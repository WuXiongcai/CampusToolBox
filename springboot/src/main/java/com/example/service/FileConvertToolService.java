package com.example.service;

import com.example.entity.FileConvertTool;
import com.example.mapper.FileConvertToolMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Date;
import java.util.List;

@Service
public class FileConvertToolService {
    
    @Autowired
    private FileConvertToolMapper fileConvertToolMapper;
    
    public List<FileConvertTool> findList(String name, Integer pageNum, Integer pageSize) {
        System.out.println("Service findList with name: " + name + ", pageNum: " + pageNum + ", pageSize: " + pageSize);
        // 计算分页起始位置
        Integer pageStart = (pageNum - 1) * pageSize;
        List<FileConvertTool> result = fileConvertToolMapper.selectList(name, pageStart, pageSize);
        System.out.println("Found " + (result != null ? result.size() : 0) + " records");
        return result;
    }
    
    public FileConvertTool findById(Integer id) {
        return fileConvertToolMapper.selectById(id);
    }
    
    @Transactional
    public int add(FileConvertTool fileConvertTool) {
        fileConvertTool.setCreateTime(new Date());
        fileConvertTool.setUpdateTime(new Date());
        return fileConvertToolMapper.insert(fileConvertTool);
    }
    
    @Transactional
    public int update(FileConvertTool fileConvertTool) {
        fileConvertTool.setUpdateTime(new Date());
        return fileConvertToolMapper.update(fileConvertTool);
    }
    
    @Transactional
    public int deleteById(Integer id) {
        return fileConvertToolMapper.deleteById(id);
    }
    
    @Transactional
    public int deleteBatch(List<Integer> ids) {
        if (ids == null || ids.isEmpty()) {
            return 0;
        }
        return fileConvertToolMapper.deleteBatch(ids);
    }
    
    public int count(String name) {
        return fileConvertToolMapper.count(name);
    }
    
    /**
     * 获取所有数据用于导出
     */
    public List<FileConvertTool> findAllForExport() {
        return fileConvertToolMapper.selectAllForExport();
    }
} 