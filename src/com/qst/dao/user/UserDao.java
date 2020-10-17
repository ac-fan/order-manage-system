package com.qst.dao.user;

import com.qst.pojo.User;

import java.sql.Connection;
import java.util.List;

public interface UserDao {

    /**
     * 增加用户信息
     *
     * @param connection
     * @param user
     * @return
     * @throws Exception
     */
    int add(Connection connection, User user) throws Exception;

    /**
     * 得到要登录的用户
     *
     * @param connection
     * @param userCode
     * @return
     * @throws Exception
     */
    User getLoginUser(Connection connection, String userCode) throws Exception;

    /**
     * 通过条件查询-userList
     *
     * @param connection
     * @param userName
     * @param userRole
     * @param currentPageNo
     * @param pageSize
     * @return
     * @throws Exception
     */
    List<User> getUserList(Connection connection, String userName, int userRole, int currentPageNo, int pageSize) throws Exception;

    /**
     * 根据用户名或者角色查询用户总数
     *
     * @param connection
     * @param username
     * @param userRole
     * @return
     * @throws Exception
     */
    int getUserCount(Connection connection, String username, int userRole) throws Exception;

    /**
     * 通过userId删除user
     *
     * @param connection
     * @param delId
     * @return
     * @throws Exception
     */
    int deleteUserById(Connection connection, Integer delId) throws Exception;

    /**
     * 通过userId获取user
     *
     * @param connection
     * @param id
     * @return
     * @throws Exception
     */
    User getUserById(Connection connection, String id) throws Exception;

    /**
     * 修改用户信息
     *
     * @param connection
     * @param user
     * @return
     * @throws Exception
     */
    int modify(Connection connection, User user) throws Exception;

    /**
     * 修改当前用户密码
     *
     * @param connection
     * @param id
     * @param password
     * @return
     * @throws Exception
     */
    int updatePwd(Connection connection, int id, String password) throws Exception;

}
