package com.hl.yyx.modules.exam.service;

import com.hl.yyx.modules.exam.model.ExamQuestionType;
import com.baomidou.mybatisplus.extension.service.IService;

import java.util.List;

/**
 * <p>
 * 试题分类表 服务类
 * </p>
 *
 * @author hl243695czyn
 * @since 2023-04-19
 */
public interface ExamPaperTypeService extends IService<ExamQuestionType> {

    List<ExamQuestionType> getList();
}
