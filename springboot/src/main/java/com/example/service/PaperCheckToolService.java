package com.example.service;

import com.example.entity.PaperCheckTool;
import com.example.mapper.PaperCheckToolMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Date;
import java.util.List;

@Service
public class PaperCheckToolService {
    
    @Autowired
    private PaperCheckToolMapper paperCheckToolMapper;
    
    public List<PaperCheckTool> findList(String name, Integer pageNum, Integer pageSize) {
        Integer pageStart = (pageNum - 1) * pageSize;
        return paperCheckToolMapper.selectList(name, pageStart, pageSize);
    }
    
    public PaperCheckTool findById(Integer id) {
        return paperCheckToolMapper.selectById(id);
    }
    
    @Transactional
    public int add(PaperCheckTool paperCheckTool) {
        paperCheckTool.setCreateTime(new Date());
        paperCheckTool.setUpdateTime(new Date());
        return paperCheckToolMapper.insert(paperCheckTool);
    }
    
    @Transactional
    public int update(PaperCheckTool paperCheckTool) {
        paperCheckTool.setUpdateTime(new Date());
        return paperCheckToolMapper.update(paperCheckTool);
    }
    
    @Transactional
    public int deleteById(Integer id) {
        return paperCheckToolMapper.deleteById(id);
    }
    
    @Transactional
    public int deleteBatch(List<Integer> ids) {
        if (ids == null || ids.isEmpty()) {
            return 0;
        }
        return paperCheckToolMapper.deleteBatch(ids);
    }
    
    public int count(String name) {
        return paperCheckToolMapper.count(name);
    }
    
    public List<PaperCheckTool> findAllForExport() {
        return paperCheckToolMapper.selectAllForExport();
    }
} 