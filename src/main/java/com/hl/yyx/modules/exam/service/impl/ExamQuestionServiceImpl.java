package com.hl.yyx.modules.exam.service.impl;

import cn.hutool.core.util.StrUtil;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.hl.yyx.common.util.RandomUtil;
import com.hl.yyx.modules.exam.dto.QuestionPageDTO;
import com.hl.yyx.modules.exam.dto.RandomChooseDTO;
import com.hl.yyx.modules.exam.model.ExamQuestionType;
import com.hl.yyx.modules.exam.model.ExamQuestion;
import com.hl.yyx.modules.exam.mapper.ExamQuestionMapper;
import com.hl.yyx.modules.exam.model.ExamQuestionItem;
import com.hl.yyx.modules.exam.model.ExamQuestionRelationItem;
import com.hl.yyx.modules.exam.service.ExamPaperTypeService;
import com.hl.yyx.modules.exam.service.ExamQuestionItemService;
import com.hl.yyx.modules.exam.service.ExamQuestionRelationItemService;
import com.hl.yyx.modules.exam.service.ExamQuestionService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.*;
import java.util.stream.Collectors;

/**
 * <p>
 * 试题表 服务实现类
 * </p>
 *
 * @author hl243695czyn
 * @since 2023-04-20
 */
@Service
public class ExamQuestionServiceImpl extends ServiceImpl<ExamQuestionMapper, ExamQuestion> implements ExamQuestionService {

    @Autowired
    private ExamQuestionItemService questionItemService;

    @Autowired
    private ExamQuestionRelationItemService relationItemService;

    @Autowired
    private ExamPaperTypeService paperTypeService;

    @Override
    public Page<ExamQuestion> pageList(QuestionPageDTO params) {
        Page<ExamQuestion> page = new Page<>(params.getPageIndex(), params.getPageSize());
        QueryWrapper<ExamQuestion> queryWrapper = new QueryWrapper<>();
        if (params.getType() != null) {
            queryWrapper.lambda().eq(ExamQuestion::getType, params.getType());
        }
        if (params.getDifficulty() != null) {
            queryWrapper.lambda().eq(ExamQuestion::getDifficulty, params.getDifficulty());
        }
        if (params.getQuestionType() != null) {
            queryWrapper.lambda().eq(ExamQuestion::getQuestionType, params.getQuestionType());
        }
        if (StrUtil.isNotEmpty(params.getQuestion())) {
            queryWrapper.lambda().like(ExamQuestion::getQuestion, params.getQuestion());
        }
        if (StrUtil.isNotEmpty(params.getAnalysis())) {
            queryWrapper.lambda().like(ExamQuestion::getAnalysis, params.getAnalysis());
        }
        Page<ExamQuestion> pageList = page(page, queryWrapper);
        pageList.getRecords().stream().forEach(item -> {
            // 设置试题类型名称
            ExamQuestionType paperType = paperTypeService.getById(item.getQuestionType());
            item.setQuestionTypeName(paperType.getName());

            List<ExamQuestionItem> itemList = getQuestionItemList(item.getId());
            // 根据sort_index字段排序
            List<ExamQuestionItem> sortItemList = itemList.stream().sorted(Comparator.comparing(ExamQuestionItem::getSortIndex)).collect(Collectors.toList());
            item.setQuestionItemList(sortItemList);
        });
        return pageList;
    }

    public List<ExamQuestionItem> getQuestionItemList(String questionId) {
        // 根据试题id获取选项id
        List<String> itemIds = relationItemService.list(new QueryWrapper<ExamQuestionRelationItem>()
                .eq("q_id", questionId).select("i_id")).stream()
                .map(ExamQuestionRelationItem::getIId).collect(Collectors.toList());
        // 根据试题选项表查询对应的选项名称
        ArrayList<ExamQuestionItem> itemList = new ArrayList<>();
        for (String itemId: itemIds) {
            itemList.add(questionItemService.getById(itemId));
        }
        return itemList;
    }

    @Override
    @Transactional
    public Boolean create(ExamQuestion examQuestion) {
        save(examQuestion);
        Integer index = 0;
        List<ExamQuestionItem> questionItemList = examQuestion.getQuestionItemList();
        for (ExamQuestionItem item: questionItemList) {
            index ++;
            saveQuestionItem(item, examQuestion.getId(), index);
        }
        // 更新试题答案
        examQuestion.setAnswer(updateQuestionAnswer(examQuestion));
        return updateById(examQuestion);
    }

