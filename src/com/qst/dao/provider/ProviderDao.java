package com.qst.dao.provider;

import com.qst.pojo.Provider;

import java.sql.Connection;
import java.util.List;


public interface ProviderDao {

    int add(Connection connection, Provider provider) throws Exception;

    List<Provider> getProviderList(Connection connection, String proName, String proCode) throws Exception;

    int deleteProviderById(Connection connection, String delId) throws Exception;

    Provider getProviderById(Connection connection, String id) throws Exception;

    int modify(Connection connection, Provider provider) throws Exception;

}
