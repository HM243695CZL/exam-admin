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
 * 试题表
 * </p>
 *
 * @author hl243695czyn
 * @since 2023-04-20
 */
@Data
@EqualsAndHashCode(callSuper = false)
@TableName("exam_question")
@ApiModel(value="ExamQuestion对象", description="试题表")
public class ExamQuestion extends BaseModelDTO implements Serializable {

    private static final long serialVersionUID=1L;

    @TableId(value = "id", type = IdType.ASSIGN_UUID)
    private String id;

    @ApiModelProperty(value = "试题类型 1 单选题 2 多选题 3 判断题 4 简答题")
    private Integer type;

    @ApiModelProperty(value = "试题分类")
    private String questionType;

    @ApiModelProperty(value = "试题分类名称")
    @TableField(exist = false)
    private String questionTypeName;

    @ApiModelProperty(value = "分数")
    private Integer score;

    @ApiModelProperty(value = "难度 1 简单  2 一般   3 困难")
    private Integer difficulty;

    @ApiModelProperty(value = "题目")
    private String question;

    @ApiModelProperty(value = "解析")
    private String analysis;

    @ApiModelProperty(value = "答案")
    private String answer;

    @ApiModelProperty(value = "选项列表")
    @TableField(exist = false)
    private List<ExamQuestionItem> questionItemList;


}
