package com.example.service;

import com.example.entity.CommunitySite;
import com.example.mapper.CommunitySiteMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Date;
import java.util.List;

@Service
public class CommunitySiteService {
    
    @Autowired
    private CommunitySiteMapper communitySiteMapper;
    
    public List<CommunitySite> findList(String name, String category, Integer pageNum, Integer pageSize) {
        Integer pageStart = (pageNum - 1) * pageSize;
        return communitySiteMapper.selectList(name, category, pageStart, pageSize);
    }
    
    public CommunitySite findById(Integer id) {
        return communitySiteMapper.selectById(id);
    }
    
    @Transactional
    public int add(CommunitySite communitySite) {
        communitySite.setCreateTime(new Date());
        communitySite.setUpdateTime(new Date());
        return communitySiteMapper.insert(communitySite);
    }
    
    @Transactional
    public int update(CommunitySite communitySite) {
        communitySite.setUpdateTime(new Date());
        return communitySiteMapper.update(communitySite);
    }
    
    @Transactional
    public int deleteById(Integer id) {
        return communitySiteMapper.deleteById(id);
    }
    
    @Transactional
    public int deleteBatch(List<Integer> ids) {
        if (ids == null || ids.isEmpty()) {
            return 0;
        }
        return communitySiteMapper.deleteBatch(ids);
    }
    
    public int count(String name, String category) {
        return communitySiteMapper.count(name, category);
    }
    
    public List<CommunitySite> findAllForExport() {
        return communitySiteMapper.selectAllForExport();
    }
} 