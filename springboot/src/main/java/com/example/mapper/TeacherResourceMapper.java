package com.example.mapper;

import com.example.entity.TeacherResource;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface TeacherResourceMapper {
    List<TeacherResource> selectList(@Param("name") String name, 
                                    @Param("isFree") Boolean isFree,
                                    @Param("pageStart") Integer pageStart, 
                                    @Param("pageSize") Integer pageSize);
    
    TeacherResource selectById(@Param("id") Integer id);
    
    int insert(TeacherResource teacherResource);
    
    int update(TeacherResource teacherResource);
    
    int deleteById(@Param("id") Integer id);
    
    int deleteBatch(List<Integer> ids);
    
    int count(@Param("name") String name, @Param("isFree") Boolean isFree);
    
    List<TeacherResource> selectAllForExport();
} 