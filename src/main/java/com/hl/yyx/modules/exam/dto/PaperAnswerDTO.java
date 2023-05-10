package com.hl.yyx.modules.exam.dto;

import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

@Data
public class PaperAnswerDTO {

    @ApiModelProperty(value = "试题id")
    private String questionId;

    @ApiModelProperty(value = "试题答案")
    private String answer;
}
