package com.example.service;

import com.example.entity.ChartTool;
import com.example.mapper.ChartToolMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Date;
import java.util.List;

@Service
public class ChartToolService {
    
    @Autowired
    private ChartToolMapper chartToolMapper;
    
    public List<ChartTool> findList(String name, Boolean isFree, Integer pageNum, Integer pageSize) {
        Integer pageStart = (pageNum - 1) * pageSize;
        return chartToolMapper.selectList(name, isFree, pageStart, pageSize);
    }
    
    public ChartTool findById(Integer id) {
        return chartToolMapper.selectById(id);
    }
    
    @Transactional
    public int add(ChartTool chartTool) {
        chartTool.setCreateTime(new Date());
        chartTool.setUpdateTime(new Date());
        return chartToolMapper.insert(chartTool);
    }
    
    @Transactional
    public int update(ChartTool chartTool) {
        chartTool.setUpdateTime(new Date());
        return chartToolMapper.update(chartTool);
    }
    
    @Transactional
    public int deleteById(Integer id) {
        return chartToolMapper.deleteById(id);
    }
    
    @Transactional
    public int deleteBatch(List<Integer> ids) {
        if (ids == null || ids.isEmpty()) {
            return 0;
        }
        return chartToolMapper.deleteBatch(ids);
    }
    
    public int count(String name, Boolean isFree) {
        return chartToolMapper.count(name, isFree);
    }
    
    public List<ChartTool> findAllForExport() {
        return chartToolMapper.selectAllForExport();
    }
} 