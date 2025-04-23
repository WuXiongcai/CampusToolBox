<template>
    <div class="login-bg">
        <div class="login-container">
            <div class="login-header">
                <img class="logo mr10" src="../../assets/img/logo.svg" alt="" />
                <div class="login-title">CampusToolBox后台</div>
            </div>
            <el-form :model="param" :rules="rules" ref="loginForm" size="large">
                <el-form-item prop="username">
                    <el-input v-model="param.username" placeholder="用户名">
                        <template #prepend>
                            <el-icon>
                                <User />
                            </el-icon>
                        </template>
                    </el-input>
                </el-form-item>
                <el-form-item prop="password">
                    <el-input
                        type="password"
                        placeholder="密码"
                        v-model="param.password"
                        @keyup.enter="submitForm(loginForm)"
                    >
                        <template #prepend>
                            <el-icon>
                                <Lock />
                            </el-icon>
                        </template>
                    </el-input>
                </el-form-item>
                <div class="pwd-tips">
                    <el-checkbox class="pwd-checkbox" v-model="checked" label="记住密码" />
                </div>
                <el-button class="login-btn" type="primary" size="large" @click="submitForm(loginForm)">登录</el-button>
                <p class="login-tips">提示：请输入管理员账号和密码登录。</p>
            </el-form>
        </div>
    </div>
</template>

<script setup lang="ts">
import { ref, reactive } from 'vue';
import { useTabsStore } from '@/store/tabs';
import { usePermissStore } from '@/store/permiss';
import { useRouter } from 'vue-router';
import { ElMessage } from 'element-plus';
import type { FormInstance, FormRules } from 'element-plus';
import { login as loginApi } from '@/api/index';
import type { AxiosResponse } from 'axios';

interface LoginInfo {
    username: string;
    password: string;
}

interface ApiResponse {
    code: string;
    msg: string;
    data: any;
}

const lgStr = localStorage.getItem('login-param');
const defParam = lgStr ? JSON.parse(lgStr) : null;
const checked = ref(lgStr ? true : false);

const router = useRouter();
const param = reactive<LoginInfo>({
    username: defParam ? defParam.username : '',
    password: defParam ? defParam.password : '',
});

const rules: FormRules = {
    username: [
        {
            required: true,
            message: '请输入用户名',
            trigger: 'blur',
        },
    ],
    password: [{ required: true, message: '请输入密码', trigger: 'blur' }],
};

const permiss = usePermissStore();
const loginForm = ref<FormInstance>();

const submitForm = (formEl: FormInstance | undefined) => {
    if (!formEl) return;
    formEl.validate((valid: boolean) => {
        if (valid) {
            loginApi({
                username: param.username,
                password: param.password
            })
                .then((response: AxiosResponse<ApiResponse>) => {
                    if (response.data.code === '200') {
                        localStorage.setItem('ms_username', param.username);
                        const keys = ['0', '1', '11', '12', '13', '14', '15', '7'];  // 添加 '0' 作为系统首页权限
                        permiss.handleSet(keys);
                        localStorage.setItem('ms_keys', JSON.stringify(keys));
                        if (checked.value) {
                            localStorage.setItem('login-param', JSON.stringify(param));
                        } else {
                            localStorage.removeItem('login-param');
                        }
                        // 记录登录时间
                        const now = new Date();
                        localStorage.setItem('loginTime', now.toLocaleString());
                        ElMessage.success('登录成功');
                        router.push('/');
                    } else {
                        ElMessage.error(response.data.msg);
                    }
                })
                .catch((error) => {
                    console.error('Login error:', error);
                    ElMessage.error('登录失败，请重试');
                });
        } else {
            return false;
        }
    });
};

const tabs = useTabsStore();
tabs.clearTabs();
</script>

<style scoped>
.login-bg {
    display: flex;
    align-items: center;
    justify-content: center;
    width: 100%;
    height: 100vh;
    background: url(../../assets/img/login-bg.jpg) center/cover no-repeat;
}

.login-header {
    display: flex;
    align-items: center;
    justify-content: center;
    margin-bottom: 40px;
}

.logo {
    width: 35px;
}

.login-title {
    font-size: 22px;
    color: #333;
    font-weight: bold;
}

.login-container {
    width: 450px;
    border-radius: 5px;
    background: #fff;
    padding: 40px 50px 50px;
    box-sizing: border-box;
}

.pwd-tips {
    display: flex;
    justify-content: space-between;
    align-items: center;
    font-size: 14px;
    margin: -10px 0 10px;
    color: #787878;
}

.pwd-checkbox {
    height: auto;
}

.login-btn {
    display: block;
    width: 100%;
}

.login-tips {
    font-size: 12px;
    color: #999;
    text-align: center;
    margin-top: 20px;
}
</style>
