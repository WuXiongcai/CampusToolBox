package com.example.controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("/api/test")
public class TestController {

    @GetMapping("/poi")
    public String testPoi() {
        try {
            // 尝试加载POI类
            Class.forName("org.apache.poi.ss.usermodel.Workbook");
            Class.forName("org.apache.poi.xssf.usermodel.XSSFWorkbook");
            return "POI类加载成功";
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
            return "POI类加载失败: " + e.getMessage();
        }
    }
} 