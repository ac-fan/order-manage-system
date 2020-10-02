package com.fan.service.user;

import com.fan.pojo.User;



public interface UserService {
    //用户登录
    //得到要登陆的用户
    public User login(String userCode,String password);
}
