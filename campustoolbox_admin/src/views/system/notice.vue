<template>
    <div>
        <div class="container">
            <div class="handle-box">
                <el-input
                    v-model="query.title"
                    placeholder="请输入公告标题"
                    class="handle-input mr10"
                >
                    <template #prefix>
                        <el-icon><Search /></el-icon>
                    </template>
                </el-input>
                <el-button type="primary" :icon="Search" @click="handleSearch" class="search-btn">搜索</el-button>
                <el-button type="success" :icon="Plus" @click="handleAdd" class="add-btn">新增</el-button>
                <el-button 
                    type="danger" 
                    :icon="Delete" 
                    @click="handleBatchDelete"
                    :disabled="selectedIds.length === 0"
                    class="delete-btn"
                >批量删除</el-button>
                <el-button type="warning" :icon="Download" @click="handleExport" class="export-btn">导出</el-button>
            </div>

            <el-table
                :data="tableData"
                border
                class="table"
                ref="multipleTable"
                header-cell-class-name="table-header"
                @selection-change="handleSelectionChange"
                v-loading="loading"
            >
                <el-table-column type="selection" width="55" align="center" />
                <el-table-column prop="id" label="ID" width="55" align="center" />
                <el-table-column prop="title" label="标题" min-width="200">
                    <template #default="scope">
                        <div class="title-cell">
                            <span class="title-text">{{ scope.row.title }}</span>
                            <el-button
                                type="primary"
                                link
                                @click="handleViewDetail(scope.row, 'title')"
                            >
                                查看详情
                            </el-button>
                        </div>
                    </template>
                </el-table-column>
                <el-table-column prop="content" label="内容" min-width="120" align="center">
                    <template #default="scope">
                        <el-button
                            type="primary"
                            link
                            @click="handleViewDetail(scope.row, 'content')"
                        >
                            查看详情
                        </el-button>
                    </template>
                </el-table-column>
                <el-table-column prop="createBy" label="创建人" width="120" />
                <el-table-column prop="createTime" label="创建时间" width="180" />
                <el-table-column prop="updateBy" label="更新人" width="120" />
                <el-table-column prop="updateTime" label="更新时间" width="180" />
                <el-table-column label="状态" width="100" align="center">
                    <template #default="scope">
                        <el-tag :type="scope.row.status ? 'success' : 'danger'" effect="dark">
                            {{ scope.row.status ? '启用' : '禁用' }}
                        </el-tag>
                    </template>
                </el-table-column>
                <el-table-column label="操作" width="220" align="center" fixed="right">
                    <template #default="scope">
                        <el-button
                            type="primary"
                            :icon="Edit"
                            circle
                            @click="handleEdit(scope.row)"
                            v-permiss="15"
                        />
                        <el-button
                            type="danger"
                            :icon="Delete"
                            circle
                            @click="handleDelete(scope.row)"
                            v-permiss="15"
                        />
                    </template>
                </el-table-column>
            </el-table>
            <div class="pagination">
                <el-pagination
                    background
                    layout="total, sizes, prev, pager, next"
                    :current-page="query.pageNum"
                    :page-size="query.pageSize"
                    :page-sizes="[10, 20, 50, 100]"
                    :total="total"
                    @current-change="handlePageChange"
                    @size-change="handleSizeChange"
                />
            </div>
        </div>

        <!-- 编辑弹出框 -->
        <el-dialog
            :title="dialogTitle"
            v-model="dialogVisible"
            width="50%"
        >
            <el-form :model="form" label-width="100px" :rules="rules" ref="formRef">
                <el-form-item label="公告标题" prop="title">
                    <el-input v-model="form.title" placeholder="请输入公告标题"></el-input>
                </el-form-item>
                <el-form-item label="公告内容" prop="content">
                    <el-input
                        v-model="form.content"
                        type="textarea"
                        placeholder="请输入公告内容"
                        :rows="4"
                    ></el-input>
                </el-form-item>
                <el-form-item label="状态">
                    <el-radio-group v-model="form.status">
                        <el-radio :value="1">启用</el-radio>
                        <el-radio :value="0">禁用</el-radio>
                    </el-radio-group>
                </el-form-item>
            </el-form>
            <template #footer>
                <span class="dialog-footer">
                    <el-button @click="dialogVisible = false">取 消</el-button>
                    <el-button type="primary" @click="saveNotice">确 定</el-button>
                </span>
            </template>
        </el-dialog>

        <!-- 查看详情弹出框 -->
        <el-dialog
            :title="detailTitle"
            v-model="detailVisible"
            width="50%"
        >
            <div class="detail-content" v-if="detailType === 'title'">
                <h3>公告标题</h3>
                <p>{{ detailData.title }}</p>
            </div>
            <div class="detail-content" v-else>
                <h3>公告内容</h3>
                <p>{{ detailData.content }}</p>
            </div>
        </el-dialog>
    </div>
</template>

<script setup lang="ts" name="notice">
import { ref, reactive, onMounted } from 'vue';
import { ElMessage, ElMessageBox } from 'element-plus';
import { Delete, Edit, Search, Plus, Download } from '@element-plus/icons-vue';
import type { FormInstance, FormRules } from 'element-plus';
import {
    fetchNoticeData,
    addNotice,
    updateNotice,
    deleteNotice,
    batchDeleteNotice,
    exportNotice
} from '@/api/index';

const loading = ref(false);
const dialogVisible = ref(false);
const dialogTitle = ref('');
const detailVisible = ref(false);
const detailTitle = ref('');
const detailType = ref('');
const detailData = ref({
    title: '',
    content: ''
});
const formRef = ref<FormInstance>();

