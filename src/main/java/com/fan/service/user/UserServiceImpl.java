package com.fan.service.user;

import com.fan.dao.BaseDao;
import com.fan.dao.user.UserDao;
import com.fan.dao.user.UserDaoImpl;
import com.fan.pojo.User;
import org.junit.Test;


import java.sql.Connection;
import java.sql.SQLException;

public class UserServiceImpl implements UserService {

    //业务层会调用dao层，所以我们要引入dao层
    private UserDao userDao;
    public UserServiceImpl(){
        userDao=new UserDaoImpl();
    }

    public User login(String userCode, String password) {
        Connection connection=null;
        User user=null;


        try {
            connection=BaseDao.getConnection();
            //通过业务层调用对应的数据库操作
            user = userDao.getLoginUser(connection, userCode);
        } catch (SQLException e) {
            e.printStackTrace();
        }finally {
            BaseDao.closeResource(connection,null,null);
        }

        return user;
    }


}
