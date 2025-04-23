package com.example.service;

import com.example.entity.CodingPractice;
import com.example.mapper.CodingPracticeMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Date;
import java.util.List;

@Service
public class CodingPracticeService {
    
    @Autowired
    private CodingPracticeMapper codingPracticeMapper;
    
    public List<CodingPractice> findList(String name, Boolean isFree, Integer pageNum, Integer pageSize) {
        Integer pageStart = (pageNum - 1) * pageSize;
        return codingPracticeMapper.selectList(name, isFree, pageStart, pageSize);
    }
    
    public CodingPractice findById(Integer id) {
        return codingPracticeMapper.selectById(id);
    }
    
    @Transactional
    public int add(CodingPractice codingPractice) {
        codingPractice.setCreateTime(new Date());
        codingPractice.setUpdateTime(new Date());
        return codingPracticeMapper.insert(codingPractice);
    }
    
    @Transactional
    public int update(CodingPractice codingPractice) {
        codingPractice.setUpdateTime(new Date());
        return codingPracticeMapper.update(codingPractice);
    }
    
    @Transactional
    public int deleteById(Integer id) {
        return codingPracticeMapper.deleteById(id);
    }
    
    @Transactional
    public int deleteBatch(List<Integer> ids) {
        if (ids == null || ids.isEmpty()) {
            return 0;
        }
        return codingPracticeMapper.deleteBatch(ids);
    }
    
    public int count(String name, Boolean isFree) {
        return codingPracticeMapper.count(name, isFree);
    }
    
    public List<CodingPractice> findAllForExport() {
        return codingPracticeMapper.selectAllForExport();
    }
} 