package com.qst.service.bill;

import com.qst.dao.BaseDao;
import com.qst.dao.bill.BillDao;
import com.qst.dao.bill.BillDaoImpl;
import com.qst.pojo.Bill;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;


public class BillServiceImpl implements BillService {

    private final BillDao billDao;

    public BillServiceImpl() {
        billDao = new BillDaoImpl();
    }

    /**
     * 订单添加方法
     *
     * @param bill
     * @return
     */
    @Override
    public boolean add(Bill bill) {
        boolean flag = false;
        Connection connection = null;
        try {
            connection = BaseDao.getConnection();
            connection.setAutoCommit(false);//开启JDBC事务管理
            if (billDao.add(connection, bill) > 0) {
                flag = true;
            }
            connection.commit();
        } catch (Exception e) {
            e.printStackTrace();
            try {
                System.out.println("[SQL]:发生错误,事务回滚...");
                assert connection != null;
                connection.rollback();
            } catch (SQLException e1) {
                e1.printStackTrace();
            }
        } finally {
            //在service层进行connection连接的关闭
            BaseDao.closeResource(connection, null, null);
        }
        return flag;
    }

    /**
     * 获取订单集合
     *
     * @param productname,providerid,ispayment
     * @return java.util.List<com.qst.pojo.Bill>
     */
    @Override
    public List<Bill> getBillList(String productname, int providerid, int ispayment, int currentPageNo, int pageSize) {
        Connection connection = null;
        List<Bill> billList = null;

        try {
            connection = BaseDao.getConnection();
            billList = billDao.getBillList(connection, productname, providerid, ispayment, currentPageNo, pageSize);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            BaseDao.closeResource(connection, null, null);
        }
        return billList;
    }

    /**
     * 根据订单 id 删除订单
     *
     * @param delId
     * @return
     */
    @Override
    public boolean deleteBillById(String delId) {
        Connection connection = null;
        boolean flag = false;
        try {
            connection = BaseDao.getConnection();
            if (billDao.deleteBillById(connection, delId) > 0) {
                flag = true;
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            BaseDao.closeResource(connection, null, null);
        }
        return flag;
    }

    /**
     * 根据订单 id 查询订单方法实现
     *
     * @param id
     * @return
     */
    @Override
    public Bill getBillById(String id) {
        Bill bill = null;
        Connection connection = null;
        try {
            connection = BaseDao.getConnection();
            bill = billDao.getBillById(connection, id);
        } catch (Exception e) {
            e.printStackTrace();
            bill = null;
        } finally {
            BaseDao.closeResource(connection, null, null);
        }
        return bill;
    }

    /**
     * 修改订单方法实现
     *
     * @param bill
     * @return
     */
    @Override
    public boolean modify(Bill bill) {
        Connection connection = null;
        boolean flag = false;
        try {
            connection = BaseDao.getConnection();
            if (billDao.modify(connection, bill) > 0) {
                flag = true;
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            //关闭资源
            BaseDao.closeResource(connection, null, null);
        }
        return flag;
    }

    //查询记录数
    @Override
    public int getBillCount(String productname, int providerid, int ispayment) {
        Connection connection = null;
        int count = 0;

        try {
            connection = BaseDao.getConnection();
            count = billDao.getBillCount(connection, productname, providerid, ispayment);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            BaseDao.closeResource(connection, null, null);
        }
        return count;
    }
}
