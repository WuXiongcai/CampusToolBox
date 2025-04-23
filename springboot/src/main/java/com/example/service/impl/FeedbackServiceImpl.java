package com.example.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.conditions.update.LambdaUpdateWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.example.entity.Feedback;
import com.example.mapper.FeedbackMapper;
import com.example.service.FeedbackService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.time.LocalDateTime;
import java.util.List;

@Service
public class FeedbackServiceImpl extends ServiceImpl<FeedbackMapper, Feedback> implements FeedbackService {
    
    private static final Logger log = LoggerFactory.getLogger(FeedbackServiceImpl.class);
    
    @Override
    public Page<Feedback> getFeedbackList(Integer pageNum, Integer pageSize, Integer status) {
        Page<Feedback> page = new Page<>(pageNum, pageSize);
        LambdaQueryWrapper<Feedback> wrapper = new LambdaQueryWrapper<>();
        if (status != null) {
            wrapper.eq(Feedback::getStatus, status);
        }
        wrapper.orderByDesc(Feedback::getCreateTime);
        Page<Feedback> result = this.page(page, wrapper);
        log.info("分页查询结果：total={}, records={}", result.getTotal(), result.getRecords().size());
        return result;
    }
    
    @Override
    @Transactional
    public void processFeedback(Long id) {
        Feedback feedback = this.getById(id);
        if (feedback != null) {
            feedback.setStatus(1);
            this.updateById(feedback);
        }
    }
    
    @Override
    @Transactional
    public void deleteFeedback(Long id) {
        this.removeById(id);
    }
    
    @Override
    @Transactional
    public void batchProcessFeedback(List<Long> ids) {
        if (ids == null || ids.isEmpty()) {
            return;
        }
        // 使用批量更新
        this.update(
            new LambdaUpdateWrapper<Feedback>()
                .in(Feedback::getId, ids)
                .set(Feedback::getStatus, 1)
                .set(Feedback::getUpdateTime, LocalDateTime.now())
        );
    }
    
    @Override
    @Transactional
    public void batchDeleteFeedback(List<Long> ids) {
        if (ids == null || ids.isEmpty()) {
            return;
        }
        this.removeByIds(ids);
    }
}