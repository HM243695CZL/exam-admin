package com.hl.yyx.modules.exam.service;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.hl.yyx.modules.exam.dto.ExamReviewPageDTO;
import com.hl.yyx.modules.exam.model.ExamReview;
import com.baomidou.mybatisplus.extension.service.IService;

/**
 * <p>
 * 复习资料 服务类
 * </p>
 *
 * @author hl243695czyn
 * @since 2023-10-23
 */
public interface ExamReviewService extends IService<ExamReview> {

    Page<ExamReview> pageList(ExamReviewPageDTO params);
}
