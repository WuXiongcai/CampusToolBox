package com.example.mapper;

import com.example.entity.ImageDrawing;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface ImageDrawingMapper {
    List<ImageDrawing> selectList(@Param("name") String name, 
                                 @Param("isFree") Boolean isFree,
                                 @Param("pageStart") Integer pageStart, 
                                 @Param("pageSize") Integer pageSize);
    
    ImageDrawing selectById(@Param("id") Integer id);
    
    int insert(ImageDrawing imageDrawing);
    
    int update(ImageDrawing imageDrawing);
    
    int deleteById(@Param("id") Integer id);
    
    int deleteBatch(List<Integer> ids);
    
    int count(@Param("name") String name, @Param("isFree") Boolean isFree);
    
    List<ImageDrawing> selectAllForExport();
} 