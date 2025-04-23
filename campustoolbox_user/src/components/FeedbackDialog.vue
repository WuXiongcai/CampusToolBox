<template>
  <div class="feedback-dialog" v-if="visible">
    <div class="dialog-content">
      <div class="dialog-header">
        <h3>反馈建议</h3>
        <button class="close-btn" @click="closeDialog">×</button>
      </div>
      <div class="dialog-body">
        <div class="form-group">
          <label for="feedbackType">反馈类型</label>
          <select id="feedbackType" v-model="feedback.type">
            <option value="1">功能建议</option>
            <option value="2">问题反馈</option>
            <option value="3">其他</option>
          </select>
        </div>
        <div class="form-group">
          <label for="feedbackContent">反馈内容</label>
          <textarea 
            id="feedbackContent" 
            v-model="feedback.content" 
            placeholder="请输入您的反馈内容..."
            rows="5"
          ></textarea>
        </div>
        <div class="form-group">
          <label for="contactInfo">联系方式（选填）</label>
          <input 
            type="text" 
            id="contactInfo" 
            v-model="feedback.contactInfo" 
            placeholder="请输入您的联系方式"
          >
        </div>
      </div>
      <div class="dialog-footer">
        <button class="submit-btn" @click="submitFeedback">提交</button>
        <button class="cancel-btn" @click="closeDialog">取消</button>
      </div>
    </div>
  </div>
</template>

<script setup lang="ts">
import { ref, reactive } from 'vue'
import { ElMessage } from 'element-plus'
import { submitFeedback as submitFeedbackApi } from '@/api'

const visible = ref(false)
const feedback = reactive({
  type: '1',
  content: '',
  contactInfo: ''
})

const emit = defineEmits(['close'])

const closeDialog = () => {
  visible.value = false
  emit('close')
}

const submitFeedback = async () => {
  if (!feedback.content.trim()) {
    ElMessage.warning('请输入反馈内容')
    return
  }
  
  try {
    await submitFeedbackApi(feedback)
    ElMessage.success('提交成功，感谢您的反馈！')
    closeDialog()
  } catch (error) {
    ElMessage.error('提交失败，请稍后重试')
  }
}

defineExpose({
  show: () => visible.value = true
})
</script>

<style scoped>
.feedback-dialog {
  position: fixed;
  top: 0;
  left: 0;
  right: 0;
  bottom: 0;
  background: rgba(0, 0, 0, 0.5);
  display: flex;
  justify-content: center;
  align-items: flex-start;
  z-index: 1000;
  padding-top: 120px;
}

.dialog-content {
  background: #fff;
  border-radius: 8px;
  width: 400px;
  max-width: 90%;
  box-shadow: 0 2px 12px rgba(0, 0, 0, 0.1);
}

.dialog-header {
  padding: 12px 20px;
  border-bottom: 1px solid #eaeaea;
  display: flex;
  justify-content: space-between;
  align-items: center;
}

.dialog-header h3 {
  margin: 0;
  font-size: 16px;
  color: #333;
}

.close-btn {
  background: none;
  border: none;
  font-size: 24px;
  cursor: pointer;
  color: #666;
}

.dialog-body {
  padding: 16px 20px;
}

.form-group {
  margin-bottom: 12px;
}

.form-group label {
  display: block;
  margin-bottom: 4px;
  color: #333;
  font-size: 13px;
}

.form-group select,
.form-group input {
  width: 100%;
  padding: 6px 10px;
  border: 1px solid #dcdfe6;
  border-radius: 4px;
  font-size: 13px;
  height: 32px;
}

.form-group textarea {
  width: 100%;
  padding: 6px 10px;
  border: 1px solid #dcdfe6;
  border-radius: 4px;
  font-size: 13px;
  resize: vertical;
  min-height: 80px;
  max-height: 150px;
}

.dialog-footer {
  padding: 12px 20px;
  border-top: 1px solid #eaeaea;
  text-align: right;
}

.submit-btn,
.cancel-btn {
  padding: 6px 16px;
  border-radius: 4px;
  font-size: 13px;
  cursor: pointer;
  margin-left: 8px;
  height: 32px;
}

.submit-btn {
  background: #1a73e8;
  color: #fff;
  border: none;
}

.cancel-btn {
  background: #fff;
  color: #666;
  border: 1px solid #dcdfe6;
}

.submit-btn:hover {
  background: #1557b0;
}

.cancel-btn:hover {
  color: #333;
  border-color: #c0c4cc;
}

:deep(.dark-theme) .dialog-content {
  background: #2d2d2d;
}

:deep(.dark-theme) .dialog-header {
  border-color: #3d3d3d;
}

:deep(.dark-theme) .dialog-header h3 {
  color: #fff;
}

:deep(.dark-theme) .close-btn {
  color: #999;
}

:deep(.dark-theme) .form-group label {
  color: #fff;
}

:deep(.dark-theme) .form-group select,
:deep(.dark-theme) .form-group input,
:deep(.dark-theme) .form-group textarea {
  background: #1a1a1a;
  border-color: #3d3d3d;
  color: #fff;
}

:deep(.dark-theme) .dialog-footer {
  border-color: #3d3d3d;
}

:deep(.dark-theme) .cancel-btn {
  background: #2d2d2d;
  border-color: #3d3d3d;
  color: #fff;
}
</style> 