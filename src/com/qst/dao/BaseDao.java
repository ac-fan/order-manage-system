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
    }

    /**
     * 使用 ResourceBundle 类读取配置文件信息
     */
    private static void init1() {
        ResourceBundle resource;
        String bundle = "com/qst/dao/db";
        try {
            resource = ResourceBundle.getBundle(bundle);
            driver = resource.getString("driver");
            url = resource.getString("url");
            user = resource.getString("username");
            password = resource.getString("password");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    /**
     * 初始化连接参数,从配置文件里获得
     */
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

    /**
     * 获取连接
     *
     * @return
     */
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

    /**
     * 获取查询结果集
     *
     * @param connection
     * @param preparedStatement
     * @param resultSet
     * @param sql
     * @param params
     * @return
     * @throws Exception
     */
    public static ResultSet execute(Connection connection, PreparedStatement preparedStatement, ResultSet resultSet, String sql, Object[] params) throws Exception {
        //预编译的sql不需要传参，直接执行即可
        preparedStatement = connection.prepareStatement(sql);
        for (int i = 0; i < params.length; i++) {
            preparedStatement.setObject(i + 1, params[i]);
        }
        //新添加sql
        resultSet = preparedStatement.executeQuery();
        return resultSet;
    }

    /**
     * 执行其他更新结果
     *
     * @param connection
     * @param preparedStatement
     * @param sql
     * @param params
     * @return
     * @throws Exception
     */
    public static int execute(Connection connection, PreparedStatement preparedStatement, String sql, Object[] params) throws Exception {
        int updateRows = 0;
        preparedStatement = connection.prepareStatement(sql);
        for (int i = 0; i < params.length; i++) {
            preparedStatement.setObject(i + 1, params[i]);
        }
        updateRows = preparedStatement.executeUpdate();
        return updateRows;
    }

    /**
     * 关闭并释放资源
     *
     * @param connection
     * @param preparedStatement
     * @param resultSet
     * @return
     */
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
