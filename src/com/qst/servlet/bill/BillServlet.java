package com.qst.servlet.bill;

import java.io.IOException;
import java.io.PrintWriter;
import java.math.BigDecimal;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;


import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.alibaba.fastjson.JSONArray;
import com.mysql.cj.util.StringUtils;
import com.qst.pojo.Bill;
import com.qst.pojo.Provider;
import com.qst.pojo.User;
import com.qst.service.bill.BillService;
import com.qst.service.bill.BillServiceImpl;
import com.qst.service.provider.ProviderService;
import com.qst.service.provider.ProviderServiceImpl;
import com.qst.util.Constants;
import com.qst.util.PageSupport;

/**
 * Class BillServlet
 *
 * @author sve1r
 * @description 订单 Servlet
 * @date 2020/10/12
 */
@SuppressWarnings("serial")
public class BillServlet extends HttpServlet {

    /**
     * Destruction of the servlet. <br>
     */
    @Override
    public void destroy() {
        super.destroy();
    }

    /**
     * The doGet method of the servlet. <br>
     * <p>
     * This method is called when a form has its tag value method equals to get.
     *
     * @param request  the request send by the client to the server
     * @param response the response send by the server to the client
     * @throws ServletException if an error occurred
     * @throws IOException      if an error occurred
     */
    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        doPost(request, response);
    }

    /**
     * The doPost method of the servlet. <br>
     * <p>
     * This method is called when a form has its tag value method equals to post.
     *
     * @param request  the request send by the client to the server
     * @param response the response send by the server to the client
     * @throws ServletException if an error occurred
     * @throws IOException      if an error occurred
     */
    @Override
    public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
		/*String totalPrice = request.getParameter("totalPrice");
		//23.234   45
		BigDecimal totalPriceBigDecimal =
				//设置规则，小数点保留两位，多出部分，ROUND_DOWN 舍弃
				//ROUND_HALF_UP 四舍五入(5入) ROUND_UP 进位
				//ROUND_HALF_DOWN 四舍五入（5不入）
				new BigDecimal(totalPrice).setScale(2,BigDecimal.ROUND_DOWN);*/
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
            this.getBillById(request, response, "billview.jsp");
        } else if ("modify".equals(method)) {
            this.getBillById(request, response, "billmodify.jsp");
        } else if ("modifysave".equals(method)) {
            this.modify(request, response);
        } else if ("delbill".equals(method)) {
            this.delBill(request, response);
        } else if ("getproviderlist".equals(method)) {
            this.getProviderlist(request, response);
        }

    }

    private void getProviderlist(HttpServletRequest request, HttpServletResponse response)
            throws IOException {

        System.out.println("getproviderlist ========================= ");
        int pageSize = Constants.pageSize;

        int currentPageNo = 1;
        List<Provider> providerList;
        ProviderService providerService = new ProviderServiceImpl();
        providerList = providerService.getProviderList("", "", currentPageNo, pageSize);
        //把providerList转换成json对象输出
        response.setContentType("application/json");
        PrintWriter outPrintWriter = response.getWriter();
        outPrintWriter.write(JSONArray.toJSONString(providerList));
        outPrintWriter.flush();
        outPrintWriter.close();
    }

    private void getBillById(HttpServletRequest request, HttpServletResponse response, String url)
            throws ServletException, IOException {
        String id = request.getParameter("billid");
        if (!StringUtils.isNullOrEmpty(id)) {
            BillService billService = new BillServiceImpl();
            Bill bill = null;
            bill = billService.getBillById(id);
            request.setAttribute("bill", bill);
            request.getRequestDispatcher(url).forward(request, response);
        }
    }

    private void modify(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        System.out.println("modify===============");
        String id = request.getParameter("id");
        String productName = request.getParameter("productName");
        String productDesc = request.getParameter("productDesc");
        String productUnit = request.getParameter("productUnit");
        String productCount = request.getParameter("productCount");
        String totalPrice = request.getParameter("totalPrice");
        String providerId = request.getParameter("providerId");
        String isPayment = request.getParameter("isPayment");

        Bill bill = new Bill();
        bill.setId(Integer.valueOf(id));
        bill.setProductName(productName);
        bill.setProductDesc(productDesc);
        bill.setProductUnit(productUnit);
        bill.setProductCount(new BigDecimal(productCount).setScale(2, BigDecimal.ROUND_DOWN));
        bill.setIsPayment(Integer.parseInt(isPayment));
        bill.setTotalPrice(new BigDecimal(totalPrice).setScale(2, BigDecimal.ROUND_DOWN));
        bill.setProviderId(Integer.parseInt(providerId));

        bill.setModifyBy(((User) request.getSession().getAttribute(Constants.USER_SESSION)).getId());
        bill.setModifyDate(new Date());
        boolean flag = false;
        BillService billService = new BillServiceImpl();
        flag = billService.modify(bill);
        if (flag) {
            response.sendRedirect(request.getContextPath() + "/jsp/bill.do?method=query");
        } else {
            request.getRequestDispatcher("billmodify.jsp").forward(request, response);
        }
    }

    private void delBill(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String id = request.getParameter("billid");
        HashMap<String, String> resultMap = new HashMap<>();
        if (!StringUtils.isNullOrEmpty(id)) {
            BillService billService = new BillServiceImpl();
            boolean flag = billService.deleteBillById(id);
            if (flag) {
                //删除成功
                resultMap.put("delResult", "true");
            } else {
                //删除失败
                resultMap.put("delResult", "false");
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

    private void add(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String billCode = request.getParameter("billCode");
        String productName = request.getParameter("productName");
        String productDesc = request.getParameter("productDesc");
        String productUnit = request.getParameter("productUnit");

        String productCount = request.getParameter("productCount");
        String totalPrice = request.getParameter("totalPrice");
        String providerId = request.getParameter("providerId");
        String isPayment = request.getParameter("isPayment");

        Bill bill = new Bill();
        bill.setBillCode(billCode);
        bill.setProductName(productName);
        bill.setProductDesc(productDesc);
        bill.setProductUnit(productUnit);
        bill.setProductCount(new BigDecimal(productCount).setScale(2, BigDecimal.ROUND_DOWN));
        bill.setIsPayment(Integer.parseInt(isPayment));
        bill.setTotalPrice(new BigDecimal(totalPrice).setScale(2, BigDecimal.ROUND_DOWN));
        bill.setProviderId(Integer.parseInt(providerId));
        bill.setCreatedBy(((User) request.getSession().getAttribute(Constants.USER_SESSION)).getId());
        bill.setCreationDate(new Date());
        boolean flag = false;
        BillService billService = new BillServiceImpl();
        flag = billService.add(bill);
        System.out.println("add flag -- > " + flag);
        if (flag) {
            response.sendRedirect(request.getContextPath() + "/jsp/bill.do?method=query");
        } else {
            request.getRequestDispatcher("billadd.jsp").forward(request, response);
        }
    }

    private void query(HttpServletRequest request, HttpServletResponse response) {

        String queryProductName = request.getParameter("queryProductName");
        String tempp = request.getParameter("queryProviderId");
        String tempi = request.getParameter("queryIsPayment");
        int queryProviderId = 0, queryIsPayment = 0;

        String pageIndex = request.getParameter("pageIndex");
        //第一此请求肯定是走第一页，页面大小固定的
        //设置页面容量
        int pageSize = Constants.pageSize;
        //把它设置在配置文件里,后面方便修改
        //当前页码
        int currentPageNo = 1;

        List<Provider> providerList = null;
        ProviderService providerService = new ProviderServiceImpl();
        providerList = providerService.getProviderList("", "", currentPageNo, pageSize);
        request.setAttribute("providerList", providerList);

        if (queryProductName == null) {
            queryProductName = "";
        }

        List<Bill> billList = null;
        BillService billService = new BillServiceImpl();


        if (tempi != null && !"".equals(tempi)) {
            queryIsPayment = Integer.parseInt(tempi);
        }
        if (tempp != null && !"".equals(tempp)) {
            queryProviderId = Integer.parseInt(tempp);
        }
        if (pageIndex != null) {
            currentPageNo = Integer.parseInt(pageIndex);
        }
        //获取总数（分页	上一页：下一页的情况）
        //总数量（表）
        int totalCount = billService.getBillCount(queryProductName, queryProviderId, queryIsPayment);

        //总页数支持
        PageSupport pageSupport = new PageSupport();
        pageSupport.setCurrentPageNo(currentPageNo);
        pageSupport.setPageSize(pageSize);
        pageSupport.setTotalCount(totalCount);
        //总共有几页
        int totalPageCount = pageSupport.getTotalPageCount();
        //(totalCount+pageSize-1/pageSize)取整
        // pageSupport.getTotalCount()

        //System.out.println("totalCount ="+totalCount);
        //System.out.println("pageSize ="+pageSize);
        //System.out.println("totalPageCount ="+totalPageCount);
        //控制首页和尾页
        //如果页面小于 1 就显示第一页的东西
        if (currentPageNo < 1) {
            currentPageNo = 1;
        } else if (currentPageNo > totalPageCount) {
            //如果页面大于了最后一页就显示最后一页
            currentPageNo = totalPageCount;
        }


        billList = billService.getBillList(queryProductName, queryProviderId, queryIsPayment, currentPageNo, pageSize);
        request.setAttribute("billList", billList);
        request.setAttribute("queryProductId", queryProviderId);
        request.setAttribute("queryIsPayment", queryIsPayment);
        request.setAttribute("totalCount", totalCount);
        request.setAttribute("currentPageNo", currentPageNo);
        request.setAttribute("totalPageCount", totalPageCount);

        try {
            request.getRequestDispatcher("billlist.jsp").forward(request, response);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }

    }

    public static void main(String[] args) {
        System.out.println(new BigDecimal("23.235").setScale(2, BigDecimal.ROUND_HALF_DOWN));
    }

    /**
     * Initialization of the servlet. <br>
     *
     * @throws ServletException if an error occurs
     */
    @Override
    public void init() throws ServletException {
        // Put your code here
    }

}
