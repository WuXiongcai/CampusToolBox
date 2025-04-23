<template>
    <div class="dashboard-container">
        <!-- 欢迎卡片 -->
        <div class="welcome-card">
            <div class="welcome-header">
                <div class="welcome-info">
                    <img src="../assets/img/avatar.jpg" alt="avatar" class="avatar">
                    <div class="welcome-text">
                        <h2>欢迎回来，{{ username }}！</h2>
                        <p>{{ getGreeting() }}</p>
                    </div>
                </div>
                <!-- 添加段子显示区域 -->
                <div class="joke-container">
                    <p class="joke-text">{{ currentJoke }}</p>
                </div>
                <div class="welcome-stats">
                    <div class="stat-item">
                        <el-icon><Clock /></el-icon>
                        <div class="stat-info">
                            <span class="label">当前时间</span>
                            <span class="value">{{ currentTime }}</span>
                        </div>
                    </div>
                    <div class="stat-item">
                        <el-icon><Calendar /></el-icon>
                        <div class="stat-info">
                            <span class="label">本次登录时间</span>
                            <span class="value">{{ loginTime }}</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="dashboard-main">
            <!-- 左侧内容区 -->
            <div class="dashboard-left">
                <!-- 数据统计卡片 -->
                <div class="data-cards">
                    <el-row :gutter="20">
                        <el-col :span="6" v-for="(item, index) in dataCards" :key="index">
                            <div class="data-card">
                                <div class="data-icon">
                                    <el-icon><component :is="item.icon" /></el-icon>
                                </div>
                                <div class="data-info">
                                    <div class="data-title">{{ item.title }}</div>
                                    <div class="data-value">{{ item.value }}</div>
                                    <div class="data-trend">
                                        <span :class="item.trend >= 0 ? 'up' : 'down'">
                                            {{ Math.abs(item.trend) }}%
                                            <el-icon><component :is="item.trend >= 0 ? 'ArrowUp' : 'ArrowDown'" /></el-icon>
                                        </span>
                                        较上周
                                    </div>
                                </div>
                            </div>
                        </el-col>
                    </el-row>
                </div>

                <!-- 快速访问卡片 -->
                <div class="quick-access">
                    <div class="chart-card">
                        <div class="chart-header">
                            <h3>快速访问</h3>
                        </div>
                        <div class="quick-access-content">
                            <el-row :gutter="12">
                                <el-col :span="6" v-for="(item, index) in quickAccessItems" :key="index">
                                    <div class="quick-access-item" @click="navigateTo(item.path)">
                                        <el-icon><component :is="item.icon" /></el-icon>
                                        <span>{{ item.name }}</span>
                                    </div>
                                </el-col>
                            </el-row>
                        </div>
                    </div>
                </div>

                <!-- 工具介绍卡片 -->
                <div class="tools-intro">
                    <div class="chart-card">
                        <div class="chart-header">
                            <h3>工具介绍</h3>
                        </div>
                        <div class="tools-grid">
                            <div 
                                class="tool-item" 
                                v-for="(tool, index) in toolIntros" 
                                :key="index"
                                @click="navigateTo(tool.path)"
                            >
                                <el-icon><component :is="tool.icon" /></el-icon>
                                <h4>{{ tool.name }}</h4>
                                <p>{{ tool.desc }}</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- 右侧内容区 -->
            <div class="dashboard-right">
                <!-- 系统公告时间轴 -->
                <div class="notice-timeline-card">
                    <div class="card-header">
                        <h3>系统公告</h3>
                        <el-button type="primary" link @click="navigateTo('/notice')">
                            查看全部
                            <el-icon><ArrowRight /></el-icon>
                        </el-button>
                    </div>
                    <div class="notice-timeline">
                    <el-timeline>
                            <el-timeline-item
                                v-for="notice in notices"
                                :key="notice.id"
                                :timestamp="formatDate(notice.createTime)"
                                :type="notice.status ? 'primary' : 'info'"
                                :hollow="!notice.status"
                            >
                                <div class="timeline-content" @click="handleViewNotice(notice)">
                                    <h4>{{ notice.title }}</h4>
                                    <p class="notice-brief">{{ notice.content }}</p>
                                    <div class="notice-meta">
                                        <span>发布人：{{ notice.createBy }}</span>
                                </div>
                            </div>
                        </el-timeline-item>
                    </el-timeline>
                    </div>
                </div>
            
                <!-- 版本信息 -->
                <div class="version-card">
                    <div class="card-header">
                        <h3>版本信息</h3>
                    </div>
                    <div class="version-info">
                        <table>
                            <tr>
                                <td>当前版本：</td>
                                <td>v1.0.0</td>
                            </tr>
                            <tr>
                                <td>框架信息：</td>
                                <td>SpringBoot+Vue3+Mybatis+TypeScript</td>
                            </tr>
                            <tr>
                                <td>主要特色：</td>
                                <td>适合初学者 / 响应式 / 极简</td>
                            </tr>
                            <tr>
                                <td>演示地址：</td>
                                <td>
                                    <a href="http://campustoolbox.site/" target="_blank">http://campustoolbox.site/</a>
                                </td>
                            </tr>
                            <tr>
                                <td>下载地址：</td>
                                <td>
                                    <a href="https://github.com/WuXiongcai/CampusToolBox" target="_blank">Github</a>
                                </td>
                            </tr>
                        </table>
                            </div>
                        </div>

                <!-- 工具使用分布图表 -->
                <div class="chart-card">
                    <div class="chart-header">
                        <h3>工具使用分布</h3>
                    </div>
                    <div class="chart-content">
                        <div ref="toolsChart" style="height: 300px"></div>
                    </div>
                </div>
            </div>
        </div>

        <!-- 查看公告详情弹窗 -->
        <el-dialog
            title="公告详情"
            v-model="noticeDialogVisible"
            width="50%"
        >
            <div class="notice-detail">
                <h3>{{ currentNotice?.title }}</h3>
                <div class="notice-meta">
                    <span>发布人：{{ currentNotice?.createBy }}</span>
                    <span>发布时间：{{ formatDate(currentNotice?.createTime) }}</span>
                </div>
                <div class="notice-content">
                    {{ currentNotice?.content }}
                </div>
            </div>
        </el-dialog>
    </div>
