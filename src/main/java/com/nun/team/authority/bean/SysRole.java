package com.nun.team.authority.bean;

import com.nun.team.base.bean.BaseEntity;
import lombok.Data;

import java.io.Serializable;

@Data
public class SysRole extends BaseEntity implements Serializable {

    private Integer id;

    private String name;

    private String memo;
}
