package com.example.service;

import com.example.entity.Notice;
import com.github.pagehelper.PageInfo;

import java.util.List;
import java.util.Map;

public interface NoticeService {
    /**
     * 分页查询公告
     * @param title 标题（可选）
     * @param pageNum 页码
     * @param pageSize 每页大小
     * @return 分页结果
     */
    PageInfo<Notice> selectPage(String title, Integer pageNum, Integer pageSize);

    /**
     * 根据ID查询公告
     * @param id 公告ID
     * @return 公告信息
     */
    Notice selectById(Integer id);

    /**
     * 新增公告
     * @param notice 公告信息
     * @return 影响行数
     */
    int add(Notice notice);

    /**
     * 更新公告
     * @param notice 公告信息
     * @return 影响行数
     */
    int update(Notice notice);

    /**
     * 删除单个公告
     * @param id 公告ID
     * @return 影响行数
     */
    int deleteById(Integer id);

    /**
     * 批量删除公告
     * @param ids ID列表
     * @return 影响行数
     */
    int deleteBatch(List<Integer> ids);

    /**
     * 导出所有公告
     * @return 公告列表
     */
    List<Notice> selectAllForExport();

    /**
     * 获取公告统计数据
     * @return Map<String, Object> 包含总数和上周数量
     */
    Map<String, Object> getNoticeStatistics();
} 