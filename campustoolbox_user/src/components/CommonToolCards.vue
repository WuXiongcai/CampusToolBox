<template>
  <div class="common-tools">
    <div v-if="loading" class="loading-state">
      加载中...
    </div>
    <div v-else-if="tools.length === 0" class="empty-state">
      暂无工具数据
    </div>
    <div v-else class="tools-grid">
      <div v-for="tool in sortedTools" :key="tool.id" class="tool-card">
        <div class="tool-icon">
          <img v-if="tool.icon" :src="getIconUrl(tool.icon)" :alt="tool.name" />
          <span v-else class="default-icon">🛠️</span>
        </div>
        <div class="tool-content">
          <h3 class="tool-name">{{ tool.name }}</h3>
          <p class="tool-description">{{ tool.description }}</p>
          <a :href="tool.url" target="_blank" class="tool-link">访问官网</a>
        </div>
      </div>
    </div>
    <div class="pagination" v-if="total > 0">
      <el-pagination
        v-model:current-page="currentPage"
        v-model:page-size="pageSize"
        :total="total"
        :page-sizes="[12, 24, 36, 48]"
        layout="total, sizes, prev, pager, next"
        @size-change="handleSizeChange"
        @current-change="handleCurrentChange"
      />
    </div>
  </div>
</template>

<script setup lang="ts">
import { ref, onMounted, computed } from 'vue'
import { fetchCommonTools, BASE_URL } from '@/api'
import type { Tool } from '@/types/tool'

const tools = ref<Tool[]>([])
const currentPage = ref(1)
const pageSize = ref(12)
const total = ref(0)
const loading = ref(false)

// 按创建时间排序的计算属性
const sortedTools = computed(() => {
  return [...tools.value].sort((a, b) => {
    const timeA = new Date(a.createTime || '').getTime()
    const timeB = new Date(b.createTime || '').getTime()
    return timeA - timeB
  })
})

const getIconUrl = (icon: string) => {
  if (!icon) return ''
  if (icon.startsWith('http')) return icon
  return `${BASE_URL}${icon}`
}

const loadTools = async () => {
  loading.value = true
  console.log('开始加载工具数据...')
  try {
    const res = await fetchCommonTools({
      pageNum: currentPage.value,
      pageSize: pageSize.value
    })
    console.log('API响应数据:', res)
    if (res.data.code === "200") {
      tools.value = res.data.data.list
      total.value = res.data.data.total
      console.log('成功加载工具数据:', tools.value)
    } else {
      console.warn('加载工具数据失败:', res.data)
    }
  } catch (error) {
    console.error('加载工具数据出错:', error)
  } finally {
    loading.value = false
  }
}

const handleSizeChange = (val: number) => {
  console.log('改变每页显示数量:', val)
  pageSize.value = val
  loadTools()
}

const handleCurrentChange = (val: number) => {
  console.log('改变当前页码:', val)
  currentPage.value = val
  loadTools()
}

onMounted(() => {
  console.log('CommonToolCards组件已挂载')
  loadTools()
})
</script>

<style scoped>
.common-tools {
  padding: 20px;
}

.tools-grid {
  display: grid;
  grid-template-columns: repeat(4, 1fr);
  gap: 16px;
  margin-bottom: 20px;
}

.tool-card {
  background: #fff;
  border-radius: 8px;
  padding: 12px;
  box-shadow: 0 2px 8px rgba(0, 0, 0, 0.08);
  transition: transform 0.3s ease;
  display: flex;
  align-items: flex-start;
  gap: 16px;
}

.tool-card:hover {
  transform: translateY(-3px);
  box-shadow: 0 4px 12px rgba(0, 0, 0, 0.12);
}

.tool-icon {
  width: 32px;
  height: 32px;
  display: flex;
  align-items: center;
  justify-content: center;
  background: #f5f7fa;
  border-radius: 6px;
  flex-shrink: 0;
}

.tool-icon img {
  width: 24px;
  height: 24px;
  object-fit: contain;
}

.default-icon {
  font-size: 18px;
}

.tool-content {
  flex: 1;
}

.tool-name {
  margin: 0 0 8px;
  font-size: 16px;
  color: #333;
  font-weight: 600;
}

.tool-description {
  margin: 0 0 12px;
  font-size: 13px;
  color: #666;
  line-height: 1.4;
  display: -webkit-box;
  -webkit-line-clamp: 2;
  -webkit-box-orient: vertical;
  overflow: hidden;
}

.tool-link {
  display: inline-block;
  padding: 4px 10px;
  background: #1a73e8;
  color: #fff;
  text-decoration: none;
  border-radius: 4px;
  font-size: 13px;
  transition: background 0.3s ease;
}

.tool-link:hover {
  background: #1557b0;
}

.pagination {
  display: flex;
  justify-content: center;
  margin-top: 20px;
}

.loading-state,
.empty-state {
  text-align: center;
  padding: 40px;
  color: #666;
  font-size: 16px;
}

@media (max-width: 1400px) {
  .tools-grid {
    grid-template-columns: repeat(3, 1fr);
  }
}

@media (max-width: 1100px) {
  .tools-grid {
    grid-template-columns: repeat(2, 1fr);
  }
}

@media (max-width: 768px) {
  .tools-grid {
    grid-template-columns: 1fr;
  }
}
</style> 