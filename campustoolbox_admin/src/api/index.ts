import request from '../utils/request';

export const fetchData = () => {
    return request({
        url: './mock/table.json',
        method: 'get'
    });
};

export const fetchUserData = () => {
    return request({
        url: './mock/user.json',
        method: 'get'
    });
};

export const fetchRoleData = () => {
    return request({
        url: './mock/role.json',
        method: 'get'
    });
};

// 常用工具相关API
export const fetchCommonToolsData = (params = {}) => {
    return request({
        url: 'http://localhost:9090/api/common-tools/list',
        method: 'get',
        params
    });
};

export const addCommonTool = (data) => {
    return request({
        url: 'http://localhost:9090/api/common-tools',
        method: 'post',
        data
    });
};

export const updateCommonTool = (data) => {
    return request({
        url: 'http://localhost:9090/api/common-tools',
        method: 'put',
        data
    });
};

export const deleteCommonTool = (id) => {
    return request({
        url: `http://localhost:9090/api/common-tools/${id}`,
        method: 'delete'
    });
};

export const batchDeleteCommonTools = (ids) => {
    return request({
        url: 'http://localhost:9090/api/common-tools/batch',
        method: 'delete',
        data: ids
    });
};

export const exportCommonTools = () => {
    return request({
        url: 'http://localhost:9090/api/common-tools/export',
        method: 'get',
        responseType: 'blob'
    });
};

// AI工具相关API
export const fetchAiToolsData = (params = {}) => {
    return request({
        url: '/api/ai-tools/list',
        method: 'get',
        params
    });
};

export const addAiTool = (data) => {
    return request({
        url: '/api/ai-tools',
        method: 'post',
        data
    });
};

export const updateAiTool = (data) => {
    return request({
        url: '/api/ai-tools',
        method: 'put',
        data
    });
};

export const deleteAiTool = (id) => {
    return request({
        url: `/api/ai-tools/${id}`,
        method: 'delete'
    });
};


// AI编程辅助工具相关API
export const fetchAiCodingToolsData = (params = {}) => {
    return request({
        url: 'http://localhost:9090/api/ai-coding-tools/list',
        method: 'get',
        params
    });
};

export const addAiCodingTool = (data) => {
    return request({
        url: 'http://localhost:9090/api/ai-coding-tools',
        method: 'post',
        data
    });
};

export const updateAiCodingTool = (data) => {
    return request({
        url: 'http://localhost:9090/api/ai-coding-tools',
        method: 'put',
        data
    });
};

export const deleteAiCodingTool = (id) => {
    return request({
        url: `http://localhost:9090/api/ai-coding-tools/${id}`,
        method: 'delete'
    });
};

export const batchDeleteAiCodingTools = (ids) => {
    return request({
        url: 'http://localhost:9090/api/ai-coding-tools/batch',
        method: 'delete',
        data: ids
    });
};

export const exportAiCodingTools = () => {
    return request({
        url: 'http://localhost:9090/api/ai-coding-tools/export',
        method: 'get',
        responseType: 'blob'
    });
};

// 文件格式转换工具相关API
export const fetchFileConvertToolsData = (params = {}) => {
    return request({
        url: 'http://localhost:9090/api/file-convert-tools/list',
        method: 'get',
        params
    });
};

export const addFileConvertTool = (data) => {
    return request({
        url: 'http://localhost:9090/api/file-convert-tools',
        method: 'post',
        data
    });
};

export const updateFileConvertTool = (data) => {
    return request({
        url: 'http://localhost:9090/api/file-convert-tools',
        method: 'put',
        data
    });
};

export const deleteFileConvertTool = (id) => {
    return request({
        url: `http://localhost:9090/api/file-convert-tools/${id}`,
        method: 'delete'
    });
};

export const batchDeleteFileConvertTools = (ids) => {
    return request({
        url: 'http://localhost:9090/api/file-convert-tools/batch',
        method: 'delete',
        data: ids
    });
};

