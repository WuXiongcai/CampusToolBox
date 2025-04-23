package com.example.mapper;

import com.example.entity.AiMindmapTool;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface AiMindmapToolMapper {
    List<AiMindmapTool> selectList(@Param("name") String name, 
                                  @Param("pageStart") Integer pageStart, 
                                  @Param("pageSize") Integer pageSize);
    
    AiMindmapTool selectById(@Param("id") Integer id);
    
    int insert(AiMindmapTool aiMindmapTool);
    
    int update(AiMindmapTool aiMindmapTool);
    
    int deleteById(@Param("id") Integer id);
    
    int deleteBatch(List<Integer> ids);
    
    int count(@Param("name") String name);
    
    List<AiMindmapTool> selectAllForExport();
} 