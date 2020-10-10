package com.qst.dao;


import java.io.IOException;
import java.io.InputStream;
import java.sql.*;
import java.util.Properties;
import java.util.ResourceBundle;

/**
 * 操作数据库的基类--静态类
 *
 * @author Administrator
 */
public class BaseDao {
    private static String driver;
    private static String url;
    private static String user;
    private static String password;

    static {
        //静态代码块,在类加载的时候执行
        init1();
//        init2();
    }

    private static void init2() {
        ResourceBundle resource = ResourceBundle.getBundle("com/qst/dao/db");
        driver = resource.getString("driver");
        url = resource.getString("url");
        user = resource.getString("username");
        password = resource.getString("password");

    }

    //写死数据库相应数据
    public static void init1() {
        driver = "com.mysql.cj.jdbc.Driver";
        url = "jdbc:mysql://cdb-nzp5bzla.bj.tencentcdb.com:10192/smbms?useSSL=false&useUnicode=true";
        user = "smbms";
        password = "smbms123456";
    }

    //初始化连接参数,从配置文件里获得
    public static void init() {
        Properties properties = new Properties();
        String configFile = "db.properties";
        InputStream is = BaseDao.class.getResourceAsStream(configFile);
        try {
            properties.load(is);
            System.out.println(is);
            driver = properties.getProperty("driver");
            url = properties.getProperty("url");
            user = properties.getProperty("username");
            password = properties.getProperty("password");
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    //获取连接
    public static Connection getConnection() {
        Connection connection = null;
        try {
            Class.forName(driver);
            connection = DriverManager.getConnection(url, user, password);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return connection;
    }

    //获取查询结果集
    public static ResultSet execute(Connection connection, PreparedStatement preparedStatement, ResultSet resultSet, String sql, Object[] params) throws Exception {
        //预编译的sql不需要传参，直接执行即可
        preparedStatement = connection.prepareStatement(sql);
        for (int i = 0; i < params.length; i++) {
            preparedStatement.setObject(i + 1, params[i]);
        }
        resultSet = preparedStatement.executeQuery();//新添加sql
        return resultSet;
    }

    //执行其他更新结果
    public static int execute(Connection connection, PreparedStatement preparedStatement, String sql, Object[] params) throws Exception {
        int updateRows = 0;
        preparedStatement = connection.prepareStatement(sql);
        for (int i = 0; i < params.length; i++) {
            preparedStatement.setObject(i + 1, params[i]);
        }
        updateRows = preparedStatement.executeUpdate();
        return updateRows;
    }

    //关闭并释放资源
    public static boolean closeResource(Connection connection, PreparedStatement preparedStatement, ResultSet resultSet) {
        boolean flag = true;
        if (resultSet != null) {
            try {
                resultSet.close();
            } catch (SQLException e) {
                e.printStackTrace();
                flag = false;
            }
        }
        if (preparedStatement != null) {
            try {
                preparedStatement.close();
            } catch (SQLException e) {
                e.printStackTrace();
                flag = false;
            }
        }
        if (connection != null) {
            try {
                connection.close();
            } catch (SQLException e) {
                e.printStackTrace();
                flag = false;
            }
        }
        return flag;
    }
}