export const exportFileConvertTools = () => {
    return request({
        url: 'http://localhost:9090/api/file-convert-tools/export',
        method: 'get',
        responseType: 'blob'
    });
};

// 论文查重工具相关API
export const fetchPaperCheckToolsData = (params = {}) => {
    return request({
        url: 'http://localhost:9090/api/paper-check-tools/list',
        method: 'get',
        params
    });
};

export const addPaperCheckTool = (data) => {
    return request({
        url: 'http://localhost:9090/api/paper-check-tools',
        method: 'post',
        data
    });
};

export const updatePaperCheckTool = (data) => {
    return request({
        url: 'http://localhost:9090/api/paper-check-tools',
        method: 'put',
        data
    });
};

export const deletePaperCheckTool = (id) => {
    return request({
        url: `http://localhost:9090/api/paper-check-tools/${id}`,
        method: 'delete'
    });
};

export const batchDeletePaperCheckTools = (ids) => {
    return request({
        url: 'http://localhost:9090/api/paper-check-tools/batch',
        method: 'delete',
        data: ids
    });
};

export const exportPaperCheckTools = () => {
    return request({
        url: 'http://localhost:9090/api/paper-check-tools/export',
        method: 'get',
        responseType: 'blob'
    });
};

// 数学建模辅助工具相关API
export const fetchMathModelToolsData = (params = {}) => {
    return request({
        url: 'http://localhost:9090/api/math-model-tools/list',
        method: 'get',
        params
    });
};

export const addMathModelTool = (data) => {
    return request({
        url: 'http://localhost:9090/api/math-model-tools',
        method: 'post',
        data
    });
};

export const updateMathModelTool = (data) => {
    return request({
        url: 'http://localhost:9090/api/math-model-tools',
        method: 'put',
        data
    });
};

export const deleteMathModelTool = (id) => {
    return request({
        url: `http://localhost:9090/api/math-model-tools/${id}`,
        method: 'delete'
    });
};

export const batchDeleteMathModelTools = (ids) => {
    return request({
        url: 'http://localhost:9090/api/math-model-tools/batch',
        method: 'delete',
        data: ids
    });
};

export const exportMathModelTools = () => {
    return request({
        url: 'http://localhost:9090/api/math-model-tools/export',
        method: 'get',
        responseType: 'blob'
    });
};

// 代码托管工具相关API
export const fetchCodeHostingToolsData = (params = {}) => {
    return request({
        url: 'http://localhost:9090/api/code-hosting-tools/list',
        method: 'get',
        params
    });
};

export const addCodeHostingTool = (data) => {
    return request({
        url: 'http://localhost:9090/api/code-hosting-tools',
        method: 'post',
        data
    });
};

export const updateCodeHostingTool = (data) => {
    return request({
        url: 'http://localhost:9090/api/code-hosting-tools',
        method: 'put',
        data
    });
};

export const deleteCodeHostingTool = (id) => {
    return request({
        url: `http://localhost:9090/api/code-hosting-tools/${id}`,
        method: 'delete'
    });
};

export const batchDeleteCodeHostingTools = (ids) => {
    return request({
        url: 'http://localhost:9090/api/code-hosting-tools/batch',
        method: 'delete',
        data: ids
    });
};

export const exportCodeHostingTools = () => {
    return request({
        url: 'http://localhost:9090/api/code-hosting-tools/export',
        method: 'get',
        responseType: 'blob'
    });
};

// 学术资源检索网站相关API
export const fetchAcademicSearchToolsData = (params = {}) => {
    return request({
        url: 'http://localhost:9090/api/academic-search-tools/list',
        method: 'get',
        params
    });
};

export const addAcademicSearchTool = (data) => {
    return request({
        url: 'http://localhost:9090/api/academic-search-tools',
        method: 'post',
        data
    });
};

export const updateAcademicSearchTool = (data) => {
    return request({
        url: 'http://localhost:9090/api/academic-search-tools',
        method: 'put',
        data
    });
};

