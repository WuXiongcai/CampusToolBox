<script setup lang="ts">
import { ref, computed, onMounted, onUnmounted, provide } from 'vue'
import { fetchCommonTools } from './api'
import type { Tool } from './types/tool'
import Sidebar from './components/Sidebar.vue'
import ToolCard from './components/ToolCard.vue'
import Header from './components/Header.vue'
import ResourceToolCards from './components/ResourceToolCards.vue'
import AiToolCards from './components/AiToolCards.vue'
import AiCodingToolCards from './components/AiCodingToolCards.vue'
import AiMindmapToolCards from './components/AiMindmapToolCards.vue'
import MathModelToolCards from './components/MathModelToolCards.vue'
import CodeHostingToolCards from './components/CodeHostingToolCards.vue'
import CodingPracticeCards from './components/CodingPracticeCards.vue'
import DataAnalysisCards from './components/DataAnalysisCards.vue'
import FileConvertCards from './components/FileConvertCards.vue'
import PaperCheckCards from './components/PaperCheckCards.vue'
import AcademicSearchCards from './components/AcademicSearchCards.vue'
import TranslationCards from './components/TranslationCards.vue'
import CommunitySitesCards from './components/CommunitySitesCards.vue'
import LawAssistantsCards from './components/LawAssistantsCards.vue'
import PPTCards from './components/PPTCards.vue'
import AudioToolsCards from './components/AudioToolsCards.vue'
import ChartToolsCards from './components/ChartToolsCards.vue'
import TeacherResourcesCards from './components/TeacherResourcesCards.vue'
import ResumeTemplatesCards from './components/ResumeTemplatesCards.vue'
import FontIconsCards from './components/FontIconsCards.vue'
import ImageDrawingCards from './components/ImageDrawingCards.vue'
import ReadingSummaryCards from './components/ReadingSummaryCards.vue'

const searchQuery = ref('')
const tools = ref<Tool[]>([])
const loading = ref(false)
const showBackToTop = ref(false)

// 提供全局搜索查询给子组件
provide('searchQuery', searchQuery)

const handleSearch = (query: string) => {
  searchQuery.value = query.toLowerCase()
}

