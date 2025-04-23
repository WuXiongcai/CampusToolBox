package com.example.mapper;

import com.example.entity.DataAnalysis;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface DataAnalysisMapper {
    List<DataAnalysis> selectList(@Param("name") String name, 
                                 @Param("isFree") Boolean isFree,
                                 @Param("pageStart") Integer pageStart, 
                                 @Param("pageSize") Integer pageSize);
    
    DataAnalysis selectById(@Param("id") Integer id);
    
    int insert(DataAnalysis dataAnalysis);
    
    int update(DataAnalysis dataAnalysis);
    
    int deleteById(@Param("id") Integer id);
    
    int deleteBatch(List<Integer> ids);
    
    int count(@Param("name") String name, @Param("isFree") Boolean isFree);
    
    List<DataAnalysis> selectAllForExport();
} 