package com.example.service;

import com.example.entity.DataAnalysis;
import com.example.mapper.DataAnalysisMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Date;
import java.util.List;

@Service
public class DataAnalysisService {
    
    @Autowired
    private DataAnalysisMapper dataAnalysisMapper;
    
    public List<DataAnalysis> findList(String name, Boolean isFree, Integer pageNum, Integer pageSize) {
        Integer pageStart = (pageNum - 1) * pageSize;
        return dataAnalysisMapper.selectList(name, isFree, pageStart, pageSize);
    }
    
    public DataAnalysis findById(Integer id) {
        return dataAnalysisMapper.selectById(id);
    }
    
    @Transactional
    public int add(DataAnalysis dataAnalysis) {
        dataAnalysis.setCreateTime(new Date());
        dataAnalysis.setUpdateTime(new Date());
        return dataAnalysisMapper.insert(dataAnalysis);
    }
    
    @Transactional
    public int update(DataAnalysis dataAnalysis) {
        dataAnalysis.setUpdateTime(new Date());
        return dataAnalysisMapper.update(dataAnalysis);
    }
    
    @Transactional
    public int deleteById(Integer id) {
        return dataAnalysisMapper.deleteById(id);
    }
    
    @Transactional
    public int deleteBatch(List<Integer> ids) {
        if (ids == null || ids.isEmpty()) {
            return 0;
        }
        return dataAnalysisMapper.deleteBatch(ids);
    }
    
    public int count(String name, Boolean isFree) {
        return dataAnalysisMapper.count(name, isFree);
    }
    
    public List<DataAnalysis> findAllForExport() {
        return dataAnalysisMapper.selectAllForExport();
    }
} 