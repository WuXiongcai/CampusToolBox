package com.example.mapper;

import com.example.entity.Admin;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import java.util.List;
import java.util.Date;

@Mapper
public interface AdminMapper {
    List<Admin> selectList(@Param("username") String username);
    
    int count(@Param("username") String username);
    
    Admin selectById(@Param("id") Integer id);
    
    /**
     * 根据用户名查询管理员
     */
    Admin selectByUsername(@Param("username") String username);
    
    int insert(Admin admin);
    
    int update(Admin admin);
    
    int updatePassword(@Param("id") Integer id, @Param("password") String password);
    
    /**
     * 更新最后登录时间
     */
    int updateLastLoginTime(@Param("id") Integer id);
    
    int deleteById(@Param("id") Integer id);
    
    int deleteBatch(@Param("ids") List<Integer> ids);
} 