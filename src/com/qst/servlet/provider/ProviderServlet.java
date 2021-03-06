package com.qst.servlet.provider;

import com.alibaba.fastjson.JSONArray;
import com.mysql.cj.util.StringUtils;
import com.qst.pojo.Provider;
import com.qst.pojo.User;
import com.qst.service.provider.ProviderService;
import com.qst.service.provider.ProviderServiceImpl;
import com.qst.util.Constants;
import com.qst.util.PageSupport;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

@SuppressWarnings("serial")
public class ProviderServlet extends HttpServlet {

    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String method = request.getParameter("method");
        User u = (User) request.getSession().getAttribute(Constants.USER_SESSION);
        Integer userRole = u.getUserRole();
        if (userRole == 2) {
            request.getRequestDispatcher("no_permission.jsp").forward(request, response);
        } else if ("query".equals(method)) {
            this.query(request, response);
        } else if ("add".equals(method)) {
            this.add(request, response);
        } else if ("view".equals(method)) {
            this.getProviderById(request, response, "providerview.jsp");
        } else if ("modify".equals(method)) {
            this.getProviderById(request, response, "providermodify.jsp");
        } else if ("modifysave".equals(method)) {
            this.modify(request, response);
        } else if ("delprovider".equals(method)) {
            this.delProvider(request, response);
        }
    }

    /**
     * 查询供应商列表
     *
     * @param request
     * @param response
     * @throws ServletException
     * @throws IOException
     */
    private void query(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        //从前端获取数据
        String queryProName = request.getParameter("queryProName");
        String queryProCode = request.getParameter("queryProCode");
        String pageIndex = request.getParameter("pageIndex");

        ProviderServiceImpl providerService = new ProviderServiceImpl();

        //第一次运行页面，一定是第一页，页面大小是固定的
        int pageSize = 5;
        int currentPageNo = 1;

        if (StringUtils.isNullOrEmpty(queryProName)) {
            queryProName = "";
        }
        if (StringUtils.isNullOrEmpty(queryProCode)) {
            queryProCode = "";
        }
        if (pageIndex != null) {
            currentPageNo = Integer.parseInt(pageIndex);
        }
        //获取用户的总数
        int totalCount = providerService.getProviderCount(queryProName, queryProCode);
        //总页数支持
        PageSupport pageSupport = new PageSupport();
        pageSupport.setCurrentPageNo(currentPageNo);
        pageSupport.setPageSize(pageSize);
        pageSupport.setTotalCount(totalCount);
        int totalPageCount = pageSupport.getTotalPageCount();
        //控制首页和尾页
        //如果页面小于1，就显示第一页
        if (currentPageNo < 1) {
            currentPageNo = 1;
        } else if (currentPageNo > totalPageCount) {//当前页数大于尾页数
            currentPageNo = totalPageCount;
        }

        //获取供应商列表展示
        List<Provider> providerList = providerService.getProviderList(queryProName, queryProCode, currentPageNo, pageSize);
        request.setAttribute("providerList", providerList);
        request.setAttribute("totalCount", totalCount);
        request.setAttribute("currentPageNo", currentPageNo);
        request.setAttribute("totalPageCount", totalPageCount);
        request.setAttribute("queryProName", queryProName);
        request.setAttribute("queryProCode", queryProCode);
        request.getRequestDispatcher("providerlist.jsp").forward(request, response);
    }

    /**
     * 增加供应商
     *
     * @param request
     * @param response
     * @throws ServletException
     * @throws IOException
     */
    private void add(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String proCode = request.getParameter("proCode");
        String proName = request.getParameter("proName");
        String proContact = request.getParameter("proContact");
        String proPhone = request.getParameter("proPhone");
        String proAddress = request.getParameter("proAddress");
        String proFax = request.getParameter("proFax");
        String proDesc = request.getParameter("proDesc");

        Provider provider = new Provider();
        provider.setProCode(proCode);
        provider.setProName(proName);
        provider.setProContact(proContact);
        provider.setProPhone(proPhone);
        provider.setProFax(proFax);
        provider.setProAddress(proAddress);
        provider.setProDesc(proDesc);
        provider.setCreatedBy(((User) request.getSession().getAttribute(Constants.USER_SESSION)).getId());
        provider.setCreationDate(new Date());
        boolean flag = false;
        ProviderService providerService = new ProviderServiceImpl();
        flag = providerService.add(provider);
        if (flag) {
            response.sendRedirect(request.getContextPath() + "/jsp/provider.do?method=query");
        } else {
            request.getRequestDispatcher("provideradd.jsp").forward(request, response);
        }
    }

    /**
     * 通过proId删除Provider
     *
     * @param request
     * @param response
     * @throws ServletException
     * @throws IOException
     */
    private void delProvider(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String id = request.getParameter("proid");
        HashMap<String, String> resultMap = new HashMap<>();
        if (!StringUtils.isNullOrEmpty(id)) {
            ProviderService providerService = new ProviderServiceImpl();
            int flag = providerService.deleteProviderById(id);
            if (flag == 0) {
                //删除成功
                resultMap.put("delResult", "true");
            } else if (flag == -1) {
                //删除失败
                resultMap.put("delResult", "false");
            } else if (flag > 0) {
                //该供应商下有订单，不能删除，返回订单数
                resultMap.put("delResult", String.valueOf(flag));
            }
        } else {
            resultMap.put("delResult", "notexit");
        }
        //把resultMap转换成json对象输出
        response.setContentType("application/json");
        PrintWriter outPrintWriter = response.getWriter();
        outPrintWriter.write(JSONArray.toJSONString(resultMap));
        outPrintWriter.flush();
        outPrintWriter.close();
    }

    /**
     * 修改供应商
     *
     * @param request
     * @param response
     * @throws ServletException
     * @throws IOException
     */
    private void modify(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String proName = request.getParameter("proName");
        String proContact = request.getParameter("proContact");
        String proPhone = request.getParameter("proPhone");
        String proAddress = request.getParameter("proAddress");
        String proFax = request.getParameter("proFax");
        String proDesc = request.getParameter("proDesc");
        String id = request.getParameter("id");
        Provider provider = new Provider();

        provider.setProName(proName);
        provider.setId(Integer.valueOf(id));
        provider.setProContact(proContact);
        provider.setProPhone(proPhone);
        provider.setProFax(proFax);
        provider.setProAddress(proAddress);
        provider.setProDesc(proDesc);
        provider.setModifyBy(((User) request.getSession().getAttribute(Constants.USER_SESSION)).getId());
        provider.setModifyDate(new Date());
        boolean flag = false;
        ProviderService providerService = new ProviderServiceImpl();
        flag = providerService.modify(provider);
        if (flag) {
            response.sendRedirect(request.getContextPath() + "/jsp/provider.do?method=query");
        } else {
            request.getRequestDispatcher("providermodify.jsp").forward(request, response);
        }
    }

    /**
     * 通过proId获取Provider
     *
     * @param request
     * @param response
     * @param url
     * @throws ServletException
     * @throws IOException
     */
    private void getProviderById(HttpServletRequest request, HttpServletResponse response, String url)
            throws ServletException, IOException {
        String id = request.getParameter("proid");
        if (!StringUtils.isNullOrEmpty(id)) {
            ProviderService providerService = new ProviderServiceImpl();
            Provider provider = null;
            provider = providerService.getProviderById(id);
            request.setAttribute("provider", provider);
            request.getRequestDispatcher(url).forward(request, response);
        }
    }

}
