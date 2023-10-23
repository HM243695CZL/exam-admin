package com.hl.yyx.modules.exam.service.impl;

import cn.hutool.core.util.StrUtil;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.hl.yyx.modules.exam.dto.ExamReviewPageDTO;
import com.hl.yyx.modules.exam.model.ExamReview;
import com.hl.yyx.modules.exam.mapper.ExamReviewMapper;
import com.hl.yyx.modules.exam.model.ExamReviewType;
import com.hl.yyx.modules.exam.service.ExamReviewService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.hl.yyx.modules.exam.service.ExamReviewTypeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * <p>
 * 复习资料 服务实现类
 * </p>
 *
 * @author hl243695czyn
 * @since 2023-10-23
 */
@Service
public class ExamReviewServiceImpl extends ServiceImpl<ExamReviewMapper, ExamReview> implements ExamReviewService {

    @Autowired
    private ExamReviewTypeService reviewTypeService;

    @Override
    public Page<ExamReview> pageList(ExamReviewPageDTO params) {
        Page<ExamReview> page = new Page<>(params.getPageIndex(), params.getPageSize());
        QueryWrapper<ExamReview> queryWrapper = new QueryWrapper<>();
        if (params.getReviewType() != null) {
            queryWrapper.lambda().eq(ExamReview::getReviewType, params.getReviewType());
        }
        if (StrUtil.isNotEmpty(params.getContent())) {
            queryWrapper.lambda().like(ExamReview::getContent, params.getContent());
        }
        Page<ExamReview> pageList = page(page, queryWrapper);
        pageList.getRecords().stream().forEach(item -> {
            // 设置复习资料类型名称
            ExamReviewType reviewType = reviewTypeService.getById(item.getReviewType());
            item.setReviewTypeName(reviewType.getName());
        });
        return pageList;
    }
}
