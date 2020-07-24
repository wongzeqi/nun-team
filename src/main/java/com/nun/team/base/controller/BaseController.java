package com.nun.team.base.controller;

import com.nun.team.authority.bean.SysUser;
import com.nun.team.util.ShiroUtils;

public class BaseController {
    public SysUser getSysUser()
    {
        return ShiroUtils.getSysUser();
    }
}
