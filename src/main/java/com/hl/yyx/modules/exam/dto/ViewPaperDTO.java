package com.hl.yyx.modules.exam.dto;

import com.baomidou.mybatisplus.annotation.TableField;
import com.hl.yyx.modules.exam.model.ExamPaper;
import com.hl.yyx.modules.exam.model.ExamRecord;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

import java.util.List;

@Data
public class ViewPaperDTO {

    @ApiModelProperty(value = "试卷信息")
    private ExamPaper paper;

    @ApiModelProperty(value = "大题列表")
    private List<BigQuestionDTO> questionBigList;

    @ApiModelProperty(value = "答题记录信息")
    private ExamRecord answerRecordInfo;
}
