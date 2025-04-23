<template>
  <div class="feedback-container">
    <!-- 统计卡片 -->
    <el-row :gutter="20" class="statistics-row">
      <el-col :span="8">
        <el-card shadow="hover" class="statistics-card">
          <template #header>
            <div class="card-header">
              <span>总反馈数</span>
            </div>
          </template>
          <div class="statistics-value">
            <el-statistic :value="statistics.total">
              <template #title>
                <div style="display: inline-flex; align-items: center">
                  总计
                  <el-icon style="margin-left: 4px">
                    <Comment />
                  </el-icon>
                </div>
              </template>
            </el-statistic>
          </div>
        </el-card>
      </el-col>
      <el-col :span="8">
        <el-card shadow="hover" class="statistics-card">
          <template #header>
            <div class="card-header">
              <span>待处理反馈</span>
            </div>
          </template>
          <div class="statistics-value">
            <el-statistic :value="statistics.pending" value-style="color: #ff9900">
              <template #title>
                <div style="display: inline-flex; align-items: center">
                  待处理
                  <el-icon style="margin-left: 4px">
                    <Warning />
                  </el-icon>
                </div>
              </template>
            </el-statistic>
          </div>
        </el-card>
      </el-col>
      <el-col :span="8">
        <el-card shadow="hover" class="statistics-card">
          <template #header>
            <div class="card-header">
              <span>已处理反馈</span>
            </div>
          </template>
          <div class="statistics-value">
            <el-statistic :value="statistics.processed" value-style="color: #67c23a">
              <template #title>
                <div style="display: inline-flex; align-items: center">
                  已处理
                  <el-icon style="margin-left: 4px">
                    <Check />
                  </el-icon>
                </div>
              </template>
            </el-statistic>
          </div>
        </el-card>
      </el-col>
    </el-row>

    <el-card class="box-card">
      <template #header>
        <div class="card-header">
          <div class="header-left">
            <span class="title">反馈管理</span>
            <el-select
              v-model="filterStatus"
              placeholder="状态筛选"
              class="filter-select"
              @change="handleFilterChange"
            >
              <el-option label="全部" :value="-1" />
              <el-option label="待处理" :value="0" />
              <el-option label="已处理" :value="1" />
            </el-select>
          </div>
          <div class="button-group">
            <el-button
              type="primary"
              :disabled="!selectedRows.length"
              @click="handleBatchProcess"
            >
              批量处理
            </el-button>
            <el-button
              type="danger"
              :disabled="!selectedRows.length"
              @click="handleBatchDelete"
            >
              批量删除
            </el-button>
          </div>
        </div>
      </template>
      
      <el-table 
        :data="feedbackList" 
        style="width: 100%" 
        v-loading="loading"
        @selection-change="handleSelectionChange"
      >
        <el-table-column type="selection" width="55" />
        <el-table-column prop="id" label="ID" width="80" />
        <el-table-column prop="type" label="反馈类型" width="120">
          <template #default="{ row }">
            <el-tag :type="getTypeTag(row.type)">
              {{ getTypeText(row.type) }}
            </el-tag>
          </template>
        </el-table-column>
        <el-table-column prop="content" label="反馈内容" show-overflow-tooltip />
        <el-table-column prop="contactInfo" label="联系方式" width="150" show-overflow-tooltip />
        <el-table-column prop="status" label="状态" width="100">
          <template #default="{ row }">
            <el-tag :type="row.status === 1 ? 'success' : 'info'">
              {{ row.status === 1 ? '已处理' : '待处理' }}
            </el-tag>
          </template>
        </el-table-column>
        <el-table-column prop="createTime" label="提交时间" width="180" />
        <el-table-column label="操作" width="150" fixed="right">
          <template #default="{ row }">
            <el-button 
              v-if="row.status === 0"
              type="primary" 
              size="small" 
              @click="handleProcess(row)"
            >
              处理
            </el-button>
            <el-button 
              type="danger" 
              size="small" 
              @click="handleDelete(row)"
            >
              删除
            </el-button>
          </template>
        </el-table-column>
      </el-table>

      <div class="pagination-container">
        <el-pagination
          background
          layout="total, sizes, prev, pager, next"
          :total="total"
          :page-size="pageSize"
          :current-page="currentPage"
          :page-sizes="[10, 20, 50, 100]"
          @size-change="handleSizeChange"
          @current-change="handleCurrentChange"
        />
      </div>
    </el-card>
  </div>
</template>

<script setup lang="ts">
import { ref, onMounted } from 'vue'
import { ElMessage, ElMessageBox } from 'element-plus'
import { getFeedbackList, processFeedback, deleteFeedback } from '@/api'
import { Comment, Warning, Check } from '@element-plus/icons-vue'

const loading = ref(false)
const feedbackList = ref([])
const currentPage = ref(1)
const pageSize = ref(10)
const total = ref(0)
const selectedRows = ref([])
const filterStatus = ref(-1)
const statistics = ref({
  total: 0,
  pending: 0,
  processed: 0
})

const getTypeTag = (type: number) => {
  const tags = {
    1: 'success',
    2: 'warning',
    3: 'info'
  }
  return tags[type] || 'info'
}

const getTypeText = (type: number) => {
  const texts = {
    1: '功能建议',
    2: '问题反馈',
    3: '其他'
  }
  return texts[type] || '未知'
}

