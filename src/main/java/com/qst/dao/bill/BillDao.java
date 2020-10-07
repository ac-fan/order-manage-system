package com.qst.dao.bill;

import com.qst.pojo.Bill;

import java.sql.Connection;
import java.util.List;

/**
 * Interface BillDao
 *
 * @author sve1r
 * @description
 * @date 2020/10/7
 */


public interface BillDao {
    /**
     * 增加订单
     *
     * @param connection
     * @param bill
     * @return
     * @throws Exception
     */
    public int add(Connection connection, Bill bill) throws Exception;


    /**
     * 通过查询条件获取供应商列表-模糊查询-getBillList
     *
     * @param connection
     * @param bill
     * @return
     * @throws Exception
     */
    List<Bill> getBillList(Connection connection, Bill bill) throws Exception;

    /**
     * 通过delId删除Bill
     *
     * @param connection
     * @param delId
     * @return
     * @throws Exception
     */
    int deleteBillById(Connection connection, String delId) throws Exception;


    /**
     * 通过billId获取Bill
     *
     * @param connection
     * @param id
     * @return
     * @throws Exception
     */
    Bill getBillById(Connection connection, String id) throws Exception;

    /**
     * 修改订单信息
     *
     * @param connection
     * @param bill
     * @return
     * @throws Exception
     */
    int modify(Connection connection, Bill bill) throws Exception;

    /**
     * 根据供应商ID查询订单数量
     *
     * @param connection
     * @param providerId
     * @return
     * @throws Exception
     */
    int getBillCountByProviderId(Connection connection, String providerId) throws Exception;

}
