<template>
  <header class="header">
    <div class="announcement-bar">
      <div class="announcements" ref="announcementRef">
        <div
          v-for="announcement in announcements"
          :key="announcement.id"
          class="announcement-item"
        >
          {{ announcement.content }}
        </div>
      </div>
    </div>
    <div class="header-main">
      <div class="header-left">
        <div class="logo">
          <img src="@/assets/logo.png" alt="Logo" class="logo-img" />
          <div class="logo-text">
            <h1>CampusToolBox</h1>
            <p class="slogan">校园生活，工具加持</p>
          </div>
        </div>
      </div>
      <div class="header-center">
        <div class="search-box">
          <span class="search-icon">🔍</span>
          <input
            v-model="searchQuery"
            type="text"
            placeholder="搜索工具..."
            @input="handleSearch"
          />
          <div class="search-tags" v-if="searchQuery">
            <span class="search-tag" v-for="tag in searchTags" :key="tag" @click="addTagToSearch(tag)">
              {{ tag }}
            </span>
          </div>
        </div>
      </div>
      <div class="header-right">
        <div class="header-actions">
          <button class="action-btn" @click="showNotifications">
            <span class="icon">🔔</span>
            <span class="badge">2</span>
          </button>
          <button class="action-btn" @click="handleAdminClick" title="点击三次进入后台管理">
            <span class="icon">🔑</span>
          </button>
          <button class="action-btn" @click="toggleTheme">
            <span class="icon">{{ isDarkTheme ? '🌞' : '🌙' }}</span>
          </button>
          <a 
            href="https://github.com/WuXiongcai/CampusToolBox" 
            target="_blank" 
            class="action-btn github-btn" 
            title="作者仓库"
          >
            <span class="icon">
              <svg height="24" viewBox="0 0 16 16" width="24" aria-hidden="true">
                <path fill="currentColor" d="M8 0C3.58 0 0 3.58 0 8c0 3.54 2.29 6.53 5.47 7.59.4.07.55-.17.55-.38 0-.19-.01-.82-.01-1.49-2.01.37-2.53-.49-2.69-.94-.09-.23-.48-.94-.82-1.13-.28-.15-.68-.52-.01-.53.63-.01 1.08.58 1.23.82.72 1.21 1.87.87 2.33.66.07-.52.28-.87.51-1.07-1.78-.2-3.64-.89-3.64-3.95 0-.87.31-1.59.82-2.15-.08-.2-.36-1.02.08-2.12 0 0 .67-.21 2.2.82.64-.18 1.32-.27 2-.27.68 0 1.36.09 2 .27 1.53-1.04 2.2-.82 2.2-.82.44 1.1.16 1.92.08 2.12.51.56.82 1.27.82 2.15 0 3.07-1.87 3.75-3.65 3.95.29.25.54.73.54 1.48 0 1.07-.01 1.93-.01 2.2 0 .21.15.46.55.38A8.013 8.013 0 0016 8c0-4.42-3.58-8-8-8z"></path>
              </svg>
            </span>
          </a>
          <div class="user-profile" @click="toggleUserMenu">
            <div class="avatar-text">{{ getAvatarText(username) }}</div>
            <span class="username">{{ username }}</span>
            <span class="dropdown-icon">▼</span>
          </div>
        </div>
      </div>
    </div>
  </header>
</template>

<script setup lang="ts">
import { ref, onMounted } from 'vue'
import { fetchNotices } from '@/api'

const searchQuery = ref('')
const isDarkTheme = ref(false)
const announcementRef = ref<HTMLElement | null>(null)
const announcements = ref<{id: number, content: string}[]>([])
const username = ref('')
const adminClickCount = ref(0)
const lastClickTime = ref(0)

// 用户名列表
const usernameList = [
  '码农本农',
  '秃头程序员',
  '键盘侠',
  'Bug制造机',
  '404未找到对象',
  '内存泄漏大师',
  '死循环专业户',
  '产品经理克星',
  '加班到天亮',
  '需求毁灭者',
  '测试不通过',
  '注释写得很详细',
  '代码能跑就行',
  '复制粘贴工程师',
  '服务器崩了找我',
  'Git提交艺术家',
  '编译一次过',
  '面试造火箭',
  '上班摸鱼写代码',
  '码到成功',
  '代码有毒',
  '删库警告',
  '不写注释',
  '变量瞎起',
  '永不报错',
  '键盘冒烟',
  '需求别改',
  '加班狂魔',
  '调参玄学',
  '越改越崩',
  '能跑就行',
  '随手一敲',
  '重构地狱',
  '注释是啥',
  '绝不测试'
]

