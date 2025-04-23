package com.example.service;

import com.example.entity.ResourceNavigation;
import com.example.mapper.ResourceNavigationMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Date;
import java.util.List;

@Service
public class ResourceNavigationService {
    
    @Autowired
    private ResourceNavigationMapper resourceNavigationMapper;
    
    public List<ResourceNavigation> findList(String name, Integer pageNum, Integer pageSize) {
        Integer pageStart = (pageNum - 1) * pageSize;
        return resourceNavigationMapper.selectList(name, pageStart, pageSize);
    }
    
    public ResourceNavigation findById(Integer id) {
        return resourceNavigationMapper.selectById(id);
    }
    
    @Transactional
    public int add(ResourceNavigation resourceNavigation) {
        resourceNavigation.setCreateTime(new Date());
        resourceNavigation.setUpdateTime(new Date());
        return resourceNavigationMapper.insert(resourceNavigation);
    }
    
    @Transactional
    public int update(ResourceNavigation resourceNavigation) {
        resourceNavigation.setUpdateTime(new Date());
        return resourceNavigationMapper.update(resourceNavigation);
    }
    
    @Transactional
    public int deleteById(Integer id) {
        return resourceNavigationMapper.deleteById(id);
    }
    
    @Transactional
    public int deleteBatch(List<Integer> ids) {
        if (ids == null || ids.isEmpty()) {
            return 0;
        }
        return resourceNavigationMapper.deleteBatch(ids);
    }
    
    public int count(String name) {
        return resourceNavigationMapper.count(name);
    }
    
    public List<ResourceNavigation> findAllForExport() {
        return resourceNavigationMapper.selectAllForExport();
    }
} 