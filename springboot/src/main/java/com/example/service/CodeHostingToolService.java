package com.example.service;

import com.example.entity.CodeHostingTool;
import com.example.mapper.CodeHostingToolMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Date;
import java.util.List;

@Service
public class CodeHostingToolService {
    
    @Autowired
    private CodeHostingToolMapper codeHostingToolMapper;
    
    public List<CodeHostingTool> findList(String name, Integer pageNum, Integer pageSize) {
        Integer pageStart = (pageNum - 1) * pageSize;
        return codeHostingToolMapper.selectList(name, pageStart, pageSize);
    }
    
    public CodeHostingTool findById(Integer id) {
        return codeHostingToolMapper.selectById(id);
    }
    
    @Transactional
    public int add(CodeHostingTool codeHostingTool) {
        codeHostingTool.setCreateTime(new Date());
        codeHostingTool.setUpdateTime(new Date());
        return codeHostingToolMapper.insert(codeHostingTool);
    }
    
    @Transactional
    public int update(CodeHostingTool codeHostingTool) {
        codeHostingTool.setUpdateTime(new Date());
        return codeHostingToolMapper.update(codeHostingTool);
    }
    
    @Transactional
    public int deleteById(Integer id) {
        return codeHostingToolMapper.deleteById(id);
    }
    
    @Transactional
    public int deleteBatch(List<Integer> ids) {
        if (ids == null || ids.isEmpty()) {
            return 0;
        }
        return codeHostingToolMapper.deleteBatch(ids);
    }
    
    public int count(String name) {
        return codeHostingToolMapper.count(name);
    }
    
    public List<CodeHostingTool> findAllForExport() {
        return codeHostingToolMapper.selectAllForExport();
    }
} 