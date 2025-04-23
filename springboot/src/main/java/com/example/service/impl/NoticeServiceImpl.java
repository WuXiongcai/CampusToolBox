package com.example.service.impl;

import com.example.entity.Notice;
import com.example.mapper.NoticeMapper;
import com.example.service.NoticeService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;
import java.util.HashMap;

@Service
public class NoticeServiceImpl implements NoticeService {

    @Resource
    private NoticeMapper noticeMapper;

    @Override
    public PageInfo<Notice> selectPage(String title, Integer pageNum, Integer pageSize) {
        PageHelper.startPage(pageNum, pageSize);
        List<Notice> list = noticeMapper.selectList(title, (pageNum - 1) * pageSize, pageSize);
        return new PageInfo<>(list);
    }

    @Override
    public Notice selectById(Integer id) {
        return noticeMapper.selectById(id);
    }

    @Override
    @Transactional
    public int add(Notice notice) {
        return noticeMapper.insert(notice);
    }

    @Override
    @Transactional
    public int update(Notice notice) {
        return noticeMapper.update(notice);
    }

    @Override
    @Transactional
    public int deleteById(Integer id) {
        return noticeMapper.deleteById(id);
    }

    @Override
    @Transactional
    public int deleteBatch(List<Integer> ids) {
        return noticeMapper.deleteBatch(ids);
    }

    @Override
    public List<Notice> selectAllForExport() {
        return noticeMapper.selectAllForExport();
    }

    @Override
    public Map<String, Object> getNoticeStatistics() {
        Map<String, Object> result = new HashMap<>();
        result.put("total", noticeMapper.getTotalCount());
        result.put("lastWeek", noticeMapper.getLastWeekCount());
        return result;
    }
} 