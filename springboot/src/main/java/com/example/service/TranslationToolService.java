package com.example.service;

import com.example.entity.TranslationTool;
import com.example.mapper.TranslationToolMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Date;
import java.util.List;

@Service
public class TranslationToolService {
    
    @Autowired
    private TranslationToolMapper translationToolMapper;
    
    public List<TranslationTool> findList(String name, Boolean isFree, Integer pageNum, Integer pageSize) {
        Integer pageStart = (pageNum - 1) * pageSize;
        return translationToolMapper.selectList(name, isFree, pageStart, pageSize);
    }
    
    public TranslationTool findById(Integer id) {
        return translationToolMapper.selectById(id);
    }
    
    @Transactional
    public int add(TranslationTool translationTool) {
        translationTool.setCreateTime(new Date());
        translationTool.setUpdateTime(new Date());
        return translationToolMapper.insert(translationTool);
    }
    
    @Transactional
    public int update(TranslationTool translationTool) {
        translationTool.setUpdateTime(new Date());
        return translationToolMapper.update(translationTool);
    }
    
    @Transactional
    public int deleteById(Integer id) {
        return translationToolMapper.deleteById(id);
    }
    
    @Transactional
    public int deleteBatch(List<Integer> ids) {
        if (ids == null || ids.isEmpty()) {
            return 0;
        }
        return translationToolMapper.deleteBatch(ids);
    }
    
    public int count(String name, Boolean isFree) {
        return translationToolMapper.count(name, isFree);
    }
    
    public List<TranslationTool> findAllForExport() {
        return translationToolMapper.selectAllForExport();
    }
} 