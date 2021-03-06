package com.qst.dao.provider;


import com.qst.dao.BaseDao;
import com.qst.pojo.Provider;
import com.mysql.cj.util.StringUtils;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class ProviderDaoImpl implements ProviderDao {

    /**
     * 通过供应商编码或供应商名称查询供应商总数
     *
     * @param connection
     * @param proCode
     * @param proName
     * @return
     * @throws Exception
     */
    @Override
    public int getProviderCount(Connection connection, String proCode, String proName) throws Exception {
        PreparedStatement pstm = null;
        ResultSet rs = null;
        int count = 0;
        if (connection != null) {
            StringBuffer sql = new StringBuffer();
            sql.append("select count(1) as count from smbms_provider where 1=1");
            List<Object> list = new ArrayList<>();//存放参数
            if (!StringUtils.isNullOrEmpty(proCode)) {
                sql.append(" and proCode like ?");
                list.add("%" + proCode + "%");//index:0
            }
            if (!StringUtils.isNullOrEmpty(proName)) {
                sql.append(" and proName like ?");
                list.add("%" + proName + "%");//index:1
            }

            //把list转换为数组
            Object[] params = list.toArray();
            System.out.println("ProviderDaoImpl->getProviderCount:" + sql.toString());//输出最后完整的sql语句
            rs = BaseDao.execute(connection, pstm, rs, sql.toString(), params);
            if (rs.next()) {
                count = rs.getInt("count");//从结果集中获取最终的数量
            }
            BaseDao.closeResource(null, pstm, rs);
        }

        return count;
    }

    /**
     * 通过供应商名称、编码获取供应商列表-模糊查询-providerList
     *
     * @param connection
     * @param proName
     * @param proCode
     * @param currentPageNo
     * @param pageSize
     * @return
     * @throws Exception
     */
    @Override
    public List<Provider> getProviderList(Connection connection, String proName, String proCode, int currentPageNo, int pageSize)
            throws Exception {
        // TODO Auto-generated method stub
        PreparedStatement pstm = null;
        ResultSet rs = null;
        List<Provider> providerList = new ArrayList<>();
        if (connection != null) {
            StringBuffer sql = new StringBuffer();
            sql.append("select * from smbms_provider where 1=1 ");
            List<Object> list = new ArrayList<>();
            if (!StringUtils.isNullOrEmpty(proName)) {
                sql.append(" and proName like ?");
                list.add("%" + proName + "%");
            }
            if (!StringUtils.isNullOrEmpty(proCode)) {
                sql.append(" and proCode like ?");
                list.add("%" + proCode + "%");
            }
            //在数据中，分页使用 limit startIndex，pageSize 总数

            sql.append("order by creationDate DESC limit ?,?");
            currentPageNo = (currentPageNo - 1) * pageSize;
            list.add(currentPageNo);
            list.add(pageSize);

            Object[] params = list.toArray();
            System.out.println("sql ----> " + sql.toString());
            rs = BaseDao.execute(connection, pstm, rs, sql.toString(), params);
            while (rs.next()) {
                Provider _provider = new Provider();
                _provider.setId(rs.getInt("id"));
                _provider.setProCode(rs.getString("proCode"));
                _provider.setProName(rs.getString("proName"));
                _provider.setProDesc(rs.getString("proDesc"));
                _provider.setProContact(rs.getString("proContact"));
                _provider.setProPhone(rs.getString("proPhone"));
                _provider.setProAddress(rs.getString("proAddress"));
                _provider.setProFax(rs.getString("proFax"));
                _provider.setCreationDate(rs.getTimestamp("creationDate"));
                providerList.add(_provider);
            }
            BaseDao.closeResource(null, pstm, rs);
        }
        return providerList;
    }


    @Override
    public int add(Connection connection, Provider provider)
            throws Exception {
        // TODO Auto-generated method stub
        PreparedStatement pstm = null;
        int flag = 0;
        if (connection != null) {
            String sql = "insert into smbms_provider (proCode,proName,proDesc," +
                    "proContact,proPhone,proAddress,proFax,createdBy,creationDate) " +
                    "values(?,?,?,?,?,?,?,?,?)";
            Object[] params = {provider.getProCode(), provider.getProName(), provider.getProDesc(),
                    provider.getProContact(), provider.getProPhone(), provider.getProAddress(),
                    provider.getProFax(), provider.getCreatedBy(), provider.getCreationDate()};
            flag = BaseDao.execute(connection, pstm, sql, params);
            BaseDao.closeResource(null, pstm, null);
        }
        return flag;
    }


    @Override
    public int deleteProviderById(Connection connection, String delId)
            throws Exception {
        // TODO Auto-generated method stub
        PreparedStatement pstm = null;
        int flag = 0;
        if (null != connection) {
            String sql = "delete from smbms_provider where id=?";
            Object[] params = {delId};
            flag = BaseDao.execute(connection, pstm, sql, params);
            BaseDao.closeResource(null, pstm, null);
        }
        return flag;
    }


    @Override
    public Provider getProviderById(Connection connection, String id)
            throws Exception {
        // TODO Auto-generated method stub
        Provider provider = null;
        PreparedStatement pstm = null;
        ResultSet rs = null;
        if (null != connection) {
            String sql = "select * from smbms_provider where id=?";
            Object[] params = {id};
            rs = BaseDao.execute(connection, pstm, rs, sql, params);
            if (rs.next()) {
                provider = new Provider();
                provider.setId(rs.getInt("id"));
                provider.setProCode(rs.getString("proCode"));
                provider.setProName(rs.getString("proName"));
                provider.setProDesc(rs.getString("proDesc"));
                provider.setProContact(rs.getString("proContact"));
                provider.setProPhone(rs.getString("proPhone"));
                provider.setProAddress(rs.getString("proAddress"));
                provider.setProFax(rs.getString("proFax"));
                provider.setCreatedBy(rs.getInt("createdBy"));
                provider.setCreationDate(rs.getTimestamp("creationDate"));
                provider.setModifyBy(rs.getInt("modifyBy"));
                provider.setModifyDate(rs.getTimestamp("modifyDate"));
            }
            BaseDao.closeResource(null, pstm, rs);
        }
        return provider;
    }


    @Override
    public int modify(Connection connection, Provider provider)
            throws Exception {
        // TODO Auto-generated method stub
        int flag = 0;
        PreparedStatement pstm = null;
        if (null != connection) {
            String sql = "update smbms_provider set proName=?,proDesc=?,proContact=?," +
                    "proPhone=?,proAddress=?,proFax=?,modifyBy=?,modifyDate=? where id = ? ";
            Object[] params = {provider.getProName(), provider.getProDesc(), provider.getProContact(), provider.getProPhone(), provider.getProAddress(),
                    provider.getProFax(), provider.getModifyBy(), provider.getModifyDate(), provider.getId()};
            flag = BaseDao.execute(connection, pstm, sql, params);
            BaseDao.closeResource(null, pstm, null);
        }
        return flag;
    }
}
