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
 * 试题分数关系表
 * </p>
 *
 * @author hl243695czyn
 * @since 2023-05-03
 */
@Data
@EqualsAndHashCode(callSuper = false)
@TableName("exam_paper_big_relation")
@ApiModel(value="ExamPaperBigRelation对象", description="试题分数关系表")
public class ExamPaperBigRelation implements Serializable {

    private static final long serialVersionUID=1L;

    @TableId(value = "id", type = IdType.ASSIGN_UUID)
    private String id;

    @ApiModelProperty(value = "大题id")
    private String bigId;

    @ApiModelProperty(value = "题目id")
    private String questionId;

    @ApiModelProperty(value = "当前题的分数")
    private String score;


}