</template>

<script setup lang="ts">
import { ref, onMounted, onUnmounted, nextTick } from 'vue';
import { useRouter } from 'vue-router';
import { ElMessage } from 'element-plus';
import * as echarts from 'echarts';
import { 
    Clock, 
    Calendar, 
    Setting, 
    User, 
    Bell, 
    Tools,
    Monitor,
    Document,
    Search,
    ChatDotRound,
    School,
    ArrowRight,
    ArrowUp,
    ArrowDown,
    Promotion,
    Connection,
    DataLine,
    TrendCharts,
    Headset,
    Picture,
    PieChart,
    Reading,
    Edit,
    Management
} from '@element-plus/icons-vue';
import { fetchNoticeData, getNoticeCount, getToolsCount, getFeedbackList } from '@/api/index';

interface Notice {
    id: number;
    title: string;
    content: string;
    createBy: string;
    createTime: string;
    status: number;
}

const router = useRouter();
const username = ref(localStorage.getItem('ms_username') || '管理员');
const currentTime = ref('');
const loginTime = ref('未登录');
const noticeDialogVisible = ref(false);
const currentNotice = ref<Notice | null>(null);
const notices = ref<Notice[]>([]);
const visitTimeRange = ref('week');
const visitChart = ref<HTMLElement | null>(null);
const toolsChart = ref<HTMLElement | null>(null);
let toolsChartInstance: echarts.ECharts | null = null;