    /**
     * 更新试题答案
     * @param examQuestion
     * @return
     */
    public String updateQuestionAnswer(ExamQuestion examQuestion) {
        String answerId = "";
        // 更新试题答案
        String[] itemArr = new String[]{"A", "B", "C", "D", "E", "F"};
        for (int i = 0; i < itemArr.length; i++) {
            if (examQuestion.getAnswer().equals(itemArr[i])) {
                answerId = examQuestion.getQuestionItemList().get(i).getId();
                break;
            }
        }
        return answerId;
    }

    @Override
    public ExamQuestion view(String id) {
        ExamQuestion examQuestion = getById(id);
        List<ExamQuestionItem> itemList = getQuestionItemList(id);
        // 根据sort_index字段排序
        List<ExamQuestionItem> sortItemList = itemList.stream().sorted(Comparator.comparing(ExamQuestionItem::getSortIndex)).collect(Collectors.toList());
        examQuestion.setQuestionItemList(sortItemList);
        return examQuestion;
    }

    @Override
    @Transactional
    public Boolean updateQuestion(ExamQuestion examQuestion) {
        examQuestion.setAnswer(updateQuestionAnswer(examQuestion));
        boolean update = updateById(examQuestion);
        // 根据试题id获取选项id
        List<String> itemIds = relationItemService.list(new QueryWrapper<ExamQuestionRelationItem>()
                .eq("q_id", examQuestion.getId()).select("i_id")).stream()
                .map(ExamQuestionRelationItem::getIId).collect(Collectors.toList());
        questionItemService.removeByIds(itemIds);
        Integer index = 1;
        for (ExamQuestionItem item: examQuestion.getQuestionItemList()) {
            QueryWrapper<ExamQuestionRelationItem> queryWrapper = new QueryWrapper<>();
            queryWrapper.lambda().eq(ExamQuestionRelationItem::getQId, examQuestion.getId());
            queryWrapper.lambda().eq(ExamQuestionRelationItem::getIId, item.getId());
            relationItemService.remove(queryWrapper);

            index ++;
            saveQuestionItem(item, examQuestion.getId(), index);
        }
        return update;
    }

    @Override
    public Boolean delete(String id) {
        boolean b = removeById(id);
        List<String> itemIds = relationItemService.list(new QueryWrapper<ExamQuestionRelationItem>()
                .eq("q_id", id).select("i_id")).stream()
                .map(ExamQuestionRelationItem::getIId).collect(Collectors.toList());
        questionItemService.removeByIds(itemIds);

        QueryWrapper<ExamQuestionRelationItem> queryWrapper = new QueryWrapper<>();
        queryWrapper.lambda().eq(ExamQuestionRelationItem::getQId, id);
        relationItemService.remove(queryWrapper);
        return b;
    }

    /**
     * 随机抽题
     * @param chooseDTO
     * @return
     */
    @Override
    public List<ExamQuestion> randomChoose(RandomChooseDTO chooseDTO) {
        QueryWrapper<ExamQuestion> wrapper = new QueryWrapper<>();
        wrapper.lambda().eq(ExamQuestion::getQuestionType, chooseDTO.getQuestionType());
        List<ExamQuestion> questionList = list(wrapper);
        for (ExamQuestion question : questionList) {
            List<ExamQuestionItem> questionItemList = getQuestionItemList(question.getId());
            question.setQuestionItemList(questionItemList);
        }
        // 在questionList中随机抽题
        if (chooseDTO.getRandomCount() >= questionList.size()) {
            return questionList;
        }
        ArrayList<ExamQuestion> list = new ArrayList<>();
        int[] randomList = RandomUtil.getNoRepeatRandomList(chooseDTO.getRandomCount(), questionList.size());
        for (int i : randomList) {
            list.add(questionList.get(i));
        }
        return list;
    }


    public void saveQuestionItem(ExamQuestionItem questionItem, String questionId, Integer index) {
        questionItem.setSortIndex(index);
        questionItemService.save(questionItem);
        ExamQuestionRelationItem relationItem = new ExamQuestionRelationItem();
        relationItem.setQId(questionId);
        relationItem.setIId(questionItem.getId());
        relationItemService.save(relationItem);
    }
}
