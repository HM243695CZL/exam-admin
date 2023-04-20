package com.hl.yyx.modules.exam.model;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import java.io.Serializable;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 * <p>
 * 试题和试题选项关系表
 * </p>
 *
 * @author hl243695czyn
 * @since 2023-04-20
 */
@Data
@EqualsAndHashCode(callSuper = false)
@TableName("exam_question_relation_item")
@ApiModel(value="ExamQuestionRelationItem对象", description="试题和试题选项关系表")
public class ExamQuestionRelationItem implements Serializable {

    private static final long serialVersionUID=1L;

    @TableId(value = "id", type = IdType.ASSIGN_UUID)
    private String id;

    @ApiModelProperty(value = "试题id")
    private String qId;

    @ApiModelProperty(value = "选项id")
    private String iId;


}
