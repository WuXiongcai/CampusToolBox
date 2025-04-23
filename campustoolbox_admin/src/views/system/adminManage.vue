<template>
    <div>
        <div class="search-wrapper">
            <el-input 
                v-model="query.username"
                placeholder="请输入用户名查询"
                class="search-input"
                clearable
            />
            <el-button type="primary" @click="handleSearch">搜索</el-button>
            <el-button @click="resetQuery">重置</el-button>
        </div>
        <div class="container">
            <div class="handle-wrapper">
                <el-button type="primary" :icon="Plus" @click="handleAdd">新增管理员</el-button>
                <el-button 
                    type="danger" 
                    :icon="Delete"
                    :disabled="selectedIds.length === 0"
                    @click="handleBatchDelete"
                >批量删除</el-button>
            </div>

            <el-table 
                :data="tableData" 
                border 
                v-loading="loading"
                @selection-change="handleSelectionChange"
            >
                <el-table-column type="selection" width="55" />
                <el-table-column prop="id" label="ID" width="80" />
                <el-table-column prop="username" label="用户名" />
                <el-table-column prop="email" label="邮箱" />
                <el-table-column prop="role" label="角色" />
                <el-table-column prop="status" label="状态">
                    <template #default="scope">
                        <el-tag type="success" v-if="scope.row.status">启用</el-tag>
                        <el-tag type="danger" v-else>禁用</el-tag>
                    </template>
                </el-table-column>
                <el-table-column prop="createTime" label="创建时间" width="180" />
                <el-table-column prop="lastLoginTime" label="最后登录时间" width="180" />
                <el-table-column label="操作" width="280" fixed="right">
                    <template #default="scope">
                        <div class="operation-buttons">
                            <el-button 
                                type="primary" 
                                size="small"
                                @click="handleEdit(scope.row)"
                            >编辑</el-button>
                            <el-button 
                                type="success" 
                                size="small"
                                @click="handleResetPassword(scope.row)"
                            >重置密码</el-button>
                            <el-button 
                                type="danger" 
                                size="small"
                                @click="handleDelete(scope.row)"
                            >删除</el-button>
                        </div>
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
        </div>

        <!-- 添加/编辑对话框 -->
        <el-dialog
            :title="dialogType === 'add' ? '新增管理员' : '编辑管理员'"
            v-model="dialogVisible"
            width="500px"
            :close-on-click-modal="false"
            @close="handleDialogClose"
        >
            <el-form 
                ref="formRef" 
                :model="form" 
                :rules="rules" 
                label-width="100px"
            >
                <el-form-item label="用户名" prop="username" v-if="dialogType === 'add'">
                    <el-input v-model="form.username" placeholder="请输入用户名" />
                </el-form-item>
                <el-form-item label="邮箱" prop="email">
                    <el-input v-model="form.email" placeholder="请输入邮箱" />
                </el-form-item>
                <el-form-item label="角色" prop="role">
                    <el-select v-model="form.role" placeholder="请选择角色" style="width: 100%">
                        <el-option label="管理员" value="admin" />
                        <el-option label="普通用户" value="user" />
                    </el-select>
                </el-form-item>
                <el-form-item label="状态" prop="status">
                    <el-switch v-model="form.status" active-text="启用" inactive-text="禁用" />
                </el-form-item>
                <el-form-item label="密码" prop="password" v-if="dialogType === 'add'">
                    <el-input v-model="form.password" type="password" placeholder="请输入密码" />
                </el-form-item>
            </el-form>
            <template #footer>
                <span class="dialog-footer">
                    <el-button @click="dialogVisible = false">取消</el-button>
                    <el-button type="primary" @click="handleSubmit" :loading="submitLoading">
                        确定
                    </el-button>
                </span>
            </template>
        </el-dialog>

        <!-- 重置密码对话框 -->
        <el-dialog
            title="重置密码"
            v-model="resetPwdVisible"
            width="400px"
            :close-on-click-modal="false"
            @close="resetForm.password = ''"
        >
            <el-form 
                ref="resetFormRef" 
                :model="resetForm" 
                :rules="resetRules" 
                label-width="100px"
            >
                <el-form-item label="新密码" prop="password">
                    <el-input v-model="resetForm.password" type="password" placeholder="请输入新密码" />
                </el-form-item>
            </el-form>
            <template #footer>
                <span class="dialog-footer">
                    <el-button @click="resetPwdVisible = false">取消</el-button>
                    <el-button type="primary" @click="submitResetPassword" :loading="resetLoading">
                        确定
                    </el-button>
                </span>
            </template>
        </el-dialog>
    </div>
