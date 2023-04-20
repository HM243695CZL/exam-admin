package com.hl.yyx.modules.exam.service;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.hl.yyx.modules.exam.dto.QuestionPageDTO;
import com.hl.yyx.modules.exam.model.ExamQuestion;
import com.baomidou.mybatisplus.extension.service.IService;

/**
 * <p>
 * 试题表 服务类
 * </p>
 *
 * @author hl243695czyn
 * @since 2023-04-20
 */
public interface ExamQuestionService extends IService<ExamQuestion> {

    Page<ExamQuestion> pageList(QuestionPageDTO params);

    Boolean create(ExamQuestion examQuestion);

    ExamQuestion view(String id);

    Boolean updateQuestion(ExamQuestion examQuestion);
}
