package com.example.service;

import com.example.entity.AiCodingTool;
import com.example.mapper.AiCodingToolMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Date;
import java.util.List;

@Service
public class AiCodingToolService {
    
    @Autowired
    private AiCodingToolMapper aiCodingToolMapper;
    
    public List<AiCodingTool> findList(String name, Integer pageNum, Integer pageSize) {
        System.out.println("Service findList with name: " + name + ", pageNum: " + pageNum + ", pageSize: " + pageSize);
        // 计算分页起始位置
        Integer pageStart = (pageNum - 1) * pageSize;
        List<AiCodingTool> result = aiCodingToolMapper.selectList(name, pageStart, pageSize);
        System.out.println("Found " + (result != null ? result.size() : 0) + " records");
        return result;
    }
    
    public AiCodingTool findById(Integer id) {
        return aiCodingToolMapper.selectById(id);
    }
    
    @Transactional
    public int add(AiCodingTool aiCodingTool) {
        aiCodingTool.setCreateTime(new Date());
        aiCodingTool.setUpdateTime(new Date());
        return aiCodingToolMapper.insert(aiCodingTool);
    }
    
    @Transactional
    public int update(AiCodingTool aiCodingTool) {
        aiCodingTool.setUpdateTime(new Date());
        return aiCodingToolMapper.update(aiCodingTool);
    }
    
    @Transactional
    public int deleteById(Integer id) {
        return aiCodingToolMapper.deleteById(id);
    }
    
    @Transactional
    public int deleteBatch(List<Integer> ids) {
        if (ids == null || ids.isEmpty()) {
            return 0;
        }
        return aiCodingToolMapper.deleteBatch(ids);
    }
    
    public int count(String name) {
        return aiCodingToolMapper.count(name);
    }
    
    /**
     * 获取所有数据用于导出
     */
    public List<AiCodingTool> findAllForExport() {
        return aiCodingToolMapper.selectAllForExport();
    }
} 