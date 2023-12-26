package com.hl.yyx.modules.exam.service;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.hl.yyx.modules.exam.dto.QuestionPageDTO;
import com.hl.yyx.modules.exam.dto.RandomChooseDTO;
import com.hl.yyx.modules.exam.model.ExamQuestion;
import com.baomidou.mybatisplus.extension.service.IService;
import com.hl.yyx.modules.exam.model.ExamQuestionItem;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

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

    Boolean delete(String id);

    List<ExamQuestion> randomChoose(RandomChooseDTO chooseDTO);

    /**
     * 下载模板
     * @param request
     * @param response
     */
    void downloadModule(HttpServletRequest request, HttpServletResponse response);

    /**
     * 导入试题
     * @param file
     */
    void importExcel(MultipartFile file);

    Boolean batchDelete(List<String> ids);

    List<ExamQuestionItem> getQuestionItemList(String questionId);
}
