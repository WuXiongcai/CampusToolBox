<template>
    <div class="container">
        <!-- 搜索区域 -->
        <div class="search-wrapper">
            <el-input 
                v-model="query.name"
                placeholder="请输入网站名称"
                class="search-input"
                clearable
            />
            <el-select 
                v-model="query.category" 
                placeholder="请选择分类"
                clearable
                class="search-select"
            >
                <el-option label="技术交流" value="技术交流" />
                <el-option label="学术交流" value="学术交流" />
                <el-option label="求职就业" value="求职就业" />
                <el-option label="校园生活" value="校园生活" />
            </el-select>
            <el-button type="primary" @click="handleSearch">搜索</el-button>
            <el-button @click="resetQuery">重置</el-button>
        </div>

        <!-- 操作按钮区域 -->
        <div class="handle-wrapper">
            <el-button type="primary" @click="handleAdd">新增网站</el-button>
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
            <el-table-column prop="url" label="网站链接" show-overflow-tooltip>
                <template #default="scope">
                    <el-link :href="scope.row.url" target="_blank" type="primary">
                        {{ scope.row.url }}
                    </el-link>
                </template>
            </el-table-column>
            <el-table-column prop="category" label="分类" width="100">
                <template #default="scope">
                    <el-tag>{{ scope.row.category }}</el-tag>
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

        <!-- 分页区域 -->
        <div class="pagination">
            <el-pagination
                background
                layout="total, prev, pager, next"
                :current-page="query.pageNum"
                :page-size="query.pageSize"
                :total="total"
                @current-change="handlePageChange"
            />
        </div>

        <!-- 新增/编辑对话框 -->
        <el-dialog
            :title="dialogType === 'add' ? '新增网站' : '编辑网站'"
            v-model="dialogVisible"
            width="500px"
            @close="handleDialogClose"
        >
            <el-form 
                ref="formRef"
                :model="form"
                :rules="rules"
                label-width="80px"
            >
                <el-form-item label="图标" prop="icon">
                    <el-upload
                        class="avatar-uploader"
                        action="http://localhost:9090/api/file/upload"
                        :show-file-list="false"
                        :before-upload="beforeUpload"
                        :on-success="handleUploadSuccess"
                    >
                        <img v-if="form.icon" :src="form.icon" class="avatar" />
                        <el-icon v-else class="avatar-uploader-icon"><Plus /></el-icon>
                    </el-upload>
                    <div class="upload-tip">支持jpg/png格式，大小不超过2MB</div>
                </el-form-item>
                <el-form-item label="名称" prop="name">
                    <el-input v-model="form.name" />
                </el-form-item>
                <el-form-item label="描述" prop="description">
                    <el-input 
                        v-model="form.description" 
                        type="textarea" 
                        :rows="3"
                    />
                </el-form-item>
                <el-form-item label="网站链接" prop="url">
                    <el-input v-model="form.url" />
                </el-form-item>
                <el-form-item label="分类" prop="category">
                    <el-select v-model="form.category" placeholder="请选择分类">
                        <el-option label="技术交流" value="技术交流" />
                        <el-option label="学术交流" value="学术交流" />
                        <el-option label="求职就业" value="求职就业" />
                        <el-option label="校园生活" value="校园生活" />
                    </el-select>
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
import { ref, reactive } from 'vue'
import { ElMessage, ElMessageBox } from 'element-plus'
import { Picture, Plus } from '@element-plus/icons-vue'
import { 
    fetchCommunitySitesData,
    addCommunitySite,
    updateCommunitySite,
    deleteCommunitySite,
    batchDeleteCommunitySites,
    exportCommunitySites
} from '@/api'

// 查询参数
const query = reactive({
    name: '',
    category: '',
    pageNum: 1,
    pageSize: 10
})

// 表格数据
const tableData = ref([])
const loading = ref(false)
const total = ref(0)

// 选中的记录ID
const selectedIds = ref([])

// 获取数据
const fetchData = async () => {
    loading.value = true
    try {
        const res = await fetchCommunitySitesData(query)
        if (res.data.code === "200") {
            tableData.value = res.data.data.list
            total.value = res.data.data.total
        }
    } catch (error) {
        console.error('获取数据失败:', error)
        ElMessage.error('获取数据失败')
    }
    loading.value = false
}

