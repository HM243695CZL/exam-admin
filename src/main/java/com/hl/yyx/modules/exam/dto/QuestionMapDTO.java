package com.hl.yyx.modules.exam.dto;

import com.hl.yyx.modules.exam.model.ExamQuestionItem;
import lombok.Data;

import java.util.List;

@Data
public class QuestionMapDTO {

    private String id;

    private String question;

    private Integer score;

    private String answer;

    private String currentUserAnswer;

    private String analysis;

    private Integer sortIndex;

    private List<ExamQuestionItem> questionItemList;
}
