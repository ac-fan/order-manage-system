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

public class LoginServlet extends HttpServlet {
    //Servlet:控制层，调用业务层代码
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        System.out.println("LoginServlet--start...");

        //获取用户名和密码
        String usercode=req.getParameter("userCode");
        String userPassword=req.getParameter("userPassword");

        //和数据库中的密码进行对比，调用业务层
        UserService userService=new UserServiceImpl();
        User user = userService.login(usercode, userPassword);//这里已经把登陆的人给查出来

        if(user!=null){
            //查有此人，可以登陆
            //将用户信息放到session中
            req.getSession().setAttribute(Constants.USER_SESSION,user);
            //跳转到主页
            resp.sendRedirect("jsp/frame.jsp");
            }else{
            //查无此人，无法登陆，转发回登陆页面，顺带提示用户名或者密码错误
            req.setAttribute("error","用户名或者密码错误");
            req.getRequestDispatcher("login.jsp").forward(req,resp);
        }

    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req, resp);
    }
}
