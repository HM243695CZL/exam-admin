package com.hl.yyx.modules.exam.service.impl;

import cn.hutool.core.bean.BeanUtil;
import cn.hutool.core.util.ObjectUtil;
import cn.hutool.core.util.StrUtil;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.hl.yyx.modules.exam.dto.*;
import com.hl.yyx.modules.exam.model.*;
import com.hl.yyx.modules.exam.mapper.ExamPaperMapper;
import com.hl.yyx.modules.exam.service.*;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import io.swagger.models.auth.In;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.*;
import java.util.stream.Collectors;

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

    @Autowired
    private ExamQuestionService questionService;

    @Autowired
    private ExamQuestionItemService questionItemService;

    @Autowired
    private ExamQuestionRelationItemService relationItemService;

    @Autowired
    private ExamPaperPublishService publishService;


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
        setBigQuestion(examPaper);
        return b;
    }

    @Override
    public Object view(String id, Boolean isPreview) {
        ViewPaperDTO viewPaper = new ViewPaperDTO();
        ExamPaper paper = getById(id);

        viewPaper.setPaper(paper);

        ArrayList<BigQuestionDTO> bigQuestionList = new ArrayList<>();
        // 获取大题
        QueryWrapper<ExamPaperBig> wrapper = new QueryWrapper<>();
        wrapper.lambda().eq(ExamPaperBig::getPaperId, id);
        List<ExamPaperBig> bigList = paperBigService.list(wrapper);
        for (ExamPaperBig paperBig : bigList) {
            BigQuestionDTO bigQuestion = new BigQuestionDTO();
            bigQuestion.setBigId(paperBig.getId());
            bigQuestion.setBigName(paperBig.getName());
            bigQuestion.setPaperId(paperBig.getPaperId());
            bigQuestion.setType(paperBig.getType());
            bigQuestion.setQuestionScore(paperBig.getQuestionScore());
            // 获取大题中的题目
            if (paperBig.getType().equals("1")) {
                // 单选题
                QueryWrapper<ExamPaperBigRelation> queryWrapper = new QueryWrapper<>();
                queryWrapper.lambda().eq(ExamPaperBigRelation::getBigId, paperBig.getId());
                List<ExamPaperBigRelation> list = relationService.list(queryWrapper);
                ArrayList<QuestionMapDTO> questionList = new ArrayList<>();
                for (ExamPaperBigRelation relation : list) {
                    // 获取试题名称
                    ExamQuestion questionInfo = questionService.getById(relation.getQuestionId());

                    QuestionMapDTO questionMap = new QuestionMapDTO();
                    questionMap.setId(questionInfo.getId());
                    questionMap.setQuestion(questionInfo.getQuestion());
                    questionMap.setScore(relation.getScore());
                    if (!isPreview) {
                        questionMap.setAnswer(questionInfo.getAnswer());
                        questionMap.setAnalysis(questionInfo.getAnalysis());
                    }
                    questionMap.setSortIndex(relation.getSortIndex());
                    // 根据试题id获取选项id
                    List<String> itemIds = relationItemService.list(new QueryWrapper<ExamQuestionRelationItem>()
                            .eq("q_id", relation.getQuestionId()).select("i_id")).stream()
                            .map(ExamQuestionRelationItem::getIId).collect(Collectors.toList());
                    // 根据试题选项表查询对应的选项名称
                    ArrayList<ExamQuestionItem> itemList = new ArrayList<>();
                    for (String itemId: itemIds) {
                        itemList.add(questionItemService.getById(itemId));
                    }
                    // 根据sort_index字段排序
                    List<ExamQuestionItem> sortItemList = itemList.stream().sorted(Comparator.comparing(ExamQuestionItem::getSortIndex)).collect(Collectors.toList());
                    questionMap.setQuestionItemList(sortItemList);
                    questionList.add(questionMap);
                }
                // 排序
                List<QuestionMapDTO> sortQuestionList = questionList.stream().sorted(Comparator.comparing(QuestionMapDTO::getSortIndex)).collect(Collectors.toList());
                bigQuestion.setQuestionList(sortQuestionList);
            }
            bigQuestionList.add(bigQuestion);
        }
        viewPaper.setQuestionBigList(bigQuestionList);
        return viewPaper;
    }

    @Transactional
    @Override
    public Boolean updatePaper(ExamPaper examPaper) {
        boolean update = updateById(examPaper);
        // 更新大题， 先删除，再添加
        QueryWrapper<ExamPaperBig> wrapper = new QueryWrapper<>();
        wrapper.lambda().eq(ExamPaperBig::getPaperId, examPaper.getId());
        paperBigService.remove(wrapper);

        QueryWrapper<ExamPaperBigRelation> queryWrapper = new QueryWrapper<>();
        queryWrapper.lambda().eq(ExamPaperBigRelation::getPaperId, examPaper.getId());
        relationService.remove(queryWrapper);
        setBigQuestion(examPaper);
        return update;
    }

    private void setBigQuestion(ExamPaper examPaper) {
        for (ExamPaperBig examPaperBig : examPaper.getQuestionBigType()) {
            ExamPaperBig paperBig = new ExamPaperBig();
            BeanUtil.copyProperties(examPaperBig, paperBig);
            paperBig.setPaperId(examPaper.getId());
            paperBigService.save(paperBig);
            // 更新大题中的题目
            saveQuestionOption(examPaper, examPaperBig, paperBig);
        }
    }

    private void saveQuestionOption(ExamPaper examPaper, ExamPaperBig examPaperBig, ExamPaperBig paperBig) {
        Integer index = 0;
        for (ExamPaperBigRelation bigRelation : examPaperBig.getQuestionList()) {
            ExamPaperBigRelation relation = new ExamPaperBigRelation();
            relation.setBigId(paperBig.getId());
            relation.setQuestionId(bigRelation.getId());
            relation.setScore(bigRelation.getScore());
            relation.setPaperId(examPaper.getId());
            index ++;
            relation.setSortIndex(index);
            relationService.save(relation);
        }
    }

    @Transactional
    @Override
    public Boolean delete(String id) {
        boolean b = removeById(id);
        QueryWrapper<ExamPaperBig> wrapper = new QueryWrapper<>();
        wrapper.lambda().eq(ExamPaperBig::getPaperId, id);
        paperBigService.remove(wrapper);

        QueryWrapper<ExamPaperBigRelation> queryWrapper = new QueryWrapper<>();
        queryWrapper.lambda().eq(ExamPaperBigRelation::getPaperId, id);
        relationService.remove(queryWrapper);
        return b;
    }

    /**
     * 发布考试
     * @param examDTO
     * @return
     */
    @Transactional
    @Override
    public Boolean publishExam(PublishExamDTO examDTO) {
        // 先删除已发布班级
        QueryWrapper<ExamPaperPublish> queryWrapper = new QueryWrapper<>();
        queryWrapper.lambda().eq(ExamPaperPublish::getPaperId, examDTO.getPaperId());
        publishService.remove(queryWrapper);

        for (Integer classId : examDTO.getClassId()) {
            ExamPaperPublish paperPublish = new ExamPaperPublish();
            paperPublish.setPaperId(examDTO.getPaperId());
            paperPublish.setClassId(classId);
            publishService.save(paperPublish);
        }
        return true;
    }

    /**
     * 获取已发布班级
     * @param id
     * @return
     */
    @Override
    public List<Integer> getPublishClass(String id) {
        QueryWrapper<ExamPaperPublish> queryWrapper = new QueryWrapper<>();
        queryWrapper.lambda().eq(ExamPaperPublish::getPaperId, id);
        List<ExamPaperPublish> list = publishService.list(queryWrapper);
        ArrayList<Integer> publishList = new ArrayList<>();
        for (ExamPaperPublish publish : list) {
            publishList.add(publish.getClassId());
        }
        return publishList;
    }
}
