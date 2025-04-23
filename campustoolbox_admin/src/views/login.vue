const submitForm = () => {
    loginForm.value.validate((valid: boolean) => {
        if (valid) {
            loading.value = true;
            loginApi(param).then(res => {
                loading.value = false;
                if (res.data.code === "200") {
                    localStorage.setItem('ms_username', param.username);
                    const now = new Date();
                    const loginTime = now.toLocaleString();
                    localStorage.setItem('loginTime', loginTime);
                    const token = res.data.data;
                    localStorage.setItem('ms_token', token);
                    ElMessage.success('登录成功');
                    router.push('/');
                } else {
                    ElMessage.error(res.data.msg);
                }
            });
        } else {
            ElMessage.error('请输入登录信息');
            return false;
        }
    });
}; 