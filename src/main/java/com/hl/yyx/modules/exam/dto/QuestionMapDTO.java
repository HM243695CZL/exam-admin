package com.hl.yyx.modules.exam.dto;

import com.hl.yyx.modules.exam.model.ExamQuestionItem;
import lombok.Data;

import java.util.List;

@Data
public class QuestionMapDTO {

    private String id;

    private String question;

    private String questionUrl;

    private Integer score;

    private String answer;

    private String currentUserAnswer;

    private String analysis;

    private String analysisUrl;

    private Integer sortIndex;

    private Integer type;

    private List<ExamQuestionItem> questionItemList;
}
