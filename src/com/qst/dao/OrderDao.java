package com.qst.dao;

import com.qst.entity.Order;

import java.util.List;

/**
 * Interface OrderDao
 *
 * @author sve1r
 * @description 订单查询接口
 * @date 2020/10/6
 */


public interface OrderDao {

    //添加订单
    boolean add(Order order);

    //通过 id 修改订单
    boolean modify(String orderId, Order order);

    //通过 id 删除订单
    boolean deleteOrderById(String orderId);

    //通过 id 查询订单
    Order selectOrderById(String orderId);

    //通过筛选条件查询订单
    List<Order> getOrderList(Order order);

    //通过供应商 id 查询订单数量
    int getOrderCountByProviderId(String providerId);
}
