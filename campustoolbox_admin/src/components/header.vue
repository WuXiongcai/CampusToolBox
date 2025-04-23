<template>
    <div class="header">
        <!-- 折叠按钮 -->
        <div class="header-left">
            <img class="logo" src="../assets/img/logo.svg" alt="" />
            <div class="web-title">CampusToolBox后台</div>
            <div class="collapse-btn" @click="collapseChage">
                <el-icon v-if="sidebar.collapse">
                    <Expand />
                </el-icon>
                <el-icon v-else>
                    <Fold />
                </el-icon>
            </div>
        </div>
        <div class="header-right">
            <div class="header-user-con">
                <div class="btn-icon" @click="router.push('/theme')">
                    <el-tooltip effect="dark" content="设置主题" placement="bottom">
                        <i class="el-icon-lx-skin"></i>
                    </el-tooltip>
                </div>
                <div class="btn-icon" @click="router.push('/feedback')">
                    <el-tooltip
                        effect="dark"
                        :content="pendingFeedbacks ? `有${pendingFeedbacks}条待处理反馈` : `反馈管理`"
                        placement="bottom"
                    >
                        <i class="el-icon-lx-notice"></i>
                    </el-tooltip>
                    <span class="btn-bell-badge" v-if="pendingFeedbacks"></span>
                </div>
                <div class="btn-icon" @click="setFullScreen">
                    <el-tooltip effect="dark" content="全屏" placement="bottom">
                        <i class="el-icon-lx-full"></i>
                    </el-tooltip>
                </div>
                <a 
                    href="https://github.com/WuXiongcai/CampusToolBox" 
                    target="_blank" 
                    class="btn-icon github-btn"
                >
                    <el-tooltip effect="dark" content="作者仓库" placement="bottom">
                        <svg height="20" viewBox="0 0 16 16" width="20" aria-hidden="true">
                            <path fill="currentColor" d="M8 0C3.58 0 0 3.58 0 8c0 3.54 2.29 6.53 5.47 7.59.4.07.55-.17.55-.38 0-.19-.01-.82-.01-1.49-2.01.37-2.53-.49-2.69-.94-.09-.23-.48-.94-.82-1.13-.28-.15-.68-.52-.01-.53.63-.01 1.08.58 1.23.82.72 1.21 1.87.87 2.33.66.07-.52.28-.87.51-1.07-1.78-.2-3.64-.89-3.64-3.95 0-.87.31-1.59.82-2.15-.08-.2-.36-1.02.08-2.12 0 0 .67-.21 2.2.82.64-.18 1.32-.27 2-.27.68 0 1.36.09 2 .27 1.53-1.04 2.2-.82 2.2-.82.44 1.1.16 1.92.08 2.12.51.56.82 1.27.82 2.15 0 3.07-1.87 3.75-3.65 3.95.29.25.54.73.54 1.48 0 1.07-.01 1.93-.01 2.2 0 .21.15.46.55.38A8.013 8.013 0 0016 8c0-4.42-3.58-8-8-8z"></path>
                        </svg>
                    </el-tooltip>
                </a>
                <!-- 用户头像 -->
                <div class="user-info">
                    <el-dropdown class="user-name" trigger="click">
                        <span class="el-dropdown-link">
                            <el-avatar 
                                class="user-avatar" 
                                :size="30" 
                                :style="{ backgroundColor: getAvatarColor(username) }"
                            >
                                {{ getNameInitial(username) }}
                            </el-avatar>
                            {{ username }}
                        </span>
                        <template #dropdown>
                            <el-dropdown-menu>
                                <el-dropdown-item @click="handleCommand('user')">个人中心</el-dropdown-item>
                                <el-dropdown-item @click="handleCommand('logout')">退出登录</el-dropdown-item>
                            </el-dropdown-menu>
                        </template>
                    </el-dropdown>
                </div>
            </div>
        </div>
    </div>
