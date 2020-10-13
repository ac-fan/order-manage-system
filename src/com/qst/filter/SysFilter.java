package com.qst.filter;

import com.qst.pojo.User;
import com.qst.util.Constants;

import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;


public class SysFilter implements Filter {
    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        System.out.println("SysFilter Initialized.");
    }

    @Override
    public void doFilter(ServletRequest req, ServletResponse resp, FilterChain chain)
            throws IOException, ServletException {

        HttpServletRequest request = (HttpServletRequest) req;
        HttpServletResponse response = (HttpServletResponse) resp;

        //过滤器，从session中获取用户
        User user = (User) request.getSession().getAttribute(Constants.USER_SESSION);
        if (user == null) {
            //已经被移除或者注销了，或者未登录
            //跳转到对应的错误页面
            response.sendRedirect("/error.jsp");
        } else {
            //调用过滤器
            chain.doFilter(req, resp);
        }
    }

    @Override
    public void destroy() {
        System.out.println("SysFilter Destroyed..");
    }

}
