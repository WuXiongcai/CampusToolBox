<template>
  <div class="tool-card" :class="{ 'expanded': isExpanded }">
    <div class="tool-header">
      <div class="tool-info">
        <div class="tool-icon">
          <img v-if="tool.icon" :src="getIconUrl(tool.icon)" :alt="tool.name" />
          <span v-else class="default-icon">🛠️</span>
        </div>
        <h3 class="tool-name">{{ tool.name }}</h3>
      </div>
      <button 
        class="favorite-btn"
        :class="{ 'is-favorite': isFavorite }"
        @click.prevent="toggleFavorite"
      >
        <span class="favorite-icon">{{ isFavorite ? '★' : '☆' }}</span>
      </button>
    </div>
    <div class="tool-content">
      <div class="description-wrapper" ref="descriptionWrapperRef">
        <p class="tool-description" ref="descriptionRef" :class="{ 'expanded': isExpanded }">
          {{ tool.description }}
        </p>
        <div class="description-fade" v-if="!isExpanded && showExpandButton"></div>
        <button 
          v-if="showExpandButton"
          class="expand-btn"
          :class="{ 'expanded': isExpanded }"
          @click="toggleDescription"
        >
          {{ isExpanded ? '收起' : '查看更多' }}
        </button>
      </div>
      <div class="tool-footer">
        <span class="tool-category" v-if="tool.category">{{ tool.category }}</span>
        <a :href="tool.url" target="_blank" class="tool-link">访问官网</a>
      </div>
    </div>
  </div>
</template>

<script setup lang="ts">
import { ref, onMounted, nextTick, onBeforeUnmount } from 'vue'
import { BASE_URL } from '@/api'
import type { Tool } from '@/types/tool'

const props = defineProps<{
  tool: Tool
}>()

const isFavorite = ref(false)
const isExpanded = ref(false)
const showExpandButton = ref(false)
const descriptionRef = ref<HTMLElement | null>(null)
const descriptionWrapperRef = ref<HTMLElement | null>(null)

// 检查是否需要显示展开按钮
const checkNeedsExpand = async () => {
  await nextTick()
  if (descriptionRef.value && descriptionWrapperRef.value) {
    const lineHeight = parseInt(getComputedStyle(descriptionRef.value).lineHeight)
    const maxHeight = lineHeight * 2 // 两行文本的高度
    showExpandButton.value = descriptionRef.value.scrollHeight > maxHeight
  }
}

const getIconUrl = (icon: string) => {
  if (!icon) return ''
  if (icon.startsWith('http')) return icon
  return `${BASE_URL}${icon}`
}

const toggleDescription = () => {
  isExpanded.value = !isExpanded.value
}

// 从 localStorage 获取收藏状态
const loadFavoriteState = () => {
  const favorites = JSON.parse(localStorage.getItem('favorites') || '[]')
  isFavorite.value = favorites.some((id: number) => id === props.tool.id)
}

// 切换收藏状态
const toggleFavorite = () => {
  const favorites = JSON.parse(localStorage.getItem('favorites') || '[]')
  if (isFavorite.value) {
    const index = favorites.indexOf(props.tool.id)
    if (index > -1) {
      favorites.splice(index, 1)
    }
  } else {
    favorites.push(props.tool.id)
  }
  localStorage.setItem('favorites', JSON.stringify(favorites))
  isFavorite.value = !isFavorite.value
  
  // 触发自定义事件通知收藏状态变化
  window.dispatchEvent(new CustomEvent('favorites-changed'))
}

onMounted(async () => {
  loadFavoriteState()
  await checkNeedsExpand()
  window.addEventListener('resize', checkNeedsExpand)
})

onBeforeUnmount(() => {
  window.removeEventListener('resize', checkNeedsExpand)
})
</script>

<style scoped>
.tool-card {
  background: #fff;
  border-radius: 8px;
  padding: 12px;
  box-shadow: 0 2px 8px rgba(0, 0, 0, 0.08);
  transition: all 0.3s ease;
  min-height: 160px;
  height: fit-content;
  display: flex;
  flex-direction: column;
  position: relative;
  z-index: 1;
}

.tool-card:hover {
  transform: translateY(-3px);
  box-shadow: 0 4px 12px rgba(0, 0, 0, 0.12);
}

