package com.example.mapper;

import com.example.entity.ReadingSummary;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface ReadingSummaryMapper {
    List<ReadingSummary> selectList(@Param("name") String name, 
                                   @Param("isFree") Boolean isFree,
                                   @Param("pageStart") Integer pageStart, 
                                   @Param("pageSize") Integer pageSize);
    
    ReadingSummary selectById(@Param("id") Integer id);
    
    int insert(ReadingSummary readingSummary);
    
    int update(ReadingSummary readingSummary);
    
    int deleteById(@Param("id") Integer id);
    
    int deleteBatch(List<Integer> ids);
    
    int count(@Param("name") String name, @Param("isFree") Boolean isFree);
    
    List<ReadingSummary> selectAllForExport();
} 