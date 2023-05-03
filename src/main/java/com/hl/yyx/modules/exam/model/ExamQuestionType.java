package com.hl.yyx.modules.exam.model;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;

import java.io.Serializable;
import java.util.List;

import com.hl.yyx.common.vo.BaseModelDTO;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 * <p>
 * 试题分类表
 * </p>
 *
 * @author hl243695czyn
 * @since 2023-04-19
 */
@Data
@EqualsAndHashCode(callSuper = false)
@TableName("exam_question_type")
@ApiModel(value="ExamPaperType对象", description="试题分类表")
public class ExamQuestionType extends BaseModelDTO implements Serializable {

    private static final long serialVersionUID=1L;

    @TableId(value = "id", type = IdType.ASSIGN_UUID)
    private String id;

    @ApiModelProperty(value = "试题分类")
    @TableField("`name`")
    private String name;

    @ApiModelProperty(value = "父级分类")
    private String parentId;

    @ApiModelProperty(value = "子分类")
    @TableField(exist = false)
    private List<ExamQuestionType> children;

}