.tool-card.expanded {
  z-index: 2;
}

.tool-header {
  display: flex;
  justify-content: space-between;
  align-items: center;
  margin-bottom: 8px;
}

.tool-info {
  display: flex;
  align-items: center;
  gap: 8px;
  flex: 1;
  min-width: 0;
}

.tool-icon {
  width: 28px;
  height: 28px;
  display: flex;
  align-items: center;
  justify-content: center;
  background: #f5f7fa;
  border-radius: 6px;
  flex-shrink: 0;
}

.tool-icon img {
  width: 20px;
  height: 20px;
  object-fit: contain;
}

.default-icon {
  font-size: 16px;
}

.favorite-btn {
  background: none;
  border: none;
  padding: 4px;
  cursor: pointer;
  font-size: 18px;
  color: #999;
  transition: all 0.3s ease;
  line-height: 1;
  z-index: 3;
}

.favorite-btn:hover {
  transform: scale(1.1);
}

.favorite-btn.is-favorite {
  color: #f1c40f;
}

.tool-content {
  display: flex;
  flex-direction: column;
  flex: 1;
  min-height: 0;
}

.tool-name {
  margin: 0;
  font-size: 15px;
  color: #333;
  font-weight: 600;
  white-space: nowrap;
  overflow: hidden;
  text-overflow: ellipsis;
  flex: 1;
  min-width: 0;
}

.description-wrapper {
  position: relative;
  flex: 1;
  min-height: 0;
  margin-bottom: 8px;
}

.tool-description {
  margin: 0;
  font-size: 13px;
  color: #666;
  line-height: 1.4;
  overflow: hidden;
  display: -webkit-box;
  -webkit-line-clamp: 2;
  -webkit-box-orient: vertical;
  transition: all 0.3s ease;
  position: relative;
  background: #fff;
}

.tool-description.expanded {
  -webkit-line-clamp: unset;
  max-height: none;
}

.description-fade {
  position: absolute;
  bottom: 0;
  left: 0;
  right: 0;
  height: 24px;
  background: linear-gradient(transparent, #fff);
  pointer-events: none;
}

.expand-btn {
  background: #fff;
  border: none;
  color: #1a73e8;
  font-size: 12px;
  padding: 2px 4px;
  cursor: pointer;
  position: absolute;
  right: 0;
  bottom: 0;
  line-height: 1.4;
  z-index: 2;
}

.expand-btn.expanded {
  position: static;
  margin-top: 8px;
  display: block;
  width: 100%;
  text-align: center;
}

.expand-btn:hover {
  text-decoration: underline;
}

.tool-footer {
  display: flex;
  align-items: center;
  justify-content: space-between;
  gap: 8px;
  margin-top: auto;
  position: relative;
  z-index: 2;
  background: #fff;
}

.tool-category {
  font-size: 12px;
  color: #666;
  background: #f5f7fa;
  padding: 2px 8px;
  border-radius: 4px;
  white-space: nowrap;
  overflow: hidden;
  text-overflow: ellipsis;
  max-width: 120px;
}

.tool-link {
  display: inline-block;
  padding: 3px 10px;
  background: #1a73e8;
  color: #fff;
  text-decoration: none;
  border-radius: 4px;
  font-size: 12px;
  transition: background 0.3s ease;
  line-height: 1.5;
  white-space: nowrap;
}

.tool-link:hover {
  background: #1557b0;
}

:deep(.dark-theme) .tool-card {
  background: #2d2d2d;
}

:deep(.dark-theme) .tool-name {
  color: #fff;
}

:deep(.dark-theme) .tool-description {
  color: #ccc;
  background: #2d2d2d;
}

:deep(.dark-theme) .description-fade {
  background: linear-gradient(transparent, #2d2d2d);
}

:deep(.dark-theme) .expand-btn {
  background: #2d2d2d;
  color: #64b5f6;
}

:deep(.dark-theme) .tool-category {
  background: #3d3d3d;
  color: #aaa;
}

:deep(.dark-theme) .tool-footer {
  background: #2d2d2d;
}

:deep(.dark-theme) .tool-link {
  background: #64b5f6;
}

:deep(.dark-theme) .tool-link:hover {
  background: #42a5f5;
}
</style> 