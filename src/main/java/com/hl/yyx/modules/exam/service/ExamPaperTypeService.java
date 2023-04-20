package com.hl.yyx.modules.exam.service;

import com.hl.yyx.modules.exam.model.ExamPaperType;
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
public interface ExamPaperTypeService extends IService<ExamPaperType> {

    List<ExamPaperType> getList();
}
