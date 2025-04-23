package com.example.service;

import com.example.entity.FontIcon;
import com.example.mapper.FontIconMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Date;
import java.util.List;

@Service
public class FontIconService {
    
    @Autowired
    private FontIconMapper fontIconMapper;
    
    public List<FontIcon> findList(String name, Boolean isFree, Integer pageNum, Integer pageSize) {
        Integer pageStart = (pageNum - 1) * pageSize;
        return fontIconMapper.selectList(name, isFree, pageStart, pageSize);
    }
    
    public FontIcon findById(Integer id) {
        return fontIconMapper.selectById(id);
    }
    
    @Transactional
    public int add(FontIcon fontIcon) {
        fontIcon.setCreateTime(new Date());
        fontIcon.setUpdateTime(new Date());
        return fontIconMapper.insert(fontIcon);
    }
    
    @Transactional
    public int update(FontIcon fontIcon) {
        fontIcon.setUpdateTime(new Date());
        return fontIconMapper.update(fontIcon);
    }
    
    @Transactional
    public int deleteById(Integer id) {
        return fontIconMapper.deleteById(id);
    }
    
    @Transactional
    public int deleteBatch(List<Integer> ids) {
        if (ids == null || ids.isEmpty()) {
            return 0;
        }
        return fontIconMapper.deleteBatch(ids);
    }
    
    public int count(String name, Boolean isFree) {
        return fontIconMapper.count(name, isFree);
    }
    
    public List<FontIcon> findAllForExport() {
        return fontIconMapper.selectAllForExport();
    }
} 