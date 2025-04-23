import { createRouter, createWebHashHistory, RouteRecordRaw } from 'vue-router';
import { usePermissStore } from '../store/permiss';
import Home from '../views/home.vue';
import NProgress from 'nprogress';
import 'nprogress/nprogress.css';

const routes: RouteRecordRaw[] = [
    {
        path: '/',
        redirect: '/dashboard',
    },
    {
        path: '/',
        name: 'Home',
        component: Home,
        children: [
            {
                path: '/dashboard',
                name: 'dashboard',
                meta: {
                    title: '系统首页',
                    noAuth: true,
                },
                component: () => import(/* webpackChunkName: "dashboard" */ '../views/dashboard.vue'),
            },
            {
                path: '/admin-manage',
                name: 'adminManage',
                meta: {
                    title: '管理员管理',
                    permiss: '14',
                },
                component: () => import(/* webpackChunkName: "admin-manage" */ '../views/system/adminManage.vue'),
            },
            {
                path: '/notice',
                name: 'notice',
                meta: {
                    title: '公告管理',
                    permiss: '15',
                },
                component: () => import(/* webpackChunkName: "notice" */ '../views/system/notice.vue'),
            },
            {
                path: '/feedback',
                name: 'feedback',
                meta: {
                    title: '反馈管理',
                    permiss: '14'
                },
                component: () => import(/* webpackChunkName: "feedback" */ '../views/system/feedback.vue'),
            },
            {
                path: '/system-menu',
                name: 'system-menu',
                meta: {
                    title: '菜单管理',
                    permiss: '13',
                },
                component: () => import(/* webpackChunkName: "system-menu" */ '../views/system/menu.vue'),
            },
            {
                path: '/tools',
                name: 'tools',
                meta: {
                    title: '工具管理',
                    icon: 'Tools',
                    permiss: '14',
                },
                children: [
                    {
                        path: '/tools/common',
                        name: 'commonTools',
                        meta: {
                            title: '常用工具',
                            permiss: '14'
                        },
                        component: () => import('../views/tools/CommonTools.vue')
                    },
                    {
                        path: '/tools/ai',
                        name: 'aiTools',
                        meta: {
                            title: 'AI问答工具',
                            permiss: '14'
                        },
                        component: () => import('../views/tools/AiTools.vue')
                    },
                    {
                        path: '/tools/ai-coding',
                        name: 'aiCodingTools',
                        meta: {
                            title: 'AI编程辅助工具',
                            permiss: '14'
                        },
                        component: () => import('../views/tools/AiCodingTools.vue')
                    },
                    {
                        path: '/tools/ai-mindmap',
                        name: 'aiMindmapTools',
                        meta: {
                            title: 'AI思维导图工具',
                            permiss: '14'
                        },
                        component: () => import('../views/tools/AiMindmapTools.vue')
                    },
                    {
                        path: '/tools/file-convert',
                        name: 'fileConvertTools',
                        meta: {
                            title: '文件格式转换工具',
                            permiss: '14'
                        },
                        component: () => import('../views/tools/FileConvertTools.vue')
                    },
                    {
                        path: '/tools/paper-check',
                        name: 'paperCheckTools',
                        meta: {
                            title: '论文查重工具',
                            permiss: '14'
                        },
                        component: () => import('../views/tools/PaperCheckTools.vue')
                    },
                    {
                        path: '/tools/math-model',
                        name: 'mathModelTools',
                        meta: {
                            title: '数学建模辅助工具',
                            permiss: '14'
                        },
                        component: () => import('../views/tools/MathModelTools.vue')
                    },
                    {
                        path: '/tools/code-hosting',
                        name: 'codeHostingTools',
                        meta: {
                            title: '代码托管工具',
                            permiss: '14'
                        },
                        component: () => import('../views/tools/CodeHostingTools.vue')
                    },
                    {
                        path: '/tools/academic-search',
                        name: 'academicSearchTools',
                        meta: {
                            title: '学术资源检索网站',
                            permiss: '14'
                        },
                        component: () => import('../views/tools/AcademicSearchTools.vue')
                    },
                    {
                        path: '/tools/community',
                        name: 'communitySites',
                        meta: {
                            title: '社区交流网站',
                            permiss: '14'
                        },
                        component: () => import('../views/tools/CommunitySites.vue')
                    },
                    {
                        path: '/tools/translation',
                        name: 'translationTools',
                        meta: {
                            title: '在线翻译工具',
                            permiss: '14'
                        },
                        component: () => import('../views/tools/TranslationTools.vue')
                    },
                    {
                        path: '/tools/chart',
                        name: 'chartTools',
                        meta: {
                            title: '图表工具',
                            permiss: '14'
                        },
                        component: () => import('../views/tools/ChartTools.vue')
                    },
                    {
                        path: '/tools/law',
                        name: 'lawAssistants',
                        meta: {
                            title: 'AI法律助手',
                            permiss: '14'
                        },
                        component: () => import('../views/tools/LawAssistants.vue')
                    },
                    {
                        path: '/tools/audio',
                        name: 'audioTools',
                        meta: {
                            title: 'AI音频工具',
                            permiss: '14'
                        },
                        component: () => import('../views/tools/AudioTools.vue')
                    },
                    {
                        path: '/tools/coding-practice',
                        name: 'codingPractice',
                        meta: {
                            title: '编程刷题网站',
                            permiss: '14'
                        },
                        component: () => import('../views/tools/CodingPractice.vue')
                    },
                    {
                        path: '/tools/ppt',
                        name: 'pptTools',
                        meta: {
                            title: 'PPT生成工具',
                            permiss: '14'
                        },
                        component: () => import('../views/tools/PptTools.vue')
                    },
                    {
                        path: '/tools/teacher',
                        name: 'teacherResources',
                        meta: {
                            title: '教师资源网站',
                            permiss: '14'
                        },
                        component: () => import('../views/tools/TeacherResources.vue')
                    },
                    {
                        path: '/tools/font-icon',
                        name: 'fontIcons',
                        meta: {
                            title: '字体图标工具',
                            permiss: '14'
                        },
                        component: () => import('../views/tools/FontIcons.vue')
                    },
                    {
                        path: '/tools/resume',
                        name: 'resumeTemplates',
                        meta: {
                            title: '简历模板网站',
                            permiss: '14'
                        },
                        component: () => import('../views/tools/ResumeTemplates.vue')
                    },
                    {
                        path: '/tools/reading',
                        name: 'readingSummary',
                        meta: {
                            title: '阅读总结工具',
                            permiss: '14'
                        },
                        component: () => import('../views/tools/ReadingSummary.vue')
                    },
                    {
                        path: '/tools/data-analysis',
                        name: 'dataAnalysis',
                        meta: {
                            title: '数据分析工具',
                            permiss: '14'
                        },
                        component: () => import('../views/tools/DataAnalysis.vue')
                    },
                    {
                        path: '/tools/image-drawing',
                        name: 'imageDrawing',
                        meta: {
                            title: '图像绘画工具',
                            permiss: '14'
                        },
                        component: () => import('../views/tools/ImageDrawing.vue')
                    },
                    {
                        path: '/tools/resource-navigation',
                        name: 'resourceNavigation',
                        meta: {
                            title: '资源导航',
                            permiss: '14'
                        },
                        component: () => import('../views/tools/ResourceNavigation.vue')
                    }
                ]
            },
            {
                path: '/ucenter',
                name: 'ucenter',
                meta: {
                    title: '个人中心',
                },
                component: () => import(/* webpackChunkName: "ucenter" */ '../views/pages/ucenter.vue'),
            },
            {
                path: '/theme',
                name: 'theme',
                meta: {
                    title: '主题设置',
                    permiss: '7',
                },
                component: () => import(/* webpackChunkName: "theme" */ '../views/pages/theme.vue'),
            },
        ],
    },
    {
        path: '/login',
        meta: {
            title: '登录',
            noAuth: true,
        },
        component: () => import(/* webpackChunkName: "login" */ '../views/pages/login.vue'),
    },
    {
        path: '/403',
        meta: {
            title: '没有权限',
            noAuth: true,
        },
        component: () => import(/* webpackChunkName: "403" */ '../views/pages/403.vue'),
    },
    {
        path: '/404',
        meta: {
            title: '找不到页面',
            noAuth: true,
        },
        component: () => import(/* webpackChunkName: "404" */ '../views/pages/404.vue'),
    },
    { path: '/:path(.*)', redirect: '/404' },
];

const router = createRouter({
    history: createWebHashHistory(),
    routes,
});

router.beforeEach((to, from, next) => {
    document.title = `${to.meta.title} | CampusToolBox后台`;
    const role = localStorage.getItem('ms_username');
    const permiss = localStorage.getItem('ms_keys') || '';
    if (!role && to.path !== '/login') {
        next('/login');
    } else if (to.meta.permiss && !permiss.includes(to.meta.permiss as string)) {
        // 如果没有权限，则进入403
        next('/403');
    } else {
        next();
    }
});

router.afterEach(() => {
    NProgress.done();
});

export default router;