export const deleteAcademicSearchTool = (id) => {
    return request({
        url: `http://localhost:9090/api/academic-search-tools/${id}`,
        method: 'delete'
    });
};

export const batchDeleteAcademicSearchTools = (ids) => {
    return request({
        url: 'http://localhost:9090/api/academic-search-tools/batch',
        method: 'delete',
        data: ids
    });
};

export const exportAcademicSearchTools = () => {
    return request({
        url: 'http://localhost:9090/api/academic-search-tools/export',
        method: 'get',
        responseType: 'blob'
    });
};

// 社区交流网站相关API
export const fetchCommunitySitesData = (params = {}) => {
    return request({
        url: 'http://localhost:9090/api/community-sites/list',
        method: 'get',
        params
    });
};

export const addCommunitySite = (data) => {
    return request({
        url: 'http://localhost:9090/api/community-sites',
        method: 'post',
        data
    });
};

export const updateCommunitySite = (data) => {
    return request({
        url: 'http://localhost:9090/api/community-sites',
        method: 'put',
        data
    });
};

export const deleteCommunitySite = (id) => {
    return request({
        url: `http://localhost:9090/api/community-sites/${id}`,
        method: 'delete'
    });
};

export const batchDeleteCommunitySites = (ids) => {
    return request({
        url: 'http://localhost:9090/api/community-sites/batch',
        method: 'delete',
        data: ids
    });
};

export const exportCommunitySites = () => {
    return request({
        url: 'http://localhost:9090/api/community-sites/export',
        method: 'get',
        responseType: 'blob'
    });
};

// 在线翻译工具相关API
export const fetchTranslationToolsData = (params = {}) => {
    return request({
        url: 'http://localhost:9090/api/translation-tools/list',
        method: 'get',
        params
    });
};

export const addTranslationTool = (data) => {
    return request({
        url: 'http://localhost:9090/api/translation-tools',
        method: 'post',
        data
    });
};

export const updateTranslationTool = (data) => {
    return request({
        url: 'http://localhost:9090/api/translation-tools',
        method: 'put',
        data
    });
};

export const deleteTranslationTool = (id) => {
    return request({
        url: `http://localhost:9090/api/translation-tools/${id}`,
        method: 'delete'
    });
};

export const batchDeleteTranslationTools = (ids) => {
    return request({
        url: 'http://localhost:9090/api/translation-tools/batch',
        method: 'delete',
        data: ids
    });
};

export const exportTranslationTools = () => {
    return request({
        url: 'http://localhost:9090/api/translation-tools/export',
        method: 'get',
        responseType: 'blob'
    });
};

// 图表工具相关API
export const fetchChartToolsData = (params = {}) => {
    return request({
        url: 'http://localhost:9090/api/chart-tools/list',
        method: 'get',
        params
    });
};

export const addChartTool = (data) => {
    return request({
        url: 'http://localhost:9090/api/chart-tools',
        method: 'post',
        data
    });
};

export const updateChartTool = (data) => {
    return request({
        url: 'http://localhost:9090/api/chart-tools',
        method: 'put',
        data
    });
};

export const deleteChartTool = (id) => {
    return request({
        url: `http://localhost:9090/api/chart-tools/${id}`,
        method: 'delete'
    });
};

export const batchDeleteChartTools = (ids) => {
    return request({
        url: 'http://localhost:9090/api/chart-tools/batch',
        method: 'delete',
        data: ids
    });
};

export const exportChartTools = () => {
    return request({
        url: 'http://localhost:9090/api/chart-tools/export',
        method: 'get',
        responseType: 'blob'
    });
};

// AI法律助手相关API
export const fetchLawAssistantsData = (params = {}) => {
    return request({
        url: 'http://localhost:9090/api/law-assistants/list',
        method: 'get',
        params
    });
};

export const addLawAssistant = (data) => {
    return request({
        url: 'http://localhost:9090/api/law-assistants',
        method: 'post',
        data
    });
};

