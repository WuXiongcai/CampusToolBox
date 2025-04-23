package com.example.mapper;

import com.example.entity.CommonTool;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface CommonToolMapper {
    List<CommonTool> selectList(@Param("name") String name, 
                               @Param("pageStart") Integer pageStart, 
                               @Param("pageSize") Integer pageSize);
    
    CommonTool selectById(@Param("id") Integer id);
    
    int insert(CommonTool commonTool);
    
    int update(CommonTool commonTool);
    
    int deleteById(@Param("id") Integer id);
    
    int deleteBatch(List<Integer> ids);
    
    int count(@Param("name") String name);
    
    List<CommonTool> selectAllForExport();
} 