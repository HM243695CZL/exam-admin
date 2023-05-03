package com.hl.yyx.modules.exam.service;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.hl.yyx.modules.exam.dto.PaperPageDTO;
import com.hl.yyx.modules.exam.model.ExamPaper;
import com.baomidou.mybatisplus.extension.service.IService;

/**
 * <p>
 * 试卷库 服务类
 * </p>
 *
 * @author hl243695czyn
 * @since 2023-04-28
 */
public interface ExamPaperService extends IService<ExamPaper> {

    Page<ExamPaper> pageList(PaperPageDTO params);

    Boolean create(ExamPaper examPaper);
}
