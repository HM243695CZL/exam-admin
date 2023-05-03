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
 * 试卷大题表
 * </p>
 *
 * @author hl243695czyn
 * @since 2023-05-03
 */
@Data
@EqualsAndHashCode(callSuper = false)
@TableName("exam_paper_big")
@ApiModel(value="ExamPaperBig对象", description="试卷大题表")
public class ExamPaperBig extends BaseModelDTO implements Serializable {

    private static final long serialVersionUID=1L;

    @TableId(value = "id", type = IdType.ASSIGN_UUID)
    private String id;

    @ApiModelProperty(value = "试卷id")
    private String paperId;

    @ApiModelProperty(value = "大题名称")
    @TableField("`name`")
    private String name;

    @ApiModelProperty(value = "大题总分")
    private String questionScore;

    @ApiModelProperty(value = "大题类型  1 单选题  2 多选题  3 判断题")
    private String type;

    @ApiModelProperty(value = "试题列表")
    @TableField(exist = false)
    private List<ExamPaperBigRelation> questionList;


}
