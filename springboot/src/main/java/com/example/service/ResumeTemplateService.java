package com.example.service;

import com.example.entity.ResumeTemplate;
import com.example.mapper.ResumeTemplateMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Date;
import java.util.List;

@Service
public class ResumeTemplateService {
    
    @Autowired
    private ResumeTemplateMapper resumeTemplateMapper;
    
    public List<ResumeTemplate> findList(String name, Boolean isFree, Integer pageNum, Integer pageSize) {
        Integer pageStart = (pageNum - 1) * pageSize;
        return resumeTemplateMapper.selectList(name, isFree, pageStart, pageSize);
    }
    
    public ResumeTemplate findById(Integer id) {
        return resumeTemplateMapper.selectById(id);
    }
    
    @Transactional
    public int add(ResumeTemplate resumeTemplate) {
        resumeTemplate.setCreateTime(new Date());
        resumeTemplate.setUpdateTime(new Date());
        return resumeTemplateMapper.insert(resumeTemplate);
    }
    
    @Transactional
    public int update(ResumeTemplate resumeTemplate) {
        resumeTemplate.setUpdateTime(new Date());
        return resumeTemplateMapper.update(resumeTemplate);
    }
    
    @Transactional
    public int deleteById(Integer id) {
        return resumeTemplateMapper.deleteById(id);
    }
    
    @Transactional
    public int deleteBatch(List<Integer> ids) {
        if (ids == null || ids.isEmpty()) {
            return 0;
        }
        return resumeTemplateMapper.deleteBatch(ids);
    }
    
    public int count(String name, Boolean isFree) {
        return resumeTemplateMapper.count(name, isFree);
    }
    
    public List<ResumeTemplate> findAllForExport() {
        return resumeTemplateMapper.selectAllForExport();
    }
} 