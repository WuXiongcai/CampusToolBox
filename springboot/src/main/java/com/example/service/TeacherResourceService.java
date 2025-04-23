package com.example.service;

import com.example.entity.TeacherResource;
import com.example.mapper.TeacherResourceMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Date;
import java.util.List;

@Service
public class TeacherResourceService {
    
    @Autowired
    private TeacherResourceMapper teacherResourceMapper;
    
    public List<TeacherResource> findList(String name, Boolean isFree, Integer pageNum, Integer pageSize) {
        Integer pageStart = (pageNum - 1) * pageSize;
        return teacherResourceMapper.selectList(name, isFree, pageStart, pageSize);
    }
    
    public TeacherResource findById(Integer id) {
        return teacherResourceMapper.selectById(id);
    }
    
    @Transactional
    public int add(TeacherResource teacherResource) {
        teacherResource.setCreateTime(new Date());
        teacherResource.setUpdateTime(new Date());
        return teacherResourceMapper.insert(teacherResource);
    }
    
    @Transactional
    public int update(TeacherResource teacherResource) {
        teacherResource.setUpdateTime(new Date());
        return teacherResourceMapper.update(teacherResource);
    }
    
    @Transactional
    public int deleteById(Integer id) {
        return teacherResourceMapper.deleteById(id);
    }
    
    @Transactional
    public int deleteBatch(List<Integer> ids) {
        if (ids == null || ids.isEmpty()) {
            return 0;
        }
        return teacherResourceMapper.deleteBatch(ids);
    }
    
    public int count(String name, Boolean isFree) {
        return teacherResourceMapper.count(name, isFree);
    }
    
    public List<TeacherResource> findAllForExport() {
        return teacherResourceMapper.selectAllForExport();
    }
} 