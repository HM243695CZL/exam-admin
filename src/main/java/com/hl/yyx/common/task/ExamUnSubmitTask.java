package com.hl.yyx.common.task;

import lombok.extern.slf4j.Slf4j;

@Slf4j
public class ExamUnSubmitTask extends Task {

    private String examId;

    public ExamUnSubmitTask(String examId, long delayInMilliseconds) {
        super(examId, delayInMilliseconds);
        this.examId = examId;
    }

    public ExamUnSubmitTask(String examId) {
        super(examId, 30 * 60 * 1000);
        this.examId = examId;
    }

    @Override
    public void run() {
        log.info("系统开始处理延时任务【考试超时未提交】，考试id：" + this.examId);
    }
}