export const updateLawAssistant = (data) => {
    return request({
        url: 'http://localhost:9090/api/law-assistants',
        method: 'put',
        data
    });
};

export const deleteLawAssistant = (id) => {
    return request({
        url: `http://localhost:9090/api/law-assistants/${id}`,
        method: 'delete'
    });
};

export const batchDeleteLawAssistants = (ids) => {
    return request({
        url: 'http://localhost:9090/api/law-assistants/batch',
        method: 'delete',
        data: ids
    });
};

export const exportLawAssistants = () => {
    return request({
        url: 'http://localhost:9090/api/law-assistants/export',
        method: 'get',
        responseType: 'blob'
    });
};

// AI音频工具相关API
export const fetchAudioToolsData = (params = {}) => {
    return request({
        url: 'http://localhost:9090/api/audio-tools/list',
        method: 'get',
        params
    });
};

export const addAudioTool = (data) => {
    return request({
        url: 'http://localhost:9090/api/audio-tools',
        method: 'post',
        data
    });
};

export const updateAudioTool = (data) => {
    return request({
        url: 'http://localhost:9090/api/audio-tools',
        method: 'put',
        data
    });
};

export const deleteAudioTool = (id) => {
    return request({
        url: `http://localhost:9090/api/audio-tools/${id}`,
        method: 'delete'
    });
};

export const batchDeleteAudioTools = (ids) => {
    return request({
        url: 'http://localhost:9090/api/audio-tools/batch',
        method: 'delete',
        data: ids
    });
};

export const exportAudioTools = () => {
    return request({
        url: 'http://localhost:9090/api/audio-tools/export',
        method: 'get',
        responseType: 'blob'
    });
};

// 编程刷题网站相关API
export const fetchCodingPracticeData = (params = {}) => {
    return request({
        url: 'http://localhost:9090/api/coding-practice/list',
        method: 'get',
        params
    });
};

export const addCodingPractice = (data) => {
    return request({
        url: 'http://localhost:9090/api/coding-practice',
        method: 'post',
        data
    });
};

export const updateCodingPractice = (data) => {
    return request({
        url: 'http://localhost:9090/api/coding-practice',
        method: 'put',
        data
    });
};

export const deleteCodingPractice = (id) => {
    return request({
        url: `http://localhost:9090/api/coding-practice/${id}`,
        method: 'delete'
    });
};

export const batchDeleteCodingPractice = (ids) => {
    return request({
        url: 'http://localhost:9090/api/coding-practice/batch',
        method: 'delete',
        data: ids
    });
};

export const exportCodingPractice = () => {
    return request({
        url: 'http://localhost:9090/api/coding-practice/export',
        method: 'get',
        responseType: 'blob'
    });
};

// PPT生成工具相关API
export const fetchPptToolsData = (params = {}) => {
    return request({
        url: 'http://localhost:9090/api/ppt-tools/list',
        method: 'get',
        params
    });
};

export const addPptTool = (data) => {
    return request({
        url: 'http://localhost:9090/api/ppt-tools',
        method: 'post',
        data
    });
};

export const updatePptTool = (data) => {
    return request({
        url: 'http://localhost:9090/api/ppt-tools',
        method: 'put',
        data
    });
};

export const deletePptTool = (id) => {
    return request({
        url: `http://localhost:9090/api/ppt-tools/${id}`,
        method: 'delete'
    });
};

export const batchDeletePptTools = (ids) => {
    return request({
        url: 'http://localhost:9090/api/ppt-tools/batch',
        method: 'delete',
        data: ids
    });
};

export const exportPptTools = () => {
    return request({
        url: 'http://localhost:9090/api/ppt-tools/export',
        method: 'get',
        responseType: 'blob'
    });
};

// 教师资源网站相关API
export const fetchTeacherResourcesData = (params = {}) => {
    return request({
        url: 'http://localhost:9090/api/teacher-resources/list',
        method: 'get',
        params
    });
};

