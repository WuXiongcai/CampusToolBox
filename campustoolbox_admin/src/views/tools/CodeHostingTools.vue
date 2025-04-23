<template>
    <div class="container">
        <!-- 搜索区域 -->
        <div class="search-wrapper">
            <el-input 
                v-model="query.name"
                placeholder="请输入工具名称"
                class="search-input"
                clearable
            />
            <el-button type="primary" @click="handleSearch">搜索</el-button>
            <el-button @click="resetQuery">重置</el-button>
        </div>

        <!-- 操作按钮区域 -->
        <div class="handle-wrapper">
            <el-button type="primary" @click="handleAdd">新增工具</el-button>
            <el-button 
                type="danger" 
                :disabled="selectedIds.length === 0"
                @click="handleBatchDelete"
            >批量删除</el-button>
            <el-button 
                type="success" 
                @click="handleExport"
            >导出Excel</el-button>
        </div>

        <!-- 表格区域 -->
        <el-table 
            :data="tableData" 
            border 
            @selection-change="handleSelectionChange"
            v-loading="loading"
        >
            <el-table-column type="selection" width="55" />
            <el-table-column prop="id" label="ID" width="80" />
            <el-table-column prop="icon" label="图标" width="100">
                <template #default="scope">
                    <el-image 
                        v-if="scope.row.icon"
                        :src="scope.row.icon" 
                        :preview-src-list="[scope.row.icon]"
                        fit="contain"
                        style="width: 50px; height: 50px"
                    >
                        <template #error>
                            <div class="image-error">
                                <el-icon><Picture /></el-icon>
                            </div>
                        </template>
                    </el-image>
                    <span v-else>无图标</span>
                </template>
            </el-table-column>
            <el-table-column prop="name" label="名称" />
            <el-table-column prop="description" label="描述" show-overflow-tooltip />
            <el-table-column prop="url" label="官网链接" show-overflow-tooltip>
                <template #default="scope">
                    <el-link :href="scope.row.url" target="_blank" type="primary">
                        {{ scope.row.url }}
                    </el-link>
                </template>
            </el-table-column>
            <el-table-column prop="createTime" label="创建时间" width="180" />
            <el-table-column label="操作" width="220" fixed="right">
                <template #default="scope">
                    <el-button 
                        type="primary" 
                        @click="handleEdit(scope.row)"
                    >编辑</el-button>
                    <el-button 
                        type="danger" 
                        @click="handleDelete(scope.row)"
                    >删除</el-button>
                </template>
            </el-table-column>
        </el-table>

        <!-- 分页器 -->
        <div class="pagination">
            <el-pagination
                v-model:current-page="currentPage"
                v-model:page-size="pageSize"
                :total="total"
                :page-sizes="[10, 20, 50, 100]"
                layout="total, sizes, prev, pager, next, jumper"
                @size-change="handleSizeChange"
                @current-change="handleCurrentChange"
            />
        </div>

        <!-- 添加/编辑对话框 -->
        <el-dialog
            :title="dialogType === 'add' ? '添加工具' : '编辑工具'"
            v-model="dialogVisible"
            width="500px"
            @close="handleDialogClose"
        >
            <el-form 
                ref="formRef" 
                :model="form" 
                :rules="rules" 
                label-width="100px"
            >
                <el-form-item label="图标">
                    <el-upload
                        class="avatar-uploader"
                        action="http://localhost:9090/api/file/upload"
                        :headers="uploadHeaders"
                        :show-file-list="false"
                        :before-upload="beforeUpload"
                        :on-success="handleUploadSuccess"
                        :on-error="handleUploadError"
                    >
                        <img v-if="form.icon" :src="form.icon" class="avatar" />
                        <el-icon v-else class="avatar-uploader-icon"><Plus /></el-icon>
                    </el-upload>
                    <div class="upload-tip">点击上传图标，建议尺寸 100x100</div>
                </el-form-item>
                <el-form-item label="名称" prop="name">
                    <el-input v-model="form.name" placeholder="请输入工具名称" />
                </el-form-item>
                <el-form-item label="描述" prop="description">
                    <el-input 
                        v-model="form.description" 
                        type="textarea" 
                        placeholder="请输入工具描述"
                    />
                </el-form-item>
                <el-form-item label="官网链接" prop="url">
                    <el-input v-model="form.url" placeholder="请输入官网链接" />
                </el-form-item>
            </el-form>
            <template #footer>
                <el-button @click="dialogVisible = false">取消</el-button>
                <el-button 
                    type="primary" 
                    @click="handleSubmit"
                    :loading="submitLoading"
                >确定</el-button>
            </template>
        </el-dialog>
    </div>
