package com.hl.yyx.modules.exam.dto;

import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

import java.util.List;
import java.util.Map;

@Data
public class SubmitPaperDTO {

    @ApiModelProperty(value = "试卷id")
    private String paperId;

    @ApiModelProperty(value = "答案")
    private Map<String, String> answerMap;
}