// 搜索
const handleSearch = () => {
    query.pageNum = 1
    fetchData()
}

// 重置搜索
const resetQuery = () => {
    query.name = ''
    query.category = ''
    query.pageNum = 1
    handleSearch()
}

// 分页
const handlePageChange = (val: number) => {
    query.pageNum = val
    fetchData()
}

// 选择记录
const handleSelectionChange = (val) => {
    selectedIds.value = val.map(item => item.id)
}

// 新增/编辑表单
const dialogVisible = ref(false)
const dialogType = ref('add')
const formRef = ref()
const submitLoading = ref(false)
const form = reactive({
    id: undefined,
    icon: '',
    name: '',
    description: '',
    url: '',
    category: ''
})

// 表单校验规则
const rules = {
    name: [{ required: true, message: '请输入名称', trigger: 'blur' }],
    url: [{ required: true, message: '请输入网站链接', trigger: 'blur' }],
    category: [{ required: true, message: '请选择分类', trigger: 'change' }]
}

// 新增
const handleAdd = () => {
    dialogType.value = 'add'
    dialogVisible.value = true
    form.id = undefined
    form.icon = ''
    form.name = ''
    form.description = ''
    form.url = ''
    form.category = ''
}

// 编辑
const handleEdit = (row) => {
    dialogType.value = 'edit'
    dialogVisible.value = true
    Object.assign(form, row)
}

// 删除
const handleDelete = (row) => {
    ElMessageBox.confirm('确定要删除该记录吗？', '提示', {
        type: 'warning'
    }).then(async () => {
        try {
            const res = await deleteCommunitySite(row.id)
            if (res.data.code === "200") {
                ElMessage.success('删除成功')
                fetchData()
            }
        } catch (error) {
            console.error('删除失败:', error)
            ElMessage.error('删除失败')
        }
    }).catch(() => {})
}

// 批量删除
const handleBatchDelete = () => {
    if (selectedIds.value.length === 0) {
        ElMessage.warning('请选择要删除的记录')
        return
    }
    ElMessageBox.confirm(`确定要删除选中的${selectedIds.value.length}条记录吗？`, '提示', {
        type: 'warning'
    }).then(async () => {
        try {
            const res = await batchDeleteCommunitySites(selectedIds.value)
            if (res.data.code === "200") {
                ElMessage.success('批量删除成功')
                fetchData()
            }
        } catch (error) {
            console.error('批量删除失败:', error)
            ElMessage.error('批量删除失败')
        }
    }).catch(() => {})
}

// 导出Excel
const handleExport = async () => {
    try {
        const res = await exportCommunitySites()
        const blob = new Blob([res.data], { type: 'application/vnd.ms-excel' })
        const url = window.URL.createObjectURL(blob)
        const link = document.createElement('a')
        link.href = url
        link.download = 'community_sites.xlsx'
        link.click()
        window.URL.revokeObjectURL(url)
    } catch (error) {
        console.error('导出失败:', error)
        ElMessage.error('导出失败')
    }
}

// 上传图片前的校验
const beforeUpload = (file) => {
    const isJpgOrPng = file.type === 'image/jpeg' || file.type === 'image/png'
    if (!isJpgOrPng) {
        ElMessage.error('只能上传jpg/png格式的图片')
        return false
    }
    const isLt2M = file.size / 1024 / 1024 < 2
    if (!isLt2M) {
        ElMessage.error('图片大小不能超过2MB')
        return false
    }
    return true
}

// 上传成功回调
const handleUploadSuccess = (res) => {
    if (res.code === "200") {
        form.icon = res.data
    } else {
        ElMessage.error('上传失败')
    }
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
                        res = await addCommunitySite(form)
                    } else {
                        res = await updateCommunitySite(form)
                    }
                    
                    if (res.data.code === "200") {
                        ElMessage.success(dialogType.value === 'add' ? '添加成功' : '更新成功')
                        dialogVisible.value = false
                        fetchData()
                    }
                } catch (error) {
                    console.error(dialogType.value === 'add' ? '添加失败:' : '更新失败:', error)
                    ElMessage.error(dialogType.value === 'add' ? '添加失败' : '更新失败')
                }
                submitLoading.value = false
            }
        })
    }
}

// 初始化
fetchData()
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
    width: 120px;
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