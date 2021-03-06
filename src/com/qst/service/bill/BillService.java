package com.qst.service.bill;

import com.qst.pojo.Bill;

import java.util.List;

/**
 * Class BillService
 *
 * @author sve1r
 * @description 订单服务接口
 * @date 2020/10/10
 */
public interface BillService {
    /**
     * 添加订单抽象方法
     *
     * @param bill
     * @return
     */
    boolean add(Bill bill);

    /**
     * 通过条件获取订单列表-billList
     *
     * @param productname
     * @param providerid
     * @param ispayment
     * @param currentPageNo
     * @param pageSize
     * @return
     */
    List<Bill> getBillList(String productname, int providerid, int ispayment, int currentPageNo, int pageSize);

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

    /**
     * 根据产品名或者供应商或者是否支付查询订单总数
     *
     * @param productname
     * @param providerid
     * @param ispayment
     * @return
     */
    int getBillCount(String productname, int providerid, int ispayment);
}
