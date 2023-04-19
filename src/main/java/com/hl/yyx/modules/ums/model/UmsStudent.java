package com.hl.yyx.modules.ums.model;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import java.util.Date;
import java.io.Serializable;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.hl.yyx.common.vo.BaseModelDTO;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 * <p>
 * 学生表
 * </p>
 *
 * @author hl243695czyn
 * @since 2023-04-10
 */
@Data
@EqualsAndHashCode(callSuper = false)
@TableName("ums_student")
@ApiModel(value="UmsStudent对象", description="学生表")
public class UmsStudent extends BaseModelDTO implements Serializable {

    private static final long serialVersionUID=1L;

    @TableId(value = "id", type = IdType.AUTO)
    private Integer id;

    @ApiModelProperty(value = "姓名")
    @TableField("`name`")
    private String name;

    @ApiModelProperty(value = "学号")
    private String number;

    @ApiModelProperty(value = "学院")
    private String college;

    @ApiModelProperty(value = "专业")
    private String major;

    @ApiModelProperty(value = "班级")
    private String classId;

    @ApiModelProperty(value = "头像")
    private String avatar;

    @JsonFormat(pattern = "yyyy-MM-dd", timezone = "GMT+8")
    @ApiModelProperty(value = "出生日期")
    private Date birthday;

    @ApiModelProperty(value = "手机号")
    private String phone;

    @ApiModelProperty(value = "0：男 1：女")
    private Integer sex;

    @ApiModelProperty(value = "0：禁用 1：启用")
    private Integer status;

    @ApiModelProperty(value = "wxopenid")
    private String wxOpenId;

    @ApiModelProperty(value = "学院名称")
    @TableField(exist = false)
    private String collegeName;

    @ApiModelProperty(value = "专业名称")
    @TableField(exist = false)
    private String majorName;

    @ApiModelProperty(value = "班级名称")
    @TableField(exist = false)
    private String className;

}