// 生成随机用户名
const generateRandomUsername = () => {
  const randomIndex = Math.floor(Math.random() * usernameList.length)
  return usernameList[randomIndex]
}

// 获取用户名的第一个字作为头像
const getAvatarText = (name: string) => {
  return name.charAt(0)
}

// 默认公告数据
const defaultAnnouncements = [
  { id: 1, content: '📢 欢迎使用 CampusToolBox！为校园生活提供便利' },
  { id: 2, content: '🎉 新增多个实用工具，提升学习效率' },
  { id: 3, content: '🌟 如果觉得好用，请帮忙分享给同学们' },
  { id: 4, content: '🔧 持续更新中，欢迎提供建议和反馈' }
]

// 获取公告数据
const loadAnnouncements = async (retryCount = 0) => {
  try {
    console.log(`开始获取公告数据... (第${retryCount + 1}次尝试)`)
    const res = await fetchNotices({
      pageNum: 1,
      pageSize: 10
    })
    console.log('公告数据响应:', res)
    
    // 检查响应数据格式
    if (res && res.data) {
      let noticeList = []
      
      // 尝试不同的数据格式
      if (res.data.data && res.data.data.list) {
        noticeList = res.data.data.list
      } else if (res.data.list) {
        noticeList = res.data.list
      } else if (Array.isArray(res.data)) {
        noticeList = res.data
      } else if (res.data.records) { // 可能是其他格式
        noticeList = res.data.records
      }
      
      console.log('解析后的公告列表:', noticeList)
      
      if (noticeList && noticeList.length > 0) {
        announcements.value = noticeList.map((notice: any) => ({
          id: notice.id || notice.noticeId || notice.notice_id,
          content: `📢 ${notice.title || notice.noticeTitle || notice.notice_title} - ${notice.content || notice.noticeContent || notice.notice_content}`
        }))
        console.log('处理后的公告数据:', announcements.value)
      } else {
        console.log('没有公告数据,使用默认公告')
        announcements.value = defaultAnnouncements
      }
    } else {
      console.warn('公告数据格式不正确,使用默认公告:', res)
      announcements.value = defaultAnnouncements
    }
  } catch (error) {
    console.error('获取公告失败:', error)
    
    // 如果重试次数小于3次,则重试
    if (retryCount < 3) {
      console.log(`将在3秒后重试... (剩余重试次数: ${3 - retryCount})`)
      setTimeout(() => {
        loadAnnouncements(retryCount + 1)
      }, 3000)
    } else {
      console.error('重试次数已达上限,使用默认公告')
      announcements.value = defaultAnnouncements
    }
  }
}

const searchTags = [
  '常用工具 ',
  'PPT生成 ',
  '数据分析 ',
  '文档转换 ',
  '图片处理 ',
]

const emit = defineEmits(['search'])

const handleSearch = () => {
  emit('search', searchQuery.value)
}

const addTagToSearch = (tag: string) => {
  searchQuery.value = tag
  emit('search', tag)
}

const toggleTheme = () => {
  isDarkTheme.value = !isDarkTheme.value
  document.body.classList.toggle('dark-theme')
}

const showNotifications = () => {
  // 实现通知功能
}

const toggleUserMenu = () => {
  // 实现用户菜单
}

// 处理后台管理按钮点击
const handleAdminClick = () => {
  const currentTime = Date.now()
  
  // 如果距离上次点击超过3秒,重置计数
  if (currentTime - lastClickTime.value > 3000) {
    adminClickCount.value = 0
  }
  
  adminClickCount.value++
  lastClickTime.value = currentTime
  
  // 如果点击了3次,跳转到后台管理系统
  if (adminClickCount.value === 3) {
    window.open('http://localhost:5173/#/login', '_blank')
    adminClickCount.value = 0 // 重置计数
  }
}

onMounted(async () => {
  // 生成随机用户名
  username.value = generateRandomUsername()
  
  await loadAnnouncements()
  if (announcementRef.value && announcements.value.length > 0) {
    const firstAnnouncement = announcementRef.value.firstElementChild?.cloneNode(true)
    if (firstAnnouncement) {
      announcementRef.value.appendChild(firstAnnouncement)
    }
  }
})
</script>

<style scoped>
.header {
  position: fixed;
  top: 0;
  right: 0;
  left: 0;
  z-index: 200;
  background: #fff;
  box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
}