</template>

<script setup lang="ts">
import { ref, reactive, onMounted, onUnmounted } from 'vue';
import { ElMessage, ElMessageBox } from 'element-plus';
import { Delete, Plus } from '@element-plus/icons-vue';
import type { FormInstance, FormRules } from 'element-plus';
import { 
    fetchAdminData,
    addAdmin,
    updateAdmin,
    deleteAdmin,
    batchDeleteAdmin,
    resetAdminPassword
} from '@/api/index';

// 数据加载状态
const loading = ref(false);
const submitLoading = ref(false);
const resetLoading = ref(false);

// 表格数据
const tableData = ref([]);
const total = ref(0);
const currentPage = ref(1);
const pageSize = ref(10);
const selectedIds = ref([]);

// 查询参数
const query = reactive({
    username: ''
});

// 对话框状态
const dialogVisible = ref(false);
const resetPwdVisible = ref(false);
const dialogType = ref('add'); // add 或 edit
const formRef = ref<FormInstance>();
const resetFormRef = ref<FormInstance>();

// 表单数据
const form = reactive({
    id: null as number | null,
    username: '',
    email: '',
    role: 'admin',
    status: true,
    password: ''
});

// 重置密码表单
const resetForm = reactive({
    id: null as number | null,
    password: ''
});

// 表单验证规则
const rules = reactive<FormRules>({
    username: [
        { required: true, message: '请输入用户名', trigger: 'blur' },
        { min: 3, max: 20, message: '长度在 3 到 20 个字符', trigger: 'blur' }
    ],
    password: [
        { required: true, message: '请输入密码', trigger: 'blur' },
        { min: 6, message: '密码长度至少为 6 个字符', trigger: 'blur' }
    ],
    role: [
        { required: true, message: '请选择角色', trigger: 'change' }
    ]
});

// 重置密码验证规则
const resetRules = reactive<FormRules>({
    password: [
        { required: true, message: '请输入新密码', trigger: 'blur' },
        { min: 6, message: '密码长度至少为 6 个字符', trigger: 'blur' }
    ]
});

// 生命周期钩子
onMounted(() => {
    fetchData();
    // 添加管理员信息更新事件监听
    window.addEventListener('adminInfoUpdated', fetchData);
});

onUnmounted(() => {
    // 移除事件监听
    window.removeEventListener('adminInfoUpdated', fetchData);
});

