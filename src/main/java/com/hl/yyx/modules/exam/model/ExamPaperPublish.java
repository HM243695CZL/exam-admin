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
 * 发布考试表
 * </p>
 *
 * @author hl243695czyn
 * @since 2023-05-08
 */
@Data
@EqualsAndHashCode(callSuper = false)
@TableName("exam_paper_publish")
@ApiModel(value="ExamPaperPublish对象", description="发布考试表")
public class ExamPaperPublish implements Serializable {

    private static final long serialVersionUID=1L;

    @TableId(value = "id", type = IdType.ASSIGN_UUID)
    private String id;

    @ApiModelProperty(value = "试卷id")
    private String paperId;

    @ApiModelProperty(value = "班级id")
    private Integer classId;


}
