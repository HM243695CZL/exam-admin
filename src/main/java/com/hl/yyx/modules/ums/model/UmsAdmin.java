package com.hl.yyx.modules.ums.model;

import com.baomidou.mybatisplus.annotation.*;

import java.util.Date;
import java.io.Serializable;
import java.util.List;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonIgnore;
import com.hl.yyx.common.vo.BaseModelDTO;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import lombok.EqualsAndHashCode;

import javax.validation.constraints.NotBlank;

/**
 * <p>
 * 管理员表
 * </p>
 *
 * @author hl243695czyn
 * @since 2022-06-20
 */
@Data
@EqualsAndHashCode(callSuper = false)
@TableName("ums_admin")
@ApiModel(value = "UmsAdmin对象", description = "管理员表")
public class UmsAdmin extends BaseModelDTO implements Serializable {

    private static final long serialVersionUID = 1L;

    @TableId(value = "id", type = IdType.ASSIGN_UUID)
    private String id;

    @ApiModelProperty(value = "管理员名称")
    @NotBlank(message = "用户名不能为空")
    private String username;

    @ApiModelProperty(value = "昵称")
    private String nickName;

    @ApiModelProperty(value = "用户类型  1：教师  2：学生")
    private Integer userType;

    @ApiModelProperty(value = "管理员密码")
    @JsonIgnore
    private String password;

    @ApiModelProperty(value = "学号/工号")
    private String number;

    @ApiModelProperty(value = "学院id")
    private String collegeId;

    @ApiModelProperty(value = "学院名称")
    @TableField(exist = false)
    private String collegeName;

    @ApiModelProperty(value = "专业id")
    private String majorId;

    @ApiModelProperty(value = "专业名称")
    @TableField(exist = false)
    private String majorName;

    @ApiModelProperty(value = "班级id")
    private String classId;

    @ApiModelProperty(value = "班级名称")
    @TableField(exist = false)
    private String className;

    @ApiModelProperty(value = "部门id")
    private String deptId;

    @ApiModelProperty(value = "部门名称")
    @TableField(exist = false)
    private String deptName;

    @ApiModelProperty(value = "性别  0：男  1：女")
    private Integer sex;

    @ApiModelProperty(value = "openId")
    private String wxOpenId;

    @ApiModelProperty(value = "微信登录会话KEY")
    private String sessionKey;

    @ApiModelProperty(value = "最近一次登录IP地址")
    private String lastLoginIp;

    @ApiModelProperty(value = "最近一次登录时间")
    private Date lastLoginTime;

    @ApiModelProperty(value = "头像图片")
    private String avatar;

    @ApiModelProperty(value = "角色id列表")
    @TableField(exist = false)
    private List<Integer> roleIds;

    @ApiModelProperty(value = "角色名称")
    @TableField(exist = false)
    private List<String> roles;


}
