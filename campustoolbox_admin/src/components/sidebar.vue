<template>
    <div class="sidebar">
        <el-menu
            class="sidebar-el-menu"
            :default-active="onRoutes"
            :collapse="sidebar.collapse"
            :background-color="sidebar.bgColor"
            :text-color="sidebar.textColor"
            router
        >
            <template v-for="item in menuData">
                <template v-if="item.children">
                    <el-sub-menu :index="item.index" :key="item.index" v-permiss="item.id">
                        <template #title>
                            <el-icon>
                                <component :is="item.icon"></component>
                            </el-icon>
                            <span>{{ item.title }}</span>
                        </template>
                        <template v-for="subItem in item.children">
                            <el-sub-menu
                                v-if="subItem.children"
                                :index="subItem.index"
                                :key="subItem.index"
                            >
                                <template #title>
                                    <el-icon>
                                        <component :is="subItem.icon"></component>
                                    </el-icon>
                                    <span>{{ subItem.title }}</span>
                                </template>
                                <el-menu-item
                                    v-for="threeItem in subItem.children"
                                    :key="threeItem.index"
                                    :index="threeItem.index"
                                    v-permiss="threeItem.permiss"
                                >
                                    <el-icon>
                                        <component :is="threeItem.icon"></component>
                                    </el-icon>
                                    <template #title>{{ threeItem.title }}</template>
                                </el-menu-item>
                            </el-sub-menu>
                            <el-menu-item 
                                v-else 
                                :index="subItem.index" 
                                v-permiss="subItem.permiss"
                            >
                                <el-icon>
                                    <component :is="subItem.icon"></component>
                                </el-icon>
                                <template #title>{{ subItem.title }}</template>
                            </el-menu-item>
                        </template>
                    </el-sub-menu>
                </template>
                <template v-else>
                    <el-menu-item :index="item.index" :key="item.index" v-permiss="item.id">
                        <el-icon>
                            <component :is="item.icon"></component>
                        </el-icon>
                        <template #title>{{ item.title }}</template>
                    </el-menu-item>
                </template>
            </template>
        </el-menu>
    </div>
</template>

<script setup lang="ts">
import { computed } from 'vue';
import { useSidebarStore } from '../store/sidebar';
import { useRoute } from 'vue-router';
import { menuData } from '@/components/menu';

const route = useRoute();
const onRoutes = computed(() => {
    return route.path;
});

const sidebar = useSidebarStore();
</script>

<style scoped>
.sidebar {
    display: block;
    position: absolute;
    left: 0;
    top: 70px;
    bottom: 0;
    overflow-y: scroll;
}

.sidebar::-webkit-scrollbar {
    width: 6px;
}

.sidebar::-webkit-scrollbar-thumb {
    background: rgba(144, 147, 153, 0.3);
    border-radius: 3px;
}

.sidebar-el-menu:not(.el-menu--collapse) {
    width: 250px;
}

.sidebar-el-menu {
    min-height: 100%;
}

:deep(.el-menu--popup) {
    max-height: calc(100vh - 100px);
    overflow-y: auto;
}

:deep(.el-menu--popup)::-webkit-scrollbar {
    width: 6px;
}

:deep(.el-menu--popup)::-webkit-scrollbar-thumb {
    background: rgba(144, 147, 153, 0.3);
    border-radius: 3px;
}

:deep(.el-sub-menu .el-menu-item) {
    min-width: 200px;
    padding-left: 45px !important;
}

:deep(.el-sub-menu__title) {
    padding-left: 20px !important;
}

:deep(.el-menu-item) {
    padding-left: 20px !important;
}

:deep(.el-menu--collapse) .el-sub-menu__title {
    padding-left: 20px !important;
}
</style>
