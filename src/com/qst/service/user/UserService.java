package com.qst.service.user;

import com.qst.pojo.User;

import java.sql.SQLException;
import java.util.List;


public interface UserService {

    //�����û���Ϣ
    boolean add(User user);

    //�û���¼
    User login(String userCode, String password);

    //����������ѯ�û��б�
    List<User> getUserList(String queryUserName, int queryUserRole, int currentPageNo, int pageSize);

    //��ѯ��¼��
    int getUserCount(String username, int userRole);

    //����userCode��ѯ��User
    User selectUserCodeExist(String userCode);

    //����IDɾ��user
    boolean deleteUserById(Integer delId);

    //����ID����user
    User getUserById(String id);

    //�޸��û���Ϣ
    boolean modify(User user);

    //�����û�ID�޸�����
    boolean updatePwd(int id, String password) throws Exception;
}
