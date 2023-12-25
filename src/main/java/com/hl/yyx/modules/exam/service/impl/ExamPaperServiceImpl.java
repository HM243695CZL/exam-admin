package com.hl.yyx.modules.exam.service.impl;

import cn.hutool.core.bean.BeanUtil;
import cn.hutool.core.util.ObjectUtil;
import cn.hutool.core.util.StrUtil;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.hl.yyx.common.util.UserThreadLocalUtil;
import com.hl.yyx.modules.exam.dto.*;
import com.hl.yyx.modules.exam.model.*;
import com.hl.yyx.modules.exam.mapper.ExamPaperMapper;
import com.hl.yyx.modules.exam.service.*;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.hl.yyx.modules.ums.model.UmsAdmin;
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
@SuppressWarnings("all")
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

    @Autowired
    private ExamPaperMapper paperMapper;

    @Autowired
    private ExamRecordService recordService;

    @Autowired
    private ExamSubAnswerRelationService answerRelationService;

    @Autowired
    private ExamWrongBookService wrongBookService;


    @Override
    public Page<ExamPaper> pageList(PaperPageDTO params) {
        Page<ExamPaper> page = new Page<>(params.getPageIndex(), params.getPageSize());
        QueryWrapper<ExamPaper> wrapper = new QueryWrapper<>();
        if (StrUtil.isNotEmpty(params.getName())) {
            wrapper.lambda().like(ExamPaper::getName, params.getName());
        }
        Page<ExamPaper> paperPage = page(page, wrapper);
        getPaperQuestionInfo(paperPage);
        return  paperPage;
    }

    public void getPaperQuestionInfo(Page<ExamPaper> paperPage) {
        for (ExamPaper record : paperPage.getRecords()) {
            QueryWrapper<ExamPaperBig> queryWrapper = new QueryWrapper<>();
            queryWrapper.lambda().eq(ExamPaperBig::getPaperId, record.getId());
            List<ExamPaperBig> list = paperBigService.list(queryWrapper);
            String paperInfo = "";
            Integer singleCount = 0;
            Integer multiCount = 0;
            Integer judgeCount = 0;
            for (ExamPaperBig paperBig : list) {
                if (paperBig.getType().equals("1")) {
                    // 单选题
                    QueryWrapper<ExamPaperBigRelation> wrapperRelation = new QueryWrapper<>();
                    wrapperRelation.lambda().eq(ExamPaperBigRelation::getBigId, paperBig.getId());
                    int relationCount = relationService.count(wrapperRelation);
                    singleCount += relationCount;
                }
                if (paperBig.getType().equals("2")) {
                    // 多选题
                    QueryWrapper<ExamPaperBigRelation> wrapperRelation = new QueryWrapper<>();
                    wrapperRelation.lambda().eq(ExamPaperBigRelation::getBigId, paperBig.getId());
                    int relationCount = relationService.count(wrapperRelation);
                    multiCount += relationCount;
                }
                if (paperBig.getType().equals("3")) {
                    // 判断题
                    QueryWrapper<ExamPaperBigRelation> wrapperRelation = new QueryWrapper<>();
                    wrapperRelation.lambda().eq(ExamPaperBigRelation::getBigId, paperBig.getId());
                    int relationCount = relationService.count(wrapperRelation);
                    judgeCount += relationCount;
                }
            }
            if (!singleCount.equals(0)) {
                paperInfo = "单选题(" + singleCount + ") ";
            }
            if (!multiCount.equals(0)) {
                paperInfo += "多选题(" + multiCount + ") ";
            }
            if (!judgeCount.equals(0)) {
                paperInfo += "判断题(" + judgeCount + ") ";
            }
            // 是否已有考试记录
            UmsAdmin admin = UserThreadLocalUtil.get();
            QueryWrapper<ExamRecord> wrapper = new QueryWrapper<>();
            wrapper.lambda().eq(ExamRecord::getUserId, admin.getId());
            wrapper.lambda().eq(ExamRecord::getPaperId, record.getId());
            ExamRecord examRecord = recordService.getOne(wrapper);
            if (examRecord != null) {
                record.setExamScore(examRecord.getScore());
                record.setSubmitTime(examRecord.getSubmitTime());
            }
            record.setQuestionInfo(paperInfo);
        }
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
        List<BigQuestionDTO> bigQuestionList = getBigQuestionList(id, isPreview);
        viewPaper.setQuestionBigList(bigQuestionList);
        if (!isPreview) {
            // 获取用户答题记录
            UmsAdmin admin = UserThreadLocalUtil.get();
            QueryWrapper<ExamRecord> recordQueryWrapper = new QueryWrapper<>();
            recordQueryWrapper.lambda().eq(ExamRecord::getUserId, admin.getId());
            recordQueryWrapper.lambda().eq(ExamRecord::getPaperId, id);
            ExamRecord examRecord = recordService.getOne(recordQueryWrapper);
            viewPaper.setAnswerRecordInfo(examRecord);
        }
        return viewPaper;
    }


    /**
     * 获取试卷的大题
     * @param paperId
     * @return
     */
    public List<BigQuestionDTO> getBigQuestionList(String paperId, Boolean isPreview) {
        UmsAdmin admin = UserThreadLocalUtil.get();
        ArrayList<BigQuestionDTO> bigQuestionList = new ArrayList<>();
        // 获取大题
        QueryWrapper<ExamPaperBig> wrapper = new QueryWrapper<>();
        wrapper.lambda().eq(ExamPaperBig::getPaperId, paperId);
        List<ExamPaperBig> bigList = paperBigService.list(wrapper);
        for (ExamPaperBig paperBig : bigList) {
            BigQuestionDTO bigQuestion = new BigQuestionDTO();
            bigQuestion.setBigId(paperBig.getId());
            bigQuestion.setBigName(paperBig.getName());
            bigQuestion.setPaperId(paperBig.getPaperId());
            bigQuestion.setType(paperBig.getType());
            bigQuestion.setQuestionScore(paperBig.getQuestionScore());
            // 获取大题中的题目
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
                questionMap.setQuestionUrl(questionInfo.getQuestionUrl());
                questionMap.setScore(relation.getScore());
                questionMap.setType(questionInfo.getType());
                if (!isPreview) {
                    questionMap.setAnswer(questionInfo.getAnswer());
                    questionMap.setAnalysis(questionInfo.getAnalysis());
                    questionMap.setAnalysisUrl(questionInfo.getAnalysisUrl());
                    // 获取当前用户的答案
                    QueryWrapper<ExamSubAnswerRelation> currentAnswerQuery = new QueryWrapper<>();
                    currentAnswerQuery.lambda().eq(ExamSubAnswerRelation::getUserId, admin.getId());
                    currentAnswerQuery.lambda().eq(ExamSubAnswerRelation::getPaperId, paperId);
                    currentAnswerQuery.lambda().eq(ExamSubAnswerRelation::getQuestionId, questionInfo.getId());
                    ExamSubAnswerRelation answerRelation = answerRelationService.getOne(currentAnswerQuery);
                    if (answerRelation != null) {
                        questionMap.setCurrentUserAnswer(answerRelation.getAnswer());
                    }
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
            bigQuestionList.add(bigQuestion);
        }
        return bigQuestionList;
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
        // 更新发布时间
        ExamPaper paper = getById(examDTO.getPaperId());
        paper.setPublishTime(new Date());
        updateById(paper);

        // 先删除已发布班级
        QueryWrapper<ExamPaperPublish> queryWrapper = new QueryWrapper<>();
        queryWrapper.lambda().eq(ExamPaperPublish::getPaperId, examDTO.getPaperId());
        publishService.remove(queryWrapper);
        for (String classId : examDTO.getClassId()) {
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
    public List<String> getPublishClass(String id) {
        QueryWrapper<ExamPaperPublish> queryWrapper = new QueryWrapper<>();
        queryWrapper.lambda().eq(ExamPaperPublish::getPaperId, id);
        List<ExamPaperPublish> list = publishService.list(queryWrapper);
        ArrayList<String> publishList = new ArrayList<>();
        for (ExamPaperPublish publish : list) {
            publishList.add(publish.getClassId());
        }
        return publishList;
    }

    /**
     * 获取我的考试
     * @param pageDTO
     * @return
     */
    @Override
    public Page<ExamPaper> getMyExam(PaperPageDTO pageDTO) {
        UmsAdmin currentUser = UserThreadLocalUtil.get();
        // 获取当前用户所在班级的考试
        Page<ExamPaper> page = new Page<>(pageDTO.getPageIndex(), pageDTO.getPageSize());
        Page<ExamPaper> paperPage = paperMapper.getMyExamPageList(page, pageDTO, currentUser.getClassId());
        getPaperQuestionInfo(paperPage);
        return paperPage;
    }

    @Transactional
    @Override
    public Boolean submitPaper(SubmitPaperDTO params) {
        UmsAdmin currentUser = UserThreadLocalUtil.get();

        ExamRecord record = new ExamRecord();
        record.setPaperId(params.getPaperId());
        record.setRecordStatus(1);
        record.setUserId(currentUser.getId());
        record.setSubmitTime(new Date());

        // 计算试卷得分
        Integer totalScore = 0;
        // 获取试卷信息
        ExamPaper paperInfo = getById(params.getPaperId());
        for (BigQuestionDTO bigQuestionDTO : getBigQuestionList(params.getPaperId(), true)) {
            for (QuestionMapDTO mapDTO : bigQuestionDTO.getQuestionList()) {
                ExamQuestion question = questionService.getById(mapDTO.getId());
                String answer = params.getAnswerMap().get(mapDTO.getId());
                if (question.getAnswer().equals(answer)) {
                    // 获取本题得分
                    QueryWrapper<ExamPaperBigRelation> wrapper = new QueryWrapper<>();
                    wrapper.lambda().eq(ExamPaperBigRelation::getBigId, bigQuestionDTO.getBigId());
                    wrapper.lambda().eq(ExamPaperBigRelation::getPaperId, params.getPaperId());
                    wrapper.lambda().eq(ExamPaperBigRelation::getQuestionId, mapDTO.getId());
                    ExamPaperBigRelation bigRelation = relationService.getOne(wrapper);
                    totalScore += bigRelation.getScore();
                } else {
                    // 添加到错题本， 如果当前用户已错过，则增加做错次数
                    QueryWrapper<ExamWrongBook> wrapper = new QueryWrapper<>();
                    wrapper.lambda().eq(ExamWrongBook::getUserId, currentUser.getId());
                    wrapper.lambda().eq(ExamWrongBook::getQuestionId, mapDTO.getId());
                    ExamWrongBook wrongQuestion = wrongBookService.getOne(wrapper);
                    if (wrongQuestion != null) {
                        wrongQuestion.setWrongCount(wrongQuestion.getWrongCount() + 1);
                        wrongBookService.updateById(wrongQuestion);
                    } else {
                        ExamWrongBook wrongBook = new ExamWrongBook();
                        wrongBook.setQuestionId(mapDTO.getId());
                        wrongBook.setUserId(currentUser.getId());
                        wrongBook.setCorrectAnswerId(question.getAnswer());
                        wrongBook.setSelfAnswerId(answer);
                        wrongBookService.save(wrongBook);
                    }
                }
            }
        }
        record.setScore(totalScore);
        boolean save = recordService.save(record);
        for (String questionId: params.getAnswerMap().keySet()) {
            ExamSubAnswerRelation relation = new ExamSubAnswerRelation();
            relation.setPaperId(params.getPaperId());
            relation.setUserId(currentUser.getId());
            relation.setQuestionId(questionId);
            relation.setAnswer(params.getAnswerMap().get(questionId));
            answerRelationService.save(relation);
        }
        return save;
    }
}
