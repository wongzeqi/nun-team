package com.nun.team.authority.controller;

import com.nun.team.authority.bean.SysMenu;
import com.nun.team.authority.service.ISysMenuService;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import org.springframework.web.bind.annotation.*;

import java.util.List;


/**
 * 菜单信息
 * 
 * @author numberone
 */
@Controller
@RequestMapping("/menu")
public class SysMenuController {
    private String prefix = "menu";

    @Autowired
    private ISysMenuService menuService;

    @RequiresPermissions("system:menu:view")
    @GetMapping("/menu")
    public String menu()
    {
        return prefix + "/menu";
    }

    @RequiresPermissions("system:menu:list")
    @GetMapping("/list")
    @ResponseBody
    public List<SysMenu> list(SysMenu menu)
    {
        List<SysMenu> menuList = menuService.selectMenuList(menu);
        return menuList;
    }
//
//    /**
//     * 删除菜单
//     */
//    //@Log(title = "菜单管理", businessType = BusinessType.DELETE)
//    @RequiresPermissions("system:menu:remove")
//    @PostMapping("/remove/{menuId}")
//    @ResponseBody
//    public AjaxResult remove(@PathVariable("menuId") Long menuId)
//    {
//        if (menuService.selectCountMenuByParentId(menuId) > 0)
//        {
//            return error(1, "存在子菜单,不允许删除");
//        }
//        if (menuService.selectCountRoleMenuByMenuId(menuId) > 0)
//        {
//            return error(1, "菜单已分配,不允许删除");
//        }
//        ShiroUtils.clearCachedAuthorizationInfo();
//        return toAjax(menuService.deleteMenuById(menuId));
//    }
//
//    /**
//     * 新增
//     */
//    @GetMapping("/add/{parentId}")
//    public String add(@PathVariable("parentId") Long parentId, ModelMap mmap)
//    {
//        SysMenu menu = null;
//        if (0L != parentId)
//        {
//            menu = menuService.selectMenuById(parentId);
//        }
//        else
//        {
//            menu = new SysMenu();
//            menu.setMenuId(0L);
//            menu.setMenuName("主目录");
//        }
//        mmap.put("menu", menu);
//        return prefix + "/add";
//    }
//
//    /**
//     * 新增保存菜单
//     */
//    @Log(title = "菜单管理", businessType = BusinessType.INSERT)
//    @RequiresPermissions("system:menu:add")
//    @PostMapping("/add")
//    @ResponseBody
//    public AjaxResult addSave(SysMenu menu)
//    {
//        menu.setCreateBy(ShiroUtils.getLoginName());
//        ShiroUtils.clearCachedAuthorizationInfo();
//        return toAjax(menuService.insertMenu(menu));
//    }
//
//    /**
//     * 修改菜单
//     */
//    @GetMapping("/edit/{menuId}")
//    public String edit(@PathVariable("menuId") Long menuId, ModelMap mmap)
//    {
//        mmap.put("menu", menuService.selectMenuById(menuId));
//        return prefix + "/edit";
//    }
//
//    /**
//     * 修改保存菜单
//     */
//    @Log(title = "菜单管理", businessType = BusinessType.UPDATE)
//    @RequiresPermissions("system:menu:edit")
//    @PostMapping("/edit")
//    @ResponseBody
//    public AjaxResult editSave(SysMenu menu)
//    {
//        menu.setUpdateBy(ShiroUtils.getLoginName());
//        ShiroUtils.clearCachedAuthorizationInfo();
//        return toAjax(menuService.updateMenu(menu));
//    }
//
//    /**
//     * 选择菜单图标
//     */
//    @GetMapping("/icon")
//    public String icon()
//    {
//        return prefix + "/icon";
//    }
//
//    /**
//     * 校验菜单名称
//     */
//    @PostMapping("/checkMenuNameUnique")
//    @ResponseBody
//    public String checkMenuNameUnique(SysMenu menu)
//    {
//        return menuService.checkMenuNameUnique(menu);
//    }
//
//    /**
//     * 加载角色菜单列表树
//     */
//    @GetMapping("/roleMenuTreeData")
//    @ResponseBody
//    public List<Map<String, Object>> roleMenuTreeData(SysRole role)
//    {
//        List<Map<String, Object>> tree = menuService.roleMenuTreeData(role);
//        return tree;
//    }
//
//    /**
//     * 加载所有菜单列表树
//     */
//    @GetMapping("/menuTreeData")
//    @ResponseBody
//    public List<Map<String, Object>> menuTreeData(SysRole role)
//    {
//        List<Map<String, Object>> tree = menuService.menuTreeData();
//        return tree;
//    }
//
//    /**
//     * 选择菜单树
//     */
//    @GetMapping("/selectMenuTree/{menuId}")
//    public String selectMenuTree(@PathVariable("menuId") Long menuId, ModelMap mmap)
//    {
//        mmap.put("menu", menuService.selectMenuById(menuId));
//        return prefix + "/tree";
//    }
}