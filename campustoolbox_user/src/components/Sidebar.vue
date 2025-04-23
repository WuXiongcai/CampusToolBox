<template>
  <aside class="sidebar">
    <nav>
      <div class="nav-section">
        <h3 class="nav-section-title">工具分类</h3>
        <ul class="nav-list">
          <li
            v-for="category in categories"
            :key="category.id"
            class="nav-item"
          >
            <a
              :href="'#' + category.id"
              class="nav-link"
              :class="{ active: activeCategory === category.id }"
              @click="setActiveCategory(category.id)"
            >
              <span class="category-icon">{{ category.icon }}</span>
              <span class="category-name">{{ category.name }}</span>
            </a>
          </li>
        </ul>
      </div>
      <div class="nav-section">
        <h3 class="nav-section-title">快捷操作</h3>
        <ul class="nav-list">
          <li class="nav-item">
            <a href="#" class="nav-link" @click.prevent="toggleFavorites">
              <span class="category-icon">⭐</span>
              <span class="category-name">我的收藏</span>
            </a>
          </li>
          <li class="nav-item">
            <a href="#" class="nav-link" @click="toggleHistory">
              <span class="category-icon">🕒</span>
              <span class="category-name">使用记录</span>
            </a>
          </li>
        </ul>
      </div>
    </nav>
    <div class="sidebar-footer">
      <p class="copyright">© 2025 CampusToolBox</p>
      <a href="#" class="feedback-link" @click.prevent="showFeedback">反馈建议</a>
    </div>
    <FeedbackDialog ref="feedbackDialogRef" />
    <FavoriteTools ref="favoriteToolsRef" :all-tools="tools" />
  </aside>
</template>

<script setup lang="ts">
import { ref, onMounted, onUnmounted, nextTick } from 'vue'
import FeedbackDialog from './FeedbackDialog.vue'
import FavoriteTools from './FavoriteTools.vue'
import type { Tool } from '@/types/tool'

interface Category {
  id: string
  name: string
  icon: string
}

const categories: Category[] = [
  {
    id: 'common',
    name: '常用工具',
    icon: '🛠️'
  },
  {
    id: 'resources',
    name: '资源导航',
    icon: '🧭'
  },
  {
    id: 'ai',
    name: 'AI问答工具',
    icon: '🤖'
  },
  {
    id: 'coding',
    name: 'AI编程辅助',
    icon: '💻'
  },
  {
    id: 'mindmap',
    name: 'AI思维导图',
    icon: '🗺️'
  },
  {
    id: 'mathmodel',
    name: '数学建模辅助',
    icon: '📊'
  },
  {
    id: 'codehosting',
    name: '代码托管工具',
    icon: '📦'
  },
  {
    id: 'codingpractice',
    name: '编程刷题网站',
    icon: '🎯'
  },
  {
    id: 'dataanalysis',
    name: '数据分析工具',
    icon: '📈'
  },
  {
    id: 'fileconvert',
    name: '文件格式转换工具',
    icon: '🗂️'
  },
  {
    id: 'papercheck',
    name: '论文查重工具',
    icon: '📝'
  },
  {
    id: 'academicsearch',
    name: '学术资源检索网站',
    icon: '🔍'
  },
  {
    id: 'translation',
    name: '在线翻译工具',
    icon: '🌐'
  },
  {
    id: 'community',
    name: '社区交流网站',
    icon: '👥'
  },
  {
    id: 'law',
    name: 'AI法律助手',
    icon: '⚖️'
  },
  {
    id: 'ppt',
    name: 'PPT生成工具',
    icon: '📑'
  },
  {
    id: 'audio',
    name: 'AI音频工具',
    icon: '🎵'
  },
  {
    id: 'chart',
    name: '图表工具',
    icon: '📉'
  },
  {
    id: 'teacher',
    name: '教师资源网站',
    icon: '📚'
  },
  {
    id: 'resume',
    name: '简历模板网站',
    icon: '📄'
  },
  {
    id: 'fonticons',
    name: '字体图标工具',
    icon: '🔤'
  },
  {
    id: 'imagedrawing',
    name: '图像绘画工具',
    icon: '🎨'
  },
  {
    id: 'readingsummary',
    name: '阅读总结工具',
    icon: '📖'
  },
]

const props = defineProps<{
  tools: Tool[]
}>()

const activeCategory = ref('common')
const showBackToTop = ref(false)
const feedbackDialogRef = ref()
const favoriteToolsRef = ref()

const setActiveCategory = (categoryId: string) => {
  activeCategory.value = categoryId
  emit('section-change', categoryId)
  
  // 延迟执行滚动，确保DOM更新完成
  nextTick(() => {
    const element = document.getElementById(categoryId)
    if (element) {
      const headerOffset = 120 // 增加偏移量，确保正确定位
      const elementPosition = element.getBoundingClientRect().top + window.pageYOffset
      const offsetPosition = elementPosition - headerOffset

      window.scrollTo({
        top: offsetPosition,
        behavior: 'smooth'
      })
    }
  })
}