const handleScroll = () => {
  showBackToTop.value = window.scrollY > 300
  
  // 更新当前可见的部分
  const sections = document.querySelectorAll('.category-section')
  const headerOffset = 100 // 头部固定导航的高度
  const scrollPosition = window.scrollY + headerOffset
  
  // 找到当前在视图中的部分
  let currentSection = ''
  for (const section of sections) {
    const rect = section.getBoundingClientRect()
    const offsetTop = window.scrollY + rect.top
    
    // 如果滚动位置超过了该部分的顶部位置，就更新当前部分
    if (scrollPosition >= offsetTop) {
      currentSection = section.id
    }
  }
  
  if (currentSection) {
    // 使用节流函数来限制事件触发频率
    throttle(() => {
      document.dispatchEvent(new CustomEvent('section-visible', { detail: currentSection }))
    }, 100)()
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

const scrollToTop = () => {
  window.scrollTo({
    top: 0,
    behavior: 'smooth'
  })
}

const loadTools = async () => {
  loading.value = true
  try {
    console.log('开始加载工具数据...')
    const res = await fetchCommonTools({
      pageNum: 1,
      pageSize: 100
    })
    if (res.data.code === "200") {
      tools.value = res.data.data.list
      console.log('成功加载工具数据:', tools.value)
    }
  } catch (error) {
    console.error('加载工具数据失败:', error)
  } finally {
    loading.value = false
  }
}

// 按创建时间排序的计算属性
const sortedTools = computed(() => {
  return [...tools.value].sort((a, b) => {
    const timeA = new Date(a.createTime || '').getTime()
    const timeB = new Date(b.createTime || '').getTime()
    return timeA - timeB
  })
})

// 搜索过滤后的工具列表
const filteredTools = computed(() => {
  if (!searchQuery.value) {
    return sortedTools.value
  }
  const query = searchQuery.value.toLowerCase()
  return sortedTools.value.filter(tool =>
    tool.name.toLowerCase().includes(query) ||
    tool.description.toLowerCase().includes(query) ||
    (tool.category && tool.category.toLowerCase().includes(query))
  )
})

onMounted(() => {
  loadTools()
  window.addEventListener('scroll', handleScroll)
})

onUnmounted(() => {
  window.removeEventListener('scroll', handleScroll)
})
</script>

<template>
  <div class="app">
    <Sidebar :tools="tools" />
    <div class="main-container">
      <Header @search="handleSearch" />
      <main class="main-content">
        <div v-if="loading" class="loading">
          加载中...
        </div>
        <div v-else>
          <section id="common" class="category-section">
            <h2 class="category-title">常用工具</h2>
            <div class="tools-grid">
              <ToolCard
                v-for="tool in filteredTools"
                :key="tool.id"
                :tool="tool"
              />
            </div>
          </section>
          <section id="resources" class="category-section">
            <h2 class="category-title">资源导航</h2>
            <ResourceToolCards />
          </section>
          <section id="ai" class="category-section">
            <h2 class="category-title">AI问答工具</h2>
            <AiToolCards />
          </section>
          <section id="coding" class="category-section">
            <h2 class="category-title">AI编程辅助</h2>
            <AiCodingToolCards />
          </section>
          <section id="mindmap" class="category-section">
            <h2 class="category-title">AI思维导图</h2>
            <AiMindmapToolCards />
          </section>
          <section id="mathmodel" class="category-section">
            <h2 class="category-title">数学建模辅助</h2>
            <MathModelToolCards />
          </section>
          <section id="codehosting" class="category-section">
            <h2 class="category-title">代码托管工具</h2>
            <CodeHostingToolCards />
          </section>
          <section id="codingpractice" class="category-section">
            <h2 class="category-title">编程刷题网站</h2>
            <CodingPracticeCards />
          </section>
          <section id="dataanalysis" class="category-section">
            <h2 class="category-title">数据分析工具</h2>
            <DataAnalysisCards />
          </section>
          <section id="fileconvert" class="category-section">
            <h2 class="category-title">文件格式转换工具</h2>
            <FileConvertCards />
          </section>
          <section id="papercheck" class="category-section">
            <h2 class="category-title">论文查重工具</h2>
            <PaperCheckCards />
          </section>
          <section id="academicsearch" class="category-section">
            <h2 class="category-title">学术资源检索网站</h2>
            <AcademicSearchCards />
          </section>
          <section id="translation" class="category-section">
            <h2 class="category-title">在线翻译工具</h2>
            <TranslationCards />
          </section>
          <section id="community" class="category-section">
            <h2 class="category-title">社区交流网站</h2>
            <CommunitySitesCards />
          </section>
          <section id="law" class="category-section">
            <h2 class="category-title">AI法律助手</h2>
            <LawAssistantsCards />
          </section>
          <section id="ppt" class="category-section">
            <h2 class="category-title">PPT生成工具</h2>
            <PPTCards />
          </section>
          <section id="audio" class="category-section">
            <h2 class="category-title">AI音频工具</h2>
            <AudioToolsCards />
          </section>
          <section id="chart" class="category-section">
            <h2 class="category-title">图表工具</h2>
            <ChartToolsCards />
          </section>
          <section id="teacher" class="category-section">
            <h2 class="category-title">教师资源网站</h2>
            <TeacherResourcesCards />
          </section>
          <section id="resume" class="category-section">
            <h2 class="category-title">简历模板网站</h2>
            <ResumeTemplatesCards />
          </section>
          <section id="fonticons" class="category-section">
            <h2 class="category-title">字体图标工具</h2>
            <FontIconsCards />
          </section>
          <section id="imagedrawing" class="category-section">
            <h2 class="category-title">图像绘画工具</h2>
            <ImageDrawingCards />
          </section>
          <section id="readingsummary" class="category-section">
            <h2 class="category-title">阅读总结工具</h2>
            <ReadingSummaryCards />
          </section>
        </div>
      </main>
      <button 
        class="back-to-top" 
        @click="scrollToTop" 
        v-show="showBackToTop"
        title="回到顶部"
      >
        <span class="icon">↑</span>
      </button>
    </div>
  </div>
</template>

<style>
* {
  margin: 0;
  padding: 0;
  box-sizing: border-box;
}

body {
  font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Oxygen,
    Ubuntu, Cantarell, 'Open Sans', 'Helvetica Neue', sans-serif;
  line-height: 1.6;
  color: #333;
  background: #f5f7fa;
  overflow-x: hidden;
  scroll-behavior: smooth;
}

.app {
  display: flex;
  min-height: 100vh;
  width: 100%;
}

.main-container {
  margin-left: 180px;
  width: calc(100% - 180px);
  min-height: 100vh;
  background: #f5f5f5;
  position: relative;
  display: flex;
  flex-direction: column;
}

.main-content {
  padding: 16px;
  margin-top: 100px;
  width: 100%;
  box-sizing: border-box;
}

.category-section {
  background: #fff;
  border-radius: 8px;
  padding: 24px;
  box-shadow: 0 1px 3px rgba(0, 0, 0, 0.1);
  margin-bottom: 24px;
  scroll-margin-top: 100px;
  width: 100%;
  box-sizing: border-box;
}

.category-title {
  font-size: 24px;
  font-weight: 600;
  color: #333;
  margin-bottom: 24px;
  padding-bottom: 12px;
  border-bottom: 2px solid #1a73e8;
}

.tools-grid {
  display: grid;
  gap: 20px;
  width: 100%;
  margin: 0 auto;
  box-sizing: border-box;
}

/* 超大屏幕 */
@media (min-width: 1600px) {
  .main-content {
    padding-left: 40px;
    margin-right: 280px;
    padding-right: 300px;
  }
  .tools-grid {
    grid-template-columns: repeat(4, 1fr);
  }
}

/* 大屏幕 */
@media (min-width: 1200px) and (max-width: 1599px) {
  .main-content {
    padding-left: 32px;
    margin-right: auto;
    padding-right: 200px;
  }
  .tools-grid {
    grid-template-columns: repeat(4, 1fr);
  }
}

/* 中等屏幕 */
@media (min-width: 992px) and (max-width: 1199px) {
  .main-container {
    margin-left: 180px;
    width: calc(100% - 160px);
  }
  .main-content {
    padding-left: 24px;
    padding-right: 120px;
  }
  .tools-grid {
    grid-template-columns: repeat(3, 1fr);
  }
}

/* 平板 */
@media (min-width: 768px) and (max-width: 991px) {
  .main-container {
    margin-left: 220px;
    width: calc(100% - 140px);
  }
  .main-content {
    padding-left: 20px;
    padding-right: 80px;
  }
  .tools-grid {
    grid-template-columns: repeat(2, 1fr);
  }
}

/* 手机端 */
@media (max-width: 767px) {
  .main-container {
    margin-left: 220px;
    width: 100%;
  }
  .main-content {
    padding: 16px;
  }
  .tools-grid {
    grid-template-columns: 1fr;
  }
  .category-section {
    padding: 16px;
  }
}

/* 暗色主题 */
body.dark-theme {
  background: #1a1a1a;
  color: #fff;
}

.dark-theme .main-container {
  background: #1a1a1a;
}

.dark-theme .category-section {
  background: #2d2d2d;
  box-shadow: 0 2px 12px rgba(0, 0, 0, 0.2);
}

.dark-theme .category-title {
  color: #64b5f6;
  border-color: #3d3d3d;
}

.dark-theme .back-to-top {
  background: #64b5f6;
  box-shadow: 0 2px 8px rgba(100, 181, 246, 0.3);
}

.dark-theme .back-to-top:hover {
  background: #42a5f5;
  box-shadow: 0 4px 12px rgba(100, 181, 246, 0.4);
}

/* 回到顶部按钮 */
.back-to-top {
  position: fixed;
  right: 24px;
  bottom: 24px;
  width: 40px;
  height: 40px;
  border-radius: 50%;
  background: #1a73e8;
  color: white;
  border: none;
  cursor: pointer;
  display: flex;
  align-items: center;
  justify-content: center;
  font-size: 20px;
  box-shadow: 0 2px 8px rgba(26, 115, 232, 0.3);
  transition: all 0.3s ease;
  z-index: 99;
}

.back-to-top:hover {
  transform: translateY(-3px);
  box-shadow: 0 4px 12px rgba(26, 115, 232, 0.4);
  background: #1557b0;
}

.back-to-top .icon {
  line-height: 1;
}
</style>
