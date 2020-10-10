package com.qst.dao.user;

import com.qst.pojo.User;

import java.sql.Connection;
import java.util.List;

public interface UserDao {

    //增加用户信息
    int add(Connection connection, User user) throws Exception;

    //得到要登录的用户
    User getLoginUser(Connection connection, String userCode) throws Exception;

    //通过条件查询-userList
    List<User> getUserList(Connection connection, String userName, int userRole, int currentPageNo, int pageSize) throws Exception;

    //根据用户名或者角色查询用户总数
    int getUserCount(Connection connection, String username, int userRole) throws Exception;

    //通过userId删除user
    int deleteUserById(Connection connection, Integer delId) throws Exception;

    //通过userId获取user
    User getUserById(Connection connection, String id) throws Exception;

    //修改用户信息
    int modify(Connection connection, User user) throws Exception;

    //修改当前用户密码
    int updatePwd(Connection connection, int id, String password) throws Exception;


}