// 程序员段子数组
const programmerJokes = [
    "为什么学编程？因为世界需要更多能修电脑的人……不，是改变世界的人！",
    "程序员最浪漫的情话不是'我爱你'，而是'我帮你调通了'。",
    "学编程就像谈恋爱，一开始全是bug，后来慢慢就习惯了。",
    "写代码一时爽，一直写一直爽……直到遇到段错误（Segmentation Fault）。",
    "当初以为学计算机是'高薪职业'，后来发现是高'秃'职业。",
    "程序员的黑眼圈不是熬夜熬的，是IDE（集成开发环境）的黑色主题反光的。",
    "学计算机的以为自己是未来扎克伯格，直到焊电路板时烫到手，才明白自己是当代爱迪生（的学徒）。",
    "面试官：'你擅长什么语言？'\n我：'C++、Java、Python……和沉默。'",
    "复习时的我：'TCP三次握手？简单！'\n考场的我：'TCP……是那个……UDP他兄弟？'",
    "大一时：我要进大厂当架构师！\n大四时：只要给钱，我连祖传的HTML都愿意维护！",
    "考《操作系统》前：进程调度？简单！\n考场上：这题是考我先挂还是系统先挂？",
    "入学前：我要成为算法大神，年薪百万！\n毕业后：外卖算法能不能别老给我推同一家店？",
    "写毕业设计时：这个项目一定要放到GitHub上！\n工作后：这段代码千万不能传到GitHub上...",
    "大一时：我要精通C++、Java、Python三大语言！\n毕业时：精通Word、Excel、PPT三大办公软件..."
];

// 当前显示的段子
const currentJoke = ref('');

// 获取随机段子
const getRandomJoke = () => {
    const randomIndex = Math.floor(Math.random() * programmerJokes.length);
    return programmerJokes[randomIndex];
};

// 快速访问项
const quickAccessItems = [
    { name: '常用工具', icon: 'Tools', path: '/tools/common' },
    { name: '资源导航', icon: 'Promotion', path: '/tools/resource' },
    { name: 'AI编程助手', icon: 'ChatDotRound', path: '/tools/ai-coding' },
    { name: '学术资源', icon: 'School', path: '/tools/academic' },
    { name: '数据分析', icon: 'Monitor', path: '/tools/data-analysis' },
    { name: '格式转换', icon: 'Document', path: '/tools/file-convert' },
    { name: '数学建模', icon: 'Setting', path: '/tools/math-model' },
    { name: '简历模板', icon: 'User', path: '/tools/resume' }
];

// 数据卡片数据
const dataCards = ref([
    {
        icon: 'View',
        title: '总访问量',
        value: '2,345',
        trend: 12.5
    },
    {
        icon: 'ChatDotRound',
        title: '反馈建议',
        value: '0',
        trend: 0
    },
    {
        icon: 'Tools',
        title: '工具数量',
        value: '0',
        trend: 0
    },
    {
        icon: 'Bell',
        title: '公告数量',
        value: '0',
        trend: 0
    }
]);

// 获取工具数量和公告数量
const fetchStatistics = async () => {
    try {
        // 获取反馈数量
        const feedbackRes = await getFeedbackList({
            pageNum: 1,
            pageSize: 10
        });
        
        console.log('反馈数据响应:', feedbackRes);
        
        if (feedbackRes?.data?.code === '200') {
            const { records, total } = feedbackRes.data.data;
            console.log('解析的反馈数据:', { records, total });
            
            // 更新反馈建议卡片数据
            dataCards.value[1].value = records ? records.length.toString() : '0';
            
            // 计算环比增长
            const currentCount = records ? records.length : 0;
            const lastWeekCount = 0; // 这里可以从后端获取上周数据
            const trend = lastWeekCount > 0 ? 
                ((currentCount - lastWeekCount) / lastWeekCount * 100) : 0;
            
            dataCards.value[1].trend = Number(trend.toFixed(1));
            console.log('更新后的反馈统计:', {
                value: dataCards.value[1].value,
                trend: dataCards.value[1].trend
            });
        }

        // 获取工具数量
        const toolsRes = await getToolsCount();
        if (toolsRes?.data?.code === '200') {
            const toolsData = toolsRes.data.data;
            dataCards.value[2].value = toolsData.total;
            const trend = toolsData.lastTotal > 0 ? 
                ((toolsData.total - toolsData.lastTotal) / toolsData.lastTotal * 100) : 0;
            dataCards.value[2].trend = Number(trend.toFixed(1));
        }

        // 获取公告数量
        const noticeRes = await getNoticeCount();
        if (noticeRes?.data?.code === '200') {
            const noticeData = noticeRes.data.data;
            dataCards.value[3].value = noticeData.total;
            const trend = noticeData.lastWeek > 0 ? 
                ((noticeData.total - noticeData.lastWeek) / noticeData.lastWeek * 100) : 0;
            dataCards.value[3].trend = Number(trend.toFixed(1));
        }
    } catch (error) {
        console.error('获取统计数据失败:', error);
    }
};

