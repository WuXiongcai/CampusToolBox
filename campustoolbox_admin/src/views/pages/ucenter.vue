<template>
    <div class="ucenter-container">
        <div class="ucenter-layout">
            <!-- 左侧个人信息卡片 -->
            <el-card class="profile-card" shadow="hover">
                <div class="profile-header" :style="{ backgroundImage: 'linear-gradient(45deg, #145b7d, #1c7da6)' }">
                    <div class="profile-avatar-wrap">
                        <el-avatar 
                            class="profile-avatar" 
                            :size="120" 
                            :style="{ backgroundColor: getAvatarColor(adminInfo.username) }"
                        >
                            {{ getNameInitial(adminInfo.username) }}
                        </el-avatar>
                    </div>
                </div>
                <div class="profile-info">
                    <h2 class="info-name">{{ adminInfo.username }}</h2>
                    <div class="info-role">
                        <el-tag type="success" effect="dark">
                            {{ adminInfo.role === 'admin' ? '超级管理员' : '管理员' }}
                        </el-tag>
                    </div>
                    <div class="info-email">{{ adminInfo.email || '暂无邮箱' }}</div>
                </div>
                <div class="profile-stats">
                    <div class="stat-item">
                        <div class="stat-label">上次登录</div>
                        <div class="stat-value">{{ formatDate(adminInfo.lastLoginTime) }}</div>
                    </div>
                    <div class="stat-item">
                        <div class="stat-label">账号创建</div>
                        <div class="stat-value">{{ formatDate(adminInfo.createTime) }}</div>
                    </div>
                    <div class="stat-item">
                        <div class="stat-label">账号状态</div>
                        <div class="stat-value">
                            <el-tag :type="adminInfo.status ? 'success' : 'danger'" effect="plain" size="small">
                                {{ adminInfo.status ? '启用' : '禁用' }}
                            </el-tag>
                        </div>
                    </div>
                </div>
            </el-card>

            <!-- 右侧内容区 -->
            <el-card class="content-card" shadow="hover">
                <el-tabs v-model="activeName" tab-position="left" class="custom-tabs">
                    <el-tab-pane name="label1" label="基本信息">
                        <div class="tab-content">
                            <h3 class="section-title">个人信息设置</h3>
                            <el-form class="settings-form" label-position="top" :model="adminInfo">
                                <el-form-item label="用户名">
                                    <el-input v-model="adminInfo.username" disabled></el-input>
                                </el-form-item>
                                <el-form-item label="邮箱">
                                    <el-input v-model="adminInfo.email" placeholder="请输入邮箱"></el-input>
                                </el-form-item>
                                <el-form-item>
                                    <el-button type="primary" @click="handleUpdateInfo">保存修改</el-button>
                                </el-form-item>
                            </el-form>
                        </div>
                    </el-tab-pane>

                    <el-tab-pane name="label3" label="修改密码">
                        <div class="tab-content">
                            <h3 class="section-title">密码修改</h3>
                            <el-form 
                                class="settings-form" 
                                label-position="top" 
                                :model="passwordForm" 
                                :rules="passwordRules" 
                                ref="passwordFormRef"
                            >
                                <el-form-item label="旧密码" prop="oldPassword">
                                    <el-input type="password" v-model="passwordForm.oldPassword" show-password></el-input>
                                </el-form-item>
                                <el-form-item label="新密码" prop="newPassword">
                                    <el-input type="password" v-model="passwordForm.newPassword" show-password></el-input>
                                </el-form-item>
                                <el-form-item label="确认新密码" prop="confirmPassword">
                                    <el-input type="password" v-model="passwordForm.confirmPassword" show-password></el-input>
                                </el-form-item>
                                <el-form-item>
                                    <el-button type="primary" @click="handleChangePassword">修改密码</el-button>
                                </el-form-item>
                            </el-form>
                        </div>
                    </el-tab-pane>

                    <el-tab-pane name="label4" label="关于系统">
                        <div class="tab-content">
                            <div class="about-system">
                                <h3 class="section-title">CampusToolBox 校园工具箱管理系统</h3>
                                <div class="about-content">
                                    <p class="system-desc">
                                        本系统是一个专为高校开发的综合工具管理平台，集成了多种实用工具和资源。
                                        如果您在使用过程中遇到任何问题，或者有好的建议，欢迎通过以下方式与作者联系：
                                    </p>
                                    <div class="contact-info">
                                        <p><i class="el-icon-message"></i> 邮箱：admin@example.com</p>
                                        <p><i class="el-icon-chat-dot-round"></i> 微信：campustool</p>
                                        <p class="contact-tips">添加微信时请注明来意，谢谢！</p>
                                    </div>
                                    <div class="qrcode-section">
                                        <div class="qrcode-item">
                                            <img src="@/assets/img/wechat.png" alt="微信二维码" class="qrcode-img">
                                            <p class="qrcode-label">微信二维码</p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </el-tab-pane>
                </el-tabs>
            </el-card>
        </div>
    </div>