.announcement-bar {
  background: linear-gradient(90deg, #1a73e8, #4285f4);
  color: white;
  padding: 8px 0;
  overflow: hidden;
}

.announcements {
  display: flex;
  animation: scroll 20s linear infinite;
  padding-left: 16px;
}

.announcement-item {
  white-space: nowrap;
  padding: 0 20px;
  font-size: 14px;
}

@keyframes scroll {
  0% { transform: translateX(0); }
  100% { transform: translateX(-100%); }
}

.header-main {
  padding: 12px 24px;
  display: flex;
  align-items: center;
  gap: 24px;
}

.header-left {
  display: flex;
  align-items: center;
  gap: 16px;
  min-width: 260px;
}

.logo {
  display: flex;
  align-items: center;
  gap: 12px;
  text-decoration: none;
}

.logo-img {
  width: 32px;
  height: 32px;
}

.logo-text {
  display: flex;
  flex-direction: column;
}

.logo-text h1 {
  font-size: 18px;
  color: #1a73e8;
  margin: 0;
  font-weight: 600;
}

.slogan {
  font-size: 12px;
  color: #666;
  margin: 0;
}

.header-center {
  flex: 1;
  max-width: 480px;
}

.search-box {
  position: relative;
  width: 100%;
}

.search-box input {
  width: 100%;
  padding: 10px 40px;
  border: 2px solid #eaeaea;
  border-radius: 24px;
  font-size: 14px;
  transition: all 0.3s ease;
  background: #f8f9fa;
}

.search-box input:focus {
  border-color: #1a73e8;
  outline: none;
  background: #fff;
  box-shadow: 0 2px 8px rgba(26, 115, 232, 0.1);
}

.search-icon {
  position: absolute;
  left: 16px;
  top: 50%;
  transform: translateY(-50%);
  font-size: 16px;
  color: #666;
}

.header-right {
  display: flex;
  align-items: center;
  gap: 16px;
  margin-left: auto;
  padding-left: 16px;
}

.header-actions {
  display: flex;
  align-items: center;
  gap: 12px;
}

.action-btn {
  background: none;
  border: none;
  font-size: 20px;
  cursor: pointer;
  padding: 8px;
  border-radius: 50%;
  transition: all 0.3s ease;
  position: relative;
  width: 40px;
  height: 40px;
  display: flex;
  align-items: center;
  justify-content: center;
  color: #1a73e8;
}

.action-btn:hover {
  background: rgba(26, 115, 232, 0.1);
}

.github-btn {
  text-decoration: none;
  color: #24292f;
}

.github-btn:hover {
  transform: scale(1.1);
  color: #1a73e8;
}

.badge {
  position: absolute;
  top: 0;
  right: 0;
  background: #ea4335;
  color: white;
  font-size: 12px;
  padding: 2px 6px;
  border-radius: 10px;
  border: 2px solid #fff;
}

.user-profile {
  display: flex;
  align-items: center;
  gap: 8px;
  padding: 6px 12px;
  border-radius: 20px;
  cursor: pointer;
  transition: all 0.3s ease;
}

.user-profile:hover {
  background: #f5f5f5;
}

.avatar-text {
  width: 32px;
  height: 32px;
  border-radius: 50%;
  background: #1a73e8;
  color: white;
  display: flex;
  align-items: center;
  justify-content: center;
  font-size: 16px;
  font-weight: bold;
  margin-right: 8px;
}

.username {
  font-size: 14px;
  color: #333;
}

.dropdown-icon {
  font-size: 12px;
  color: #666;
}

/* 暗色主题样式 */
:deep(.dark-theme) .header {
  background: #2d2d2d;
}

:deep(.dark-theme) .search-box input {
  background: #3d3d3d;
  border-color: #4d4d4d;
  color: #fff;
}

:deep(.dark-theme) .search-box input:focus {
  background: #3d3d3d;
  border-color: #64b5f6;
}

:deep(.dark-theme) .search-tags {
  background: #2d2d2d;
}

:deep(.dark-theme) .search-tag {
  background: #3d3d3d;
  color: #64b5f6;
}

:deep(.dark-theme) .search-tag:hover {
  background: #4d4d4d;
}

:deep(.dark-theme) .action-btn:hover,
:deep(.dark-theme) .user-profile:hover {
  background: #3d3d3d;
}

:deep(.dark-theme) .username {
  color: #fff;
}

.action-btn .icon {
  transition: transform 0.3s ease;
}

.action-btn:active .icon {
  transform: scale(0.9);
}
</style> 