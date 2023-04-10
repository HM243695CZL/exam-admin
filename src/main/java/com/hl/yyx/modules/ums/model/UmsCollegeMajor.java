package com.hl.yyx.modules.ums.model;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import java.util.Date;
import java.io.Serializable;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 * <p>
 * 学院/专业表
 * </p>
 *
 * @author hl243695czyn
 * @since 2023-04-10
 */
@Data
@EqualsAndHashCode(callSuper = false)
@TableName("ums_college_major")
@ApiModel(value="UmsCollegeMajor对象", description="学院/专业表")
public class UmsCollegeMajor implements Serializable {

    private static final long serialVersionUID=1L;

    @TableId(value = "id", type = IdType.AUTO)
    private Integer id;

    @ApiModelProperty(value = "父id")
    private Integer parentId;

    @ApiModelProperty(value = "学院/专业名称")
    @TableField("`name`")
    private String name;

    @ApiModelProperty(value = "0：学院   1：专业")
    @TableField("`type`")
    private Boolean type;

}