</template>

<script setup lang="ts" name="ucenter">
import { ref, reactive, onMounted } from 'vue';
import { ElMessage } from 'element-plus';
import type { FormInstance, FormRules } from 'element-plus';
import { updateAdminInfo, updateAdminPassword } from '@/api/index';

const activeName = ref('label1');
const passwordFormRef = ref<FormInstance>();

// 管理员信息
const adminInfo = reactive({
    id: Number(localStorage.getItem('ms_id')),
    username: localStorage.getItem('ms_username'),
    email: '',
    role: 'admin',
    status: true,
    createTime: '',
    lastLoginTime: ''
});

// 密码表单
const passwordForm = reactive({
    oldPassword: '',
    newPassword: '',
    confirmPassword: ''
});

// 密码验证规则
const passwordRules = reactive<FormRules>({
    oldPassword: [
        { required: true, message: '请输入旧密码', trigger: 'blur' },
        { min: 6, message: '密码长度至少为6个字符', trigger: 'blur' }
    ],
    newPassword: [
        { required: true, message: '请输入新密码', trigger: 'blur' },
        { min: 6, message: '密码长度至少为6个字符', trigger: 'blur' }
    ],
    confirmPassword: [
        { required: true, message: '请确认新密码', trigger: 'blur' },
        {
            validator: (rule: any, value: string, callback: Function) => {
                if (value !== passwordForm.newPassword) {
                    callback(new Error('两次输入的密码不一致'));
                } else {
                    callback();
                }
            },
            trigger: 'blur'
        }
    ]
});

// 获取用户名首字母
const getNameInitial = (username: string) => {
    return username ? username.charAt(0).toUpperCase() : 'U';
};

// 根据用户名生成固定的头像背景色
const getAvatarColor = (username: string) => {
    const colors = [
        '#409EFF', // 蓝色
        '#67C23A', // 绿色
        '#E6A23C', // 黄色
        '#F56C6C', // 红色
        '#909399', // 灰色
        '#9B59B6', // 紫色
        '#3498DB', // 天蓝色
        '#1ABC9C', // 青绿色
    ];
    
    // 使用用户名生成一个固定的索引
    let total = 0;
    for (let i = 0; i < username.length; i++) {
        total += username.charCodeAt(i);
    }
    return colors[total % colors.length];
};

// 更新基本信息
const handleUpdateInfo = async () => {
    if (!adminInfo.id) {
        ElMessage.error('管理员ID不存在');
        return;
    }
    
    try {
        const response = await updateAdminInfo({
            id: adminInfo.id,
            email: adminInfo.email
        });
        if (response.data.code === '200') {
            ElMessage.success('信息更新成功');
            // 更新本地存储的邮箱信息
            localStorage.setItem('ms_email', adminInfo.email);
            // 触发全局事件，通知其他组件更新
            window.dispatchEvent(new CustomEvent('adminInfoUpdated'));
        } else {
            ElMessage.error(response.data.msg || '信息更新失败');
        }
    } catch (error) {
        console.error('信息更新失败:', error);
        ElMessage.error('信息更新失败');
    }
};

// 修改密码
const handleChangePassword = async () => {
    if (!passwordFormRef.value) return;
    await passwordFormRef.value.validate(async (valid: boolean) => {
        if (valid) {
            try {
                const response = await updateAdminPassword({
                    id: adminInfo.id,
                    oldPassword: passwordForm.oldPassword,
                    newPassword: passwordForm.newPassword
                });
                if (response.data.code === '200') {
                    ElMessage.success('密码修改成功，请重新登录');
                    // 清除登录信息，跳转到登录页
                    localStorage.clear();
                    window.location.href = '/login';
                } else {
                    ElMessage.error(response.data.msg || '密码修改失败');
                }
            } catch (error) {
                console.error('密码修改失败:', error);
                ElMessage.error('密码修改失败');
            }
        }
    });
};

// 格式化日期
const formatDate = (date: string) => {
    if (!date) return '暂无记录';
    return new Date(date).toLocaleString();
};