</template>
<script setup lang="ts">
import { onMounted, computed, ref } from 'vue';
import { useSidebarStore } from '../store/sidebar';
import { useRouter } from 'vue-router';
import { getFeedbackList } from '@/api';

const router = useRouter();
const pendingFeedbacks = ref(0);

const username = computed(() => {
    return localStorage.getItem('ms_username') || 'Admin';
});

const sidebar = useSidebarStore();
// 侧边栏折叠
const collapseChage = () => {
    sidebar.handleCollapse();
};

// 获取待处理的反馈数量
const loadPendingFeedbacks = async () => {
    try {
        const res = await getFeedbackList({
            pageNum: 1,
            pageSize: 999 // 获取所有反馈
        });
        if (res?.data?.code === '200') {
            const { records } = res.data.data || {};
            if (Array.isArray(records)) {
                pendingFeedbacks.value = records.filter(item => item.status === 0).length;
            }
        }
    } catch (error) {
        console.error('获取待处理反馈数量失败:', error);
    }
};

onMounted(() => {
    if (document.body.clientWidth < 1500) {
        collapseChage();
    }
    // 加载待处理反馈数量
    loadPendingFeedbacks();
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

const handleCommand = (command: string) => {
    if (command === 'logout') {
        localStorage.clear();
        router.push('/login');
    } else if (command === 'user') {
        router.push('/ucenter');
    }
};

const setFullScreen = () => {
    if (document.fullscreenElement) {
        document.exitFullscreen();
    } else {
        document.body.requestFullscreen.call(document.body);
    }
};
</script>
<style scoped>
.header {
    display: flex;
    justify-content: space-between;
    align-items: center;
    box-sizing: border-box;
    width: 100%;
    height: 70px;
    color: var(--header-text-color);
    background-color: var(--header-bg-color);
    border-bottom: 1px solid #ddd;
}

.header-left {
    display: flex;
    align-items: center;
    padding-left: 20px;
    height: 100%;
}

.logo {
    width: 35px;
}

.web-title {
    margin: 0 40px 0 10px;
    font-size: 22px;
}

.collapse-btn {
    display: flex;
    justify-content: center;
    align-items: center;
    height: 100%;
    padding: 0 10px;
    cursor: pointer;
    opacity: 0.8;
    font-size: 22px;
}

.collapse-btn:hover {
    opacity: 1;
}

.header-right {
    float: right;
    padding-right: 50px;
}

.header-user-con {
    display: flex;
    height: 70px;
    align-items: center;
}

.btn-fullscreen {
    transform: rotate(45deg);
    margin-right: 5px;
    font-size: 24px;
}

.btn-icon {
    position: relative;
    width: 30px;
    height: 30px;
    text-align: center;
    cursor: pointer;
    display: flex;
    align-items: center;
    color: var(--header-text-color);
    margin: 0 5px;
    font-size: 20px;
}

.github-btn {
    text-decoration: none;
    transition: transform 0.3s ease;
}

.github-btn:hover {
    transform: scale(1.1);
}

.btn-bell-badge {
    position: absolute;
    right: 4px;
    top: 0px;
    width: 8px;
    height: 8px;
    border-radius: 4px;
    background: #f56c6c;
    color: var(--header-text-color);
}

.user-avatar {
    margin: 0 10px 0 20px;
}

.el-dropdown-link {
    color: var(--header-text-color);
    cursor: pointer;
    display: flex;
    align-items: center;
}

.el-dropdown-menu__item {
    text-align: center;
}

.user-info {
    display: flex;
    align-items: center;
    padding-right: 50px;
}

.user-name {
    margin-left: 10px;
}

.user-avatar {
    margin-right: 8px;
    font-size: 14px;
    font-weight: bold;
    color: #ffffff;
}

.el-dropdown-link {
    display: flex;
    align-items: center;
    color: #fff;
    cursor: pointer;
}
</style>
