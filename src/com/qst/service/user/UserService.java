package com.qst.service.user;

import com.qst.pojo.User;

import java.util.List;

public interface UserService {

    /**
     * 增加用户信息
     *
     * @param user
     * @return
     */
    boolean add(User user);

    /**
     * 用户登录
     *
     * @param userCode
     * @param password
     * @return
     */
    User login(String userCode, String password);

    /**
     * 根据条件查询用户列表
     *
     * @param queryUserName
     * @param queryUserRole
     * @param currentPageNo
     * @param pageSize
     * @return
     */
    List<User> getUserList(String queryUserName, int queryUserRole, int currentPageNo, int pageSize);

    /**
     * 查询记录数
     *
     * @param username
     * @param userRole
     * @return
     */
    int getUserCount(String username, int userRole);

    /**
     * 根据userCode查询出User
     *
     * @param userCode
     * @return
     */
    User selectUserCodeExist(String userCode);

    /**
     * 根据ID删除user
     *
     * @param delId
     * @return
     */
    boolean deleteUserById(Integer delId);

    /**
     * 根据ID查找user
     *
     * @param id
     * @return
     */
    User getUserById(String id);

    /**
     * 修改用户信息
     *
     * @param user
     * @return
     */
    boolean modify(User user);

    /**
     * 根据用户ID修改密码
     *
     * @param id
     * @param password
     * @return
     * @throws Exception
     */
    boolean updatePwd(int id, String password) throws Exception;
}
