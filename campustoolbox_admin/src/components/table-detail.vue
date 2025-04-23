<template>
    <div class="table-detail">
        <el-descriptions :column="data.column || 2" border>
            <template v-for="(item, index) in data.list" :key="index">
                <el-descriptions-item :label="item.label">
                    <slot v-if="item.slot" :name="item.prop" :rows="data.row"></slot>
                    <template v-else>{{ data.row[item.prop] }}</template>
                </el-descriptions-item>
            </template>
        </el-descriptions>
    </div>
</template>

<script setup lang="ts">
defineProps({
    data: {
        type: Object,
        required: true
    }
});
</script>

<style scoped>
.table-detail {
    padding: 20px;
}
</style>