package com.hl.yyx.modules.exam.model;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import java.util.Date;
import java.io.Serializable;
import java.util.List;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.hl.yyx.common.vo.BaseModelDTO;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 * <p>
 * 试卷库
 * </p>
 *
 * @author hl243695czyn
 * @since 2023-04-28
 */
@Data
@EqualsAndHashCode(callSuper = false)
@TableName("exam_paper")
@ApiModel(value="ExamPaper对象", description="试卷库")
public class ExamPaper extends BaseModelDTO implements Serializable {

    private static final long serialVersionUID=1L;

    @TableId(value = "id", type = IdType.ASSIGN_UUID)
    private String id;

    @ApiModelProperty(value = "试卷名称")
    @TableField("`name`")
    private String name;

    @ApiModelProperty(value = "试卷总分")
    private Integer score;

    @ApiModelProperty(value = "试题总数")
    private Integer questionCount;

    @ApiModelProperty(value = "答题时间")
    private String questionDuration;

    @ApiModelProperty(value = "发布时间")
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "GMT+8")
    private Date publishTime;

    @ApiModelProperty(value = "是否限时  1 不限时  2 限时")
    private Integer timeLimit;

    @ApiModelProperty(value = "试题信息")
    @TableField(exist = false)
    private String questionInfo;

    @ApiModelProperty(value = "大题")
    @TableField(exist = false)
    private List<ExamPaperBig> questionBigType;

}