// 工具介绍数据
const toolIntros = [
    {
        icon: 'Edit',
        name: 'AI思维导图工具',
        desc: '智能生成思维导图，帮助理清思路和知识结构',
        path: '/tools/ai-mindmap'
    },
    {
        icon: 'ChatDotRound',
        name: 'AI问答工具',
        desc: '智能问答系统，为学习和工作提供即时解答',
        path: '/tools/ai'
    },
    {
        icon: 'Headset',
        name: 'AI音频工具',
        desc: '语音识别与合成，支持多语言转换',
        path: '/tools/audio'
    },
    {
        icon: 'PieChart',
        name: '图表工具',
        desc: '专业的数据可视化工具，支持多种图表类型',
        path: '/tools/chart'
    },
    {
        icon: 'Management',
        name: '代码托管工具',
        desc: '安全可靠的代码版本管理与协作平台',
        path: '/tools/code-hosting'
    },
    {
        icon: 'Monitor',
        name: '编程刷题网站',
        desc: '丰富的编程练习题库，提升编程能力',
        path: '/tools/coding-practice'
    },
    {
        icon: 'ChatDotRound',
        name: '社区交流网站',
        desc: '开发者交流平台，分享经验与解决方案',
        path: '/tools/community'
    },
    {
        icon: 'Reading',
        name: '论文查重工具',
        desc: '专业的学术论文查重与格式检查工具',
        path: '/tools/paper-check'
    },
    {
        icon: 'Document',
        name: 'AI法律助手',
        desc: '智能法律咨询与文书生成工具',
        path: '/tools/law'
    },
    {
        icon: 'School',
        name: '教师资源网站',
        desc: '丰富的教学资源库，助力教学工作',
        path: '/tools/teacher'
    },
    {
        icon: 'Picture',
        name: '图像绘画工具',
        desc: 'AI辅助创作，让创意更具表现力',
        path: '/tools/image-drawing'
    },
    {
        icon: 'Document',
        name: 'PPT生成工具',
        desc: '智能PPT模板与一键生成功能',
        path: '/tools/ppt'
    }
];

// 更新当前时间
const updateCurrentTime = () => {
    const now = new Date();
    currentTime.value = now.toLocaleString();
    // 更新登录时间
    const storedLoginTime = localStorage.getItem('loginTime');
    loginTime.value = storedLoginTime || '未登录';
};

let currentTimeInterval: number;

onMounted(() => {
    nextTick(() => {
        initToolsChart();
        fetchStatistics(); // 获取统计数据
    });
    
    // 获取系统公告
    fetchNotices();
    
    // 更新当前时间和登录时间
    updateCurrentTime();
    currentTimeInterval = setInterval(updateCurrentTime, 1000);

    // 设置随机段子
    currentJoke.value = getRandomJoke();
});

onUnmounted(() => {
    if (toolsChartInstance) {
        toolsChartInstance.dispose();
    }
    if (currentTimeInterval) {
        clearInterval(currentTimeInterval);
    }
});

