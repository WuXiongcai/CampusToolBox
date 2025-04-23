package com.example.mapper;

import com.example.entity.PptTool;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface PptToolMapper {
    List<PptTool> selectList(@Param("name") String name, 
                            @Param("isFree") Boolean isFree,
                            @Param("pageStart") Integer pageStart, 
                            @Param("pageSize") Integer pageSize);
    
    PptTool selectById(@Param("id") Integer id);
    
    int insert(PptTool pptTool);
    
    int update(PptTool pptTool);
    
    int deleteById(@Param("id") Integer id);
    
    int deleteBatch(List<Integer> ids);
    
    int count(@Param("name") String name, @Param("isFree") Boolean isFree);
    
    List<PptTool> selectAllForExport();
} 