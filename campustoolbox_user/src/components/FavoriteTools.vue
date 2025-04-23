<template>
  <div class="favorite-tools" v-if="showFavorites">
    <div class="modal-overlay" @click="close"></div>
    <div class="modal-content">
      <div class="modal-header">
        <h3>我的收藏</h3>
        <button class="close-btn" @click="close">×</button>
      </div>
      <div class="tools-container">
        <div v-if="favoriteTools.length === 0" class="empty-state">
          暂无收藏工具
        </div>
        <div v-else class="tools-grid">
          <div v-for="tool in favoriteTools" :key="tool.id" class="tool-card">
            <div class="tool-header">
              <div class="tool-icon">
                <img v-if="tool.icon" :src="getIconUrl(tool.icon)" :alt="tool.name" />
                <span v-else class="default-icon">🛠️</span>
              </div>
              <button 
                class="favorite-btn is-favorite"
                @click="removeFavorite(tool.id)"
              >
                <span class="favorite-icon">★</span>
              </button>
            </div>
            <div class="tool-content">
              <h3 class="tool-name">{{ tool.name }}</h3>
              <p class="tool-description">{{ tool.description }}</p>
              <a :href="tool.url" target="_blank" class="tool-link">访问官网</a>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script setup lang="ts">
import { ref, onMounted, onUnmounted } from 'vue'
import { BASE_URL } from '@/api'
import type { Tool } from '@/types/tool'

const props = defineProps<{
  allTools: Tool[]
}>()

const showFavorites = ref(false)
const favoriteTools = ref<Tool[]>([])

const getIconUrl = (icon: string) => {
  if (!icon) return ''
  if (icon.startsWith('http')) return icon
  return `${BASE_URL}${icon}`
}

const loadFavoriteTools = () => {
  const favorites = JSON.parse(localStorage.getItem('favorites') || '[]')
  favoriteTools.value = props.allTools.filter(tool => favorites.includes(tool.id))
}

const removeFavorite = (toolId: number) => {
  const favorites = JSON.parse(localStorage.getItem('favorites') || '[]')
  const index = favorites.indexOf(toolId)
  if (index > -1) {
    favorites.splice(index, 1)
    localStorage.setItem('favorites', JSON.stringify(favorites))
    loadFavoriteTools()
    window.dispatchEvent(new CustomEvent('favorites-changed'))
  }
}

const handleFavoritesChanged = () => {
  loadFavoriteTools()
}

const show = () => {
  showFavorites.value = true
  loadFavoriteTools()
}

const close = () => {
  showFavorites.value = false
}

defineExpose({
  show,
  close
})

onMounted(() => {
  window.addEventListener('favorites-changed', handleFavoritesChanged)
})

onUnmounted(() => {
  window.removeEventListener('favorites-changed', handleFavoritesChanged)
})
</script>

<style scoped>
.favorite-tools {
  position: fixed;
  top: 0;
  left: 0;
  right: 0;
  bottom: 0;
  z-index: 1000;
  display: flex;
  justify-content: center;
  align-items: center;
}

.modal-overlay {
  position: absolute;
  top: 0;
  left: 0;
  right: 0;
  bottom: 0;
  background: rgba(0, 0, 0, 0.5);
}

.modal-content {
  position: relative;
  background: #fff;
  border-radius: 8px;
  width: 90%;
  max-width: 1000px;
  max-height: 80vh;
  overflow: hidden;
  box-shadow: 0 4px 12px rgba(0, 0, 0, 0.15);
}

.modal-header {
  padding: 16px 24px;
  border-bottom: 1px solid #eaeaea;
  display: flex;
  justify-content: space-between;
  align-items: center;
}

.modal-header h3 {
  margin: 0;
  font-size: 18px;
  color: #333;
}

.close-btn {
  background: none;
  border: none;
  font-size: 24px;
  color: #999;
  cursor: pointer;
  padding: 4px;
}

.close-btn:hover {
  color: #666;
}

.tools-container {
  padding: 24px;
  overflow-y: auto;
  max-height: calc(80vh - 60px);
}

.empty-state {
  text-align: center;
  padding: 40px;
  color: #666;
}

.tools-grid {
  display: grid;
  grid-template-columns: repeat(auto-fill, minmax(280px, 1fr));
  gap: 16px;
}

.tool-card {
  background: #fff;
  border-radius: 8px;
  padding: 16px;
  box-shadow: 0 2px 8px rgba(0, 0, 0, 0.08);
}

.tool-header {
  display: flex;
  justify-content: space-between;
  align-items: flex-start;
  margin-bottom: 12px;
}

.tool-icon {
  width: 32px;
  height: 32px;
  display: flex;
  align-items: center;
  justify-content: center;
  background: #f5f7fa;
  border-radius: 6px;
}

.tool-icon img {
  width: 24px;
  height: 24px;
  object-fit: contain;
}

.favorite-btn {
  background: none;
  border: none;
  padding: 4px;
  cursor: pointer;
  font-size: 20px;
  color: #f1c40f;
  transition: all 0.3s ease;
}

.favorite-btn:hover {
  transform: scale(1.1);
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

:deep(.dark-theme) .modal-content {
  background: #2d2d2d;
}

:deep(.dark-theme) .modal-header {
  border-color: #3d3d3d;
}

:deep(.dark-theme) .modal-header h3 {
  color: #fff;
}

:deep(.dark-theme) .close-btn {
  color: #ccc;
}

:deep(.dark-theme) .close-btn:hover {
  color: #fff;
}

:deep(.dark-theme) .tool-card {
  background: #2d2d2d;
}

:deep(.dark-theme) .tool-name {
  color: #fff;
}

:deep(.dark-theme) .tool-description {
  color: #ccc;
}

:deep(.dark-theme) .tool-link {
  background: #64b5f6;
}

:deep(.dark-theme) .tool-link:hover {
  background: #42a5f5;
}
</style> 