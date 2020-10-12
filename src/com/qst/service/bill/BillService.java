package com.qst.service.bill;

import com.qst.pojo.Bill;

import java.util.List;


public interface BillService {
    /**
     * 添加订单抽象方法
     *
     * @param bill
     * @return
     */
    boolean add(Bill bill);

    /**
     * 通过条件获取订单列表-模糊查询-billList
     *
     * @param bill
     * @return
     */
    List<Bill> getBillList(Bill bill);

    /**
     * 根据订单 id 删除订单
     *
     * @param delId
     * @return
     */
    boolean deleteBillById(String delId);


    /**
     * 根据订单 id 查询订单
     *
     * @param id
     * @return
     */
    Bill getBillById(String id);

    /**
     * 修改订单
     *
     * @param bill
     * @return
     */
    boolean modify(Bill bill);

}
