package com.example.mapper;

import com.example.entity.AiTool;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface AiToolMapper {
    List<AiTool> selectList(@Param("title") String title, 
                           @Param("pageStart") Integer pageStart, 
                           @Param("pageSize") Integer pageSize);
    
    AiTool selectById(@Param("id") Integer id);
    
    int insert(AiTool aiTool);
    
    int update(AiTool aiTool);
    
    int deleteById(@Param("id") Integer id);
    
    int deleteBatch(List<Integer> ids);
    
    int count(@Param("title") String title);

    /**
     * 查询所有数据用于导出
     */
    List<AiTool> selectAllForExport();
} 