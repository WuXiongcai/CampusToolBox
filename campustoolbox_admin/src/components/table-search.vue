<template>
    <div class="table-search">
        <el-form :model="query" :inline="true">
            <template v-for="(item, index) in options" :key="index">
                <el-form-item :label="item.label">
                    <el-input 
                        v-if="item.type === 'input'" 
                        v-model="query[item.prop]" 
                        :placeholder="item.placeholder || '请输入' + item.label"
                        :disabled="item.disabled"
                        clearable 
                    />
                    <el-select 
                        v-else-if="item.type === 'select'" 
                        v-model="query[item.prop]" 
                        :placeholder="item.placeholder || '请选择' + item.label"
                        :disabled="item.disabled"
                        clearable
                    >
                        <el-option v-for="opt in item.opts" :key="opt.value" :label="opt.label" :value="opt.value" />
                    </el-select>
                </el-form-item>
            </template>
            <el-form-item>
                <el-button type="primary" @click="search">搜索</el-button>
                <el-button @click="reset">重置</el-button>
            </el-form-item>
        </el-form>
    </div>
</template>

<script setup lang="ts">
import { FormOptionList } from '@/types/form-option';

const props = defineProps({
    query: {
        type: Object,
        required: true
    },
    options: {
        type: Array as () => FormOptionList[],
        required: true
    },
    search: {
        type: Function,
        required: true
    }
});

const reset = () => {
    for (const key in props.query) {
        props.query[key] = '';
    }
    props.search();
};
</script>

<style scoped>
.table-search {
    background: #fff;
    padding: 20px;
    border-radius: 5px;
    margin-bottom: 20px;
}
</style>