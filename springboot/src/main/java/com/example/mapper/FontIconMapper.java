package com.example.mapper;

import com.example.entity.FontIcon;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface FontIconMapper {
    List<FontIcon> selectList(@Param("name") String name, 
                             @Param("isFree") Boolean isFree,
                             @Param("pageStart") Integer pageStart, 
                             @Param("pageSize") Integer pageSize);
    
    FontIcon selectById(@Param("id") Integer id);
    
    int insert(FontIcon fontIcon);
    
    int update(FontIcon fontIcon);
    
    int deleteById(@Param("id") Integer id);
    
    int deleteBatch(List<Integer> ids);
    
    int count(@Param("name") String name, @Param("isFree") Boolean isFree);
    
    List<FontIcon> selectAllForExport();
} 