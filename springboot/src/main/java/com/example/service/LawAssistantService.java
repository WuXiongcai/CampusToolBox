package com.example.service;

import com.example.entity.LawAssistant;
import com.example.mapper.LawAssistantMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Date;
import java.util.List;

@Service
public class LawAssistantService {
    
    @Autowired
    private LawAssistantMapper lawAssistantMapper;
    
    public List<LawAssistant> findList(String name, Boolean isFree, Integer pageNum, Integer pageSize) {
        Integer pageStart = (pageNum - 1) * pageSize;
        return lawAssistantMapper.selectList(name, isFree, pageStart, pageSize);
    }
    
    public LawAssistant findById(Integer id) {
        return lawAssistantMapper.selectById(id);
    }
    
    @Transactional
    public int add(LawAssistant lawAssistant) {
        lawAssistant.setCreateTime(new Date());
        lawAssistant.setUpdateTime(new Date());
        return lawAssistantMapper.insert(lawAssistant);
    }
    
    @Transactional
    public int update(LawAssistant lawAssistant) {
        lawAssistant.setUpdateTime(new Date());
        return lawAssistantMapper.update(lawAssistant);
    }
    
    @Transactional
    public int deleteById(Integer id) {
        return lawAssistantMapper.deleteById(id);
    }
    
    @Transactional
    public int deleteBatch(List<Integer> ids) {
        if (ids == null || ids.isEmpty()) {
            return 0;
        }
        return lawAssistantMapper.deleteBatch(ids);
    }
    
    public int count(String name, Boolean isFree) {
        return lawAssistantMapper.count(name, isFree);
    }
    
    public List<LawAssistant> findAllForExport() {
        return lawAssistantMapper.selectAllForExport();
    }
} 