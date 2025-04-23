package com.example.service;

import com.example.entity.ReadingSummary;
import com.example.mapper.ReadingSummaryMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Date;
import java.util.List;

@Service
public class ReadingSummaryService {
    
    @Autowired
    private ReadingSummaryMapper readingSummaryMapper;
    
    public List<ReadingSummary> findList(String name, Boolean isFree, Integer pageNum, Integer pageSize) {
        Integer pageStart = (pageNum - 1) * pageSize;
        return readingSummaryMapper.selectList(name, isFree, pageStart, pageSize);
    }
    
    public ReadingSummary findById(Integer id) {
        return readingSummaryMapper.selectById(id);
    }
    
    @Transactional
    public int add(ReadingSummary readingSummary) {
        readingSummary.setCreateTime(new Date());
        readingSummary.setUpdateTime(new Date());
        return readingSummaryMapper.insert(readingSummary);
    }
    
    @Transactional
    public int update(ReadingSummary readingSummary) {
        readingSummary.setUpdateTime(new Date());
        return readingSummaryMapper.update(readingSummary);
    }
    
    @Transactional
    public int deleteById(Integer id) {
        return readingSummaryMapper.deleteById(id);
    }
    
    @Transactional
    public int deleteBatch(List<Integer> ids) {
        if (ids == null || ids.isEmpty()) {
            return 0;
        }
        return readingSummaryMapper.deleteBatch(ids);
    }
    
    public int count(String name, Boolean isFree) {
        return readingSummaryMapper.count(name, isFree);
    }
    
    public List<ReadingSummary> findAllForExport() {
        return readingSummaryMapper.selectAllForExport();
    }
} 