const loadStatistics = () => {
  const total = feedbackList.value.length
  const processed = feedbackList.value.filter(item => item.status === 1).length
  statistics.value = {
    total,
    processed,
    pending: total - processed
  }
}

const handleSelectionChange = (rows) => {
  selectedRows.value = rows
}

const handleBatchProcess = async () => {
  try {
    await ElMessageBox.confirm('确认处理选中的反馈？', '提示', { type: 'warning' })
    const promises = selectedRows.value.map(row => processFeedback(row.id))
    await Promise.all(promises)
    ElMessage.success('批量处理成功')
    loadFeedbackList()
  } catch (error) {
    if (error !== 'cancel') {
      console.error('批量处理反馈失败:', error)
      ElMessage.error('批量处理失败')
    }
  }
}

const handleBatchDelete = async () => {
  try {
    await ElMessageBox.confirm('确认删除选中的反馈？此操作不可恢复！', '警告', { type: 'warning' })
    const promises = selectedRows.value.map(row => deleteFeedback(row.id))
    await Promise.all(promises)
    ElMessage.success('批量删除成功')
    loadFeedbackList()
  } catch (error) {
    if (error !== 'cancel') {
      console.error('批量删除反馈失败:', error)
      ElMessage.error('批量删除失败')
    }
  }
}

const handleFilterChange = () => {
  currentPage.value = 1; // 重置页码
  loadFeedbackList();
};

const loadFeedbackList = async () => {
  loading.value = true;
  try {
    console.log('开始获取反馈列表，参数:', {
      pageNum: currentPage.value,
      pageSize: pageSize.value,
      status: filterStatus.value
    });
    
    const res = await getFeedbackList({
      pageNum: currentPage.value,
      pageSize: pageSize.value,
      status: filterStatus.value === -1 ? undefined : filterStatus.value
    });
    
    console.log('API响应数据:', res);
    
    if (res?.data?.code === '200') {
      const { records, total: totalCount, size, current } = res.data.data || {};
      console.log('解析的数据:', { records, totalCount, size, current });
      
      if (Array.isArray(records)) {
        feedbackList.value = records;
        total.value = totalCount > 0 ? parseInt(totalCount) : records.length;
        pageSize.value = parseInt(size) || 10;
        currentPage.value = parseInt(current) || 1;
        
        console.log('更新后的状态:', {
          feedbackList: feedbackList.value,
          total: total.value,
          pageSize: pageSize.value,
          currentPage: currentPage.value
        });
        loadStatistics()
      } else {
        console.error('records不是数组:', records);
        feedbackList.value = [];
        total.value = 0;
      }
    } else {
      console.error('API响应异常:', res);
      ElMessage.error('获取数据失败');
    }
  } catch (error) {
    console.error('获取反馈列表失败:', error);
    ElMessage.error('获取反馈列表失败');
  } finally {
    loading.value = false;
  }
};

const handleProcess = async (row: any) => {
  try {
    await ElMessageBox.confirm('确认处理该反馈？', '提示', {
      type: 'warning'
    })
    const res = await processFeedback(row.id)
    if (res?.data?.code === '200') {
      ElMessage.success('处理成功')
      loadFeedbackList()
    } else {
      ElMessage.error('处理失败')
    }
  } catch (error) {
    if (error !== 'cancel') {
      console.error('处理反馈失败:', error)
      ElMessage.error('处理失败')
    }
  }
}

const handleDelete = async (row: any) => {
  try {
    await ElMessageBox.confirm('确认删除该反馈？', '提示', {
      type: 'warning'
    })
    const res = await deleteFeedback(row.id)
    if (res?.data?.code === '200') {
      ElMessage.success('删除成功')
      loadFeedbackList()
    } else {
      ElMessage.error('删除失败')
    }
  } catch (error) {
    if (error !== 'cancel') {
      console.error('删除反馈失败:', error)
      ElMessage.error('删除失败')
    }
  }
}

const handleSizeChange = (val: number) => {
  pageSize.value = val
  currentPage.value = 1 // 重置页码
  loadFeedbackList()
}

const handleCurrentChange = (val: number) => {
  currentPage.value = val
  loadFeedbackList()
}

onMounted(() => {
  loadFeedbackList()
})
</script>

<style scoped>
.feedback-container {
  padding: 20px;
}

.statistics-row {
  margin-bottom: 20px;
}

.statistics-card {
  height: 100%;
  .statistics-value {
    text-align: center;
    font-size: 24px;
    padding: 10px;
  }
}

.card-header {
  display: flex;
  justify-content: space-between;
  align-items: center;
}

.button-group {
  display: flex;
  gap: 10px;
}

.pagination-container {
  margin-top: 20px;
  display: flex;
  justify-content: flex-end;
}

.el-table {
  margin-top: 20px;
}

:deep(.el-card__header) {
  padding: 15px 20px;
}

:deep(.el-table .cell) {
  white-space: nowrap;
}

:deep(.el-card.is-always-shadow) {
  box-shadow: 0 0 12px rgba(0, 0, 0, 0.05);
}

:deep(.el-statistic__content) {
  font-size: 24px;
  font-weight: bold;
}

.header-left {
  display: flex;
  align-items: center;
  gap: 16px;
}

.title {
  font-size: 16px;
  font-weight: 600;
}

.filter-select {
  width: 120px;
}
</style>
