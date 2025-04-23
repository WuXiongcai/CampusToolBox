package com.example.mapper;

import com.example.entity.AiCodingTool;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface AiCodingToolMapper {
    List<AiCodingTool> selectList(@Param("name") String name, 
                                 @Param("pageStart") Integer pageStart, 
                                 @Param("pageSize") Integer pageSize);
    
    AiCodingTool selectById(@Param("id") Integer id);
    
    int insert(AiCodingTool aiCodingTool);
    
    int update(AiCodingTool aiCodingTool);
    
    int deleteById(@Param("id") Integer id);
    
    int deleteBatch(List<Integer> ids);
    
    int count(@Param("name") String name);
    
    List<AiCodingTool> selectAllForExport();
} 