import axios from 'axios'

// 创建axios实例
const api = axios.create({
  baseURL: 'http://localhost:9090/api',
  timeout: 5000,
  headers: {
    'Content-Type': 'application/json',
    'Accept': 'application/json'
  }
})

export const BASE_URL = 'http://localhost:9090'

// 请求拦截器
api.interceptors.request.use(
  (config) => {
    return config
  },
  (error) => {
    console.error('请求错误:', error)
    return Promise.reject(error)
  }
)

// 响应拦截器
api.interceptors.response.use(
  (response) => {
    return response
  },
  (error) => {
    console.error('响应错误:', error)
    return Promise.reject(error)
  }
)

export const fetchCommonTools = async (params: {
  name?: string
  pageNum?: number
  pageSize?: number
}) => {
  try {
    const response = await api.get('/common-tools/list', { params })
    return response
  } catch (error) {
    throw error
  }
}

export const fetchResources = async (params: {
  pageNum?: number
  pageSize?: number
}) => {
  try {
    const response = await api.get('/resource-navigation/list', { params })
    return response
  } catch (error) {
    throw error
  }
}

export const fetchAiTools = async (params: {
  pageNum?: number
  pageSize?: number
}) => {
  try {
    const response = await api.get('/ai-tools/list', { params })
    return response
  } catch (error) {
    throw error
  }
}

export const fetchAiCodingTools = async (params: {
  pageNum?: number
  pageSize?: number
}) => {
  try {
    const response = await api.get('/ai-coding-tools/list', { params })
    return response
  } catch (error) {
    throw error
  }
}

export const fetchAiMindmapTools = async (params: {
  pageNum?: number
  pageSize?: number
}) => {
  try {
    const response = await api.get('/ai-mindmap-tools/list', { params })
    return response
  } catch (error) {
    throw error
  }
}

export const fetchMathModelTools = async (params: {
  pageNum?: number
  pageSize?: number
}) => {
  try {
    const response = await api.get('/math-model-tools/list', { params })
    return response
  } catch (error) {
    throw error
  }
}

export const fetchCodeHostingTools = async (params: {
  pageNum?: number
  pageSize?: number
}) => {
  try {
    const response = await api.get('/code-hosting-tools/list', { params })
    return response
  } catch (error) {
    throw error
  }
}

export const fetchCodingPracticeData = async (params: {
  name?: string
  isFree?: boolean
  pageNum?: number
  pageSize?: number
}) => {
  try {
    const response = await api.get('/coding-practice/list', { params })
    return response
  } catch (error) {
    throw error
  }
}

export const fetchDataAnalysisData = async (params: {
  name?: string
  isFree?: boolean
  pageNum?: number
  pageSize?: number
}) => {
  try {
    const response = await api.get('/data-analysis/list', { params })
    return response
  } catch (error) {
    throw error
  }
}

export const fetchFileConvertTools = async (params: {
  pageNum?: number
  pageSize?: number
}) => {
  try {
    const response = await api.get('/file-convert-tools/list', { params })
    return response
  } catch (error) {
    throw error
  }
}

export const fetchPaperCheckTools = async (params: {
  pageNum?: number
  pageSize?: number
}) => {
  try {
    const response = await api.get('/paper-check-tools/list', { params })
    return response
  } catch (error) {
    throw error
  }
}

export const fetchAcademicSearchTools = async (params: {
  pageNum?: number
  pageSize?: number
}) => {
  try {
    const response = await api.get('/academic-search-tools/list', { params })
    return response
  } catch (error) {
    throw error
  }
}

export const fetchTranslationTools = async (params: {
  pageNum?: number
  pageSize?: number
}) => {
  try {
    const response = await api.get('/translation-tools/list', { params })
    return response
  } catch (error) {
    throw error
  }
}

export const fetchCommunitySites = async (params: {
  pageNum?: number
  pageSize?: number
}) => {
  try {
    const response = await api.get('/community-sites/list', { params })
    return response
  } catch (error) {
    throw error
  }
}

