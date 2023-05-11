package com.hl.yyx.modules.exam.service.impl;

import cn.hutool.core.util.StrUtil;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.hl.yyx.common.util.UserThreadLocalUtil;
import com.hl.yyx.modules.exam.dto.WrongBookDTO;
import com.hl.yyx.modules.exam.model.ExamQuestion;
import com.hl.yyx.modules.exam.model.ExamWrongBook;
import com.hl.yyx.modules.exam.mapper.ExamWrongBookMapper;
import com.hl.yyx.modules.exam.service.ExamWrongBookService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
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

    @Override
    public Page<ExamWrongBook> pageList(WrongBookDTO params) {
        Page<ExamWrongBook> page = new Page<>(params.getPageIndex(), params.getPageSize());
        Page<ExamWrongBook> wrongBookPage = wrongBookMapper.pageList(page, params, UserThreadLocalUtil.get().getId());
        return wrongBookPage;
    }
}
