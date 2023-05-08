package com.hl.yyx.modules.exam.service;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.hl.yyx.modules.exam.dto.PaperPageDTO;
import com.hl.yyx.modules.exam.dto.PublishExamDTO;
import com.hl.yyx.modules.exam.model.ExamPaper;
import com.baomidou.mybatisplus.extension.service.IService;

import java.util.List;

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

    Object view(String id, Boolean isPreview);

    Boolean updatePaper(ExamPaper examPaper);

    Boolean delete(String id);

    /**
     * 发布考试
     * @param examDTO
     * @return
     */
    Boolean publishExam(PublishExamDTO examDTO);

    /**
     * 获取已发布班级
     * @param id
     * @return
     */
    List<Integer> getPublishClass(String id);
}
