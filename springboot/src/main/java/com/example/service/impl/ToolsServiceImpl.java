package com.example.service.impl;

import com.example.mapper.ToolsMapper;
import com.example.service.ToolsService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.Map;

@Service
public class ToolsServiceImpl implements ToolsService {
    
    @Resource
    private ToolsMapper toolsMapper;
    
    @Override
    public Map<String, Object> getToolsStatistics() {
        Map<String, Object> statistics = new HashMap<>();
        
        // 获取各类工具数量
        int aiTools = toolsMapper.getAiToolsCount();
        int commonTools = toolsMapper.getCommonToolsCount();
        int aiCodingTools = toolsMapper.getAiCodingToolsCount();
        int fileConvertTools = toolsMapper.getFileConvertToolsCount();
        int paperCheckTools = toolsMapper.getPaperCheckToolsCount();
        int mathModelTools = toolsMapper.getMathModelToolsCount();
        int codeHostingTools = toolsMapper.getCodeHostingToolsCount();
        int academicSearchTools = toolsMapper.getAcademicSearchToolsCount();
        int communitySites = toolsMapper.getCommunitySitesCount();
        int translationTools = toolsMapper.getTranslationToolsCount();
        int chartTools = toolsMapper.getChartToolsCount();
        int lawAssistants = toolsMapper.getLawAssistantsCount();
        int audioTools = toolsMapper.getAudioToolsCount();
        int codingPractice = toolsMapper.getCodingPracticeCount();
        int pptTools = toolsMapper.getPptToolsCount();
        int teacherResources = toolsMapper.getTeacherResourcesCount();
        int fontIcons = toolsMapper.getFontIconsCount();
        int resumeTemplates = toolsMapper.getResumeTemplatesCount();
        int readingSummary = toolsMapper.getReadingSummaryCount();
        int dataAnalysis = toolsMapper.getDataAnalysisCount();
        int imageDrawing = toolsMapper.getImageDrawingCount();
        int resourceNavigation = toolsMapper.getResourceNavigationCount();
        int aiMindmapTools = toolsMapper.getAiMindmapToolsCount();
        
        // 计算总数
        int total = aiTools + commonTools + aiCodingTools + fileConvertTools + 
                paperCheckTools + mathModelTools + codeHostingTools + 
                academicSearchTools + communitySites + translationTools +
                chartTools + lawAssistants + audioTools + codingPractice + 
                pptTools + teacherResources + fontIcons + resumeTemplates + 
                readingSummary + dataAnalysis + imageDrawing + 
                resourceNavigation + aiMindmapTools;
        
        // 存储统计结果
        statistics.put("total", total);
        statistics.put("lastTotal", 0); // 这里可以添加上周的总数，用于计算增长率
        
        // 存储详细数据
        Map<String, Integer> details = new HashMap<>();
        details.put("aiTools", aiTools);
        details.put("commonTools", commonTools);
        details.put("aiCodingTools", aiCodingTools);
        details.put("fileConvertTools", fileConvertTools);
        details.put("paperCheckTools", paperCheckTools);
        details.put("mathModelTools", mathModelTools);
        details.put("codeHostingTools", codeHostingTools);
        details.put("academicSearchTools", academicSearchTools);
        details.put("communitySites", communitySites);
        details.put("translationTools", translationTools);
        details.put("chartTools", chartTools);
        details.put("lawAssistants", lawAssistants);
        details.put("audioTools", audioTools);
        details.put("codingPractice", codingPractice);
        details.put("pptTools", pptTools);
        details.put("teacherResources", teacherResources);
        details.put("fontIcons", fontIcons);
        details.put("resumeTemplates", resumeTemplates);
        details.put("readingSummary", readingSummary);
        details.put("dataAnalysis", dataAnalysis);
        details.put("imageDrawing", imageDrawing);
        details.put("resourceNavigation", resourceNavigation);
        details.put("aiMindmapTools", aiMindmapTools);
        
        statistics.put("details", details);
        
        return statistics;
    }
} 