// 初始化工具使用分布图表
const initToolsChart = () => {
    if (toolsChart.value) {
        toolsChartInstance = echarts.init(toolsChart.value);
        const option = {
            tooltip: {
                trigger: 'item'
            },
            legend: {
                orient: 'vertical',
                left: 'left'
            },
            series: [
                {
                    name: '工具使用分布',
                    type: 'pie',
                    radius: '50%',
                    data: [
                        { value: 1048, name: 'AI编程助手' },
                        { value: 735, name: '学术资源' },
                        { value: 580, name: '数据分析' },
                        { value: 484, name: '格式转换' },
                        { value: 300, name: '数学建模' }
                    ],
                    emphasis: {
                        itemStyle: {
                            shadowBlur: 10,
                            shadowOffsetX: 0,
                            shadowColor: 'rgba(0, 0, 0, 0.5)'
                        }
                    }
                }
            ]
        };
        toolsChartInstance.setOption(option);
    }
};

// 获取问候语
const getGreeting = () => {
    const hour = new Date().getHours();
    if (hour < 6) return '夜深了，注意休息哦！';
    if (hour < 9) return '早上好，新的一天开始啦！';
    if (hour < 12) return '上午好，工作顺利！';
    if (hour < 14) return '中午好，记得休息一下！';
    if (hour < 18) return '下午好，继续加油！';
    if (hour < 22) return '晚上好，辛苦了！';
    return '夜深了，注意休息哦！';
};

// 获取公告列表
const fetchNotices = async () => {
    try {
        const res = await fetchNoticeData({
            pageNum: 1,
            pageSize: 6
        });
        if (res.data.code === '200') {
            notices.value = res.data.data.list;
        }
    } catch (error) {
        console.error('获取公告失败:', error);
        ElMessage.error('获取公告失败');
    }
};

// 格式化日期
const formatDate = (date: string) => {
    if (!date) return '';
    return new Date(date).toLocaleString();
};

// 查看公告详情
const handleViewNotice = (notice: Notice) => {
    currentNotice.value = notice;
    noticeDialogVisible.value = true;
};

// 导航到指定路径
const navigateTo = (path: string) => {
    router.push(path);
};

// 窗口大小改变时重绘图表
window.addEventListener('resize', () => {
    if (toolsChartInstance) {
        toolsChartInstance.resize();
    }
});
</script>

<style scoped>
.dashboard-container {
    padding: 20px;
    background-color: #f5f7fa;
    min-height: calc(100vh - 60px);
}

.welcome-card {
    background-color: #145b7d;
    border-radius: 8px;
    padding: 16px;
    color: white;
    margin-bottom: 20px;
    box-shadow: 0 2px 12px rgba(0, 0, 0, 0.1);
    width: 97%;
}

.dashboard-main {
    display: flex;
    gap: 20px;
    margin-top: 20px;
}

.dashboard-left {
    flex: 1;
}

.dashboard-right {
    width: 380px;
}

.welcome-header {
    display: flex;
    justify-content: space-between;
    align-items: center;
    gap: 20px;
}

.welcome-info {
    display: flex;
    align-items: center;
    min-width: 280px;
}

.avatar {
    width: 56px;
    height: 56px;
    border-radius: 50%;
    margin-right: 16px;
    border: 2px solid rgba(255, 255, 255, 0.8);
}

.welcome-text h2 {
    margin: 0;
    font-size: 20px;
    font-weight: 600;
}

.welcome-text p {
    margin: 6px 0 0;
    opacity: 0.9;
    font-size: 14px;
}

.joke-container {
    flex: 1;
    background: rgba(255, 255, 255, 0.1);
    border-radius: 8px;
    padding: 12px 16px;
    margin: 0 20px;
    max-width: 500px;
}

