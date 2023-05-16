package com.hl.yyx.modules.exam.service.impl;

import cn.hutool.core.util.StrUtil;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.hl.yyx.common.util.UserThreadLocalUtil;
import com.hl.yyx.modules.exam.dto.WrongBookDTO;
import com.hl.yyx.modules.exam.model.ExamQuestion;
import com.hl.yyx.modules.exam.model.ExamWrongBook;
import com.hl.yyx.modules.exam.mapper.ExamWrongBookMapper;
import com.hl.yyx.modules.exam.service.ExamQuestionService;
import com.hl.yyx.modules.exam.service.ExamWrongBookService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.hl.yyx.modules.ums.model.UmsAdmin;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * <p>
 * 错题表 服务实现类
 * </p>
 *
 * @author hl243695czyn
 * @since 2023-05-11
 */
@Service
@SuppressWarnings("all")
public class ExamWrongBookServiceImpl extends ServiceImpl<ExamWrongBookMapper, ExamWrongBook> implements ExamWrongBookService {


    @Autowired
    private ExamWrongBookMapper wrongBookMapper;

    @Autowired
    private ExamQuestionService questionService;

    @Override
    public Page<ExamWrongBook> pageList(WrongBookDTO params) {
        Page<ExamWrongBook> page = new Page<>(params.getPageIndex(), params.getPageSize());
        QueryWrapper<ExamWrongBook> wrapper = new QueryWrapper<>();
        Page<ExamWrongBook> bookPage = page(page, wrapper);
        for (ExamWrongBook record : bookPage.getRecords()) {
            ExamQuestion question = questionService.getById(record.getQuestionId());
            record.setQuestionName(question.getQuestion());
        }
        return bookPage;
    }
}
