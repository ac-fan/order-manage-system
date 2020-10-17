package com.qst.service.role;

import com.qst.pojo.Role;

import java.util.List;

public interface RoleService {
    /**
     * 角色列表查询
     *
     * @return
     */
    List<Role> getRoleList();
}
