package com.nun.team.authority.bean;

import com.nun.team.base.bean.BaseEntity;
import lombok.Data;
import lombok.ToString;

import java.io.Serializable;

@Data
@ToString
public class SysUser extends BaseEntity implements Serializable{

	private Integer id;

	private String userName;

	private String password;

	private String status;
    
}
