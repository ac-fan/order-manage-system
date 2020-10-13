package com.qst.servlet.user;

import com.qst.pojo.User;
import com.qst.service.user.UserService;
import com.qst.service.user.UserServiceImpl;
import com.qst.util.Constants;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;


@SuppressWarnings("serial")
public class LoginServlet extends HttpServlet {
    //接受用户参数、调用业务层、转发视图
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        System.out.println("User tried to login");
        //获取用户名和密码
        String userCode = req.getParameter("userCode");
        String userPassword = req.getParameter("userPassword");
        //调用service方法，进行用户匹配
        UserService userService = new UserServiceImpl();
        User user = userService.login(userCode, userPassword);
        if (null != user) {
            System.out.println("User:[ " + userCode + " ] Login Succeed");
            //放入session
            req.setCharacterEncoding("UTF-8");
            req.getSession().setAttribute(Constants.USER_SESSION, user);
            //页面跳转（frame.jsp）
//            resp.sendRedirect("jsp/frame.jsp");// 旧跳转
            resp.sendRedirect("jsp/home.jsp");//跳转到新首页

        } else {
            System.out.println("User:[ " + userCode + " ] Login Failed");
            //页面跳转（login.jsp）带出提示信息--转发
            req.setCharacterEncoding("UTF-8");
            req.setAttribute("error", "用户名或密码不正确");
            req.getRequestDispatcher("login.jsp").forward(req, resp);
        }
    }
}
