import axios from 'axios';
import { ElMessage } from 'element-plus';

const service = axios.create({
    timeout: 10000,
    withCredentials: true
});

// 请求拦截器
service.interceptors.request.use(
    config => {
        // 可以在这里添加token等认证信息
        return config;
    },
    error => {
        console.log(error);
        return Promise.reject(error);
    }
);

// 响应拦截器
service.interceptors.response.use(
    response => {
        // 如果响应成功但业务状态码不是200，可以在这里统一处理
        return response;
    },
    error => {
        console.log('err', error);
        // 处理网络错误
        let message = error.message;
        if (error.response) {
            switch (error.response.status) {
                case 400:
                    message = '请求错误';
                    break;
                case 401:
                    message = '未授权，请登录';
                    break;
                case 403:
                    message = '拒绝访问';
                    break;
                case 404:
                    message = `请求地址出错: ${error.response.config.url}`;
                    break;
                case 408:
                    message = '请求超时';
                    break;
                case 500:
                    message = '服务器内部错误';
                    break;
                case 501:
                    message = '服务未实现';
                    break;
                case 502:
                    message = '网关错误';
                    break;
                case 503:
                    message = '服务不可用';
                    break;
                case 504:
                    message = '网关超时';
                    break;
                case 505:
                    message = 'HTTP版本不受支持';
                    break;
                default:
                    break;
            }
        }
        ElMessage.error(message);
        return Promise.reject(error);
    }
);

export default service;