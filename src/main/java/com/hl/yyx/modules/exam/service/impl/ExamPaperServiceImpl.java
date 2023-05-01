package com.hl.yyx.modules.exam.service.impl;

import cn.hutool.core.util.StrUtil;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.hl.yyx.modules.exam.dto.PaperPageDTO;
import com.hl.yyx.modules.exam.model.ExamPaper;
import com.hl.yyx.modules.exam.mapper.ExamPaperMapper;
import com.hl.yyx.modules.exam.service.ExamPaperService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

/**
 * <p>
 * 试卷库 服务实现类
 * </p>
 *
 * @author hl243695czyn
 * @since 2023-04-28
 */
@Service
public class ExamPaperServiceImpl extends ServiceImpl<ExamPaperMapper, ExamPaper> implements ExamPaperService {

    @Override
    public Page<ExamPaper> pageList(PaperPageDTO params) {
        Page<ExamPaper> page = new Page<>(params.getPageIndex(), params.getPageSize());
        QueryWrapper<ExamPaper> wrapper = new QueryWrapper<>();
        if (StrUtil.isNotEmpty(params.getName())) {
            wrapper.lambda().like(ExamPaper::getName, params.getName());
        }
        return  page(page, wrapper);
    }
}
