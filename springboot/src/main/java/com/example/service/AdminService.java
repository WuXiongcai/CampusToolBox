package com.example.service;

import com.example.entity.Admin;
import java.util.List;
import java.util.Map;

public interface AdminService {
    Map<String, Object> selectPage(String username, Integer pageNum, Integer pageSize);
    
    Admin selectById(Integer id);
    
    /**
     * 登录
     */
    Admin login(String username, String password);
    
    void add(Admin admin);
    
    void update(Admin admin);
    
    void updatePassword(Integer id, String password);
    
    void deleteById(Integer id);
    
    void deleteBatch(List<Integer> ids);
} 