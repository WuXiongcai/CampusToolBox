<template>
  <div class="ai-cards">
    <div v-if="loading" class="loading-state">
      加载中...
    </div>
    <div v-else-if="readingSummaries.length === 0" class="empty-state">
      暂无阅读总结工具数据
    </div>
    <div v-else class="cards-grid">
      <div v-for="tool in filteredTools" :key="tool.id" class="resource-card">
        <div class="card-header">
          <div class="card-icon">
            <img v-if="tool.icon" :src="getIconUrl(tool.icon)" :alt="tool.name" />
            <span v-else class="default-icon">📖</span>
          </div>
          <h3 class="card-title">{{ tool.name }}</h3>
        </div>
        <div class="card-content">
          <div class="card-description-wrapper">
            <p class="card-description" :class="{ 'expanded': expandedDescriptions[tool.id] }">
              {{ tool.description }}
            </p>
            <button 
              v-if="tool.description.length > 50" 
              class="expand-btn"
              @click="toggleDescription(tool.id)"
            >
              {{ expandedDescriptions[tool.id] ? '收起' : '查看更多' }}
            </button>
          </div>
          <div class="card-footer">
            <span class="card-category">{{ tool.isFree ? '免费' : '付费' }}</span>
            <a :href="tool.url" target="_blank" class="card-link">访问官网</a>
          </div>
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
import { ref, onMounted, reactive, computed, inject } from 'vue'
import { fetchReadingSummaryData, BASE_URL } from '@/api'
import type { Tool } from '@/types/tool'

const searchQuery = inject('searchQuery', ref(''))

const readingSummaries = ref<Tool[]>([])
const currentPage = ref(1)
const pageSize = ref(12)
const total = ref(0)
const loading = ref(false)
const expandedDescriptions = reactive<Record<number, boolean>>({})

const sortedTools = computed(() => {
  return [...readingSummaries.value].sort((a, b) => {
    const timeA = new Date(a.createTime || '').getTime()
    const timeB = new Date(b.createTime || '').getTime()
    return timeA - timeB
  })
})

const toggleDescription = (id: number) => {
  expandedDescriptions[id] = !expandedDescriptions[id]
}

const getIconUrl = (icon: string) => {
  if (!icon) return ''
  if (icon.startsWith('http')) return icon
  return `${BASE_URL}${icon}`
}

const loadReadingSummaries = async () => {
  loading.value = true
  console.log('开始加载阅读总结工具数据...')
  try {
    const res = await fetchReadingSummaryData({
      pageNum: currentPage.value,
      pageSize: pageSize.value
    })
    console.log('API响应数据:', res)
    if (res.data.code === "200") {
      readingSummaries.value = res.data.data.list
      total.value = res.data.data.total
      console.log('成功加载阅读总结工具数据:', readingSummaries.value)
    } else {
      console.warn('加载阅读总结工具数据失败:', res.data)
    }
  } catch (error) {
    console.error('加载阅读总结工具数据出错:', error)
  } finally {
    loading.value = false
  }
}

const handleSizeChange = (val: number) => {
  console.log('改变每页显示数量:', val)
  pageSize.value = val
  loadReadingSummaries()
}

const handleCurrentChange = (val: number) => {
  console.log('改变当前页码:', val)
  currentPage.value = val
  loadReadingSummaries()
}

const filteredTools = computed(() => {
  let result = sortedTools.value
  if (searchQuery.value) {
    const query = searchQuery.value.toLowerCase()
    result = result.filter(tool =>
      tool.name.toLowerCase().includes(query) ||
      tool.description.toLowerCase().includes(query)
    )
  }
  return result
})

onMounted(() => {
  console.log('ReadingSummaryCards组件已挂载')
  loadReadingSummaries()
})
</script>

<style scoped>
.ai-cards {
  padding: 20px;
}

.cards-grid {
  display: grid;
  grid-template-columns: repeat(4, 1fr);
  gap: 16px;
  margin-bottom: 20px;
}

