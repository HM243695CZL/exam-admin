package com.hl.yyx.modules.exam.model;

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
 * 复习资料分类表
 * </p>
 *
 * @author hl243695czyn
 * @since 2023-10-23
 */
@Data
@EqualsAndHashCode(callSuper = false)
@TableName("exam_review_type")
@ApiModel(value="ExamReviewType对象", description="复习资料分类表")
public class ExamReviewType extends BaseModelDTO implements Serializable {

    private static final long serialVersionUID=1L;

    @ApiModelProperty(value = "id")
    @TableId(value = "id", type = IdType.ASSIGN_UUID)
    private String id;

    @ApiModelProperty(value = "父节点")
    private String parentId;

    @ApiModelProperty(value = "分类名称")
    @TableField("`name`")
    private String name;

    @ApiModelProperty(value = "子分类")
    @TableField(exist = false)
    private List<ExamReviewType> children;

}
