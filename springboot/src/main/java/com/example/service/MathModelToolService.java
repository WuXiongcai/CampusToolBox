package com.example.service;

import com.example.entity.MathModelTool;
import com.example.mapper.MathModelToolMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Date;
import java.util.List;

@Service
public class MathModelToolService {
    
    @Autowired
    private MathModelToolMapper mathModelToolMapper;
    
    public List<MathModelTool> findList(String name, String category, Integer pageNum, Integer pageSize) {
        Integer pageStart = (pageNum - 1) * pageSize;
        return mathModelToolMapper.selectList(name, category, pageStart, pageSize);
    }
    
    public MathModelTool findById(Integer id) {
        return mathModelToolMapper.selectById(id);
    }
    
    @Transactional
    public int add(MathModelTool mathModelTool) {
        mathModelTool.setCreateTime(new Date());
        mathModelTool.setUpdateTime(new Date());
        return mathModelToolMapper.insert(mathModelTool);
    }
    
    @Transactional
    public int update(MathModelTool mathModelTool) {
        mathModelTool.setUpdateTime(new Date());
        return mathModelToolMapper.update(mathModelTool);
    }
    
    @Transactional
    public int deleteById(Integer id) {
        return mathModelToolMapper.deleteById(id);
    }
    
    @Transactional
    public int deleteBatch(List<Integer> ids) {
        if (ids == null || ids.isEmpty()) {
            return 0;
        }
        return mathModelToolMapper.deleteBatch(ids);
    }
    
    public int count(String name, String category) {
        return mathModelToolMapper.count(name, category);
    }
    
    public List<MathModelTool> findAllForExport() {
        return mathModelToolMapper.selectAllForExport();
    }
} 