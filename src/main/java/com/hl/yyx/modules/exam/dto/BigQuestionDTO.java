package com.hl.yyx.modules.exam.dto;

import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

import java.util.List;

@Data
public class BigQuestionDTO {

    @ApiModelProperty(value = "大题id")
    private String bigId;

    @ApiModelProperty(value = "大题名称")
    private String bigName;

    @ApiModelProperty(value = "试卷id")
    private String paperId;

    @ApiModelProperty(value = "大题类型")
    private String type;

    @ApiModelProperty(value = "大题总分")
    private String questionScore;

    @ApiModelProperty(value = "试题列表")
    private List<Object> questionList;
}
