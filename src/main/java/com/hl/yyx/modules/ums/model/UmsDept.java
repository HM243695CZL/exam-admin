package com.hl.yyx.modules.ums.model;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import java.util.Date;
import java.io.Serializable;
import java.util.List;

import com.hl.yyx.common.vo.BaseModelDTO;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 * <p>
 * 部门表
 * </p>
 *
 * @author hl243695czyn
 * @since 2023-04-19
 */
@Data
@EqualsAndHashCode(callSuper = false)
@TableName("ums_dept")
@ApiModel(value="UmsDept对象", description="部门表")
public class UmsDept extends BaseModelDTO implements Serializable {

    private static final long serialVersionUID=1L;

    @TableId(value = "id", type = IdType.ASSIGN_UUID)
    private String id;

    @ApiModelProperty(value = "部门名称")
    @TableField("`name`")
    private String name;

    @ApiModelProperty(value = "上级部门")
    private String parentId;

    @ApiModelProperty(value = "备注")
    private String remark;

    @ApiModelProperty(value = "子部门")
    @TableField(exist = false)
    private List<UmsDept> children;


}
