package com.example.service;

import com.example.entity.AiMindmapTool;
import com.example.mapper.AiMindmapToolMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Date;
import java.util.List;

@Service
public class AiMindmapToolService {
    
    @Autowired
    private AiMindmapToolMapper aiMindmapToolMapper;
    
    public List<AiMindmapTool> findList(String name, Integer pageNum, Integer pageSize) {
        // 计算分页起始位置
        Integer pageStart = (pageNum - 1) * pageSize;
        return aiMindmapToolMapper.selectList(name, pageStart, pageSize);
    }
    
    public AiMindmapTool findById(Integer id) {
        return aiMindmapToolMapper.selectById(id);
    }
    
    @Transactional
    public int add(AiMindmapTool aiMindmapTool) {
        aiMindmapTool.setCreateTime(new Date());
        aiMindmapTool.setUpdateTime(new Date());
        return aiMindmapToolMapper.insert(aiMindmapTool);
    }
    
    @Transactional
    public int update(AiMindmapTool aiMindmapTool) {
        aiMindmapTool.setUpdateTime(new Date());
        return aiMindmapToolMapper.update(aiMindmapTool);
    }
    
    @Transactional
    public int deleteById(Integer id) {
        return aiMindmapToolMapper.deleteById(id);
    }
    
    @Transactional
    public int deleteBatch(List<Integer> ids) {
        if (ids == null || ids.isEmpty()) {
            return 0;
        }
        return aiMindmapToolMapper.deleteBatch(ids);
    }
    
    public int count(String name) {
        return aiMindmapToolMapper.count(name);
    }
    
    public List<AiMindmapTool> findAllForExport() {
        return aiMindmapToolMapper.selectAllForExport();
    }
} 