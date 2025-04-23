package com.example.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

@Mapper
public interface ToolsMapper {
    
    /**
     * 获取AI编程工具总数
     */
    @Select("SELECT COUNT(*) FROM ai_coding_tools")
    int getAiCodingToolsCount();
    
    /**
     * 获取文件转换工具总数
     */
    @Select("SELECT COUNT(*) FROM file_convert_tools")
    int getFileConvertToolsCount();
    
    /**
     * 获取论文查重工具总数
     */
    @Select("SELECT COUNT(*) FROM paper_check_tool")
    int getPaperCheckToolsCount();
    
    /**
     * 获取数学建模工具总数
     */
    @Select("SELECT COUNT(*) FROM math_model_tool")
    int getMathModelToolsCount();
    
    /**
     * 获取代码托管工具总数
     */
    @Select("SELECT COUNT(*) FROM code_hosting_tool")
    int getCodeHostingToolsCount();
    
    /**
     * 获取学术资源检索工具总数
     */
    @Select("SELECT COUNT(*) FROM academic_search_tool")
    int getAcademicSearchToolsCount();
    
    /**
     * 获取社区交流网站总数
     */
    @Select("SELECT COUNT(*) FROM community_site")
    int getCommunitySitesCount();
    
    /**
     * 获取在线翻译工具总数
     */
    @Select("SELECT COUNT(*) FROM translation_tool")
    int getTranslationToolsCount();
    
    /**
     * 获取图表工具总数
     */
    @Select("SELECT COUNT(*) FROM chart_tool")
    int getChartToolsCount();
    
    /**
     * 获取AI法律助手总数
     */
    @Select("SELECT COUNT(*) FROM law_assistant")
    int getLawAssistantsCount();
    
    /**
     * 获取AI音频工具总数
     */
    @Select("SELECT COUNT(*) FROM audio_tool")
    int getAudioToolsCount();
    
    /**
     * 获取编程刷题网站总数
     */
    @Select("SELECT COUNT(*) FROM coding_practice")
    int getCodingPracticeCount();
    
    /**
     * 获取PPT生成工具总数
     */
    @Select("SELECT COUNT(*) FROM ppt_tool")
    int getPptToolsCount();
    
    /**
     * 获取教师资源网站总数
     */
    @Select("SELECT COUNT(*) FROM teacher_resource")
    int getTeacherResourcesCount();
    
    /**
     * 获取字体图标工具总数
     */
    @Select("SELECT COUNT(*) FROM font_icon")
    int getFontIconsCount();
    
    /**
     * 获取简历模板总数
     */
    @Select("SELECT COUNT(*) FROM resume_template")
    int getResumeTemplatesCount();
    
    /**
     * 获取阅读总结工具总数
     */
    @Select("SELECT COUNT(*) FROM reading_summary")
    int getReadingSummaryCount();
    
    /**
     * 获取数据分析工具总数
     */
    @Select("SELECT COUNT(*) FROM data_analysis")
    int getDataAnalysisCount();
    
    /**
     * 获取图像绘画工具总数
     */
    @Select("SELECT COUNT(*) FROM image_drawing")
    int getImageDrawingCount();
    
    /**
     * 获取资源导航总数
     */
    @Select("SELECT COUNT(*) FROM resource_navigation")
    int getResourceNavigationCount();
    
    /**
     * 获取AI思维导图工具总数
     */
    @Select("SELECT COUNT(*) FROM ai_mindmap_tools")
    int getAiMindmapToolsCount();
    
    /**
     * 获取通用工具总数
     */
    @Select("SELECT COUNT(*) FROM common_tools")
    int getCommonToolsCount();
    
    /**
     * 获取AI工具总数
     */
    @Select("SELECT COUNT(*) FROM ai_tools")
    int getAiToolsCount();
} 