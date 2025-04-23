package com.example.config;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.CorsRegistry;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import java.io.File;

@Configuration
public class WebMvcConfig implements WebMvcConfigurer {

    @Value("${file.upload.path:./files}")
    private String fileUploadPath;
    
    @Value("${file.access.path}")
    private String fileAccessPath;
    
    @Override
    public void addCorsMappings(CorsRegistry registry) {
        registry.addMapping("/**")
                .allowedOriginPatterns("*")
                .allowedMethods("GET", "POST", "PUT", "DELETE", "OPTIONS")
                .allowedHeaders("*")
                .allowCredentials(true)
                .maxAge(3600);
    }

    @Override
    public void addResourceHandlers(ResourceHandlerRegistry registry) {
        // 获取文件的绝对路径
        File file = new File(fileUploadPath);
        String absolutePath = file.getAbsolutePath();
        
        // 配置静态资源映射
        registry.addResourceHandler(fileAccessPath + "/**")
                .addResourceLocations("file:" + absolutePath + File.separator);

        // 配置静态资源映射
        registry.addResourceHandler("/files/**")
                .addResourceLocations("file:" + fileUploadPath + "/");
    }
} 