.resource-card {
  background: #fff;
  border-radius: 8px;
  padding: 12px;
  box-shadow: 0 2px 8px rgba(0, 0, 0, 0.08);
  transition: transform 0.2s ease, box-shadow 0.2s ease;
  display: flex;
  flex-direction: column;
  gap: 8px;
  height: 100%;

  &:hover {
    transform: translateY(-2px);
    box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
  }
}

.card-header {
  display: flex;
  align-items: center;
  gap: 12px;
}

.card-icon {
  width: 32px;
  height: 32px;
  display: flex;
  align-items: center;
  justify-content: center;
  background: #f5f7fa;
  border-radius: 6px;
  flex-shrink: 0;
}

.card-icon img {
  width: 24px;
  height: 24px;
  object-fit: contain;
}

.default-icon {
  font-size: 18px;
}

.card-content {
  display: flex;
  flex-direction: column;
  gap: 8px;
  flex: 1;
}

.card-title {
  margin: 0;
  font-size: 16px;
  color: #333;
  font-weight: 600;
  white-space: nowrap;
  overflow: hidden;
  text-overflow: ellipsis;
  flex: 1;
}

.card-description-wrapper {
  flex: 1;
  position: relative;
  min-height: 42px;
}

.card-description {
  margin: 0;
  font-size: 13px;
  color: #666;
  line-height: 1.4;
  overflow: hidden;
  display: -webkit-box;
  -webkit-line-clamp: 2;
  -webkit-box-orient: vertical;
  transition: all 0.3s ease;
}

.card-description.expanded {
  -webkit-line-clamp: unset;
}

.expand-btn {
  background: none;
  border: none;
  color: #1a73e8;
  font-size: 13px;
  padding: 2px 0;
  cursor: pointer;
  margin-top: 2px;
}

.expand-btn:hover {
  text-decoration: underline;
}

.card-footer {
  display: flex;
  align-items: center;
  justify-content: space-between;
  gap: 8px;
  margin-top: auto;
}

.card-category {
  font-size: 12px;
  color: #666;
  background: #f5f7fa;
  padding: 2px 8px;
  border-radius: 4px;
  white-space: nowrap;
}

.card-link {
  display: inline-block;
  padding: 4px 10px;
  background: #1a73e8;
  color: #fff;
  text-decoration: none;
  border-radius: 4px;
  font-size: 13px;
  transition: background 0.3s ease;
  white-space: nowrap;
}

.card-link:hover {
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

.loading-state {
  display: flex;
  flex-direction: column;
  align-items: center;
  gap: 12px;

  &::after {
    content: "";
    width: 40px;
    height: 40px;
    border: 3px solid #f3f3f3;
    border-top: 3px solid #1a73e8;
    border-radius: 50%;
    animation: spin 1s linear infinite;
  }
}

@keyframes spin {
  0% { transform: rotate(0deg); }
  100% { transform: rotate(360deg); }
}

/* 暗色主题支持 */
:deep(.dark-theme) {
  .resource-card {
    background: #1e1e1e;
    border-color: #2d2d2d;

    &:hover {
      box-shadow: 0 4px 12px rgba(0, 0, 0, 0.3);
    }
  }

  .card-icon {
    background: #2d2d2d;
  }

  .card-title {
    color: #ffffff;
  }

  .card-description {
    color: #cccccc;
  }

  .card-category {
    background: #2d2d2d;
    color: #b3b3b3;
  }

  .card-link {
    background: #2962ff;
    
    &:hover {
      background: #1e4bd8;
    }
  }

  .loading-state {
    &::after {
      border-color: #2d2d2d;
      border-top-color: #2962ff;
    }
  }
}

@media (max-width: 1400px) {
  .cards-grid {
    grid-template-columns: repeat(3, 1fr);
  }
}

@media (max-width: 1100px) {
  .cards-grid {
    grid-template-columns: repeat(2, 1fr);
  }
}

@media (max-width: 768px) {
  .cards-grid {
    grid-template-columns: 1fr;
  }
}
</style>