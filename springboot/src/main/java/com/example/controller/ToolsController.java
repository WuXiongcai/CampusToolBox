package com.example.controller;

import com.example.common.Result;
import com.example.service.ToolsService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;
import java.util.Map;

@Slf4j
@RestController
@RequestMapping("/api/tools")
public class ToolsController {
    
    @Resource
    private ToolsService toolsService;
    
    @GetMapping("/statistics")
    public Result<?> getStatistics() {
        try {
            Map<String, Object> statistics = toolsService.getToolsStatistics();
            return Result.success(statistics);
        } catch (Exception e) {
            log.error("获取工具统计数据失败", e);
            return Result.error("获取统计数据失败");
        }
    }
} 