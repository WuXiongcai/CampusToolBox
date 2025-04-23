package com.example.mapper;

import com.example.entity.ChartTool;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface ChartToolMapper {
    List<ChartTool> selectList(@Param("name") String name, 
                              @Param("isFree") Boolean isFree,
                              @Param("pageStart") Integer pageStart, 
                              @Param("pageSize") Integer pageSize);
    
    ChartTool selectById(@Param("id") Integer id);
    
    int insert(ChartTool chartTool);
    
    int update(ChartTool chartTool);
    
    int deleteById(@Param("id") Integer id);
    
    int deleteBatch(List<Integer> ids);
    
    int count(@Param("name") String name, @Param("isFree") Boolean isFree);
    
    List<ChartTool> selectAllForExport();
} 