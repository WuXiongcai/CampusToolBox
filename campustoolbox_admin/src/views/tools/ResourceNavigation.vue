<template>
    <div class="container">
        <!-- 搜索区域 -->
        <div class="search-wrapper">
            <el-input 
                v-model="query.name"
                placeholder="请输入资源名称"
                class="search-input"
                clearable
            />
            <el-button type="primary" @click="handleSearch">搜索</el-button>
            <el-button @click="resetQuery">重置</el-button>
        </div>

        <!-- 操作按钮区域 -->
        <div class="handle-wrapper">
            <el-button type="primary" @click="handleAdd">新增资源</el-button>
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
            <el-table-column prop="category" label="分类" />
            <el-table-column prop="url" label="链接" show-overflow-tooltip>
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
            :title="dialogType === 'add' ? '添加资源' : '编辑资源'"
            v-model="dialogVisible"
            width="500px"
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
                    <div class="upload-tip">点击上传图标（建议尺寸：100x100px）</div>
                </el-form-item>
                <el-form-item label="名称" prop="name">
                    <el-input v-model="form.name" placeholder="请输入资源名称" />
                </el-form-item>
                <el-form-item label="描述" prop="description">
                    <el-input 
                        v-model="form.description" 
                        type="textarea" 
                        :rows="3" 
                        placeholder="请输入资源描述" 
                    />
                </el-form-item>
                <el-form-item label="分类" prop="category">
                    <el-input v-model="form.category" placeholder="请输入资源分类" />
                </el-form-item>
                <el-form-item label="链接" prop="url">
                    <el-input v-model="form.url" placeholder="请输入资源链接" />
                </el-form-item>
            </el-form>
            <template #footer>
                <span class="dialog-footer">
                    <el-button @click="dialogVisible = false">取消</el-button>
                    <el-button type="primary" @click="handleSubmit" :loading="submitLoading">
                        {{ dialogType === 'add' ? '添加' : '更新' }}
                    </el-button>
                </span>
            </template>
        </el-dialog>
    </div>
</template>

<script setup lang="ts" name="resource-navigation">
import { ref, reactive, onMounted } from 'vue';
import { ElMessage, ElMessageBox } from 'element-plus';
import { Picture, Plus } from '@element-plus/icons-vue';
import type { FormInstance, FormRules } from 'element-plus';
import type { ApiResponse, PageResult } from '@/types/api';
import type { AxiosResponse } from 'axios';
import { 
    fetchResourceNavigationData, 
    addResourceNavigation, 
    updateResourceNavigation, 
    deleteResourceNavigation, 
    batchDeleteResourceNavigation, 
    exportResourceNavigation 
} from '@/api';

// 查询参数
const query = reactive({
    name: ''
});

// 表格数据
const tableData = ref([]);
const loading = ref(false);
const selectedIds = ref<number[]>([]);

// 分页参数
const currentPage = ref(1);
const pageSize = ref(10);
const total = ref(0);

// 对话框相关
const dialogVisible = ref(false);
const dialogType = ref<'add' | 'edit'>('add');
const submitLoading = ref(false);
const formRef = ref<FormInstance>();

// 表单数据
const form = reactive({
    id: undefined,
    icon: '',
    name: '',
    description: '',
    url: '',
    category: ''
});

// 表单验证规则
const rules = reactive<FormRules>({
    name: [{ required: true, message: '请输入资源名称', trigger: 'blur' }],
    url: [{ required: true, message: '请输入资源链接', trigger: 'blur' }],
    category: [{ required: true, message: '请输入资源分类', trigger: 'blur' }]
});

// 上传相关
const uploadHeaders = {
    // 如果需要token等header
};

// 获取表格数据
const fetchData = async () => {
    loading.value = true;
    try {
        const { data: res } = await fetchResourceNavigationData({
            name: query.name,
            pageNum: currentPage.value,
            pageSize: pageSize.value
        }) as AxiosResponse<ApiResponse<PageResult<any>>>;
        
        if (res.code === '200') {
            tableData.value = res.data.list;
            total.value = res.data.total;
        } else {
            ElMessage.error(res.msg || '获取数据失败');
        }
    } catch (error) {
        console.error('获取数据失败:', error);
        ElMessage.error('获取数据失败');
    } finally {
        loading.value = false;
    }
};

