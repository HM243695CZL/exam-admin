package com.hl.yyx.common.api;

public enum ExamCode {
    QUESTION_TYPE_SINGLE("单选题"),
    QUESTION_TYPE_MULTIPLE("多选题"),
    QUESTION_TYPE_JUDGE("判断题");

    public String type;

    ExamCode(String type) {
        this.type = type;
    }
}
