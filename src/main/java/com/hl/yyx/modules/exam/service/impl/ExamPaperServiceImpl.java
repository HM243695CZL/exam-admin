package com.hl.yyx.modules.exam.service.impl;

import cn.hutool.core.bean.BeanUtil;
import cn.hutool.core.util.ObjectUtil;
import cn.hutool.core.util.StrUtil;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.hl.yyx.modules.exam.dto.PaperPageDTO;
import com.hl.yyx.modules.exam.model.ExamPaper;
import com.hl.yyx.modules.exam.mapper.ExamPaperMapper;
import com.hl.yyx.modules.exam.model.ExamPaperBig;
import com.hl.yyx.modules.exam.model.ExamPaperBigRelation;
import com.hl.yyx.modules.exam.service.ExamPaperBigRelationService;
import com.hl.yyx.modules.exam.service.ExamPaperBigService;
import com.hl.yyx.modules.exam.service.ExamPaperService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

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

    @Autowired
    private ExamPaperBigService paperBigService;

    @Autowired
    private ExamPaperBigRelationService relationService;

    @Override
    public Page<ExamPaper> pageList(PaperPageDTO params) {
        Page<ExamPaper> page = new Page<>(params.getPageIndex(), params.getPageSize());
        QueryWrapper<ExamPaper> wrapper = new QueryWrapper<>();
        if (StrUtil.isNotEmpty(params.getName())) {
            wrapper.lambda().like(ExamPaper::getName, params.getName());
        }
        Page<ExamPaper> paperPage = page(page, wrapper);
        for (ExamPaper record : paperPage.getRecords()) {
            QueryWrapper<ExamPaperBig> queryWrapper = new QueryWrapper<>();
            queryWrapper.lambda().eq(ExamPaperBig::getPaperId, record.getId());
            List<ExamPaperBig> list = paperBigService.list(queryWrapper);
            String paperInfo = "";
            Integer singleCount = 0;
            for (ExamPaperBig paperBig : list) {
                if (paperBig.getType().equals("1")) {
                    // 单选题
                    QueryWrapper<ExamPaperBigRelation> wrapperRelation = new QueryWrapper<>();
                    wrapperRelation.lambda().eq(ExamPaperBigRelation::getBigId, paperBig.getId());
                    int relationCount = relationService.count(wrapperRelation);
                    singleCount += relationCount;
                }
            }
            if (!singleCount.equals(0)) {
                paperInfo = "单选题(" + singleCount + ")";
            }
            record.setQuestionInfo(paperInfo);
        }
        return  paperPage;
    }

    @Transactional
    @Override
    public Boolean create(ExamPaper examPaper) {
        // 保存试卷
        boolean b = save(examPaper);
        // 保存大题
        for (ExamPaperBig examPaperBig : examPaper.getQuestionBigType()) {
            ExamPaperBig paperBig = new ExamPaperBig();
            BeanUtil.copyProperties(examPaperBig, paperBig);
            paperBig.setPaperId(examPaper.getId());
            paperBigService.save(paperBig);
            // 保存大题中的题目
            for (ExamPaperBigRelation bigRelation : examPaperBig.getQuestionList()) {
                ExamPaperBigRelation relation = new ExamPaperBigRelation();
                relation.setBigId(paperBig.getId());
                relation.setQuestionId(bigRelation.getId());
                relation.setScore(bigRelation.getScore());
                relationService.save(relation);
            }
        }
        return b;
    }
}
