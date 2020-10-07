package com.qst.dao.user;

import com.qst.pojo.User;

import java.sql.Connection;
import java.sql.SQLException;

public interface UserDao {

    //得到要登陆的用户
    User getLoginUser(Connection connection, String userCode, String userPassword) throws SQLException;

    //修改当前用户密码
    int updatePwd(Connection connection, int id, String password) throws SQLException;

}
