package com.example.mapper;

import com.example.entity.MathModelTool;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface MathModelToolMapper {
    List<MathModelTool> selectList(@Param("name") String name, 
                                  @Param("category") String category,
                                  @Param("pageStart") Integer pageStart, 
                                  @Param("pageSize") Integer pageSize);
    
    MathModelTool selectById(@Param("id") Integer id);
    
    int insert(MathModelTool mathModelTool);
    
    int update(MathModelTool mathModelTool);
    
    int deleteById(@Param("id") Integer id);
    
    int deleteBatch(List<Integer> ids);
    
    int count(@Param("name") String name, @Param("category") String category);
    
    List<MathModelTool> selectAllForExport();
} 