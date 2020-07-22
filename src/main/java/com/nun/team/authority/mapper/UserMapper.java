package com.nun.team.authority.mapper;

import com.nun.team.authority.bean.SysUser;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface UserMapper {
	SysUser findByUserName(String userName);
}
