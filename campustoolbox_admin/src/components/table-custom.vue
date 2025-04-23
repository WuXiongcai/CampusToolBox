<template>
    <div class="table-custom">
        <div class="toolbar">
            <slot name="toolbarBtn"></slot>
        </div>
        <el-table :data="tableData" style="width: 100%" v-loading="loading">
            <template v-for="(item, index) in columns" :key="index">
                <el-table-column v-if="item.type === 'index'" :type="item.type" :label="item.label" :width="item.width" :align="item.align" />
                <el-table-column v-else-if="item.slot" :prop="item.prop" :label="item.label" :width="item.width" :align="item.align">
                    <template #default="scope">
                        <slot :name="item.prop" :rows="scope.row"></slot>
                    </template>
                </el-table-column>
                <el-table-column v-else-if="item.prop === 'operator'" :prop="item.prop" :label="item.label" :width="item.width" :align="item.align">
                    <template #default="scope">
                        <el-button type="primary" size="small" @click="viewFunc && viewFunc(scope.row)">查看</el-button>
                        <el-button type="warning" size="small" @click="editFunc && editFunc(scope.row)">编辑</el-button>
                        <el-popconfirm title="确定删除吗？" @confirm="delFunc && delFunc(scope.row)">
                            <template #reference>
                                <el-button type="danger" size="small">删除</el-button>
                            </template>
                        </el-popconfirm>
                    </template>
                </el-table-column>
                <el-table-column v-else :prop="item.prop" :label="item.label" :width="item.width" :align="item.align" />
            </template>
        </el-table>
        <div class="pagination">
            <el-pagination background layout="total, prev, pager, next" :total="total" :page-size="10" @current-change="pageChange" />
        </div>
    </div>
</template>

<script setup lang="ts">
import { ref } from 'vue';

interface TableColumn {
    prop?: string;
    label?: string;
    width?: number | string;
    align?: string;
    type?: string;
    slot?: boolean;
}

defineProps({
    columns: {
        type: Array as () => TableColumn[],
        required: true
    },
    tableData: {
        type: Array,
        required: true
    },
    total: {
        type: Number,
        default: 0
    },
    viewFunc: {
        type: Function,
        default: null
    },
    editFunc: {
        type: Function,
        default: null
    },
    delFunc: {
        type: Function,
        default: null
    },
    pageChange: {
        type: Function,
        required: true
    }
});

const loading = ref(false);
</script>

<style scoped>
.table-custom {
    background: #fff;
    padding: 20px;
    border-radius: 5px;
}
.toolbar {
    margin-bottom: 20px;
}
.pagination {
    margin-top: 20px;
    text-align: right;
}
</style>