export const addTeacherResource = (data) => {
    return request({
        url: 'http://localhost:9090/api/teacher-resources',
        method: 'post',
        data
    });
};

export const updateTeacherResource = (data) => {
    return request({
        url: 'http://localhost:9090/api/teacher-resources',
        method: 'put',
        data
    });
};

export const deleteTeacherResource = (id) => {
    return request({
        url: `http://localhost:9090/api/teacher-resources/${id}`,
        method: 'delete'
    });
};

export const batchDeleteTeacherResources = (ids) => {
    return request({
        url: 'http://localhost:9090/api/teacher-resources/batch',
        method: 'delete',
        data: ids
    });
};

export const exportTeacherResources = () => {
    return request({
        url: 'http://localhost:9090/api/teacher-resources/export',
        method: 'get',
        responseType: 'blob'
    });
};

// 字体图标工具相关API
export const fetchFontIconsData = (params = {}) => {
    return request({
        url: 'http://localhost:9090/api/font-icons/list',
        method: 'get',
        params
    });
};

export const addFontIcon = (data) => {
    return request({
        url: 'http://localhost:9090/api/font-icons',
        method: 'post',
        data
    });
};

export const updateFontIcon = (data) => {
    return request({
        url: 'http://localhost:9090/api/font-icons',
        method: 'put',
        data
    });
};

export const deleteFontIcon = (id) => {
    return request({
        url: `http://localhost:9090/api/font-icons/${id}`,
        method: 'delete'
    });
};

export const batchDeleteFontIcons = (ids) => {
    return request({
        url: 'http://localhost:9090/api/font-icons/batch',
        method: 'delete',
        data: ids
    });
};

export const exportFontIcons = () => {
    return request({
        url: 'http://localhost:9090/api/font-icons/export',
        method: 'get',
        responseType: 'blob'
    });
};

// 简历模板网站相关API
export const fetchResumeTemplatesData = (params = {}) => {
    return request({
        url: 'http://localhost:9090/api/resume-templates/list',
        method: 'get',
        params
    });
};

export const addResumeTemplate = (data) => {
    return request({
        url: 'http://localhost:9090/api/resume-templates',
        method: 'post',
        data
    });
};

export const updateResumeTemplate = (data) => {
    return request({
        url: 'http://localhost:9090/api/resume-templates',
        method: 'put',
        data
    });
};

export const deleteResumeTemplate = (id) => {
    return request({
        url: `http://localhost:9090/api/resume-templates/${id}`,
        method: 'delete'
    });
};

export const batchDeleteResumeTemplates = (ids) => {
    return request({
        url: 'http://localhost:9090/api/resume-templates/batch',
        method: 'delete',
        data: ids
    });
};

export const exportResumeTemplates = () => {
    return request({
        url: 'http://localhost:9090/api/resume-templates/export',
        method: 'get',
        responseType: 'blob'
    });
};

// 阅读总结工具相关API
export const fetchReadingSummaryData = (params = {}) => {
    return request({
        url: 'http://localhost:9090/api/reading-summary/list',
        method: 'get',
        params
    });
};

export const addReadingSummary = (data) => {
    return request({
        url: 'http://localhost:9090/api/reading-summary',
        method: 'post',
        data
    });
};

export const updateReadingSummary = (data) => {
    return request({
        url: 'http://localhost:9090/api/reading-summary',
        method: 'put',
        data
    });
};

export const deleteReadingSummary = (id) => {
    return request({
        url: `http://localhost:9090/api/reading-summary/${id}`,
        method: 'delete'
    });
};

export const batchDeleteReadingSummary = (ids) => {
    return request({
        url: 'http://localhost:9090/api/reading-summary/batch',
        method: 'delete',
        data: ids
    });
};

export const exportReadingSummary = () => {
    return request({
        url: 'http://localhost:9090/api/reading-summary/export',
        method: 'get',
        responseType: 'blob'
    });
};

