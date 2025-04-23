package com.example.controller;

import com.example.common.Result;
import com.example.entity.PaperCheckTool;
import com.example.service.PaperCheckToolService;
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
@RequestMapping("/api/paper-check-tools")
public class PaperCheckToolController {
    
    @Autowired
    private PaperCheckToolService paperCheckToolService;
    
    @GetMapping("/list")
    public Result list(@RequestParam(required = false) String name,
                      @RequestParam(defaultValue = "1") Integer pageNum,
                      @RequestParam(defaultValue = "10") Integer pageSize) {
        try {
            List<PaperCheckTool> list = paperCheckToolService.findList(name, pageNum, pageSize);
            int total = paperCheckToolService.count(name);
            
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
            PaperCheckTool paperCheckTool = paperCheckToolService.findById(id);
            if (paperCheckTool == null) {
                return Result.error("404", "未找到该记录");
            }
            return Result.success(paperCheckTool);
        } catch (Exception e) {
            e.printStackTrace();
            return Result.error("500", "获取数据失败: " + e.getMessage());
        }
    }
    
    @PostMapping
    public Result add(@RequestBody PaperCheckTool paperCheckTool) {
        try {
            int result = paperCheckToolService.add(paperCheckTool);
            return result > 0 ? Result.success() : Result.error("500", "添加失败");
        } catch (Exception e) {
            e.printStackTrace();
            return Result.error("500", "添加失败: " + e.getMessage());
        }
    }
    
    @PutMapping
    public Result update(@RequestBody PaperCheckTool paperCheckTool) {
        try {
            if (paperCheckTool.getId() == null) {
                return Result.error("400", "ID不能为空");
            }
            int result = paperCheckToolService.update(paperCheckTool);
            return result > 0 ? Result.success() : Result.error("500", "更新失败");
        } catch (Exception e) {
            e.printStackTrace();
            return Result.error("500", "更新失败: " + e.getMessage());
        }
    }
    
    @DeleteMapping("/{id}")
    public Result delete(@PathVariable Integer id) {
        try {
            int result = paperCheckToolService.deleteById(id);
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
            int result = paperCheckToolService.deleteBatch(ids);
            return result > 0 ? Result.success() : Result.error("500", "批量删除失败");
        } catch (Exception e) {
            e.printStackTrace();
            return Result.error("500", "批量删除失败: " + e.getMessage());
        }
    }
    
    @GetMapping("/export")
    public void exportExcel(HttpServletResponse response) {
        try {
            List<PaperCheckTool> list = paperCheckToolService.findAllForExport();
            
            Map<String, String> headers = new LinkedHashMap<>();
            headers.put("id", "ID");
            headers.put("name", "名称");
            headers.put("description", "描述");
            headers.put("url", "官网链接");
            headers.put("pricing", "价格信息");
            headers.put("createTime", "创建时间");
            
            byte[] excelBytes = ExcelUtil.createExcel(list, headers, "论文查重工具列表");
            
            response.setContentType("application/vnd.openxmlformats-officedocument.spreadsheetml.sheet");
            response.setHeader("Content-Disposition", "attachment; filename=paper_check_tools.xlsx");
            response.getOutputStream().write(excelBytes);
            response.getOutputStream().flush();
        } catch (Exception e) {
            e.printStackTrace();
            try {
                response.setContentType("application/json;charset=UTF-8");
                response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
                response.getWriter().write("{\"code\":\"500\",\"msg\":\"导出失败: " + e.getMessage() + "\"}");
            } catch (IOException ex) {
                ex.printStackTrace();
            }
        }
    }
} 