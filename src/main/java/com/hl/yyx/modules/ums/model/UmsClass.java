package com.hl.yyx.modules.ums.model;

import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableName;
import com.baomidou.mybatisplus.annotation.IdType;
import java.util.Date;
import com.baomidou.mybatisplus.annotation.TableId;
import java.io.Serializable;

import com.hl.yyx.common.vo.BaseModelDTO;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 * <p>
 * 班级表
 * </p>
 *
 * @author hl243695czyn
 * @since 2023-04-12
 */
@Data
@EqualsAndHashCode(callSuper = false)
@TableName("ums_class")
@ApiModel(value="UmsClass对象", description="班级表")
public class UmsClass extends BaseModelDTO implements Serializable {

    private static final long serialVersionUID=1L;

    @TableId(value = "id", type = IdType.AUTO)
    private Integer id;

    @ApiModelProperty(value = "班级名称")
    @TableField("`name`")
    private String name;

    @ApiModelProperty(value = "学院id")
    private Integer collegeId;

    @ApiModelProperty(value = "专业id")
    private Integer majorId;

    @ApiModelProperty(value = "备注")
    private String remark;

    @ApiModelProperty(value = "学院名称")
    @TableField(exist = false)
    private String collegeName;

    @ApiModelProperty(value = "专业名称")
    @TableField(exist = false)
    private String majorName;

}
