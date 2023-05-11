package com.hl.yyx.modules.exam.model;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import java.util.Date;
import java.io.Serializable;

import com.hl.yyx.common.vo.BaseModelDTO;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 * <p>
 * 错题表
 * </p>
 *
 * @author hl243695czyn
 * @since 2023-05-11
 */
@Data
@EqualsAndHashCode(callSuper = false)
@TableName("exam_wrong_book")
@ApiModel(value="ExamWrongBook对象", description="错题表")
public class ExamWrongBook extends BaseModelDTO implements Serializable {

    private static final long serialVersionUID=1L;

    @TableId(value = "id", type = IdType.ASSIGN_UUID)
    private String id;

    @ApiModelProperty(value = "试题id")
    private String questionId;

    @ApiModelProperty(value = "试题名称")
    @TableField(exist = false)
    private String questionName;

    @ApiModelProperty(value = "用户id")
    private String userId;

    @ApiModelProperty(value = "出错次数")
    private Integer wrongCount;

    @ApiModelProperty(value = "正确答案id")
    private String correctAnswerId;

    @ApiModelProperty(value = "用户答案id")
    private String selfAnswerId;
}
