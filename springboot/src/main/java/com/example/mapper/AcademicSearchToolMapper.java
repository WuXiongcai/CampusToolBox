package com.example.mapper;

import com.example.entity.AcademicSearchTool;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface AcademicSearchToolMapper {
    List<AcademicSearchTool> selectList(@Param("name") String name, 
                                      @Param("isFree") Boolean isFree,
                                      @Param("pageStart") Integer pageStart, 
                                      @Param("pageSize") Integer pageSize);
    
    AcademicSearchTool selectById(@Param("id") Integer id);
    
    int insert(AcademicSearchTool academicSearchTool);
    
    int update(AcademicSearchTool academicSearchTool);
    
    int deleteById(@Param("id") Integer id);
    
    int deleteBatch(List<Integer> ids);
    
    int count(@Param("name") String name, @Param("isFree") Boolean isFree);
    
    List<AcademicSearchTool> selectAllForExport();
} 