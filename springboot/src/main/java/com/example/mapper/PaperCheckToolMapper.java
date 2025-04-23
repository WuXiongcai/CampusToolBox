package com.example.mapper;

import com.example.entity.PaperCheckTool;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface PaperCheckToolMapper {
    List<PaperCheckTool> selectList(@Param("name") String name, 
                                   @Param("pageStart") Integer pageStart, 
                                   @Param("pageSize") Integer pageSize);
    
    PaperCheckTool selectById(@Param("id") Integer id);
    
    int insert(PaperCheckTool paperCheckTool);
    
    int update(PaperCheckTool paperCheckTool);
    
    int deleteById(@Param("id") Integer id);
    
    int deleteBatch(List<Integer> ids);
    
    int count(@Param("name") String name);
    
    List<PaperCheckTool> selectAllForExport();
} 