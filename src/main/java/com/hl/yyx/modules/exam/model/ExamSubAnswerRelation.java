package com.hl.yyx.modules.exam.model;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import java.io.Serializable;

import com.hl.yyx.common.vo.BaseModelDTO;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 * <p>
 * 试卷答题答案关系表
 * </p>
 *
 * @author hl243695czyn
 * @since 2023-05-09
 */
@Data
@EqualsAndHashCode(callSuper = false)
@TableName("exam_sub_answer_relation")
@ApiModel(value="ExamSubAnswerRelation对象", description="试卷答题答案关系表")
public class ExamSubAnswerRelation implements Serializable {

    private static final long serialVersionUID=1L;

    @TableId(value = "id", type = IdType.ASSIGN_UUID)
    private String id;

    @ApiModelProperty(value = "用户id")
    private String userId;

    @ApiModelProperty(value = "试卷id")
    private String paperId;

    @ApiModelProperty(value = "试题id")
    private String questionId;

    @ApiModelProperty(value = "答案")
    private String answer;


}