// 搜索
const handleSearch = () => {
    currentPage.value = 1;
    fetchData();
};

// 重置搜索
const resetQuery = () => {
    query.name = '';
    handleSearch();
};

// 选择变化
const handleSelectionChange = (selection: any[]) => {
    selectedIds.value = selection.map(item => item.id);
};

// 分页变化
const handleSizeChange = (val: number) => {
    pageSize.value = val;
    fetchData();
};

const handleCurrentChange = (val: number) => {
    currentPage.value = val;
    fetchData();
};

// 新增
const handleAdd = () => {
    dialogType.value = 'add';
    form.id = undefined;
    form.icon = '';
    form.name = '';
    form.description = '';
    form.url = '';
    form.category = '';
    dialogVisible.value = true;
};

// 编辑
const handleEdit = (row: any) => {
    dialogType.value = 'edit';
    Object.assign(form, row);
    dialogVisible.value = true;
};

// 删除
const handleDelete = async (row: any) => {
    try {
        await ElMessageBox.confirm('确认删除该记录吗？', '提示', {
            type: 'warning'
        });
        const { data: res } = await deleteResourceNavigation(row.id) as AxiosResponse<ApiResponse>;
        if (res.code === '200') {
            ElMessage.success('删除成功');
            fetchData();
        } else {
            ElMessage.error(res.msg || '删除失败');
        }
    } catch (error) {
        console.error('删除失败:', error);
        ElMessage.error('删除失败');
    }
};

// 批量删除
const handleBatchDelete = async () => {
    try {
        await ElMessageBox.confirm(`确认删除选中的 ${selectedIds.value.length} 条记录吗？`, '提示', {
            type: 'warning'
        });
        const { data: res } = await batchDeleteResourceNavigation(selectedIds.value) as AxiosResponse<ApiResponse>;
        if (res.code === '200') {
            ElMessage.success('批量删除成功');
            fetchData();
        } else {
            ElMessage.error(res.msg || '批量删除失败');
        }
    } catch (error) {
        console.error('批量删除失败:', error);
        ElMessage.error('批量删除失败');
    }
};

// 导出
const handleExport = async () => {
    try {
        const { data } = await exportResourceNavigation();
        const blob = new Blob([data], { type: 'application/vnd.ms-excel' });
        const url = window.URL.createObjectURL(blob);
        const link = document.createElement('a');
        link.href = url;
        link.download = '资源导航列表.xlsx';
        link.click();
        window.URL.revokeObjectURL(url);
    } catch (error) {
        console.error('导出失败:', error);
        ElMessage.error('导出失败');
    }
};

// 上传相关方法
const beforeUpload = (file: File) => {
    const isImage = file.type.startsWith('image/');
    if (!isImage) {
        ElMessage.error('只能上传图片文件!');
        return false;
    }
    return true;
};

const handleUploadSuccess = (res: any) => {
    if (res.code === '200') {
        form.icon = res.data;
        ElMessage.success('上传成功');
    } else {
        ElMessage.error('上传失败');
    }
};

const handleUploadError = () => {
    ElMessage.error('上传失败');
};

// 提交表单
const handleSubmit = async () => {
    if (!formRef.value) return;
    await formRef.value.validate(async (valid) => {
        if (valid) {
            submitLoading.value = true;
            try {
                const submitFn = dialogType.value === 'add' ? addResourceNavigation : updateResourceNavigation;
                const { data: res } = await submitFn(form) as AxiosResponse<ApiResponse>;
                if (res.code === '200') {
                    ElMessage.success(dialogType.value === 'add' ? '添加成功' : '更新成功');
                    dialogVisible.value = false;
                    fetchData();
                } else {
                    ElMessage.error(res.msg || (dialogType.value === 'add' ? '添加失败' : '更新失败'));
                }
            } catch (error) {
                console.error(dialogType.value === 'add' ? '添加失败:' : '更新失败:', error);
                ElMessage.error(dialogType.value === 'add' ? '添加失败' : '更新失败');
            } finally {
                submitLoading.value = false;
            }
        }
    });
};

// 初始化
onMounted(() => {
    fetchData();
});
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