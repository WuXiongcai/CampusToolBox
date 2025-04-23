<script setup lang="ts">
import CommonToolCards from '@/components/CommonToolCards.vue'
import ResourceToolCards from '@/components/ResourceToolCards.vue'
import { onMounted } from 'vue'

onMounted(() => {
  console.log('HomeView mounted')
})
</script>

<template>
  <main class="home">
    <section class="tools-section">
      <h2 class="section-title">常用工具</h2>
      <CommonToolCards />
    </section>
    <section class="tools-section">
      <h2 class="section-title">资源导航</h2>
      <ResourceToolCards />
    </section>
  </main>
</template>

<style scoped>
.home {
  padding: 20px;
  max-width: 1200px;
  margin: 0 auto;
}

.tools-section {
  margin-top: 20px;
}

.section-title {
  font-size: 24px;
  color: #333;
  margin-bottom: 20px;
  padding-bottom: 10px;
  border-bottom: 2px solid #1a73e8;
}

/* 暗色主题支持 */
:deep(.dark-theme) .section-title {
  color: #fff;
  border-bottom-color: #64b5f6;
}
</style>
