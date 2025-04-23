package com.example.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;

import java.time.LocalDateTime;

@Data
@TableName("feedback")
public class Feedback {
    @TableId(type = IdType.AUTO)
    private Long id;
    
    private Integer type; // 反馈类型：1-功能建议，2-问题反馈，3-其他
    
    private String content; // 反馈内容
    
    private String contactInfo; // 联系方式
    
    private Integer status; // 状态：0-待处理，1-已处理
    
    private LocalDateTime createTime; // 创建时间
    
    private LocalDateTime updateTime; // 更新时间
}