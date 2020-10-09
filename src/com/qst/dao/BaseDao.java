package com.qst.dao;

import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;

/**
 * Class BaseDao
 *
 * @author sve1r
 * @description 公共 Dao
 * @date 2020/10/6
 */
public class BaseDao {

    static {
        init();
    }

    private static String driver;
    private static String url;
    private static String user;
    private static String password;

    public static void init() {
        Properties properties = new Properties();
        String configFile = "/WEB-INF/db.properties";
        InputStream is = BaseDao.class.getClassLoader().getResourceAsStream(configFile);
        try {
            properties.load(is);
        } catch (IOException e) {
            e.printStackTrace();
        }
        driver = properties.getProperty("driver");
        url = properties.getProperty("url");
        user = properties.getProperty("user");
        password = properties.getProperty("password");

    }

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

    public static ResultSet execute(Connection connection, PreparedStatement preparedStatement, ResultSet resultSet, String sql, Object[] params) throws Exception {
        //Ԥ�����sql����Ҫ���Σ�ֱ��ִ�м���
        preparedStatement = connection.prepareStatement(sql);
        for (int i = 0; i < params.length; i++) {
            preparedStatement.setObject(i + 1, params[i]);
        }
        resultSet = preparedStatement.executeQuery();//�����sql
        return resultSet;
    }

    public static int execute(Connection connection, PreparedStatement preparedStatement, String sql, Object[] params) throws Exception {
        int updateRows = 0;
        preparedStatement = connection.prepareStatement(sql);
        for (int i = 0; i < params.length; i++) {
            preparedStatement.setObject(i + 1, params[i]);
        }
        updateRows = preparedStatement.executeUpdate();
        return updateRows;
    }

    public static boolean closeResource(Connection connection, PreparedStatement preparedStatement, ResultSet resultSet) {
        boolean flag = true;
        if (resultSet != null) {
            try {
                resultSet.close();
                resultSet = null;//GC����
            } catch (SQLException e) {
                // TODO Auto-generated catch block
                e.printStackTrace();
                flag = false;
            }
        }
        if (preparedStatement != null) {
            try {
                preparedStatement.close();
                preparedStatement = null;//GC����
            } catch (SQLException e) {
                // TODO Auto-generated catch block
                e.printStackTrace();
                flag = false;
            }
        }
        if (connection != null) {
            try {
                connection.close();
                connection = null;//GC����
            } catch (SQLException e) {
                // TODO Auto-generated catch block
                e.printStackTrace();
                flag = false;
            }
        }

        return flag;
    }
}