.joke-text {
    margin: 0;
    font-size: 14px;
    line-height: 1.5;
    color: rgba(255, 255, 255, 0.9);
    white-space: pre-line;
    display: -webkit-box;
    -webkit-line-clamp: 2;
    -webkit-box-orient: vertical;
    overflow: hidden;
    text-overflow: ellipsis;
}

.welcome-stats {
    display: flex;
    gap: 16px;
    min-width: 320px;
}

.stat-item {
    display: flex;
    align-items: center;
    background: rgba(255, 255, 255, 0.1);
    padding: 8px 12px;
    border-radius: 6px;
}

.stat-item .el-icon {
    font-size: 20px;
    margin-right: 8px;
}

.stat-info {
    display: flex;
    flex-direction: column;
}

.stat-info .label {
    font-size: 12px;
    opacity: 0.8;
}

.stat-info .value {
    font-size: 14px;
    font-weight: 500;
}

.data-cards {
    margin-bottom: 20px;
}

.data-card {
    padding: 12px;
    border-radius: 8px;
    height: 85px;
    display: flex;
    align-items: center;
    transition: transform 0.3s;
    color: white;
}

.el-col:nth-child(1) .data-card {
    background-color: #76becc;
}

.el-col:nth-child(2) .data-card {
    background-color: #74905d;
}

.el-col:nth-child(3) .data-card {
    background-color: #6f6d85;
}

.el-col:nth-child(4) .data-card {
    background-color: #f58f98;
}

.data-icon {
    font-size: 28px;
    margin-right: 12px;
    opacity: 0.8;
}

.data-info {
    flex: 1;
}

.data-title {
    font-size: 13px;
    margin-bottom: 6px;
    opacity: 0.9;
}

.data-value {
    font-size: 22px;
    font-weight: bold;
    margin-bottom: 4px;
}

.data-trend {
    font-size: 12px;
    opacity: 0.9;
}

.data-trend .up {
    color: #ffffff;
}

.data-trend .down {
    color: #ffffff;
}

.quick-access {
    margin-bottom: 16px;
}

.quick-access .chart-card {
    padding: 12px;
}

.quick-access .chart-header {
    margin-bottom: 8px;
    padding: 0 4px;
}

.quick-access .chart-header h3 {
    font-size: 15px;
    margin: 0;
}

.quick-access-content {
    padding: 4px;
}

.quick-access-item {
    height: 64px;
    background-color: #f5f7fa;
    border-radius: 6px;
    display: flex;
    flex-direction: column;
    align-items: center;
    justify-content: center;
    cursor: pointer;
    transition: all 0.3s;
    margin-bottom: 12px;
    padding: 6px;
}

.quick-access-item:hover {
    background-color: #ecf5ff;
    transform: translateY(-2px);
}

.quick-access-item .el-icon {
    font-size: 20px;
    color: #409EFF;
    margin-bottom: 4px;
}

.quick-access-item span {
    font-size: 13px;
    color: #606266;
    line-height: 1;
}

.chart-container {
    margin-bottom: 24px;
}

.chart-card {
    background: white;
    border-radius: 12px;
    padding: 16px;
    box-shadow: 0 4px 12px rgba(0, 0, 0, 0.05);
}

.chart-header {
    display: flex;
    justify-content: space-between;
    align-items: center;
    margin-bottom: 12px;
    padding: 0 4px;
}

.chart-header h3 {
    margin: 0;
    font-size: 16px;
    font-weight: 600;
}

.notice-timeline-card {
    background: white;
    border-radius: 8px;
    padding: 16px;
    margin-bottom: 16px;
    box-shadow: 0 2px 12px rgba(0, 0, 0, 0.05);
}

.card-header {
    display: flex;
    justify-content: space-between;
    align-items: center;
    margin-bottom: 12px;
}

.card-header h3 {
    margin: 0;
    font-size: 16px;
    font-weight: 600;
}

.notice-timeline {
    max-height: 500px;
    overflow-y: auto;
    padding-right: 8px;
}