</template>

<script setup lang="ts">
import { ref, reactive, onMounted } from 'vue'
import { ElMessage, ElMessageBox } from 'element-plus'
import { Plus, Picture } from '@element-plus/icons-vue'
import type { FormInstance, FormRules } from 'element-plus'
import { 
    fetchCodeHostingToolsData,
    addCodeHostingTool,
    updateCodeHostingTool,
    deleteCodeHostingTool,
    batchDeleteCodeHostingTools
} from '@/api'

// 查询参数
const query = reactive({
    name: ''
})

// 表格数据
const tableData = ref([])
const loading = ref(false)
const selectedIds = ref<number[]>([])

// 分页
const currentPage = ref(1)
const pageSize = ref(10)
const total = ref(0)

// 对话框
const dialogVisible = ref(false)
const dialogType = ref<'add' | 'edit'>('add')
const formRef = ref<FormInstance>()
const submitLoading = ref(false)

// 表单数据
const form = reactive({
    id: null,
    icon: '',
    name: '',
    description: '',
    url: ''
})

// 表单验证规则
const rules = reactive<FormRules>({
    name: [
        { required: true, message: '请输入工具名称', trigger: 'blur' },
        { min: 2, max: 50, message: '长度在 2 到 50 个字符', trigger: 'blur' }
    ],
    url: [
        { required: true, message: '请输入官网链接', trigger: 'blur' },
        { type: 'url', message: '请输入正确的URL地址', trigger: 'blur' }
    ]
})

// 上传相关
const uploadHeaders = {
    Authorization: localStorage.getItem('ms_token') || ''
}

// 初始化
onMounted(() => {
    fetchData()
})

// 获取数据
const fetchData = async () => {
    loading.value = true
    try {
        const res = await fetchCodeHostingToolsData({
            ...query,
            pageNum: currentPage.value,
            pageSize: pageSize.value
        })
        
        if (res.data.code === "200") {
            tableData.value = res.data.data.list
            total.value = res.data.data.total
        } else {
            ElMessage.error(res.data.msg || '获取数据失败')
        }
    } catch (error) {
        console.error('获取数据失败:', error)
    } finally {
        loading.value = false
    }
}

// 搜索
const handleSearch = () => {
    currentPage.value = 1
    fetchData()
}

// 重置
const resetQuery = () => {
    query.name = ''
    currentPage.value = 1
    fetchData()
}

// 分页
const handleSizeChange = (val: number) => {
    pageSize.value = val
    fetchData()
}

const handleCurrentChange = (val: number) => {
    currentPage.value = val
    fetchData()
}

// 表格选择
const handleSelectionChange = (selection) => {
    selectedIds.value = selection.map(item => item.id)
}

// 新增
const handleAdd = () => {
    dialogType.value = 'add'
    form.id = null
    form.icon = ''
    form.name = ''
    form.description = ''
    form.url = ''
    dialogVisible.value = true
}

// 编辑
const handleEdit = (row) => {
    dialogType.value = 'edit'
    Object.assign(form, row)
    dialogVisible.value = true
}

// 删除
const handleDelete = async (row) => {
    try {
        await ElMessageBox.confirm('确认删除该记录吗？', '提示', {
            type: 'warning'
        })
        const res = await deleteCodeHostingTool(row.id)
        
        if (res.data.code === "200") {
            showSuccessMessage('删除成功')
            fetchData()
        } else {
            ElMessage.error(res.data.msg || '删除失败')
        }
    } catch (error) {
        console.error('删除失败:', error)
    }
}

