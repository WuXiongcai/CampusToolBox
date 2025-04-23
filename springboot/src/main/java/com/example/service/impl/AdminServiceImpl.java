package com.example.service.impl;

import com.example.entity.Admin;
import com.example.mapper.AdminMapper;
import com.example.service.AdminService;
import com.github.pagehelper.PageHelper;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.DigestUtils;

import javax.annotation.Resource;
import java.nio.charset.StandardCharsets;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class AdminServiceImpl implements AdminService {
    
    @Resource
    private AdminMapper adminMapper;

    @Override
    public Map<String, Object> selectPage(String username, Integer pageNum, Integer pageSize) {
        PageHelper.startPage(pageNum, pageSize);
        List<Admin> list = adminMapper.selectList(username);
        Integer total = adminMapper.count(username);
        Map<String, Object> result = new HashMap<>();
        result.put("list", list);
        result.put("total", total);
        return result;
    }

    @Override
    public Admin selectById(Integer id) {
        return adminMapper.selectById(id);
    }

    @Override
    public Admin login(String username, String password) {
        Admin admin = adminMapper.selectByUsername(username);
        if (admin != null) {
            // 对输入的密码进行MD5加密
            String encryptedPassword = DigestUtils.md5DigestAsHex(password.getBytes(StandardCharsets.UTF_8));
            // 比较密码
            if (encryptedPassword.equals(admin.getPassword())) {
                // 更新最后登录时间
                adminMapper.updateLastLoginTime(admin.getId());
                return admin;
            }
        }
        return null;
    }

    @Override
    @Transactional
    public void add(Admin admin) {
        // 检查用户名是否已存在
        Admin existingAdmin = adminMapper.selectByUsername(admin.getUsername());
        if (existingAdmin != null) {
            throw new RuntimeException("用户名已存在");
        }
        adminMapper.insert(admin);
    }

    @Override
    @Transactional
    public void update(Admin admin) {
        adminMapper.update(admin);
    }

    @Override
    @Transactional
    public void updatePassword(Integer id, String password) {
        String encryptedPassword = DigestUtils.md5DigestAsHex(password.getBytes(StandardCharsets.UTF_8));
        adminMapper.updatePassword(id, encryptedPassword);
    }

    @Override
    @Transactional
    public void deleteById(Integer id) {
        adminMapper.deleteById(id);
    }

    @Override
    @Transactional
    public void deleteBatch(List<Integer> ids) {
        adminMapper.deleteBatch(ids);
    }
} 