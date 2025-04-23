package com.example.controller;

import com.example.common.Result;
import com.example.entity.AiMindmapTool;
import com.example.service.AiMindmapToolService;
import com.example.util.ExcelUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("/api/ai-mindmap-tools")
public class AiMindmapToolController {
    
    @Autowired
    private AiMindmapToolService aiMindmapToolService;
    
    @GetMapping("/list")
    public Result list(@RequestParam(required = false) String name,
                       @RequestParam(defaultValue = "1") Integer pageNum,
                       @RequestParam(defaultValue = "10") Integer pageSize) {
        try {
            List<AiMindmapTool> list = aiMindmapToolService.findList(name, pageNum, pageSize);
            int total = aiMindmapToolService.count(name);
            
            Map<String, Object> data = new HashMap<>();
            data.put("list", list);
            data.put("total", total);
            
            return Result.success(data);
        } catch (Exception e) {
            e.printStackTrace();
            return Result.error("500", "获取数据失败: " + e.getMessage());
        }
    }
    
    @GetMapping("/{id}")
    public Result getById(@PathVariable Integer id) {
        try {
            AiMindmapTool aiMindmapTool = aiMindmapToolService.findById(id);
            if (aiMindmapTool == null) {
                return Result.error("404", "未找到该记录");
            }
            return Result.success(aiMindmapTool);
        } catch (Exception e) {
            e.printStackTrace();
            return Result.error("500", "获取数据失败: " + e.getMessage());
        }
    }
    
    @PostMapping
    public Result add(@RequestBody AiMindmapTool aiMindmapTool) {
        try {
            int result = aiMindmapToolService.add(aiMindmapTool);
            return result > 0 ? Result.success() : Result.error("500", "添加失败");
        } catch (Exception e) {
            e.printStackTrace();
            return Result.error("500", "添加失败: " + e.getMessage());
        }
    }
    
    @PutMapping
    public Result update(@RequestBody AiMindmapTool aiMindmapTool) {
        try {
            if (aiMindmapTool.getId() == null) {
                return Result.error("400", "ID不能为空");
            }
            int result = aiMindmapToolService.update(aiMindmapTool);
            return result > 0 ? Result.success() : Result.error("500", "更新失败");
        } catch (Exception e) {
            e.printStackTrace();
            return Result.error("500", "更新失败: " + e.getMessage());
        }
    }
    
    @DeleteMapping("/{id}")
    public Result delete(@PathVariable Integer id) {
        try {
            int result = aiMindmapToolService.deleteById(id);
            return result > 0 ? Result.success() : Result.error("500", "删除失败");
        } catch (Exception e) {
            e.printStackTrace();
            return Result.error("500", "删除失败: " + e.getMessage());
        }
    }
    
    @DeleteMapping("/batch")
    public Result deleteBatch(@RequestBody List<Integer> ids) {
        try {
            if (ids == null || ids.isEmpty()) {
                return Result.error("400", "请选择要删除的记录");
            }
            int result = aiMindmapToolService.deleteBatch(ids);
            return result > 0 ? Result.success() : Result.error("500", "批量删除失败");
        } catch (Exception e) {
            e.printStackTrace();
            return Result.error("500", "批量删除失败: " + e.getMessage());
        }
    }
    
    @GetMapping("/export")
    public void exportExcel(HttpServletResponse response) {
        try {
            // 获取所有数据
            List<AiMindmapTool> list = aiMindmapToolService.findAllForExport();
            
            // 定义表头
            Map<String, String> headers = new LinkedHashMap<>();
            headers.put("id", "ID");
            headers.put("name", "名称");
            headers.put("description", "描述");
            headers.put("url", "官网链接");
            headers.put("isFree", "是否免费");
            headers.put("createTime", "创建时间");
            
            // 生成Excel
            byte[] excelBytes = ExcelUtil.createExcel(list, headers, "AI思维导图工具列表");
            
            // 设置响应头
            response.setContentType("application/vnd.openxmlformats-officedocument.spreadsheetml.sheet");
            response.setHeader("Content-Disposition", "attachment; filename=ai_mindmap_tools.xlsx");
            response.setContentLength(excelBytes.length);
            
            // 写入响应
            response.getOutputStream().write(excelBytes);
            response.getOutputStream().flush();
        } catch (Exception e) {
            e.printStackTrace();
            try {
                response.setContentType("application/json;charset=UTF-8");
                response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
                response.getWriter().write("{\"code\":\"500\",\"msg\":\"导出失败: " + e.getMessage() + "\",\"data\":null}");
            } catch (IOException ex) {
                ex.printStackTrace();
            }
        }
    }
} 