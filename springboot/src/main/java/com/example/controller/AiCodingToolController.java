package com.example.controller;

import com.example.common.Result;
import com.example.entity.AiCodingTool;
import com.example.service.AiCodingToolService;
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
@RequestMapping("/api/ai-coding-tools")
public class AiCodingToolController {
    
    @Autowired
    private AiCodingToolService aiCodingToolService;
    
    @GetMapping("/list")
    public Result list(@RequestParam(required = false) String name,
                       @RequestParam(defaultValue = "1") Integer pageNum,
                       @RequestParam(defaultValue = "10") Integer pageSize) {
        
        System.out.println("Received request for list with name: " + name + ", pageNum: " + pageNum + ", pageSize: " + pageSize);
        
        try {
            List<AiCodingTool> list = aiCodingToolService.findList(name, pageNum, pageSize);
            int total = aiCodingToolService.count(name);
            
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
            AiCodingTool aiCodingTool = aiCodingToolService.findById(id);
            if (aiCodingTool == null) {
                return Result.error("404", "未找到该记录");
            }
            return Result.success(aiCodingTool);
        } catch (Exception e) {
            e.printStackTrace();
            return Result.error("500", "获取数据失败: " + e.getMessage());
        }
    }
    
    @PostMapping
    public Result add(@RequestBody AiCodingTool aiCodingTool) {
        try {
            System.out.println("Received add request: " + aiCodingTool);
            int result = aiCodingToolService.add(aiCodingTool);
            System.out.println("Add result: " + result);
            return result > 0 ? Result.success() : Result.error("500", "添加失败");
        } catch (Exception e) {
            e.printStackTrace();
            return Result.error("500", "添加失败: " + e.getMessage());
        }
    }
    
    @PutMapping
    public Result update(@RequestBody AiCodingTool aiCodingTool) {
        try {
            if (aiCodingTool.getId() == null) {
                return Result.error("400", "ID不能为空");
            }
            int result = aiCodingToolService.update(aiCodingTool);
            return result > 0 ? Result.success() : Result.error("500", "更新失败");
        } catch (Exception e) {
            e.printStackTrace();
            return Result.error("500", "更新失败: " + e.getMessage());
        }
    }
    
    @DeleteMapping("/{id}")
    public Result delete(@PathVariable Integer id) {
        try {
            int result = aiCodingToolService.deleteById(id);
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
            int result = aiCodingToolService.deleteBatch(ids);
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
            List<AiCodingTool> list = aiCodingToolService.findAllForExport();
            System.out.println("获取到 " + list.size() + " 条数据");
            
            // 定义表头
            Map<String, String> headers = new LinkedHashMap<>();
            headers.put("id", "ID");
            headers.put("name", "名称");
            headers.put("description", "描述");
            headers.put("url", "官网链接");
            headers.put("language", "支持语言");
            headers.put("createTime", "创建时间");
            
            // 生成Excel
            byte[] excelBytes = ExcelUtil.createExcel(list, headers, "AI编程辅助工具列表");
            System.out.println("Excel生成成功，大小: " + excelBytes.length + " 字节");
            
            // 设置响应头
            response.setContentType("application/vnd.openxmlformats-officedocument.spreadsheetml.sheet");
            response.setHeader("Content-Disposition", "attachment; filename=ai_coding_tools.xlsx");
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