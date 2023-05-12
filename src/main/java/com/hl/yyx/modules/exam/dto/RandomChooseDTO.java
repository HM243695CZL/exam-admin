package com.hl.yyx.modules.exam.dto;

import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

@Data
public class RandomChooseDTO {

    @ApiModelProperty(value = "试题类型")
    private Integer type;

    @ApiModelProperty(value = "试题分类")
    private String questionType;

    @ApiModelProperty(value = "抽题数")
    private Integer randomCount;
}