// 获取数据
const fetchData = async () => {
    loading.value = true;
    try {
        const response = await fetchAdminData({
            username: query.username,
            pageNum: currentPage.value,
            pageSize: pageSize.value
        });
        
        if (response.data.code === "200") {
            tableData.value = response.data.data.list;
            total.value = response.data.data.total;
        } else {
            ElMessage.error(response.data.msg || '获取数据失败');
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
    query.username = '';
    currentPage.value = 1;
    fetchData();
};

// 表格选择
const handleSelectionChange = (selection: any[]) => {
    selectedIds.value = selection.map(item => item.id);
};

// 新增
const handleAdd = () => {
    dialogType.value = 'add';
    form.id = null;
    form.username = '';
    form.email = '';
    form.role = 'admin';
    form.status = true;
    form.password = '';
    dialogVisible.value = true;
};

// 编辑
const handleEdit = (row: any) => {
    dialogType.value = 'edit';
    form.id = row.id;
    form.username = row.username;
    form.email = row.email;
    form.role = row.role;
    form.status = row.status;
    dialogVisible.value = true;
};

// 删除
const handleDelete = async (row: any) => {
    try {
        await ElMessageBox.confirm('确认删除该管理员吗？', '提示', {
            type: 'warning'
        });
        
        const response = await deleteAdmin(row.id);
        
        if (response.data.code === "200") {
            ElMessage.success('删除成功');
            fetchData();
        } else {
            ElMessage.error(response.data.msg || '删除失败');
        }
    } catch (error: any) {
        if (error !== 'cancel') {
            console.error('删除失败:', error);
        }
    }
};

// 批量删除
const handleBatchDelete = async () => {
    if (selectedIds.value.length === 0) {
        ElMessage.warning('请选择要删除的记录');
        return;
    }
    
    try {
        await ElMessageBox.confirm('确认删除选中的记录吗？', '提示', {
            type: 'warning'
        });
        
        const response = await batchDeleteAdmin(selectedIds.value);
        
        if (response.data.code === "200") {
            ElMessage.success('批量删除成功');
            fetchData();
        } else {
            ElMessage.error(response.data.msg || '批量删除失败');
        }
    } catch (error: any) {
        if (error !== 'cancel') {
            console.error('批量删除失败:', error);
        }
    }
};

// 重置密码
const handleResetPassword = (row: any) => {
    resetForm.id = row.id;
    resetForm.password = '';
    resetPwdVisible.value = true;
};

// 提交重置密码
const submitResetPassword = async () => {
    if (!resetFormRef.value) return;
    
    await resetFormRef.value.validate(async (valid) => {
        if (valid) {
            resetLoading.value = true;
            try {
                const response = await resetAdminPassword(resetForm.id, resetForm.password);
                
                if (response.data.code === "200") {
                    ElMessage.success('密码重置成功');
                    resetPwdVisible.value = false;
                } else {
                    ElMessage.error(response.data.msg || '密码重置失败');
                }
            } catch (error) {
                console.error('密码重置失败:', error);
                ElMessage.error('密码重置失败');
            } finally {
                resetLoading.value = false;
            }
        }
    });
};

// 关闭对话框
const handleDialogClose = () => {
    dialogVisible.value = false;
    if (formRef.value) {
        formRef.value.resetFields();
    }
};

// 提交表单
const handleSubmit = async () => {
    if (!formRef.value) return;
    
    await formRef.value.validate(async (valid: boolean) => {
        if (valid) {
            submitLoading.value = true;
            try {
                // 准备提交数据
                const submitData = {
                    username: form.username.trim(),
                    password: form.password.trim(),
                    email: form.email ? form.email.trim() : null,
                    status: form.status ? 1 : 0,  // 将布尔值转换为整数
                    role: form.role
                };
                
                console.log('提交的数据:', submitData);
                
                let response;
                if (dialogType.value === 'add') {
                    response = await addAdmin(submitData);
                } else {
                    response = await updateAdmin({
                        ...submitData,
                        id: form.id
                    });
                }
                
                if (response.data.code === "200") {
                    ElMessage.success(dialogType.value === 'add' ? '添加成功' : '更新成功');
                    dialogVisible.value = false;
                    fetchData();
                } else {
                    ElMessage.error(response.data.msg || (dialogType.value === 'add' ? '添加失败' : '更新失败'));
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

// 分页
const handleSizeChange = (val: number) => {
    pageSize.value = val;
    fetchData();
};

const handleCurrentChange = (val: number) => {
    currentPage.value = val;
    fetchData();
};
</script>

<style scoped>
.container {
    padding: 20px;
    background-color: #fff;
    border-radius: 5px;
    box-shadow: 0 2px 12px 0 rgba(0,0,0,.1);
}

.search-wrapper {
    margin-bottom: 20px;
    display: flex;
    align-items: center;
}

.search-input {
    width: 220px;
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

.operation-buttons {
    display: flex;
    gap: 5px;
    justify-content: flex-start;
    align-items: center;
}
</style>