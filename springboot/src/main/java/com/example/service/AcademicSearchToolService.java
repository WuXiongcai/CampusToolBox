package com.example.service;

import com.example.entity.AcademicSearchTool;
import com.example.mapper.AcademicSearchToolMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Date;
import java.util.List;

@Service
public class AcademicSearchToolService {
    
    @Autowired
    private AcademicSearchToolMapper academicSearchToolMapper;
    
    public List<AcademicSearchTool> findList(String name, Boolean isFree, Integer pageNum, Integer pageSize) {
        Integer pageStart = (pageNum - 1) * pageSize;
        return academicSearchToolMapper.selectList(name, isFree, pageStart, pageSize);
    }
    
    public AcademicSearchTool findById(Integer id) {
        return academicSearchToolMapper.selectById(id);
    }
    
    @Transactional
    public int add(AcademicSearchTool academicSearchTool) {
        academicSearchTool.setCreateTime(new Date());
        academicSearchTool.setUpdateTime(new Date());
        return academicSearchToolMapper.insert(academicSearchTool);
    }
    
    @Transactional
    public int update(AcademicSearchTool academicSearchTool) {
        academicSearchTool.setUpdateTime(new Date());
        return academicSearchToolMapper.update(academicSearchTool);
    }
    
    @Transactional
    public int deleteById(Integer id) {
        return academicSearchToolMapper.deleteById(id);
    }
    
    @Transactional
    public int deleteBatch(List<Integer> ids) {
        if (ids == null || ids.isEmpty()) {
            return 0;
        }
        return academicSearchToolMapper.deleteBatch(ids);
    }
    
    public int count(String name, Boolean isFree) {
        return academicSearchToolMapper.count(name, isFree);
    }
    
    public List<AcademicSearchTool> findAllForExport() {
        return academicSearchToolMapper.selectAllForExport();
    }
} 