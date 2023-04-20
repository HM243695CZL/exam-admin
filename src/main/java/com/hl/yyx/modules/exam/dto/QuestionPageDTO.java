package com.hl.yyx.modules.exam.dto;

import com.hl.yyx.common.vo.PageParamsDTO;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

@Data
public class QuestionPageDTO extends PageParamsDTO {

    @ApiModelProperty(value = "试题类型")
    private Integer type;

    @ApiModelProperty(value = "试题分类")
    private String questionType;

    @ApiModelProperty(value = "难度")
    private Integer difficulty;

    @ApiModelProperty(value = "题目")
    private String question;

    @ApiModelProperty(value = "解析")
    private String analysis;
}
