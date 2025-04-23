package com.example.controller;

import com.example.common.Result;
import com.example.entity.Notice;
import com.example.service.NoticeService;
import com.github.pagehelper.PageInfo;
import org.springframework.web.bind.annotation.*;
import lombok.extern.slf4j.Slf4j;

import javax.annotation.Resource;
import java.io.IOException;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

@Slf4j
@RestController
@RequestMapping("/api/notice")
public class NoticeController {

    @Resource
    private NoticeService noticeService;

    /**
     * 分页查询公告
     */
    @GetMapping("/page")
    public Result<PageInfo<Notice>> page(
            @RequestParam(defaultValue = "") String title,
            @RequestParam(defaultValue = "1") Integer pageNum,
            @RequestParam(defaultValue = "10") Integer pageSize) {
        PageInfo<Notice> pageInfo = noticeService.selectPage(title, pageNum, pageSize);
        return Result.success(pageInfo);
    }

    /**
     * 根据ID查询公告
     */
    @GetMapping("/{id}")
    public Result<Notice> getById(@PathVariable Integer id) {
        Notice notice = noticeService.selectById(id);
        return Result.success(notice);
    }

    /**
     * 新增公告
     */
    @PostMapping
    public Result<?> add(@RequestBody Notice notice) {
        notice.setCreateTime(new Date());
        notice.setUpdateTime(new Date());
        noticeService.add(notice);
        return Result.success();
    }

    /**
     * 更新公告
     */
    @PutMapping
    public Result<?> update(@RequestBody Notice notice) {
        notice.setUpdateTime(new Date());
        noticeService.update(notice);
        return Result.success();
    }

    /**
     * 删除公告
     */
    @DeleteMapping("/{id}")
    public Result<?> delete(@PathVariable Integer id) {
        noticeService.deleteById(id);
        return Result.success();
    }

    /**
     * 批量删除公告
     */
    @DeleteMapping("/batch")
    public Result<?> deleteBatch(@RequestBody List<Integer> ids) {
        noticeService.deleteBatch(ids);
        return Result.success();
    }

    /**
     * 导出所有公告
     */
    @GetMapping("/export")
    public void export(HttpServletResponse response) throws IOException {
        // ... existing code ...
    }

    @GetMapping("/statistics")
    public Result<?> getStatistics() {
        try {
            Map<String, Object> statistics = noticeService.getNoticeStatistics();
            return Result.success(statistics);
        } catch (Exception e) {
            log.error("获取公告统计数据失败", e);
            return Result.error("获取统计数据失败");
        }
    }
} 