// 数据分析工具相关API
export const fetchDataAnalysisData = (params = {}) => {
    return request({
        url: 'http://localhost:9090/api/data-analysis/list',
        method: 'get',
        params
    });
};

export const addDataAnalysis = (data) => {
    return request({
        url: 'http://localhost:9090/api/data-analysis',
        method: 'post',
        data
    });
};

export const updateDataAnalysis = (data) => {
    return request({
        url: 'http://localhost:9090/api/data-analysis',
        method: 'put',
        data
    });
};

export const deleteDataAnalysis = (id) => {
    return request({
        url: `http://localhost:9090/api/data-analysis/${id}`,
        method: 'delete'
    });
};

export const batchDeleteDataAnalysis = (ids) => {
    return request({
        url: 'http://localhost:9090/api/data-analysis/batch',
        method: 'delete',
        data: ids
    });
};

export const exportDataAnalysis = () => {
    return request({
        url: 'http://localhost:9090/api/data-analysis/export',
        method: 'get',
        responseType: 'blob'
    });
};

// 图像绘画工具相关API
export const fetchImageDrawingData = (params = {}) => {
    return request({
        url: 'http://localhost:9090/api/image-drawing/list',
        method: 'get',
        params
    });
};

export const addImageDrawing = (data) => {
    return request({
        url: 'http://localhost:9090/api/image-drawing',
        method: 'post',
        data
    });
};

export const updateImageDrawing = (data) => {
    return request({
        url: 'http://localhost:9090/api/image-drawing',
        method: 'put',
        data
    });
};

export const deleteImageDrawing = (id) => {
    return request({
        url: `http://localhost:9090/api/image-drawing/${id}`,
        method: 'delete'
    });
};

export const batchDeleteImageDrawing = (ids) => {
    return request({
        url: 'http://localhost:9090/api/image-drawing/batch',
        method: 'delete',
        data: ids
    });
};

export const exportImageDrawing = () => {
    return request({
        url: 'http://localhost:9090/api/image-drawing/export',
        method: 'get',
        responseType: 'blob'
    });
};

// 资源导航相关API
export const fetchResourceNavigationData = (params = {}) => {
    return request({
        url: 'http://localhost:9090/api/resource-navigation/list',
        method: 'get',
        params
    });
};

export const addResourceNavigation = (data) => {
    return request({
        url: 'http://localhost:9090/api/resource-navigation',
        method: 'post',
        data
    });
};

export const updateResourceNavigation = (data) => {
    return request({
        url: 'http://localhost:9090/api/resource-navigation',
        method: 'put',
        data
    });
};

export const deleteResourceNavigation = (id) => {
    return request({
        url: `http://localhost:9090/api/resource-navigation/${id}`,
        method: 'delete'
    });
};

export const batchDeleteResourceNavigation = (ids) => {
    return request({
        url: 'http://localhost:9090/api/resource-navigation/batch',
        method: 'delete',
        data: ids
    });
};

export const exportResourceNavigation = () => {
    return request({
        url: 'http://localhost:9090/api/resource-navigation/export',
        method: 'get',
        responseType: 'blob'
    });
};

// AI思维导图工具相关API
export const fetchAiMindmapToolsData = (params = {}) => {
    return request({
        url: 'http://localhost:9090/api/ai-mindmap-tools/list',
        method: 'get',
        params
    });
};

export const addAiMindmapTool = (data) => {
    return request({
        url: 'http://localhost:9090/api/ai-mindmap-tools',
        method: 'post',
        data
    });
};

export const updateAiMindmapTool = (data) => {
    return request({
        url: 'http://localhost:9090/api/ai-mindmap-tools',
        method: 'put',
        data
    });
};

export const deleteAiMindmapTool = (id) => {
    return request({
        url: `http://localhost:9090/api/ai-mindmap-tools/${id}`,
        method: 'delete'
    });
};

