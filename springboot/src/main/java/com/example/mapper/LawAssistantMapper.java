package com.example.mapper;

import com.example.entity.LawAssistant;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface LawAssistantMapper {
    List<LawAssistant> selectList(@Param("name") String name, 
                                 @Param("isFree") Boolean isFree,
                                 @Param("pageStart") Integer pageStart, 
                                 @Param("pageSize") Integer pageSize);
    
    LawAssistant selectById(@Param("id") Integer id);
    
    int insert(LawAssistant lawAssistant);
    
    int update(LawAssistant lawAssistant);
    
    int deleteById(@Param("id") Integer id);
    
    int deleteBatch(List<Integer> ids);
    
    int count(@Param("name") String name, @Param("isFree") Boolean isFree);
    
    List<LawAssistant> selectAllForExport();
} 