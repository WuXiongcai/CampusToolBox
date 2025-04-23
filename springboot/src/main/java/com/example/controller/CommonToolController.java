package com.example.controller;

import com.example.common.Result;
import com.example.entity.CommonTool;
import com.example.service.CommonToolService;
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
@RequestMapping("/api/common-tools")
public class CommonToolController {
    
    @Autowired
    private CommonToolService commonToolService;
    
    @GetMapping("/list")
    public Result list(@RequestParam(required = false) String name,
                       @RequestParam(defaultValue = "1") Integer pageNum,
                       @RequestParam(defaultValue = "10") Integer pageSize) {
        
        System.out.println("Received request for list with name: " + name + ", pageNum: " + pageNum + ", pageSize: " + pageSize);
        
        try {
            List<CommonTool> list = commonToolService.findList(name, pageNum, pageSize);
            int total = commonToolService.count(name);
            
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
            CommonTool commonTool = commonToolService.findById(id);
            if (commonTool == null) {
                return Result.error("404", "未找到该记录");
            }
            return Result.success(commonTool);
        } catch (Exception e) {
            e.printStackTrace();
            return Result.error("500", "获取数据失败: " + e.getMessage());
        }
    }
    
    @PostMapping
    public Result add(@RequestBody CommonTool commonTool) {
        try {
            System.out.println("Received add request: " + commonTool);
            int result = commonToolService.add(commonTool);
            System.out.println("Add result: " + result);
            return result > 0 ? Result.success() : Result.error("500", "添加失败");
        } catch (Exception e) {
            e.printStackTrace();
            return Result.error("500", "添加失败: " + e.getMessage());
        }
    }
    
    @PutMapping
    public Result update(@RequestBody CommonTool commonTool) {
        try {
            if (commonTool.getId() == null) {
                return Result.error("400", "ID不能为空");
            }
            int result = commonToolService.update(commonTool);
            return result > 0 ? Result.success() : Result.error("500", "更新失败");
        } catch (Exception e) {
            e.printStackTrace();
            return Result.error("500", "更新失败: " + e.getMessage());
        }
    }
    
    @DeleteMapping("/{id}")
    public Result delete(@PathVariable Integer id) {
        try {
            int result = commonToolService.deleteById(id);
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
            int result = commonToolService.deleteBatch(ids);
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
            List<CommonTool> list = commonToolService.findAllForExport();
            System.out.println("获取到 " + list.size() + " 条数据");
            
            // 定义表头
            Map<String, String> headers = new LinkedHashMap<>();
            headers.put("id", "ID");
            headers.put("name", "名称");
            headers.put("description", "描述");
            headers.put("url", "链接");
            headers.put("category", "分类");
            headers.put("createTime", "创建时间");
            
            // 生成Excel
            byte[] excelBytes = ExcelUtil.createExcel(list, headers, "常用工具列表");
            System.out.println("Excel生成成功，大小: " + excelBytes.length + " 字节");
            
            // 设置响应头
            response.setContentType("application/vnd.openxmlformats-officedocument.spreadsheetml.sheet");
            response.setHeader("Content-Disposition", "attachment; filename=common_tools.xlsx");
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