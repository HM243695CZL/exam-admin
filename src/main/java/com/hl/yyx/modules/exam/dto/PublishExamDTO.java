package com.hl.yyx.modules.exam.dto;

import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

import java.util.List;

@Data
public class PublishExamDTO {

    @ApiModelProperty(value = "试卷id")
    private String paperId;

    @ApiModelProperty(value = "考试班级id数组")
    private List<Integer> classId;
}