export const batchDeleteAiMindmapTools = (ids) => {
    return request({
        url: 'http://localhost:9090/api/ai-mindmap-tools/batch',
        method: 'delete',
        data: ids
    });
};

export const exportAiMindmapTools = () => {
    return request({
        url: 'http://localhost:9090/api/ai-mindmap-tools/export',
        method: 'get',
        responseType: 'blob'
    });
};

// 管理员相关API
export const login = (data: any) => {
    return request({
        url: 'http://localhost:9090/api/admin/login',
        method: 'post',
        params: data
    });
};

export const fetchAdminData = (params = {}) => {
    return request({
        url: 'http://localhost:9090/api/admin/page',
        method: 'get',
        params
    });
};

export const addAdmin = (data) => {
    return request({
        url: 'http://localhost:9090/api/admin',
        method: 'post',
        data
    });
};

export const updateAdmin = (data) => {
    return request({
        url: 'http://localhost:9090/api/admin',
        method: 'put',
        data
    });
};

export const deleteAdmin = (id) => {
    return request({
        url: `http://localhost:9090/api/admin/${id}`,
        method: 'delete'
    });
};

export const batchDeleteAdmin = (ids) => {
    return request({
        url: 'http://localhost:9090/api/admin/batch',
        method: 'delete',
        data: ids
    });
};

export const resetAdminPassword = (id, password) => {
    return request({
        url: 'http://localhost:9090/api/admin/password',
        method: 'put',
        params: { id, password }
    });
};

// 公告管理相关API
export const fetchNoticeData = (params = {}) => {
    return request({
        url: 'http://localhost:9090/api/notice/page',
        method: 'get',
        params
    });
};

export const getNoticeById = (id) => {
    return request({
        url: `http://localhost:9090/api/notice/${id}`,
        method: 'get'
    });
};

export const addNotice = (data) => {
    return request({
        url: 'http://localhost:9090/api/notice',
        method: 'post',
        data
    });
};

export const updateNotice = (data) => {
    return request({
        url: 'http://localhost:9090/api/notice',
        method: 'put',
        data
    });
};

export const deleteNotice = (id) => {
    return request({
        url: `http://localhost:9090/api/notice/${id}`,
        method: 'delete'
    });
};

export const batchDeleteNotice = (ids) => {
    return request({
        url: 'http://localhost:9090/api/notice/batch',
        method: 'delete',
        data: ids
    });
};

export const exportNotice = () => {
    return request({
        url: '/notice/export',
        method: 'get',
        responseType: 'blob'
    });
};

export const getNoticeCount = () => {
    return request({
        url: 'http://localhost:9090/api/notice/statistics',
        method: 'get'
    });
};

export const getToolsCount = () => {
    return request({
        url: 'http://localhost:9090/api/tools/statistics',
        method: 'get'
    });
};

export const updateAdminInfo = (data: any) => {
    return request({
        url: 'http://localhost:9090/api/admin/info/update',
        method: 'post',
        data
    });
};

export const updateAdminAvatar = (data: any) => {
    return request({
        url: 'http://localhost:9090/api/admin/avatar/update',
        method: 'post',
        data
    });
};

export const updateAdminPassword = (data: any) => {
    return request({
        url: 'http://localhost:9090/api/admin/password/update',
        method: 'post',
        data
    });
};

// 反馈管理相关API
export const getFeedbackList = (params: any) => {
    return request({
        url: 'http://localhost:9090/api/feedback/list',
        method: 'get',
        params,
        timeout: 10000,
        headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/json'
        }
    });
};

export const processFeedback = (id: number) => {
    return request({
        url: `http://localhost:9090/api/feedback/process/${id}`,
        method: 'put',
        timeout: 10000,
        headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/json'
        }
    });
};

export const deleteFeedback = (id: number) => {
    return request({
        url: `http://localhost:9090/api/feedback/${id}`,
        method: 'delete',
        timeout: 10000,
        headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/json'
        }
    });
};
