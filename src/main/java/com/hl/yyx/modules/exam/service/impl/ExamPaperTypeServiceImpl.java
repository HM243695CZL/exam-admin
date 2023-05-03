package com.hl.yyx.modules.exam.service.impl;

import cn.hutool.core.util.ObjectUtil;
import com.hl.yyx.modules.exam.model.ExamQuestionType;
import com.hl.yyx.modules.exam.mapper.ExamPaperTypeMapper;
import com.hl.yyx.modules.exam.service.ExamPaperTypeService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

/**
 * <p>
 * 试题分类表 服务实现类
 * </p>
 *
 * @author hl243695czyn
 * @since 2023-04-19
 */
@Service
public class ExamPaperTypeServiceImpl extends ServiceImpl<ExamPaperTypeMapper, ExamQuestionType> implements ExamPaperTypeService {

    @Override
    public List<ExamQuestionType> getList() {
        List<ExamQuestionType> list = list();
        ArrayList<ExamQuestionType> dataList = new ArrayList<>();
        for (ExamQuestionType paper: list) {
            if (ObjectUtil.isEmpty(paper.getParentId())) {
                paper.setChildren(new ArrayList<>());
                dataList.add(paper);
            }
        }
        for (ExamQuestionType paper: dataList) {
            paper.getChildren().add(findPaperChildren(paper, list));
        }
        return dataList;
    }

    /**
     * 递归试题分类
     * @return
     */
    private ExamQuestionType findPaperChildren(ExamQuestionType paper, List<ExamQuestionType> list) {
        paper.setChildren(new ArrayList<>());
        for (ExamQuestionType item: list) {
            if (paper.getId().equals(item.getParentId())) {
                paper.getChildren().add(findPaperChildren(item, list));
            }
        }
        return paper;
    }
}
