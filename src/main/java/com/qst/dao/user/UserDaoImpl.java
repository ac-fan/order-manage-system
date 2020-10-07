package com.qst.dao.user;

import com.qst.dao.BaseDao;
import com.qst.pojo.User;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;


public class UserDaoImpl implements UserDao{
    //登陆
    public User getLoginUser(Connection connection, String userCode,String userPassword) throws SQLException {

        PreparedStatement pstm=null;
        ResultSet rs=null;
        User user=null;
        if(connection!=null) {
            String sql = "select * from smbms_user where userCode=?";
            Object[] params = {userCode};

                rs=BaseDao.execute(connection,pstm,rs,sql,params);

                if(rs.next()) {
                    user = new User();
                    user.setId(rs.getInt("id"));
                    user.setUserCode(rs.getString("userCode"));
                    user.setUserName(rs.getString("userName"));
                    user.setUserPassword(rs.getString("userPassword"));
                    user.setGender(rs.getInt("gender"));
                    user.setBirthday(rs.getDate("birthday"));
                    user.setPhone(rs.getString("phone"));
                    user.setAddress(rs.getString("address"));
                    user.setUserRole(rs.getInt("userRole"));
                    user.setCreatedBy(rs.getInt("createdBy"));
                    user.setCreationDate(rs.getTimestamp("creationDate"));
                    user.setModifyBy(rs.getInt("modifyBy"));
                    user.setModifyDate(rs.getTimestamp("modifyDate"));
                }
                BaseDao.closeResource(null,pstm,rs);
                if (user != null && !user.getUserPassword().equals(userPassword))
                    user = null;
        }

            return user;

    }


    //修改密码
    public int updatePwd(Connection connection, int id, String password) throws SQLException {
        PreparedStatement pstm = null;
        int execute = 0;
        if (connection!=null){
            String sql = "update smbms_user set userPassword = ? where id = ?";
            Object params[] = {password,id};
            execute = BaseDao.execute(connection, pstm, sql, params);
            BaseDao.closeResource(null,pstm,null);
        }

        return execute;
    }

    //根据用户名或者角色查询用户总数
//    public int getUserCount(Connection connection, String username, int userRole) throws SQLException {
//
//
//        PreparedStatement pstm = null;
//        ResultSet rs = null;
//        int count = 0;
//    }

}
