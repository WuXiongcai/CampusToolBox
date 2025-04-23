package com.example.controller;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.example.common.Result;
import com.example.entity.Feedback;
import com.example.service.FeedbackService;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import java.util.List;

@RestController
@RequestMapping("/api/feedback")
public class FeedbackController {
    
    @Resource
    private FeedbackService feedbackService;
    
    @PostMapping
    public Result<?> submitFeedback(@RequestBody Feedback feedback) {
        feedback.setStatus(0);
        feedbackService.save(feedback);
        return Result.success();
    }
    
    @GetMapping("/list")
    public Result<?> getFeedbackList(
            @RequestParam(defaultValue = "1") Integer pageNum,
            @RequestParam(defaultValue = "10") Integer pageSize,
            @RequestParam(required = false) Integer status
    ) {
        Page<Feedback> page = feedbackService.getFeedbackList(pageNum, pageSize, status);
        return Result.success(page);
    }
    
    @PutMapping("/process/{id}")
    public Result<?> processFeedback(@PathVariable Long id) {
        feedbackService.processFeedback(id);
        return Result.success();
    }
    
    @DeleteMapping("/{id}")
    public Result<?> deleteFeedback(@PathVariable Long id) {
        feedbackService.deleteFeedback(id);
        return Result.success();
    }
    
    @PutMapping("/process/batch")
    public Result<?> batchProcessFeedback(@RequestBody List<Long> ids) {
        feedbackService.batchProcessFeedback(ids);
        return Result.success();
    }
    
    @DeleteMapping("/batch")
    public Result<?> batchDeleteFeedback(@RequestBody List<Long> ids) {
        feedbackService.batchDeleteFeedback(ids);
        return Result.success();
    }
}