.timeline-content {
    cursor: pointer;
    padding: 10px;
    background: #f5f7fa;
    border-radius: 6px;
    transition: background-color 0.3s;
    margin-bottom: 8px;
}

.timeline-content:hover {
    background: #e6f7ff;
}

.timeline-content h4 {
    margin: 0 0 8px;
    font-size: 14px;
    color: #1f2f3d;
}

.notice-brief {
    margin: 0;
    font-size: 12px;
    color: #606266;
    overflow: hidden;
    text-overflow: ellipsis;
    display: -webkit-box;
    -webkit-line-clamp: 2;
    -webkit-box-orient: vertical;
}

.notice-meta {
    margin-top: 8px;
    font-size: 12px;
    color: #909399;
}

.version-card {
    background: white;
    border-radius: 8px;
    padding: 16px;
    box-shadow: 0 2px 12px rgba(0, 0, 0, 0.05);
}

.version-info table {
    width: 100%;
    border-collapse: collapse;
}

.version-info tr {
    line-height: 28px;
}

.version-info td {
    padding: 4px 0;
    font-size: 14px;
    white-space: nowrap;
}

.version-info td:first-child {
    color: #606266;
    width: 90px;
}

.version-info a {
    color: #409EFF;
    text-decoration: none;
    margin: 0 4px;
}

.version-info a:hover {
    color: #66b1ff;
}

.notice-detail {
    padding: 20px;
}

.notice-detail h3 {
    margin: 0 0 16px;
    font-size: 18px;
    color: #1f2f3d;
}

.notice-meta {
    margin: 12px 0;
    color: #909399;
    display: flex;
    gap: 24px;
}

.notice-content {
    margin-top: 20px;
    line-height: 1.6;
    color: #303133;
}

@media (max-width: 1200px) {
    .dashboard-main {
        flex-direction: column;
    }

    .dashboard-right {
        width: 100%;
    }

    .data-cards .el-col {
        margin-bottom: 16px;
    }
}

:deep(.el-timeline-item__node--normal) {
    left: -2px;
    width: 12px;
    height: 12px;
}

:deep(.el-timeline-item__tail) {
    left: 4px;
    border-left: 2px solid #e4e7ed;
}

:deep(.el-timeline-item__wrapper) {
    padding-left: 28px;
}

.tools-intro {
    margin-top: 20px;
}

.tools-grid {
    display: grid;
    grid-template-columns: repeat(4, 1fr);
    gap: 12px;
    padding: 12px;
}

.tool-item {
    background: #f5f7fa;
    border-radius: 6px;
    padding: 12px;
    text-align: center;
    transition: all 0.3s;
    cursor: pointer;
    height: 120px;
    display: flex;
    flex-direction: column;
    align-items: center;
    justify-content: center;
}

.tool-item:hover {
    transform: translateY(-2px);
    box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
    background: #ecf5ff;
    color: #409EFF;
}

.tool-item:hover .el-icon {
    color: #409EFF;
}

.tool-item:hover h4 {
    color: #409EFF;
}

.tool-item .el-icon {
    font-size: 28px;
    color: #409EFF;
    margin-bottom: 8px;
}

.tool-item h4 {
    margin: 0 0 4px;
    font-size: 14px;
    color: #303133;
}

.tool-item p {
    margin: 0;
    font-size: 12px;
    color: #606266;
    line-height: 1.3;
    display: -webkit-box;
    -webkit-line-clamp: 2;
    -webkit-box-orient: vertical;
    overflow: hidden;
    text-overflow: ellipsis;
}

@media (max-width: 1400px) {
    .tools-grid {
        grid-template-columns: repeat(3, 1fr);
    }
}

@media (max-width: 1000px) {
    .tools-grid {
        grid-template-columns: repeat(2, 1fr);
    }
}

@media (max-width: 768px) {
    .tools-grid {
        grid-template-columns: repeat(1, 1fr);
    }
}

.dashboard-right .chart-card {
    margin-top: 16px;
}
</style>
