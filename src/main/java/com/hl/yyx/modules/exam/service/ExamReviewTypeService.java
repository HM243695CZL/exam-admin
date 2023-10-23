package com.hl.yyx.modules.exam.service;

import com.hl.yyx.modules.exam.model.ExamReviewType;
import com.baomidou.mybatisplus.extension.service.IService;

import java.util.List;

/**
 * <p>
 * 复习资料分类表 服务类
 * </p>
 *
 * @author hl243695czyn
 * @since 2023-10-23
 */
public interface ExamReviewTypeService extends IService<ExamReviewType> {

    List<ExamReviewType> getList();
}
