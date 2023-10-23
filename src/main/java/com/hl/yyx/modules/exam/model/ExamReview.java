package com.hl.yyx.modules.exam.model;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import java.util.Date;
import java.io.Serializable;

import com.hl.yyx.common.vo.BaseModelDTO;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 * <p>
 * 复习资料
 * </p>
 *
 * @author hl243695czyn
 * @since 2023-10-23
 */
@Data
@EqualsAndHashCode(callSuper = false)
@TableName("exam_review")
@ApiModel(value="ExamReview对象", description="复习资料")
public class ExamReview extends BaseModelDTO implements Serializable {

    private static final long serialVersionUID=1L;

    @TableId(value = "id", type = IdType.ASSIGN_UUID)
    private String id;

    @ApiModelProperty(value = "复习资料分类")
    private String reviewType;

    @ApiModelProperty(value = "复习资料分类名称")
    @TableField(exist = false)
    private String reviewTypeName;

    @ApiModelProperty(value = "内容")
    private String content;

    @ApiModelProperty(value = "图片")
    private String pictureUrl;

}
