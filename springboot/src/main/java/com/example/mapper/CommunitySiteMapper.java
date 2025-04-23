package com.example.mapper;

import com.example.entity.CommunitySite;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface CommunitySiteMapper {
    List<CommunitySite> selectList(@Param("name") String name, 
                                 @Param("category") String category,
                                 @Param("pageStart") Integer pageStart, 
                                 @Param("pageSize") Integer pageSize);
    
    CommunitySite selectById(@Param("id") Integer id);
    
    int insert(CommunitySite communitySite);
    
    int update(CommunitySite communitySite);
    
    int deleteById(@Param("id") Integer id);
    
    int deleteBatch(List<Integer> ids);
    
    int count(@Param("name") String name, @Param("category") String category);
    
    List<CommunitySite> selectAllForExport();
} 