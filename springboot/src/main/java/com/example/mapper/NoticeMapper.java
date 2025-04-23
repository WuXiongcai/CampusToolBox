package com.example.mapper;

import com.example.entity.Notice;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface NoticeMapper {
    List<Notice> selectList(@Param("title") String title, 
                          @Param("pageStart") Integer pageStart, 
                          @Param("pageSize") Integer pageSize);
    
    Notice selectById(@Param("id") Integer id);
    
    int count(@Param("title") String title);
    
    int insert(Notice notice);
    
    int update(Notice notice);
    
    int deleteById(@Param("id") Integer id);
    
    int deleteBatch(@Param("list") List<Integer> ids);
    
    List<Notice> selectAllForExport();

    /**
     * 获取公告总数
     * @return 公告总数
     */
    int getTotalCount();

    /**
     * 获取上周公告总数
     * @return 上周公告总数
     */
    int getLastWeekCount();
} 