const query = reactive({
    title: '',
    pageNum: 1,
    pageSize: 10
});

const form = reactive({
    id: null,
    title: '',
    content: '',
    status: 1,
    createBy: localStorage.getItem('ms_username'),
    updateBy: localStorage.getItem('ms_username')
});

const rules = reactive<FormRules>({
    title: [
        { required: true, message: '请输入公告标题', trigger: 'blur' },
        { min: 2, max: 100, message: '标题长度在2到100个字符之间', trigger: 'blur' }
    ],
    content: [
        { required: true, message: '请输入公告内容', trigger: 'blur' },
        { min: 1, max: 2000, message: '内容长度在1到2000个字符之间', trigger: 'blur' }
    ]
});

const tableData = ref([]);
const selectedIds = ref<number[]>([]);
const total = ref(0);

// 获取表格数据
const getData = () => {
    loading.value = true;
    fetchNoticeData({
        ...query
    })
        .then(res => {
            if (res.data.code === '200') {
                tableData.value = res.data.data.list;
                total.value = res.data.data.total;
            } else {
                ElMessage.error(res.data.msg);
            }
        })
        .finally(() => {
            loading.value = false;
        });
};

// 查询操作
const handleSearch = () => {
    query.pageNum = 1;
    getData();
};

// 新增操作
const handleAdd = () => {
    dialogTitle.value = '新增公告';
    form.id = null;
    form.title = '';
    form.content = '';
    form.status = 1;
    form.createBy = localStorage.getItem('ms_username');
    form.updateBy = localStorage.getItem('ms_username');
    dialogVisible.value = true;
};

// 编辑操作
const handleEdit = (row: any) => {
    dialogTitle.value = '编辑公告';
    form.id = row.id;
    form.title = row.title;
    form.content = row.content;
    form.status = row.status;
    form.updateBy = localStorage.getItem('ms_username');
    dialogVisible.value = true;
};

// 删除操作
const handleDelete = (row: any) => {
    ElMessageBox.confirm('确定要删除这条公告吗？', '提示', {
        type: 'warning'
    })
        .then(() => {
            deleteNotice(row.id).then(res => {
                if (res.data.code === '200') {
                    ElMessage.success('删除成功');
                    getData();
                } else {
                    ElMessage.error(res.data.msg);
                }
            });
        })
        .catch(() => {});
};

// 批量删除
const handleBatchDelete = () => {
    if (selectedIds.value.length === 0) {
        ElMessage.warning('请选择要删除的记录');
        return;
    }
    ElMessageBox.confirm('确定要删除选中的公告吗？', '提示', {
        type: 'warning'
    })
        .then(() => {
            batchDeleteNotice(selectedIds.value).then(res => {
                if (res.data.code === '200') {
                    ElMessage.success('批量删除成功');
                    getData();
                } else {
                    ElMessage.error(res.data.msg);
                }
            });
        })
        .catch(() => {});
};

// 导出操作
const handleExport = () => {
    exportNotice().then(res => {
        const blob = new Blob([res.data], { type: 'application/vnd.ms-excel' });
        const downloadElement = document.createElement('a');
        const href = window.URL.createObjectURL(blob);
        downloadElement.href = href;
        downloadElement.download = '公告列表.xlsx';
        document.body.appendChild(downloadElement);
        downloadElement.click();
        document.body.removeChild(downloadElement);
        window.URL.revokeObjectURL(href);
    });
};

// 保存公告
const saveNotice = () => {
    if (!formRef.value) return;
    formRef.value.validate((valid: boolean) => {
        if (valid) {
            const saveData = {
                ...form,
                status: form.status ? 1 : 0,
                createBy: localStorage.getItem('ms_username'),
                updateBy: localStorage.getItem('ms_username')
            };
            
            const request = form.id ? updateNotice : addNotice;
            request(saveData).then(res => {
                if (res.data.code === '200') {
                    ElMessage.success(form.id ? '更新成功' : '新增成功');
                    dialogVisible.value = false;
                    getData();
                } else {
                    ElMessage.error(res.data.msg || '操作失败');
                }
            }).catch(err => {
                console.error('保存失败:', err);
                ElMessage.error('系统错误，请稍后重试');
            });
        }
    });
};

// 分页导航
const handlePageChange = (val: number) => {
    query.pageNum = val;
    getData();
};

// 页码变化
const handleSizeChange = (val: number) => {
    query.pageSize = val;
    getData();
};

// 多选操作
const handleSelectionChange = (val: any[]) => {
    selectedIds.value = val.map(item => item.id);
};

// 查看详情操作
const handleViewDetail = (row: any, type: string) => {
    detailTitle.value = '公告详情';
    detailType.value = type;
    detailData.value = {
        title: row.title,
        content: row.content
    };
    detailVisible.value = true;
};

onMounted(() => {
    getData();
});
</script>

<style scoped>
.handle-box {
    margin-bottom: 20px;
}

.handle-input {
    width: 300px;
    display: inline-block;
}

.table {
    width: 100%;
    font-size: 14px;
}

.red {
    color: #F56C6C;
}

.mr10 {
    margin-right: 10px;
}

.table-td-thumb {
    display: block;
    margin: auto;
    width: 40px;
    height: 40px;
}

.pagination {
    margin: 20px 0;
    text-align: right;
}

.title-cell {
    display: flex;
    align-items: center;
}

.title-text {
    flex: 1;
}

.content-cell {
    display: flex;
    align-items: center;
}

.content-text {
    flex: 1;
}

.search-btn {
    margin-right: 10px;
}

.add-btn {
    margin-right: 10px;
}

.delete-btn {
    margin-right: 10px;
}

.export-btn {
    margin-right: 10px;
}
</style> 