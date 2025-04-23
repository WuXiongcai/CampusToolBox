import { Menus } from '@/types/menu';

export const menuData: Menus[] = [
    {
        id: '0',
        title: '系统首页',
        index: '/dashboard',
        icon: 'HomeFilled',
        permiss: '0'
    },
    {
        id: '1',
        title: '系统管理',
        index: '1',
        icon: 'Setting',
        children: [
            {
                id: '13',
                pid: '1',
                index: '/system-menu',
                title: '菜单管理',
                permiss: '13'
            },
            {
                id: '14',
                pid: '1',
                index: '/admin-manage',
                title: '管理员管理',
                permiss: '14'
            },
            {
                id: '15',
                pid: '1',
                index: '/notice',
                title: '公告管理',
                permiss: '15'
            },
            {
                id: '16',
                pid: '1',
                index: '/feedback',
                title: '反馈管理',
                permiss: '14'
            }
        ]
    },

    {
        id: '7',
        icon: 'Brush',
        index: '/theme',
        title: '主题',
    },
    {
        id: '6',
        icon: 'DocumentAdd',
        index: '6',
        title: '附加页面',
        children: [
            {
                id: '61',
                pid: '6',
                index: '/ucenter',
                title: '个人中心',
            },
            {
                id: '62',
                pid: '6',
                index: '/login',
                title: '登录',
            },
            {
                id: '63',
                pid: '6',
                index: '/register',
                title: '注册',
            },
            {
                id: '64',
                pid: '6',
                index: '/reset-pwd',
                title: '重设密码',
            },
            {
                id: '65',
                pid: '6',
                index: '/403',
                title: '403',
            },
            {
                id: '66',
                pid: '6',
                index: '/404',
                title: '404',
            },
        ],
    },
    {
        id: '14',
        pid: null,
        title: '工具管理',
        icon: 'Tools',
        index: '/tools',
        permiss: '14',
        children: [
            {
                id: '141',
                pid: '14',
                title: '常用工具',
                icon: 'Star',
                index: '/tools/common',
                permiss: '14'
            },
            {
                id: '142',
                pid: '14',
                title: 'AI问答工具',
                icon: 'ChatDotRound',
                index: '/tools/ai',
                permiss: '14'
            },
            {
                id: '143',
                pid: '14',
                title: '资源导航',
                icon: 'Guide',
                index: '/tools/resource-navigation',
                permiss: '14'
            },
            {
                id: '144',
                pid: '14',
                title: '理工科工具',
                icon: 'Monitor',
                index: '/tools/science',
                children: [
                    {
                        id: '1431',
                        pid: '143',
                        title: 'AI编程辅助工具',
                        icon: 'Code',
                        index: '/tools/ai-coding',
                        permiss: '14'
                    },
                    {
                        id: '1432',
                        pid: '143',
                        title: 'AI思维导图工具',
                        icon: 'MindMapping',
                        index: '/tools/ai-mindmap',
                        permiss: '14'
                    },
                    {
                        id: '1433',
                        pid: '143',
                        title: '数学建模辅助工具',
                        icon: 'DataAnalysis',
                        index: '/tools/math-model',
                        permiss: '14'
                    },
                    {
                        id: '1434',
                        pid: '143',
                        title: '代码托管工具',
                        icon: 'Document',
                        index: '/tools/code-hosting',
                        permiss: '14'
                    },
                    {
                        id: '1435',
                        pid: '143',
                        title: '编程刷题网站',
                        icon: 'Monitor',
                        index: '/tools/coding-practice',
                        permiss: '14'
                    },
                    {
                        id: '1436',
                        pid: '143',
                        title: '数据分析工具',
                        icon: 'DataAnalysis',
                        index: '/tools/data-analysis',
                        permiss: '14'
                    }
                ]
            },
            {
                id: '144',
                pid: '14',
                title: '其他工具',
                icon: 'More',
                index: '/tools/others',
                children: [
                    {
                        id: '1441',
                        pid: '144',
                        title: '文件格式转换工具',
                        icon: 'Document',
                        index: '/tools/file-convert',
                        permiss: '14'
                    },
                    {
                        id: '1442',
                        pid: '144',
                        title: '论文查重工具',
                        icon: 'Document',
                        index: '/tools/paper-check',
                        permiss: '14'
                    },
                    {
                        id: '1443',
                        pid: '144',
                        title: '学术资源检索网站',
                        icon: 'Search',
                        index: '/tools/academic-search',
                        permiss: '14'
                    },
                    {
                        id: '1444',
                        pid: '144',
                        title: '社区交流网站',
                        icon: 'ChatDotRound',
                        index: '/tools/community',
                        permiss: '14'
                    },
                    {
                        id: '1445',
                        pid: '144',
                        title: '在线翻译工具',
                        icon: 'Document',
                        index: '/tools/translation',
                        permiss: '14'
                    },
                    {
                        id: '1446',
                        pid: '144',
                        title: 'AI法律助手',
                        icon: 'Document',
                        index: '/tools/law',
                        permiss: '14'
                    },
                    {
                        id: '1447',
                        pid: '144',
                        title: 'AI音频工具',
                        icon: 'Headset',
                        index: '/tools/audio',
                        permiss: '14'
                    },
                    {
                        id: '1448',
                        pid: '144',
                        title: 'PPT生成工具',
                        icon: 'Document',
                        index: '/tools/ppt',
                        permiss: '14'
                    },
                    {
                        id: '1449',
                        pid: '144',
                        title: '教师资源网站',
                        icon: 'School',
                        index: '/tools/teacher',
                        permiss: '14'
                    },
                    {
                        id: '14410',
                        pid: '144',
                        title: '字体图标工具',
                        icon: 'FontSize',
                        index: '/tools/font-icon',
                        permiss: '14'
                    },
                    {
                        id: '14411',
                        pid: '144',
                        title: '简历模板网站',
                        icon: 'Document',
                        index: '/tools/resume',
                        permiss: '14'
                    },
                    {
                        id: '14412',
                        pid: '144',
                        title: '阅读总结工具',
                        icon: 'Reading',
                        index: '/tools/reading',
                        permiss: '14'
                    },
                    {
                        id: '14413',
                        pid: '144',
                        title: '图像绘画工具',
                        icon: 'Picture',
                        index: '/tools/image-drawing',
                        permiss: '14'
                    },
                    {
                        id: '14414',
                        pid: '144',
                        title: '图表工具',
                        icon: 'PieChart',
                        index: '/tools/chart',
                        permiss: '14'
                    }
                ]
            }
        ]
    },
];
