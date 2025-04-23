export interface ApiResponse<T = any> {
    code: string;
    msg: string;
    data: T;
}

export interface PageResult<T> {
    list: T[];
    total: number;
} 