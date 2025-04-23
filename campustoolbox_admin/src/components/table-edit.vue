<template>
    <div class="table-edit">
        <el-form :model="formData" :rules="rules" ref="formRef" :label-width="options.labelWidth || '100px'">
            <el-row :gutter="20">
                <el-col v-for="(item, index) in options.list" :key="index" :span="options.span || 12">
                    <el-form-item :label="item.label" :prop="item.prop">
                        <el-input 
                            v-if="item.type === 'input'" 
                            v-model="formData[item.prop]" 
                            :placeholder="item.placeholder || '请输入' + item.label"
                            :disabled="item.disabled"
                            clearable 
                        />
                        <el-select 
                            v-else-if="item.type === 'select'" 
                            v-model="formData[item.prop]" 
                            :placeholder="item.placeholder || '请选择' + item.label"
                            :disabled="item.disabled"
                            clearable
                        >
                            <el-option v-for="opt in item.opts" :key="opt.value" :label="opt.label" :value="opt.value" />
                        </el-select>
                        <el-switch 
                            v-else-if="item.type === 'switch'" 
                            v-model="formData[item.prop]" 
                            :active-value="item.activeValue"
                            :inactive-value="item.inactiveValue"
                            :active-text="item.activeText" 
                            :inactive-text="item.inactiveText"
                            :disabled="item.disabled"
                        />
                    </el-form-item>
                </el-col>
            </el-row>
            <el-form-item>
                <el-button type="primary" @click="submitForm">确定</el-button>
                <el-button @click="resetForm">重置</el-button>
            </el-form-item>
        </el-form>
    </div>
</template>

<script setup lang="ts">
import { ref, reactive, onMounted } from 'vue';
import { ElMessage, FormInstance } from 'element-plus';

// 定义FormOption接口
interface FormOption {
  labelWidth?: string;
  span?: number;
  list: Array<{
    label: string;
    prop: string;
    type: 'input' | 'select' | 'switch';
    placeholder?: string;
    disabled?: boolean;
    required?: boolean;
    opts?: Array<{
      label: string;
      value: any;
    }>;
    activeValue?: any;
    inactiveValue?: any;
    activeText?: string;
    inactiveText?: string;
  }>;
}

const props = defineProps({
    formData: {
        type: Object,
        required: true
    },
    options: {
        type: Object as () => FormOption,
        required: true
    },
    edit: {
        type: Boolean,
        default: false
    },
    update: {
        type: Function,
        required: true
    }
});

const formRef = ref();
const rules = reactive({});

onMounted(() => {
    // 根据options生成表单验证规则
    props.options.list.forEach(item => {
        if (item.required) {
            rules[item.prop] = [{ required: true, message: `请${item.type === 'select' ? '选择' : '输入'}${item.label}`, trigger: item.type === 'select' ? 'change' : 'blur' }];
        }
    });
});

const emit = defineEmits(['update']);

const submitForm = async (formEl: FormInstance | undefined) => {
    if (!formEl) return;
    await formEl.validate((valid, fields) => {
        if (valid) {
            emit('update', props.formData);  // 确保传递整个表单数据
        } else {
            console.error('表单验证失败:', fields);
            return false;
        }
    });
};

const resetForm = () => {
    formRef.value.resetFields();
};
</script>

<style scoped>
.table-edit {
    padding: 20px;
}
</style>