package com.example.controller;

import com.example.common.Result;
import com.example.entity.Admin;
import com.example.service.AdminService;
import org.springframework.util.DigestUtils;
import org.springframework.web.bind.annotation.*;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import javax.annotation.Resource;
import java.nio.charset.StandardCharsets;
import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("/api/admin")
public class AdminController {
    
    private static final Logger log = LoggerFactory.getLogger(AdminController.class);
    
    @Resource
    private AdminService adminService;
    
    @PostMapping("/login")
    public Result<Admin> login(@RequestParam String username, @RequestParam String password) {
        try {
            Admin admin = adminService.login(username, password);
            if (admin != null) {
                return Result.success(admin);
            }
            return Result.error("用户名或密码错误");
        } catch (Exception e) {
            return Result.error("登录失败：" + e.getMessage());
        }
    }
    
    @GetMapping("/page")
    public Result<?> findPage(@RequestParam(defaultValue = "") String username,
                             @RequestParam(defaultValue = "1") Integer pageNum,
                             @RequestParam(defaultValue = "10") Integer pageSize) {
        try {
            return Result.success(adminService.selectPage(username, pageNum, pageSize));
        } catch (Exception e) {
            return Result.error("查询失败：" + e.getMessage());
        }
    }
    
    @GetMapping("/{id}")
    public Result<?> findById(@PathVariable Integer id) {
        try {
            return Result.success(adminService.selectById(id));
        } catch (Exception e) {
            return Result.error("查询失败：" + e.getMessage());
        }
    }
    
    @PostMapping
    public Result<?> add(@RequestBody Admin admin) {
        try {
            // 对密码进行MD5加密
            admin.setPassword(DigestUtils.md5DigestAsHex(admin.getPassword().getBytes(StandardCharsets.UTF_8)));
            adminService.add(admin);
            return Result.success();
        } catch (Exception e) {
            return Result.error("新增失败：" + e.getMessage());
        }
    }
    
    @PutMapping
    public Result<?> update(@RequestBody Admin admin) {
        try {
            if (admin.getPassword() != null && !admin.getPassword().isEmpty()) {
                // 如果修改了密码，需要加密
                admin.setPassword(DigestUtils.md5DigestAsHex(admin.getPassword().getBytes(StandardCharsets.UTF_8)));
            }
            adminService.update(admin);
            return Result.success();
        } catch (Exception e) {
            return Result.error("修改失败：" + e.getMessage());
        }
    }
    
    @PutMapping("/password")
    public Result<?> resetPassword(@RequestParam Integer id, @RequestParam String password) {
        try {
            adminService.updatePassword(id, password);
            return Result.success();
        } catch (Exception e) {
            return Result.error("重置密码失败：" + e.getMessage());
        }
    }
    
    @DeleteMapping("/{id}")
    public Result<?> delete(@PathVariable Integer id) {
        try {
            adminService.deleteById(id);
            return Result.success();
        } catch (Exception e) {
            return Result.error("删除失败：" + e.getMessage());
        }
    }
    
    @DeleteMapping("/batch")
    public Result<?> deleteBatch(@RequestBody List<Integer> ids) {
        try {
            adminService.deleteBatch(ids);
            return Result.success();
        } catch (Exception e) {
            return Result.error("批量删除失败：" + e.getMessage());
        }
    }

    @PostMapping("/batch/delete")
    public Result<?> batchDelete(@RequestBody List<Integer> ids) {
        try {
            adminService.deleteBatch(ids);
            return Result.success();
        } catch (Exception e) {
            return Result.error("批量删除失败：" + e.getMessage());
        }
    }

    /**
     * 更新管理员信息
     */
    @PostMapping("/info/update")
    public Result<?> updateInfo(@RequestBody Admin admin) {
        try {
            Admin existingAdmin = adminService.selectById(admin.getId());
            if (existingAdmin == null) {
                return Result.error("管理员不存在");
            }
            existingAdmin.setEmail(admin.getEmail());
            adminService.update(existingAdmin);
            return Result.success();
        } catch (Exception e) {
            log.error("更新管理员信息失败", e);
            return Result.error("更新失败");
        }
    }

    /**
     * 更新管理员头像
     */
    @PostMapping("/avatar/update")
    public Result<?> updateAvatar(@RequestBody Map<String, Object> params) {
        try {
            Integer id = (Integer) params.get("id");
            String avatar = (String) params.get("avatar");
            
            Admin existingAdmin = adminService.selectById(id);
            if (existingAdmin == null) {
                return Result.error("管理员不存在");
            }
            
            // 这里可以添加保存头像到文件系统的逻辑
            existingAdmin.setAvatar(avatar);
            adminService.update(existingAdmin);
            return Result.success();
        } catch (Exception e) {
            log.error("更新头像失败", e);
            return Result.error("更新失败");
        }
    }

    /**
     * 修改密码
     */
    @PostMapping("/password/update")
    public Result<?> updatePassword(@RequestBody Map<String, Object> params) {
        try {
            Integer id = (Integer) params.get("id");
            String oldPassword = (String) params.get("oldPassword");
            String newPassword = (String) params.get("newPassword");
            
            Admin existingAdmin = adminService.selectById(id);
            if (existingAdmin == null) {
                return Result.error("管理员不存在");
            }
            
            // 验证旧密码
            String encryptedOldPassword = DigestUtils.md5DigestAsHex(oldPassword.getBytes(StandardCharsets.UTF_8));
            if (!existingAdmin.getPassword().equals(encryptedOldPassword)) {
                return Result.error("旧密码错误");
            }
            
            // 加密新密码
            String encryptedNewPassword = DigestUtils.md5DigestAsHex(newPassword.getBytes(StandardCharsets.UTF_8));
            existingAdmin.setPassword(encryptedNewPassword);
            adminService.update(existingAdmin);
            return Result.success();
        } catch (Exception e) {
            log.error("修改密码失败", e);
            return Result.error("修改失败");
        }
    }
} 