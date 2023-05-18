package com.hl.yyx.modules.exam.service.impl;

import cn.hutool.core.util.StrUtil;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.hl.yyx.common.util.UserThreadLocalUtil;
import com.hl.yyx.modules.exam.dto.WrongBookDTO;
import com.hl.yyx.modules.exam.model.ExamQuestion;
import com.hl.yyx.modules.exam.model.ExamQuestionItem;
import com.hl.yyx.modules.exam.model.ExamQuestionRelationItem;
import com.hl.yyx.modules.exam.model.ExamWrongBook;
import com.hl.yyx.modules.exam.mapper.ExamWrongBookMapper;
import com.hl.yyx.modules.exam.service.ExamQuestionItemService;
import com.hl.yyx.modules.exam.service.ExamQuestionRelationItemService;
import com.hl.yyx.modules.exam.service.ExamQuestionService;
import com.hl.yyx.modules.exam.service.ExamWrongBookService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.hl.yyx.modules.ums.model.UmsAdmin;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.Comparator;
import java.util.List;
import java.util.stream.Collectors;

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

    @Autowired
    private ExamQuestionRelationItemService relationItemService;

    @Autowired
    private ExamQuestionItemService questionItemService;

    @Override
    public Page<ExamWrongBook> pageList(WrongBookDTO params) {
        Page<ExamWrongBook> page = new Page<>(params.getPageIndex(), params.getPageSize());
        QueryWrapper<ExamWrongBook> wrapper = new QueryWrapper<>();
        Page<ExamWrongBook> bookPage = page(page, wrapper);
        for (ExamWrongBook record : bookPage.getRecords()) {
            ExamQuestion question = questionService.getById(record.getQuestionId());
            record.setQuestionName(question.getQuestion());
            record.setAnalysis(question.getAnalysis());

            // 根据试题id获取选项id
            List<String> itemIds = relationItemService.list(new QueryWrapper<ExamQuestionRelationItem>()
                    .eq("q_id", record.getQuestionId()).select("i_id")).stream()
                    .map(ExamQuestionRelationItem::getIId).collect(Collectors.toList());
            // 根据试题选项表查询对应的选项名称
            ArrayList<ExamQuestionItem> itemList = new ArrayList<>();
            for (String itemId: itemIds) {
                itemList.add(questionItemService.getById(itemId));
            }
            // 根据sort_index字段排序
            List<ExamQuestionItem> sortItemList = itemList.stream().sorted(Comparator.comparing(ExamQuestionItem::getSortIndex)).collect(Collectors.toList());
            record.setQuestionItemList(sortItemList);
        }
        return bookPage;
    }
}
