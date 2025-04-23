package com.example.service;

import com.example.entity.AudioTool;
import com.example.mapper.AudioToolMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Date;
import java.util.List;

@Service
public class AudioToolService {
    
    @Autowired
    private AudioToolMapper audioToolMapper;
    
    public List<AudioTool> findList(String name, Boolean isFree, Integer pageNum, Integer pageSize) {
        Integer pageStart = (pageNum - 1) * pageSize;
        return audioToolMapper.selectList(name, isFree, pageStart, pageSize);
    }
    
    public AudioTool findById(Integer id) {
        return audioToolMapper.selectById(id);
    }
    
    @Transactional
    public int add(AudioTool audioTool) {
        audioTool.setCreateTime(new Date());
        audioTool.setUpdateTime(new Date());
        return audioToolMapper.insert(audioTool);
    }
    
    @Transactional
    public int update(AudioTool audioTool) {
        audioTool.setUpdateTime(new Date());
        return audioToolMapper.update(audioTool);
    }
    
    @Transactional
    public int deleteById(Integer id) {
        return audioToolMapper.deleteById(id);
    }
    
    @Transactional
    public int deleteBatch(List<Integer> ids) {
        if (ids == null || ids.isEmpty()) {
            return 0;
        }
        return audioToolMapper.deleteBatch(ids);
    }
    
    public int count(String name, Boolean isFree) {
        return audioToolMapper.count(name, isFree);
    }
    
    public List<AudioTool> findAllForExport() {
        return audioToolMapper.selectAllForExport();
    }
} 