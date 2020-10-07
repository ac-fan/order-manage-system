package com.qst.dao.impl;

import com.qst.dao.OrderDao;
import com.qst.entity.Order;
import com.qst.util.DbUtil;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

/**
 * Class OrderDaoImpl
 *
 * @author sve1r
 * @description
 * @date 2020/10/6
 */


public class OrderDaoImpl implements OrderDao {

    @Override
    /**
     * @Author sve1r
     * @description 添加订单方法
     * @date 2020/10/7
     * @param [order]
     * @return boolean
     **/
    public boolean add(Order order) {
        PreparedStatement pstmt = null;
        boolean flag = false;  //设置标识符
        Connection connection = DbUtil.getConnection();
        String sql = "insert into smbms_order(orderCode,productName,productDesc," +
                "productUnit,productCount,totalPrice,isPayment,providerId,createdBy,creationDate)" +
                "values(?,?,?,?,?,?,?,?,?,?)";
        DbUtil.initPreparedStatement(sql);

        if (connection != null) {
            DbUtil.setParameters(
                    order.getId(), order.getProductName(), order.getProductDesc(), order.getProductUnit(),
                    order.getProductCount(), order.getTotalPrice(), order.getIsPayment(), order.getProviderId(),
                    order.getCreatedBy(), order.getCreationDate()
            );
            flag = DbUtil.executeUpdate();

            DbUtil.releaseResource();
            System.out.println("添加成功!");
        }
        return flag;
    }

    @Override
    /**
     * @Author sve1r
     * @description 根据订单 id 和订单对象修改订单
     * @date 2020/10/7
     * @param [orderId, order]
     * @return boolean
     **/
    public boolean modify(String orderId, Order order) {
        boolean flag = false;
        PreparedStatement pstmt = null;

        Connection connection = DbUtil.getConnection();
        if (connection != null) {
            String sql = "update smbms_bill set productName= ?," +
                    "productDesc=?,productUnit=?,productCount=?," +
                    "totalPrice=?,isPayment=?,providerId=?,modifyBy=?," +
                    "modifyDate=? where id= ?";
            DbUtil.setParameters(
                    order.getProductName(), order.getProductDesc(),
                    order.getProductUnit(), order.getProductCount(),
                    order.getTotalPrice(), order.getIsPayment(), order.getProviderId(),
                    order.getModifyBy(), order.getModifyDate()
            );
            flag = DbUtil.executeUpdate();
            DbUtil.releaseResource();
        }
        return flag;
    }

    @Override
    /**
     * @Author sve1r
     * @description 根据订单 id 删除订单
     * @date 2020/10/7
     * @param [orderId]
     * @return boolean
     **/
    public boolean deleteOrderById(String orderId) {
        PreparedStatement pstmt = null;
        boolean flag = false;

        Connection connection = DbUtil.getConnection();
        if (connection != null) {
            String sql = "delete from smbms_bill where id = ?";
            DbUtil.initPreparedStatement(sql);
            DbUtil.setParameters(orderId);
            flag = DbUtil.executeUpdate();
            DbUtil.releaseResource();
        }
        return flag;
    }


    @Override
    /**
     * @Author sve1r
     * @description 根据订单 id 查询订单
     * @date 2020/10/6
     * @param [orderId]
     * @return com.qst.entity.Order
     **/
    public Order selectOrderById(String orderId) {
        Order order = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        Connection connection = DbUtil.getConnection();
        if (connection != null) {
            String sql = "select o.*,p.pName as productName from smbms_order o, smbms_provider p where o.providerId = p.id and o.id = ?";
            DbUtil.initPreparedStatement(sql);
            DbUtil.setParameters(orderId);
            DbUtil.executeQuery();
            rs = DbUtil.getResultSet();
            try {
                if (rs.next()) {
                    order = new Order();
                    order.setId(rs.getInt("id"));
                    order.setBillCode(rs.getString("orderCode"));
                    order.setProductName(rs.getString("productName"));
                    order.setProductDesc(rs.getString("productDesc"));
                    order.setProductUnit(rs.getString("productUnit"));
                    order.setProductCount(rs.getBigDecimal("productCount"));
                    order.setTotalPrice(rs.getBigDecimal("totalPrice"));
                    order.setIsPayment(rs.getInt("isPayment"));
                    order.setProviderId(rs.getInt("providerId"));
                    order.setProviderName(rs.getString("providerName"));
                    order.setModifyBy(rs.getInt("modifyBy"));
                    order.setModifyDate(rs.getTimestamp("modifyDate"));
                }
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            }
            DbUtil.releaseResource();
        }
        return order;
    }

    @Override
    public List<Order> getOrderList(Order order) {

        return null;
    }

    @Override
    /**
     * @Author sve1r
     * @description 根据供应商 id 查询订单数量
     * @date 2020/10/7
     * @param [providerId]
     * @return int
     **/
    public int getOrderCountByProviderId(String providerId) {
        int count = 0;
        ResultSet rs;
        Connection connection = DbUtil.getConnection();

        if (connection != null) {
            String sql = "select count(1) as orderCount from smbms_bill where providerId=?";
            DbUtil.initPreparedStatement(sql);
            DbUtil.setParameters(providerId);
            rs = DbUtil.executeQuery();
            try {
                if (rs.next()) {
                    count = rs.getInt("orderCount");
                }
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            }
            DbUtil.releaseResource();
        }
        return count;
    }
}
