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
            <el-select 
                v-model="query.category" 
                placeholder="请选择分类"
                clearable
                class="search-select"
            >
                <el-option
                    v-for="item in categoryOptions"
                    :key="item.value"
                    :label="item.label"
                    :value="item.value"
                />
            </el-select>
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
            <el-table-column prop="category" label="分类" width="120">
                <template #default="scope">
                    <el-tag :type="getCategoryTagType(scope.row.category)">
                        {{ getCategoryLabel(scope.row.category) }}
                    </el-tag>
                </template>
            </el-table-column>
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

        <!-- 新增/编辑对话框 -->
        <el-dialog
            :title="dialogType === 'add' ? '新增工具' : '编辑工具'"
            v-model="dialogVisible"
            width="500px"
        >
            <el-form :model="form" :rules="rules" ref="formRef" label-width="80px">
                <el-form-item label="图标">
                    <el-upload
                        class="avatar-uploader"
                        action="http://localhost:9090/api/file/upload"
                        :headers="uploadHeaders"
                        :show-file-list="false"
                        :on-success="handleUploadSuccess"
                        :before-upload="beforeUpload"
                        :on-error="handleUploadError"
                    >
                        <img v-if="form.icon" :src="form.icon" class="avatar" />
                        <el-icon v-else class="avatar-uploader-icon"><Plus /></el-icon>
                    </el-upload>
                    <div class="upload-tip">支持 jpg、png 格式，大小不超过 2MB</div>
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
                <el-form-item label="分类" prop="category">
                    <el-select v-model="form.category" placeholder="请选择分类">
                        <el-option
                            v-for="item in categoryOptions"
                            :key="item.value"
                            :label="item.label"
                            :value="item.value"
                        />
                    </el-select>
                </el-form-item>
            </el-form>
            <template #footer>
                <span class="dialog-footer">
                    <el-button @click="dialogVisible = false">取消</el-button>
                    <el-button type="primary" @click="handleSubmit">确定</el-button>
                </span>
            </template>
        </el-dialog>
    </div>
</template>

<script setup lang="ts">
import { ref, reactive, onMounted } from 'vue'
import { ElMessage, ElMessageBox } from 'element-plus'
import { Plus, Picture } from '@element-plus/icons-vue'
import { 
    fetchMathModelToolsData, 
    addMathModelTool, 
    updateMathModelTool,
    deleteMathModelTool,
    batchDeleteMathModelTools,
    exportMathModelTools
} from '../../api'

// 分类选项
const categoryOptions = [
    { value: '建模', label: '建模' },
    { value: '编程', label: '编程' },
    { value: '论文写作', label: '论文写作' },
    { value: '数据分析', label: '数据分析' }
]

// 分类标签类型
const getCategoryTagType = (category) => {
    const map = {
        '建模': '',
        '编程': 'success',
        '论文写作': 'warning',
        '数据分析': 'info'
    }
    return map[category] || ''
}

// 获取分类标签文本
const getCategoryLabel = (category) => {
    const option = categoryOptions.find(item => item.value === category)
    return option ? option.label : category
}

// 数据列表
const tableData = ref([])
const loading = ref(false)
const total = ref(0)
const currentPage = ref(1)
const pageSize = ref(10)
const selectedIds = ref([])

// 查询条件
const query = reactive({
    name: '',
    category: ''
})

// 对话框相关
const dialogVisible = ref(false)
const dialogType = ref('add')
const formRef = ref()
const form = reactive({
    id: null,
    icon: '',
    name: '',
    description: '',
    url: '',
    category: ''
})

// 上传请求头
const uploadHeaders = {
    // 如果需要添加认证信息等，可以在这里设置
}

// 表单验证规则
const rules = {
    name: [{ required: true, message: '请输入工具名称', trigger: 'blur' }],
    url: [{ required: true, message: '请输入官网链接', trigger: 'blur' }],
    category: [{ required: true, message: '请选择分类', trigger: 'change' }]
}

// 生命周期钩子
onMounted(() => {
    fetchData()
})

// 获取数据
const fetchData = async () => {
    loading.value = true
    try {
        const res = await fetchMathModelToolsData({
            name: query.name,
            category: query.category,
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
        ElMessage.error('获取数据失败')
    } finally {
        loading.value = false
    }
}

// 搜索
const handleSearch = () => {
    currentPage.value = 1
    fetchData()
}

// 重置搜索
const resetQuery = () => {
    query.name = ''
    query.category = ''
    currentPage.value = 1
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
    form.category = ''
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
        const res = await deleteMathModelTool(row.id)
        
        if (res.data.code === "200") {
            ElMessage.success('删除成功')
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
        const res = await batchDeleteMathModelTools(selectedIds.value)
        
        if (res.data.code === "200") {
            ElMessage.success('批量删除成功')
            fetchData()
        } else {
            ElMessage.error(res.data.msg || '批量删除失败')
        }
    } catch (error) {
        console.error('批量删除失败:', error)
    }
}

// 导出Excel
const handleExport = async () => {
    try {
        const res = await exportMathModelTools()
        const blob = new Blob([res.data], { type: 'application/vnd.ms-excel' })
        const url = window.URL.createObjectURL(blob)
        const link = document.createElement('a')
        link.href = url
        link.download = 'math_model_tools.xlsx'
        link.click()
        window.URL.revokeObjectURL(url)
        ElMessage.success('导出成功')
    } catch (error) {
        console.error('导出失败:', error)
        ElMessage.error('导出失败')
    }
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

// 表单提交
const handleSubmit = async () => {
    if (!formRef.value) return
    
    await formRef.value.validate(async (valid) => {
        if (valid) {
            try {
                const submitFunc = dialogType.value === 'add' ? addMathModelTool : updateMathModelTool
                const res = await submitFunc(form)
                
                if (res.data.code === "200") {
                    ElMessage.success(dialogType.value === 'add' ? '添加成功' : '更新成功')
                    dialogVisible.value = false
                    fetchData()
                } else {
                    ElMessage.error(res.data.msg || (dialogType.value === 'add' ? '添加失败' : '更新失败'))
                }
            } catch (error) {
                console.error(dialogType.value === 'add' ? '添加失败:' : '更新失败:', error)
            }
        }
    })
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

.search-select {
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