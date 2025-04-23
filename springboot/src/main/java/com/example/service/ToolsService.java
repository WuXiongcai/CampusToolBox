package com.example.service;

import java.util.Map;

public interface ToolsService {
    
    /**
     * 获取所有工具的统计数据
     * @return Map 包含总数和各类工具数量
     */
    Map<String, Object> getToolsStatistics();
} 