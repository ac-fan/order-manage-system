package com.qst.dao.provider;

import com.qst.pojo.Provider;

import java.sql.Connection;
import java.util.List;


public interface ProviderDao {

    //通过供应商编码或供应商名称查询供应商总数
    int getProviderCount(Connection connection, String proCode, String proName)throws Exception;

    // 通过供应商名称、编码获取供应商列表-模糊查询-providerList
    List<Provider> getProviderList(Connection connection, String proName, String proCode, int currentPageNo, int pageSize)throws Exception;

    //增加供应商
    int add(Connection connection, Provider provider)throws Exception;

    //通过proId删除Provider
    int deleteProviderById(Connection connection, String delId)throws Exception;

    //通过proId获取Provider
    Provider getProviderById(Connection connection, String id)throws Exception;

    // 修改用户信息
    int modify(Connection connection, Provider provider)throws Exception;

}
