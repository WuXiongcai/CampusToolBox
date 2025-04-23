package com.example.service;

import com.example.entity.PptTool;
import com.example.mapper.PptToolMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Date;
import java.util.List;

@Service
public class PptToolService {
    
    @Autowired
    private PptToolMapper pptToolMapper;
    
    public List<PptTool> findList(String name, Boolean isFree, Integer pageNum, Integer pageSize) {
        Integer pageStart = (pageNum - 1) * pageSize;
        return pptToolMapper.selectList(name, isFree, pageStart, pageSize);
    }
    
    public PptTool findById(Integer id) {
        return pptToolMapper.selectById(id);
    }
    
    @Transactional
    public int add(PptTool pptTool) {
        pptTool.setCreateTime(new Date());
        pptTool.setUpdateTime(new Date());
        return pptToolMapper.insert(pptTool);
    }
    
    @Transactional
    public int update(PptTool pptTool) {
        pptTool.setUpdateTime(new Date());
        return pptToolMapper.update(pptTool);
    }
    
    @Transactional
    public int deleteById(Integer id) {
        return pptToolMapper.deleteById(id);
    }
    
    @Transactional
    public int deleteBatch(List<Integer> ids) {
        if (ids == null || ids.isEmpty()) {
            return 0;
        }
        return pptToolMapper.deleteBatch(ids);
    }
    
    public int count(String name, Boolean isFree) {
        return pptToolMapper.count(name, isFree);
    }
    
    public List<PptTool> findAllForExport() {
        return pptToolMapper.selectAllForExport();
    }
} 