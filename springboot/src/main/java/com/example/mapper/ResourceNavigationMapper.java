package com.example.mapper;

import com.example.entity.ResourceNavigation;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface ResourceNavigationMapper {
    List<ResourceNavigation> selectList(@Param("name") String name, 
                                      @Param("pageStart") Integer pageStart, 
                                      @Param("pageSize") Integer pageSize);
    
    ResourceNavigation selectById(@Param("id") Integer id);
    
    int insert(ResourceNavigation resourceNavigation);
    
    int update(ResourceNavigation resourceNavigation);
    
    int deleteById(@Param("id") Integer id);
    
    int deleteBatch(List<Integer> ids);
    
    int count(@Param("name") String name);
    
    List<ResourceNavigation> selectAllForExport();
} 