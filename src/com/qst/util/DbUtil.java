package com.qst.util;

import java.io.IOException;
import java.io.InputStream;
import java.sql.*;
import java.util.Properties;

/**
 * Class DbUtil
 *
 * @author sve1r
 * @description
 * @date 2020/10/6
 */


public class DbUtil {
    private static final String driver;
    private static final String url;
    private static final String username;
    private static final String password;
    private static Connection connection = null;
    private static PreparedStatement pstmt = null;
    private static ResultSet rs = null;

    //静态块加载资源
    static {
        Properties properties = new Properties();
        //通过类加载器读取对应的资源
        InputStream is = DbUtil.class.getClassLoader().getResourceAsStream("static/db.properties");

        try {
            properties.load(is);
        } catch (IOException e) {
            e.printStackTrace();
        }

        driver = properties.getProperty("driver");
        url = properties.getProperty("url");
        username = properties.getProperty("username");
        password = properties.getProperty("password");
    }

    //获取数据库的链接
    public static Connection getConnection() {
        try {
            Class.forName(driver);
            connection = DriverManager.getConnection(url, username, password);
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }
        return connection;
    }

    //创建语句
    public static void initPreparedStatement(String sql) {
        if (connection == null || sql.isEmpty()) {
            return;
        }
        try {
            pstmt = connection.prepareStatement(sql);
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }

    }

    //设置语句变量
    public static void setParameters(Object... args) {
        if (pstmt == null || args == null) {
            return;
        }
        try {
            for (int i = 0; i < args.length; i++) {
                pstmt.setObject(i + 1, args[i]);
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
    }

    //执行语句
    public ResultSet executeQuery() {
        try {
            rs = pstmt.executeQuery();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return rs;
    }

    //执行更新语句
    public Boolean executeUpdate() {
        int count = 0;
        try {
            count = pstmt.executeUpdate();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        if (count > 0) {
            return true;
        } else {
            return false;
        }
    }

    //释放资源
    public static Boolean releaseResource() {
        Boolean flag = true;
        if (rs != null) {
            try {
                rs.close();
                //关闭并置空
                rs = null;
            } catch (SQLException throwables) {
                throwables.printStackTrace();
                flag = false;
            }
        }
        if (pstmt != null) {
            try {
                pstmt.close();
                //关闭并置空
                pstmt = null;
            } catch (SQLException throwables) {
                throwables.printStackTrace();
                flag = false;
            }
        }
        if (connection != null) {
            try {
                connection.close();
                //关闭并置空
                connection = null;
            } catch (SQLException throwables) {
                throwables.printStackTrace();
                flag = false;
            }
        }
        return flag;
    }
}
