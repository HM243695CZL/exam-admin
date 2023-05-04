package com.hl.yyx.modules.exam.dto;

import com.hl.yyx.modules.exam.model.ExamPaper;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

import java.util.List;

@Data
public class ViewPaperDTO {

    @ApiModelProperty(value = "试卷信息")
    private ExamPaper paper;

    @ApiModelProperty(value = "大题列表")
    private List<BigQuestionDTO> questionBigList;


}
