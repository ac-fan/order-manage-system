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
    //�����û�����������ҵ��㡢ת����ͼ
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // TODO �Զ����ɵķ������

        System.out.println("���ڵ�½ ============ ");
        System.out.println("������");
        System.out.println("����");
        //��ȡ�û���������
        String userCode = req.getParameter("userCode");
        String userPassword = req.getParameter("userPassword");
        //����service�����������û�ƥ��
        UserService userService = new UserServiceImpl();
        User user = userService.login(userCode, userPassword);
        if (null != user) {//��¼�ɹ�
            System.out.println("��¼�ɹ� ============ ");
            //����session
            req.getSession().setAttribute(Constants.USER_SESSION, user);
            //ҳ����ת��frame.jsp��
            resp.sendRedirect("jsp/frame.jsp");
        } else {
            System.out.println("��¼ʧ�� ============ ");
            //ҳ����ת��login.jsp��������ʾ��Ϣ--ת��
            req.setAttribute("error", "�û��������벻��ȷ");
            req.getRequestDispatcher("login.jsp").forward(req, resp);
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // TODO �Զ����ɵķ������
        doGet(req, resp);
    }
}
