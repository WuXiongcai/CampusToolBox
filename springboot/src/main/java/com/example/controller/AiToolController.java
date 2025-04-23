package com.example.controller;

import com.example.common.Result;
import com.example.entity.AiTool;
import com.example.service.AiToolService;
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
@RequestMapping("/api/ai-tools")
public class AiToolController {
    
    @Autowired
    private AiToolService aiToolService;
    
    @GetMapping("/list")
    public Result list(@RequestParam(required = false) String title,
                       @RequestParam(defaultValue = "1") Integer pageNum,
                       @RequestParam(defaultValue = "10") Integer pageSize) {
        
        System.out.println("Received request for list with title: " + title + ", pageNum: " + pageNum + ", pageSize: " + pageSize);
        
        try {
            List<AiTool> list = aiToolService.findList(title, pageNum, pageSize);
            int total = aiToolService.count(title);
            
            System.out.println("Found " + list.size() + " records, total: " + total);
            
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
            AiTool aiTool = aiToolService.findById(id);
            if (aiTool == null) {
                return Result.error("404", "未找到该记录");
            }
            return Result.success(aiTool);
        } catch (Exception e) {
            e.printStackTrace();
            return Result.error("500", "获取数据失败: " + e.getMessage());
        }
    }
    
    @PostMapping
    public Result add(@RequestBody AiTool aiTool) {
        try {
            if (aiTool == null) {
                return Result.error("400", "数据不能为空");
            }
            
            if (aiTool.getIcon() == null || aiTool.getTitle() == null || 
                aiTool.getDescription() == null || aiTool.getLink() == null) {
                return Result.error("400", "必填字段不能为空");
            }
            
            int result = aiToolService.add(aiTool);
            return result > 0 ? Result.success() : Result.error("500", "添加失败");
        } catch (Exception e) {
            e.printStackTrace();
            return Result.error("500", "添加失败: " + e.getMessage());
        }
    }
    
    @PutMapping
    public Result update(@RequestBody AiTool aiTool) {
        try {
            if (aiTool.getId() == null) {
                return Result.error("400", "ID不能为空");
            }
            int result = aiToolService.update(aiTool);
            return result > 0 ? Result.success() : Result.error("500", "更新失败");
        } catch (Exception e) {
            e.printStackTrace();
            return Result.error("500", "更新失败: " + e.getMessage());
        }
    }
    
    @DeleteMapping("/{id}")
    public Result delete(@PathVariable Integer id) {
        try {
            int result = aiToolService.deleteById(id);
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
            int result = aiToolService.deleteBatch(ids);
            return result > 0 ? Result.success() : Result.error("500", "批量删除失败");
        } catch (Exception e) {
            e.printStackTrace();
            return Result.error("500", "批量删除失败: " + e.getMessage());
        }
    }
    
    @GetMapping("/export")
    public void exportExcel(HttpServletResponse response) {
        try {
            System.out.println("开始导出Excel...");
            
            // 获取所有数据
            List<AiTool> list = aiToolService.findAllForExport();
            System.out.println("获取到 " + list.size() + " 条数据");
            
            // 定义表头
            Map<String, String> headers = new LinkedHashMap<>();
            headers.put("id", "ID");
            headers.put("title", "名称");
            headers.put("description", "描述");
            headers.put("link", "官网链接");
            headers.put("createTime", "创建时间");
            
            // 生成Excel
            byte[] excelBytes = ExcelUtil.createExcel(list, headers, "AI工具列表");
            System.out.println("Excel生成成功，大小: " + excelBytes.length + " 字节");
            
            // 设置响应头
            response.setContentType("application/vnd.openxmlformats-officedocument.spreadsheetml.sheet");
            response.setHeader("Content-Disposition", "attachment; filename=ai_tools.xlsx");
            response.setContentLength(excelBytes.length);
            
            // 写入响应
            response.getOutputStream().write(excelBytes);
            response.getOutputStream().flush();
            System.out.println("Excel导出完成");
        } catch (Exception e) {
            e.printStackTrace();
            System.err.println("Excel导出失败: " + e.getMessage());
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