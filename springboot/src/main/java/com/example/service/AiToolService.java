package com.example.service;

import com.example.entity.AiTool;
import com.example.mapper.AiToolMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Date;
import java.util.List;

@Service
public class AiToolService {
    
    @Autowired
    private AiToolMapper aiToolMapper;
    
    public List<AiTool> findList(String title, Integer pageNum, Integer pageSize) {
        System.out.println("Service findList with title: " + title + ", pageNum: " + pageNum + ", pageSize: " + pageSize);
        // 计算分页起始位置
        Integer pageStart = (pageNum - 1) * pageSize;
        List<AiTool> result = aiToolMapper.selectList(title, pageStart, pageSize);
        System.out.println("Found " + (result != null ? result.size() : 0) + " records");
        return result;
    }
    
    public AiTool findById(Integer id) {
        return aiToolMapper.selectById(id);
    }
    
    @Transactional
    public int add(AiTool aiTool) {
        aiTool.setCreateTime(new Date());
        aiTool.setUpdateTime(new Date());
        return aiToolMapper.insert(aiTool);
    }
    
    @Transactional
    public int update(AiTool aiTool) {
        aiTool.setUpdateTime(new Date());
        return aiToolMapper.update(aiTool);
    }
    
    @Transactional
    public int deleteById(Integer id) {
        return aiToolMapper.deleteById(id);
    }
    
    @Transactional
    public int deleteBatch(List<Integer> ids) {
        if (ids == null || ids.isEmpty()) {
            return 0;
        }
        return aiToolMapper.deleteBatch(ids);
    }
    
    public int count(String title) {
        return aiToolMapper.count(title);
    }
    
    /**
     * 获取所有数据用于导出
     */
    public List<AiTool> findAllForExport() {
        return aiToolMapper.selectAllForExport();
    }
} 