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
        try {
            Properties props = new Properties();
            //通过反射获取类加载器
            InputStream in = BaseDao.class.getResourceAsStream("db.properties");
            props.load(in);


            //从 props 中获取键值
            url = props.getProperty("db.url");
            user = props.getProperty("db.username");
            password = props.getProperty("db.password");
            driver = props.getProperty("db.driver");


        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private static void init2() {
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
            driver = properties.getProperty("driver");
            url = properties.getProperty("url");
            user = properties.getProperty("user");
            password = properties.getProperty("password");
        } catch (IOException e) {
            e.printStackTrace();
        }

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
        //预编译的sql不需要传参，直接执行即可
        preparedStatement = connection.prepareStatement(sql);
        for (int i = 0; i < params.length; i++) {
            preparedStatement.setObject(i + 1, params[i]);
        }
        resultSet = preparedStatement.executeQuery();//新添加sql
        return resultSet;
    }

    //static
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
