package com.hl.yyx.modules.exam.model;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import java.util.Date;
import java.io.Serializable;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.hl.yyx.common.vo.BaseModelDTO;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 * <p>
 * 考试记录表
 * </p>
 *
 * @author hl243695czyn
 * @since 2023-05-09
 */
@Data
@EqualsAndHashCode(callSuper = false)
@TableName("exam_record")
@ApiModel(value="ExamRecord对象", description="考试记录表")
public class ExamRecord extends BaseModelDTO implements Serializable {

    private static final long serialVersionUID=1L;

    @TableId(value = "id", type = IdType.ASSIGN_UUID)
    private String id;

    @ApiModelProperty(value = "试卷id")
    private String paperId;

    @ApiModelProperty(value = "试卷名称")
    @TableField(exist = false)
    private String paperName;

    @ApiModelProperty(value = "试卷状态 1 正在考试  2 系统提交  3  主动提交")
    private Integer recordStatus;

    @ApiModelProperty(value = "用户id")
    private String userId;

    @ApiModelProperty(value = "交卷时间")
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "GMT+8")
    private Date submitTime;

    @ApiModelProperty(value = "得分")
    private String score;

    @ApiModelProperty(value = "试卷总分")
    @TableField(exist = false)
    private Integer totalScore;

}
