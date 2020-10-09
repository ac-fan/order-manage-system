package com.qst.dao.user;

import com.qst.pojo.Role;
import com.qst.pojo.User;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

public interface UserDao {

    //得到要登陆的用户
    User getLoginUser(Connection connection, String userCode, String userPassword) throws SQLException;

    //修改当前用户密码
    int updatePwd(Connection connection, int id, String password) throws SQLException;

    //查询用户总数
    int getUserCount(Connection connection, String username, int userRole) throws SQLException;

    //通过条件查询-userList
    List<User> getUserList(Connection connection, String userName, int userRole, int currentPageNo, int pageSize) throws Exception;

    //增加用户信息
    int add(Connection connection, User user) throws SQLException;

    //通过userId删除user
    int deleteUserById(Connection connection, Integer delId) throws Exception;

    //修改用户信息
    int modify(Connection connection, User user) throws Exception;

    //通过userId获取user
    User getUserById(Connection connection, String id) throws Exception;
}
