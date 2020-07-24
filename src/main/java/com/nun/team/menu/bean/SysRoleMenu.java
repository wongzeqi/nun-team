package com.nun.team.menu.bean;


import com.nun.team.base.bean.BaseEntity;
import lombok.Data;

/**
 * 角色和菜单关联 sys_role_menu
 * 
 * @author numberone
 */
@Data
public class SysRoleMenu extends BaseEntity
{
    /** 角色ID */
    private Long roleId;
    
    /** 菜单ID */
    private Long menuId;

}
