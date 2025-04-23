package com.example.service;

import com.example.entity.CommonTool;
import com.example.mapper.CommonToolMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Date;
import java.util.List;

@Service
public class CommonToolService {
    
    @Autowired
    private CommonToolMapper commonToolMapper;
    
    public List<CommonTool> findList(String name, Integer pageNum, Integer pageSize) {
        System.out.println("Service findList with name: " + name + ", pageNum: " + pageNum + ", pageSize: " + pageSize);
        // 计算分页起始位置
        Integer pageStart = (pageNum - 1) * pageSize;
        List<CommonTool> result = commonToolMapper.selectList(name, pageStart, pageSize);
        System.out.println("Found " + (result != null ? result.size() : 0) + " records");
        return result;
    }
    
    public CommonTool findById(Integer id) {
        return commonToolMapper.selectById(id);
    }
    
    @Transactional
    public int add(CommonTool commonTool) {
        commonTool.setCreateTime(new Date());
        commonTool.setUpdateTime(new Date());
        return commonToolMapper.insert(commonTool);
    }
    
    @Transactional
    public int update(CommonTool commonTool) {
        commonTool.setUpdateTime(new Date());
        return commonToolMapper.update(commonTool);
    }
    
    @Transactional
    public int deleteById(Integer id) {
        return commonToolMapper.deleteById(id);
    }
    
    @Transactional
    public int deleteBatch(List<Integer> ids) {
        if (ids == null || ids.isEmpty()) {
            return 0;
        }
        return commonToolMapper.deleteBatch(ids);
    }
    
    public int count(String name) {
        return commonToolMapper.count(name);
    }
    
    /**
     * 获取所有数据用于导出
     */
    public List<CommonTool> findAllForExport() {
        return commonToolMapper.selectAllForExport();
    }
} 