package com.example.controller;

import com.example.common.Result;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.UUID;

@RestController
@RequestMapping("/api/file")
public class FileUploadController {

    @Value("${file.upload.path:./files}")
    private String fileUploadPath;

    @PostMapping("/upload")
    public Result upload(@RequestParam("file") MultipartFile file) {
        if (file.isEmpty()) {
            return Result.error("400", "上传文件不能为空");
        }

        try {
            // 创建文件目录
            String datePath = new SimpleDateFormat("yyyyMMdd").format(new Date());
            File uploadDir = new File(fileUploadPath + "/" + datePath);
            if (!uploadDir.exists()) {
                uploadDir.mkdirs();
            }

            // 获取文件后缀
            String originalFilename = file.getOriginalFilename();
            String suffix = originalFilename.substring(originalFilename.lastIndexOf("."));
            
            // 生成新的文件名
            String newFileName = UUID.randomUUID().toString().replaceAll("-", "") + suffix;
            
            // 保存文件
            File destFile = new File(uploadDir.getAbsolutePath() + "/" + newFileName);
            file.transferTo(destFile);
            
            // 返回文件访问路径
            String filePath = "/files/" + datePath + "/" + newFileName;
            
            return Result.success(filePath);
        } catch (IOException e) {
            e.printStackTrace();
            return Result.error("500", "文件上传失败: " + e.getMessage());
        }
    }
} 