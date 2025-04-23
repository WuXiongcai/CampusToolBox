package com.example.mapper;

import com.example.entity.CodingPractice;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface CodingPracticeMapper {
    List<CodingPractice> selectList(@Param("name") String name, 
                                   @Param("isFree") Boolean isFree,
                                   @Param("pageStart") Integer pageStart, 
                                   @Param("pageSize") Integer pageSize);
    
    CodingPractice selectById(@Param("id") Integer id);
    
    int insert(CodingPractice codingPractice);
    
    int update(CodingPractice codingPractice);
    
    int deleteById(@Param("id") Integer id);
    
    int deleteBatch(List<Integer> ids);
    
    int count(@Param("name") String name, @Param("isFree") Boolean isFree);
    
    List<CodingPractice> selectAllForExport();
} 