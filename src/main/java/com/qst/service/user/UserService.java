package com.qst.service.user;

import com.qst.pojo.User;



public interface UserService {
    //用户登录
    //得到要登陆的用户
    public User login(String userCode,String password);

    //根据用户ID修改密码
    public boolean updatePwd(int id, String pwd);

}
