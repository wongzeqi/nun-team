package com.nun.team.authority.mapper;

import com.nun.team.authority.bean.SysRole;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface UserRoleMapper {
    List<SysRole> findByUserName(String userName);
}
