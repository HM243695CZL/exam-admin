package com.hl.yyx.modules.ums.model;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import java.util.Date;
import java.io.Serializable;

import com.hl.yyx.common.vo.BaseModelDTO;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 * <p>
 * 教师表
 * </p>
 *
 * @author hl243695czyn
 * @since 2023-04-19
 */
@Data
@EqualsAndHashCode(callSuper = false)
@TableName("ums_teacher")
@ApiModel(value="UmsTeacher对象", description="教师表")
public class UmsTeacher extends BaseModelDTO implements Serializable {

    private static final long serialVersionUID=1L;

    @TableId(value = "id", type = IdType.ASSIGN_UUID)
    private String id;

    @ApiModelProperty(value = "姓名")
    @TableField("`name`")
    private String name;

    @ApiModelProperty(value = "工号")
    private String number;

    @ApiModelProperty(value = "部门id")
    private String deptId;

    @ApiModelProperty(value = "头像")
    private String avatar;

    @ApiModelProperty(value = "0: 男 1：女")
    private Integer sex;

    @ApiModelProperty(value = "邮箱")
    private String email;

    @ApiModelProperty(value = "电话")
    private String phone;

    @ApiModelProperty(value = "部门名称")
    @TableField(exist = false)
    private String deptName;
}
