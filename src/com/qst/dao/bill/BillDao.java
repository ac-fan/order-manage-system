package com.qst.dao.bill;

import com.qst.pojo.Bill;

import java.sql.Connection;
import java.util.List;

/**
 * Interface BillDao
 *
 * @author sve1r
 * @description 订单 dao
 * @date 2020/10/6
 */
public interface BillDao {

    /**
     * 新增订单接口
     *
     * @param connection
     * @param bill
     * @return
     * @throws Exception
     */
    int add(Connection connection, Bill bill) throws Exception;

    /**
     * 获取订单列表
     *
     * @param connection
     * @param productname
     * @param providerid
     * @param ispayment
     * @param currentPageNo
     * @param pageSize
     * @return
     * @throws Exception
     */
    List<Bill> getBillList(Connection connection, String productname, int providerid, int ispayment, int currentPageNo, int pageSize) throws Exception;

    /**
     * 根据订单 id 删除订单
     *
     * @param connection
     * @param delId
     * @return
     * @throws Exception
     */
    int deleteBillById(Connection connection, String delId) throws Exception;

    /**
     * 根据 id 查询订单
     *
     * @param connection
     * @param id
     * @return
     * @throws Exception
     */
    Bill getBillById(Connection connection, String id) throws Exception;

    /**
     * 修改订单
     *
     * @param connection
     * @param bill
     * @return
     * @throws Exception
     */
    int modify(Connection connection, Bill bill) throws Exception;

    /**
     * 根据供应商 id 查询订单数量
     *
     * @param connection
     * @param providerId
     * @return
     * @throws Exception
     */
    int getBillCountByProviderId(Connection connection, String providerId) throws Exception;

    /**
     * 根据产品名或者供应商或者是否支付查询订单总数
     *
     * @param connection
     * @param productname
     * @param providerid
     * @param ispayment
     * @return
     * @throws Exception
     */
    int getBillCount(Connection connection, String productname, int providerid, int ispayment) throws Exception;

}
