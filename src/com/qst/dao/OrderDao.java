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
    int add();

    //通过 id 修改订单
    int modify();

    //通过 id 删除订单
    int deleteByOrderById();

    //通过 id 查询订单
    int selectOrderById();

    //通过筛选条件查询订单
    List<Order> getOrderList();

    //通过供应商 id 查询订单数量
    int getOrderCountByProviderId();
}
