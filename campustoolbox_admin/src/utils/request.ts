// 需要先安装axios依赖: npm install axios @types/axios
import axios, { AxiosInstance, AxiosError, AxiosResponse, InternalAxiosRequestConfig } from 'axios';

const request = axios.create({
    baseURL: 'http://localhost:9090',  // 修改为后端实际端口 9090
    timeout: 5000
});

// 请求拦截器
request.interceptors.request.use(
    config => {
        const token = localStorage.getItem('token');
        if (token) {
            config.headers['token'] = token;
        }
        return config;
    },
    error => {
        return Promise.reject(error);
    }
);

// 响应拦截器
request.interceptors.response.use(
    (response: AxiosResponse) => {
        if (response.status === 200) {
            return response.data;
        }
        return Promise.reject(response);
    },
    (error: AxiosError) => {
        console.error('请求错误:', error);
        return Promise.reject(error);
    }
);

export default request;