// 获取管理员详细信息
const fetchAdminInfo = async () => {
    try {
        // 先通过用户名获取完整的管理员信息
        const response = await fetch(`/api/admin/page?username=${adminInfo.username}`);
        const data = await response.json();
        if (data.code === '200' && data.data.list && data.data.list.length > 0) {
            const info = data.data.list[0];
            adminInfo.id = info.id; // 更新正确的ID
            adminInfo.email = info.email;
            adminInfo.role = info.role;
            adminInfo.status = info.status;
            adminInfo.createTime = info.createTime;
            adminInfo.lastLoginTime = info.lastLoginTime;
            // 更新本地存储
            localStorage.setItem('ms_id', info.id);
            localStorage.setItem('ms_email', info.email);
        } else {
            ElMessage.error('获取管理员信息失败');
        }
    } catch (error) {
        console.error('获取管理员信息失败:', error);
        ElMessage.error('获取管理员信息失败');
    }
};

onMounted(() => {
    fetchAdminInfo();
});
</script>

<style scoped>
.ucenter-container {
    min-height: calc(100vh - 60px);
    padding: 20px;
    background-color: #f5f7fa;
}

.ucenter-layout {
    display: flex;
    gap: 24px;
    max-width: 1400px;
    margin: 0 auto;
}

/* 左侧个人信息卡片样式 */
.profile-card {
    width: 360px;
    flex-shrink: 0;
    transition: all 0.3s ease;
}

.profile-card:hover {
    transform: translateY(-5px);
}

.profile-header {
    height: 140px;
    position: relative;
    border-radius: 8px 8px 0 0;
}

.profile-avatar-wrap {
    position: absolute;
    left: 50%;
    bottom: 0;
    transform: translate(-50%, 50%);
}

.profile-avatar {
    border: 4px solid #fff;
    box-shadow: 0 4px 12px rgba(0, 0, 0, 0.15);
    transition: transform 0.3s ease;
    font-size: 48px;
    font-weight: bold;
    color: #ffffff;
}

.profile-avatar:hover {
    transform: scale(1.05);
}

.profile-info {
    margin-top: 70px;
    text-align: center;
    padding: 0 20px;
}

.info-name {
    font-size: 24px;
    font-weight: 600;
    color: #2c3e50;
    margin: 0 0 12px;
}

.info-role {
    margin: 12px 0;
}

.info-email {
    color: #606266;
    font-size: 14px;
    margin: 8px 0;
}

.profile-stats {
    display: grid;
    grid-template-columns: repeat(3, 1fr);
    gap: 1px;
    margin-top: 24px;
    background-color: #eee;
    border-radius: 0 0 8px 8px;
}

.stat-item {
    padding: 16px 12px;
    text-align: center;
    background-color: #fff;
}

.stat-label {
    font-size: 12px;
    color: #909399;
    margin-bottom: 8px;
}

.stat-value {
    font-size: 14px;
    color: #303133;
    font-weight: 500;
}

/* 右侧内容区样式 */
.content-card {
    flex: 1;
    min-height: 600px;
}

.custom-tabs {
    height: 100%;
}

.tab-content {
    padding: 20px 40px;
}

.section-title {
    font-size: 20px;
    font-weight: 600;
    color: #2c3e50;
    margin: 0 0 24px;
    padding-bottom: 12px;
    border-bottom: 1px solid #ebeef5;
}

.settings-form {
    max-width: 500px;
}

/* 关于系统样式 */
.about-content {
    max-width: 800px;
}

.system-desc {
    line-height: 1.8;
    color: #606266;
    margin: 20px 0;
}

.contact-info {
    background: #f8f9fa;
    padding: 20px;
    border-radius: 8px;
    margin: 24px 0;
}

.contact-info p {
    margin: 12px 0;
    color: #606266;
    display: flex;
    align-items: center;
    gap: 8px;
}

.contact-tips {
    color: #f56c6c !important;
    font-size: 12px;
    margin-top: 16px;
}

.qrcode-section {
    display: flex;
    justify-content: center;
    margin-top: 32px;
}

.qrcode-item {
    text-align: center;
}

.qrcode-img {
    width: 200px;
    height: 200px;
    border-radius: 8px;
    box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
    transition: transform 0.3s ease;
}

.qrcode-img:hover {
    transform: scale(1.02);
}

.qrcode-label {
    margin-top: 12px;
    color: #606266;
    font-size: 14px;
}

:deep(.el-tabs__content) {
    height: 100%;
}

:deep(.el-form-item__label) {
    font-weight: 500;
}

@media (max-width: 1200px) {
    .ucenter-layout {
        flex-direction: column;
    }

    .profile-card {
        width: 100%;
    }
}
</style>

<style>
.el-tabs--left {
    height: 100%;
}
</style>
