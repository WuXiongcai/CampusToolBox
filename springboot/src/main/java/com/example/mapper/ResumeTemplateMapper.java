package com.example.mapper;

import com.example.entity.ResumeTemplate;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface ResumeTemplateMapper {
    List<ResumeTemplate> selectList(@Param("name") String name, 
                                   @Param("isFree") Boolean isFree,
                                   @Param("pageStart") Integer pageStart, 
                                   @Param("pageSize") Integer pageSize);
    
    ResumeTemplate selectById(@Param("id") Integer id);
    
    int insert(ResumeTemplate resumeTemplate);
    
    int update(ResumeTemplate resumeTemplate);
    
    int deleteById(@Param("id") Integer id);
    
    int deleteBatch(List<Integer> ids);
    
    int count(@Param("name") String name, @Param("isFree") Boolean isFree);
    
    List<ResumeTemplate> selectAllForExport();
} 