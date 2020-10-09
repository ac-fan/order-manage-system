package com.qst.service.user;

import com.qst.pojo.User;

import java.util.List;

public interface UserService {

    //增加用户信息
    boolean add(User user);

    //用户登录
    User login(String userCode, String password);

    //根据条件查询用户列表
    List<User> getUserList(String queryUserName, int queryUserRole, int currentPageNo, int pageSize);

    //查询记录数
    int getUserCount(String username, int userRole);

    //根据userCode查询出User
    User selectUserCodeExist(String userCode);

    //根据ID删除user
    boolean deleteUserById(Integer delId);

    //根据ID查找user
    User getUserById(String id);

    //修改用户信息
    boolean modify(User user);

    //根据用户ID修改密码
    boolean updatePwd(int id, String password) throws Exception;
}
