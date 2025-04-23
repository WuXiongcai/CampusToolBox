package com.example.service;

import com.example.entity.ImageDrawing;
import com.example.mapper.ImageDrawingMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Date;
import java.util.List;

@Service
public class ImageDrawingService {
    
    @Autowired
    private ImageDrawingMapper imageDrawingMapper;
    
    public List<ImageDrawing> findList(String name, Boolean isFree, Integer pageNum, Integer pageSize) {
        Integer pageStart = (pageNum - 1) * pageSize;
        return imageDrawingMapper.selectList(name, isFree, pageStart, pageSize);
    }
    
    public ImageDrawing findById(Integer id) {
        return imageDrawingMapper.selectById(id);
    }
    
    @Transactional
    public int add(ImageDrawing imageDrawing) {
        imageDrawing.setCreateTime(new Date());
        imageDrawing.setUpdateTime(new Date());
        return imageDrawingMapper.insert(imageDrawing);
    }
    
    @Transactional
    public int update(ImageDrawing imageDrawing) {
        imageDrawing.setUpdateTime(new Date());
        return imageDrawingMapper.update(imageDrawing);
    }
    
    @Transactional
    public int deleteById(Integer id) {
        return imageDrawingMapper.deleteById(id);
    }
    
    @Transactional
    public int deleteBatch(List<Integer> ids) {
        if (ids == null || ids.isEmpty()) {
            return 0;
        }
        return imageDrawingMapper.deleteBatch(ids);
    }
    
    public int count(String name, Boolean isFree) {
        return imageDrawingMapper.count(name, isFree);
    }
    
    public List<ImageDrawing> findAllForExport() {
        return imageDrawingMapper.selectAllForExport();
    }
} 