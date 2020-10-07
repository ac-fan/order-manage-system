package com.qst.util;

import java.io.IOException;
import java.io.InputStream;
import java.sql.*;
import java.util.Properties;

/**
 * Class DbUtil
 *
 * @author sve1r
 * @description 数据库公共操作类
 * @date 2020/10/6
 */


public class DbUtil {
    private static String driver;
    private static String url;
    private static String username;
    private static String password;
    private static Connection connection = null;
    private static PreparedStatement pstmt = null;
    private static ResultSet rs = null;

    //静态块加载资源
    static {
        init();
    }

    //类加载时初始化
    private static void init() {
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
    public static PreparedStatement initPreparedStatement(String sql) {
        if (connection == null || sql.isEmpty()) {
            return null;
        }
        try {
            pstmt = connection.prepareStatement(sql);
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return pstmt;
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

    //执行查询语句
    public static ResultSet executeQuery() {
        try {
            rs = pstmt.executeQuery();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return rs;
    }

    //获得查询结果集合
    public static ResultSet getResultSet() {
        return rs;
    }

    //执行更新语句
    public static Boolean executeUpdate() {
        int count = 0;
        try {
            count = pstmt.executeUpdate();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return (count > 0);
    }

    //释放资源
    public static void releaseResource() {
        boolean flag = true;
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
    }
}
