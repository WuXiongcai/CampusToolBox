package com.example.service;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.IService;
import com.example.entity.Feedback;
import java.util.List;

public interface FeedbackService extends IService<Feedback> {
    Page<Feedback> getFeedbackList(Integer pageNum, Integer pageSize, Integer status);
    
    void processFeedback(Long id);
    
    void deleteFeedback(Long id);
    
    void batchProcessFeedback(List<Long> ids);
    
    void batchDeleteFeedback(List<Long> ids);
}