// 批量删除
const handleBatchDelete = async () => {
    if (selectedIds.value.length === 0) {
        ElMessage.warning('请选择要删除的记录')
        return
    }
    try {
        await ElMessageBox.confirm('确认删除选中的记录吗？', '提示', {
            type: 'warning'
        })
        const res = await batchDeleteCodeHostingTools(selectedIds.value)
        
        if (res.data.code === "200") {
            showSuccessMessage('批量删除成功')
            fetchData()
        } else {
            ElMessage.error(res.data.msg || '批量删除失败')
        }
    } catch (error) {
        console.error('批量删除失败:', error)
    }
}

// 导出Excel
const handleExport = () => {
    window.open('http://localhost:9090/api/code-hosting-tools/export', '_blank')
}

// 上传相关
const handleUploadSuccess = (res) => {
    if (res.code === "200") {
        form.icon = `http://localhost:9090${res.data}`
        ElMessage.success('图标上传成功')
    } else {
        ElMessage.error(res.msg || '图标上传失败')
    }
}

const beforeUpload = (file) => {
    const isImage = file.type.startsWith('image/')
    const isLt2M = file.size / 1024 / 1024 < 2
    
    if (!isImage) {
        ElMessage.error('只能上传图片文件!')
        return false
    }
    if (!isLt2M) {
        ElMessage.error('图片大小不能超过 2MB!')
        return false
    }
    return true
}

const handleUploadError = () => {
    ElMessage.error('图标上传失败')
}

// 自定义成功消息（绿色打勾）
const showSuccessMessage = (message) => {
    ElMessage({
        message,
        type: 'success'
    })
}

// 关闭对话框
const handleDialogClose = () => {
    dialogVisible.value = false
    if (formRef.value) {
        formRef.value.resetFields()
    }
}

// 提交表单
const handleSubmit = () => {
    if (formRef.value) {
        formRef.value.validate(async (valid) => {
            if (valid) {
                submitLoading.value = true
                try {
                    let res
                    if (dialogType.value === 'add') {
                        res = await addCodeHostingTool(form)
                    } else {
                        res = await updateCodeHostingTool(form)
                    }
                    
                    if (res.data.code === "200") {
                        showSuccessMessage(dialogType.value === 'add' ? '添加成功' : '更新成功')
                        dialogVisible.value = false
                        fetchData()
                    } else {
                        ElMessage.error(res.data.msg || (dialogType.value === 'add' ? '添加失败' : '更新失败'))
                    }
                } catch (error) {
                    console.error(dialogType.value === 'add' ? '添加失败:' : '更新失败:', error)
                } finally {
                    submitLoading.value = false
                }
            }
        })
    }
}
</script>

<style scoped>
.container {
    padding: 20px;
}

.search-wrapper {
    margin-bottom: 20px;
}

.search-input {
    width: 200px;
    margin-right: 10px;
}

.handle-wrapper {
    margin-bottom: 20px;
}

.pagination {
    margin-top: 20px;
    display: flex;
    justify-content: flex-end;
}

.image-error {
    display: flex;
    justify-content: center;
    align-items: center;
    width: 50px;
    height: 50px;
    background-color: #f5f7fa;
    color: #909399;
    font-size: 20px;
}

.avatar-uploader {
    text-align: center;
    border: 1px dashed #d9d9d9;
    border-radius: 6px;
    cursor: pointer;
    position: relative;
    overflow: hidden;
    transition: border-color 0.3s;
}

.avatar-uploader:hover {
    border-color: #409EFF;
}

.avatar-uploader-icon {
    font-size: 28px;
    color: #8c939d;
    width: 100px;
    height: 100px;
    line-height: 100px;
    text-align: center;
}

.avatar {
    width: 100px;
    height: 100px;
    display: block;
    object-fit: contain;
}

.upload-tip {
    font-size: 12px;
    color: #606266;
    margin-top: 5px;
}
</style> 