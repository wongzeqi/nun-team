package com.nun.team.authority.mapper;

import com.nun.team.authority.bean.SysPermission;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface UserPermissionMapper {
    List<SysPermission> findByUserName(String userName);
}
