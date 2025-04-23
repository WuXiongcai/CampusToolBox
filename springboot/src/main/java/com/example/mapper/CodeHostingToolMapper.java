package com.example.mapper;

import com.example.entity.CodeHostingTool;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface CodeHostingToolMapper {
    List<CodeHostingTool> selectList(@Param("name") String name, 
                                   @Param("pageStart") Integer pageStart, 
                                   @Param("pageSize") Integer pageSize);
    
    CodeHostingTool selectById(@Param("id") Integer id);
    
    int insert(CodeHostingTool codeHostingTool);
    
    int update(CodeHostingTool codeHostingTool);
    
    int deleteById(@Param("id") Integer id);
    
    int deleteBatch(List<Integer> ids);
    
    int count(@Param("name") String name);
    
    List<CodeHostingTool> selectAllForExport();
} 