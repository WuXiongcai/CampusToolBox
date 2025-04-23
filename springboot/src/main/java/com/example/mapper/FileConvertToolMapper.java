package com.example.mapper;

import com.example.entity.FileConvertTool;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface FileConvertToolMapper {
    List<FileConvertTool> selectList(@Param("name") String name, 
                                    @Param("pageStart") Integer pageStart, 
                                    @Param("pageSize") Integer pageSize);
    
    FileConvertTool selectById(@Param("id") Integer id);
    
    int insert(FileConvertTool fileConvertTool);
    
    int update(FileConvertTool fileConvertTool);
    
    int deleteById(@Param("id") Integer id);
    
    int deleteBatch(List<Integer> ids);
    
    int count(@Param("name") String name);
    
    List<FileConvertTool> selectAllForExport();
} 