// 监听自定义事件来更新导航高亮
const handleSectionVisible = (event: CustomEvent) => {
  const sectionId = event.detail
  if (sectionId && sectionId !== activeCategory.value) {
    activeCategory.value = sectionId
    
    // 滚动侧边栏到当前激活的导航项
    nextTick(() => {
      const activeNavItem = document.querySelector(`.nav-link[href="#${sectionId}"]`)
      if (activeNavItem) {
        const navContainer = document.querySelector('nav')
        if (navContainer) {
          const navRect = navContainer.getBoundingClientRect()
          const itemRect = activeNavItem.getBoundingClientRect()
          const scrollTop = navContainer.scrollTop
          const itemTop = itemRect.top - navRect.top + scrollTop
          
          // 计算滚动位置，使当前项在视图中居中
          const targetScroll = itemTop - (navRect.height / 2) + (itemRect.height / 2)
          navContainer.scrollTo({
            top: targetScroll,
            behavior: 'smooth'
          })
        }
      }
    })
  }
}

// 节流函数
function throttle<T extends (...args: any[]) => void>(fn: T, delay: number): (...args: Parameters<T>) => void {
  let lastTime = 0
  return function(this: void, ...args: Parameters<T>) {
    const now = Date.now()
    if (now - lastTime >= delay) {
      fn.apply(this, args)
      lastTime = now
    }
  }
}

onMounted(() => {
  // 监听自定义事件
  document.addEventListener('section-visible', handleSectionVisible as EventListener)
  
  // 初始化时设置默认激活项并滚动到对应位置
  nextTick(() => {
    const hash = window.location.hash.slice(1)
    activeCategory.value = hash || 'common'
    if (hash) {
      setActiveCategory(hash)
    }
  })
})

onUnmounted(() => {
  document.removeEventListener('section-visible', handleSectionVisible as EventListener)
})

const emit = defineEmits(['section-change'])

const getCategoryIcon = (categoryId: string): string => {
  const icons: Record<string, string> = {
    development: '💻',
    design: '🎨',
    study: '📚',
    life: '🏠',
    entertainment: '🎮',
    office: '📊',
    media: '🎬',
    social: '💬'
  }
  return icons[categoryId] || '🔧'
}

const toggleFavorites = () => {
  favoriteToolsRef.value?.show()
}

const toggleHistory = () => {
  // 实现历史记录功能
}

const showFeedback = () => {
  feedbackDialogRef.value?.show()
}
</script>

<style scoped>
.sidebar {
  width: 220px;
  height: 100vh;
  background: #fff;
  border-right: 1px solid #eaeaea;
  position: fixed;
  left: 0;
  top: 0;
  display: flex;
  flex-direction: column;
  z-index: 100;
  overflow: hidden; /* 防止出现双滚动条 */
}

nav {
  flex: 1;
  overflow-y: auto;
  padding-top: 100px;
  scrollbar-width: thin;
  scrollbar-color: #1a73e8 #f5f5f5;
  scroll-behavior: smooth;
  max-height: calc(100vh - 100px); /* 减小最大高度 */
}

/* 自定义滚动条样式 */
nav::-webkit-scrollbar {
  width: 4px;
}

nav::-webkit-scrollbar-track {
  background: #f5f5f5;
}

nav::-webkit-scrollbar-thumb {
  background: #1a73e8;
  border-radius: 2px;
}

nav::-webkit-scrollbar-thumb:hover {
  background: #1557b0;
}

.nav-section {
  padding: 14px 0; /* 减小padding */
  border-bottom: 1px solid #eaeaea;
}

.nav-section-title {
  position: sticky;
  top: 0;
  background: #fff;
  padding: 12px 24px; /* 减小padding */
  margin: 0;
  font-size: 16px; /* 减小字体大小 */
  color: #1a73e8;
  font-weight: 600;
  text-align: center;
  letter-spacing: 0.5px;
  z-index: 1;
  box-shadow: 0 2px 4px rgba(0, 0, 0, 0.05);
}

.nav-list {
  list-style: none;
  padding: 0;
  margin: 0;
}

.nav-item {
  margin: 2px 0;
}

.nav-link {
  display: flex;
  align-items: center;
  padding: 8px 24px; /* 减小padding */
  color: #333;
  text-decoration: none;
  transition: all 0.3s ease;
  position: relative;
  gap: 8px; /* 减小间距 */
}

.nav-link:hover {
  background: rgba(26, 115, 232, 0.05);
  color: #1a73e8;
}

.nav-link.active {
  background: rgba(26, 115, 232, 0.1);
  color: #1a73e8;
  font-weight: 500;
}

.category-icon {
  font-size: 20px; /* 减小图标大小 */
  width: 26px;
  text-align: center;
}

.category-name {
  flex: 1;
  font-size: 13px; /* 减小字体大小 */
}

.tool-count {
  background: #eaeaea;
  padding: 2px 8px;
  border-radius: 12px;
  font-size: 12px;
  color: #666;
}

.sidebar-footer {
  padding: 16px 24px;
  border-top: 1px solid #eaeaea;
  text-align: center;
  background: #fff;
}

.copyright {
  font-size: 12px;
  color: #666;
  margin: 0 0 8px;
}

.feedback-link {
  font-size: 12px;
  color: #1a73e8;
  text-decoration: none;
}

.feedback-link:hover {
  text-decoration: underline;
}

:deep(.dark-theme) .nav-section-title {
  background: #2d2d2d;
  color: #64b5f6;
}

:deep(.dark-theme) nav::-webkit-scrollbar-track {
  background: #1a1a1a;
}

:deep(.dark-theme) nav::-webkit-scrollbar-thumb {
  background: #64b5f6;
}

:deep(.dark-theme) nav::-webkit-scrollbar-thumb:hover {
  background: #42a5f5;
}
</style>