export const fetchLawAssistants = async (params: {
  pageNum?: number
  pageSize?: number
}) => {
  try {
    const response = await api.get('/law-assistants/list', { params })
    return response
  } catch (error) {
    throw error
  }
}

export const fetchPptTools = async (params: {
  pageNum?: number
  pageSize?: number
}) => {
  try {
    const response = await api.get('/ppt-tools/list', { params })
    return response
  } catch (error) {
    throw error
  }
}

export const fetchAudioTools = async (params: {
  pageNum?: number
  pageSize?: number
}) => {
  try {
    const response = await api.get('/audio-tools/list', { params })
    return response
  } catch (error) {
    throw error
  }
}

export const fetchChartTools = async (params: {
  pageNum?: number
  pageSize?: number
}) => {
  try {
    const response = await api.get('/chart-tools/list', { params })
    return response
  } catch (error) {
    throw error
  }
}

export const fetchTeacherResourcesData = async (params: {
  pageNum?: number
  pageSize?: number
}) => {
  try {
    const response = await api.get('/teacher-resources/list', { params })
    return response
  } catch (error) {
    throw error
  }
}

export const fetchResumeTemplatesData = async (params: {
  pageNum?: number
  pageSize?: number
}) => {
  try {
    const response = await api.get('/resume-templates/list', { params })
    return response
  } catch (error) {
    throw error
  }
}

export const fetchFontIconsData = async (params: {
  name?: string
  isFree?: boolean
  pageNum?: number
  pageSize?: number
}) => {
  try {
    const response = await api.get('/font-icons/list', { params })
    return response
  } catch (error) {
    throw error
  }
}

export const fetchImageDrawingData = async (params: {
  name?: string
  isFree?: boolean
  pageNum?: number
  pageSize?: number
}) => {
  try {
    const response = await api.get('/image-drawing/list', { params })
    return response
  } catch (error) {
    throw error
  }
}

export const fetchReadingSummaryData = async (params: {
  name?: string
  isFree?: boolean
  pageNum?: number
  pageSize?: number
}) => {
  try {
    const response = await api.get('/reading-summary/list', { params })
    return response
  } catch (error) {
    throw error
  }
}

export const fetchNotices = async (params: {
  pageNum?: number
  pageSize?: number
}) => {
  try {
    const response = await api.get('/notice/page', {
      params,
      timeout: 5000,
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json'
      }
    })

    if (!response) {
      throw new Error('没有收到响应')
    }

    if (!response.data) {
      throw new Error('响应中没有数据')
    }

    return response
  } catch (error: any) {
    console.error('获取公告失败:', error)
    throw error
  }
}

// 提交反馈
export const submitFeedback = (data: any) => {
  return api({
    url: '/feedback',
    method: 'post',
    data
  })
}

// 获取反馈列表
export const getFeedbackList = async (params: {
    pageNum?: number
    pageSize?: number
}) => {
    try {
        console.log('开始获取反馈列表，参数:', params);
        const response = await api.get('/feedback/list', {
            params,
            timeout: 10000,
            headers: {
                'Content-Type': 'application/json',
                'Accept': 'application/json'
            }
        });

        console.log('反馈列表API响应:', response);

        if (!response) {
            throw new Error('没有收到响应');
        }

        if (!response.data) {
            throw new Error('响应中没有数据');
        }

        return response;
    } catch (error) {
        console.error('获取反馈列表失败:', error);
        throw error;
    }
};

// 处理反馈
export const processFeedback = (id: number) => {
  return api({
    url: `/feedback/process/${id}`,
    method: 'put'
  })
}

// 删除反馈
export const deleteFeedback = (id: number) => {
  return api({
    url: `/feedback/${id}`,
    method: 'delete'
  })
}

// 批量处理反馈
export const batchProcessFeedback = (ids: number[]) => {
  return api({
    url: '/feedback/process/batch',
    method: 'put',
    data: ids,
    timeout: 10000,
    headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json'
    }
  })
}

// 批量删除反馈
export const batchDeleteFeedback = (ids: number[]) => {
  return api({
    url: '/feedback/batch',
    method: 'delete',
    data: ids,
    timeout: 10000,
    headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json'
    }
  })
}

export default api
