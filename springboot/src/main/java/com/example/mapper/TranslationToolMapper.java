package com.example.mapper;

import com.example.entity.TranslationTool;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface TranslationToolMapper {
    List<TranslationTool> selectList(@Param("name") String name, 
                                   @Param("isFree") Boolean isFree,
                                   @Param("pageStart") Integer pageStart, 
                                   @Param("pageSize") Integer pageSize);
    
    TranslationTool selectById(@Param("id") Integer id);
    
    int insert(TranslationTool translationTool);
    
    int update(TranslationTool translationTool);
    
    int deleteById(@Param("id") Integer id);
    
    int deleteBatch(List<Integer> ids);
    
    int count(@Param("name") String name, @Param("isFree") Boolean isFree);
    
    List<TranslationTool> selectAllForExport();
} 