package com.example.mapper;

import com.example.entity.AudioTool;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface AudioToolMapper {
    List<AudioTool> selectList(@Param("name") String name, 
                              @Param("isFree") Boolean isFree,
                              @Param("pageStart") Integer pageStart, 
                              @Param("pageSize") Integer pageSize);
    
    AudioTool selectById(@Param("id") Integer id);
    
    int insert(AudioTool audioTool);
    
    int update(AudioTool audioTool);
    
    int deleteById(@Param("id") Integer id);
    
    int deleteBatch(List<Integer> ids);
    
    int count(@Param("name") String name, @Param("isFree") Boolean isFree);
    
    List<AudioTool> selectAllForExport();
} 