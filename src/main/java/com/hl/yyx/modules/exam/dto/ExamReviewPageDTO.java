package com.hl.yyx.modules.exam.dto;

import com.hl.yyx.common.vo.PageParamsDTO;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

@Data
public class ExamReviewPageDTO extends PageParamsDTO {


    @ApiModelProperty(value = "复习资料类型")
    private String reviewType;

    @ApiModelProperty(value = "内容")
    private String content;
}
