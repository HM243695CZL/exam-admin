package com.hl.yyx.modules.exam.service.impl;

import cn.hutool.core.util.StrUtil;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.toolkit.StringUtils;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.hl.yyx.common.exception.ApiException;
import com.hl.yyx.common.util.ExcelUtils;
import com.hl.yyx.common.util.IOExcelUtils;
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
import org.apache.poi.ss.usermodel.Workbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.BufferedOutputStream;
import java.io.IOException;
import java.io.OutputStream;
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

    private static final String EXCEL_TABLE_HEADS = "题目名称-题目分类-题目类型-题目难度-题目分数-题目选项A-题目选项B-题目选项C-题目选项D-题目答案-题目解析";

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
        ArrayList<String> answerIdList = new ArrayList<>();
        // 更新试题答案
        String[] itemArr = new String[]{"A", "B", "C", "D", "E", "F"};
        for (int i = 0; i < itemArr.length; i++) {
            if (examQuestion.getType() == 1 || examQuestion.getType() == 3) {
                // 单选题或判断题
                if (examQuestion.getAnswer().equals(itemArr[i])) {
                    answerId = examQuestion.getQuestionItemList().get(i).getId();
                    break;
                }
            } else if (examQuestion.getType() == 2) {
                // 多选题
                if (examQuestion.getAnswer().contains(itemArr[i])) {
                    answerIdList.add(examQuestion.getQuestionItemList().get(i).getId());
                }
            }
        }
        if (examQuestion.getType() == 2) {
            answerId = String.join(",", answerIdList);
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
            // 启用逻辑删除时，需要将id设置为null
            item.setId(null);
            saveQuestionItem(item, examQuestion.getId(), index);
        }
        examQuestion.setAnswer(updateQuestionAnswer(examQuestion));
        return updateById(examQuestion);
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
        wrapper.lambda().eq(ExamQuestion::getType, chooseDTO.getType());
        List<ExamQuestion> questionList = list(wrapper);
        for (ExamQuestion question : questionList) {
            List<ExamQuestionItem> questionItemList = getQuestionItemList(question.getId());
            // 根据sort_index字段排序
            List<ExamQuestionItem> sortItemList = questionItemList.stream().sorted(Comparator.comparing(ExamQuestionItem::getSortIndex)).collect(Collectors.toList());
            question.setQuestionItemList(sortItemList);
        }
        // 在questionList中随机抽题
        if (chooseDTO.getRandomCount() >= questionList.size()) {
            return questionList;
        }
        ArrayList<ExamQuestion> list = new ArrayList<>();
        int[] randomList = RandomUtil.getNoRepeatRandomList(chooseDTO.getRandomCount(), questionList.size() - 1);
        for (int i : randomList) {
            list.add(questionList.get(i));
        }
        return list;
    }

    /**
     * 下载模板
     * @param request
     * @param response
     */
    @Override
    public void downloadModule(HttpServletRequest request, HttpServletResponse response) {
        try {
            List<String> titleName = Arrays.asList(EXCEL_TABLE_HEADS.split("-"));
            Workbook book = ExcelUtils.createWorkBook("试题", (String) null, null, titleName.subList(0, titleName.size()));
            String fileName = "试题导入模板.xlsx";
            response.setHeader("content-Type", "application/msexcel");
            response.setCharacterEncoding("UTF-8");
            OutputStream os = new BufferedOutputStream(response.getOutputStream());
            fileName = new String(fileName.getBytes("UTF-8"), "iso-8859-1");
            response.setHeader("Content-Disposition", "attachment;filename=" + fileName);
            book.write(os);
        } catch (Exception e) {
           e.printStackTrace();
           throw new ApiException("数据模板下载异常");
        }
    }

    /**
     * 导入试题
     * @param file
     */
    @Override
    @Transactional
    public void importExcel(MultipartFile file) {
        List<String> columnNames = Arrays.asList(EXCEL_TABLE_HEADS.split("-"));
        IOExcelUtils.SheetData sheetData = IOExcelUtils.validExcel(file, columnNames.subList(0, columnNames.size()));
        List<List<String>> rowDatas = sheetData.getDatas();
        List<ExamQuestion> questionList = validateExcelData(rowDatas);
        List<ExamQuestionItem> questionItemList = validateExcelQuestionItem(rowDatas);
        int questionNumber = 0;
        for (ExamQuestion examQuestion : questionList) {
            save(examQuestion);
            for (ExamQuestionItem item : questionItemList.subList(questionNumber * 4, (questionNumber + 1) * 4)) {
                questionItemService.save(item);
                ExamQuestionRelationItem relationItem = new ExamQuestionRelationItem();
                relationItem.setQId(examQuestion.getId());
                relationItem.setIId(item.getId());
                relationItemService.save(relationItem);
            }
            String currentQuestionAnswer = "";
            String[] itemArr = new String[]{"A", "B", "C", "D", "E", "F"};
            for (int i = 0; i < itemArr.length; i++) {
                if (examQuestion.getAnswer().equals(itemArr[i])) {
                    currentQuestionAnswer = questionItemList.subList(questionNumber * 4, (questionNumber + 1) * 4).get(i).getId();
                    break;
                }
            }
            questionNumber += 1;
            examQuestion.setAnswer(currentQuestionAnswer);
            updateById(examQuestion);
        }
    }

    /**
     * 批量删除
     * @param ids
     * @return
     */
    @Transactional
    @Override
    public Boolean batchDelete(List<String> ids) {
        for (String id : ids) {
            delete(id);
        }
        return true;
    }

    /**
     * 验证excel数据并构建新增参数
     * @param rowDatas
     * @return
     */
    private List<ExamQuestion> validateExcelData(List<List<String>> rowDatas) {
        List<ExamQuestion> questionParams = new ArrayList<>();
        List<ExamQuestion> allQuestion = list();
        Set<String> tmpQuestionName = allQuestion.stream().map(ExamQuestion::getQuestion).collect(Collectors.toSet());
        List<ExamQuestionType> questionTypes = paperTypeService.list();

        HashMap<String, String> questionTypeMap = new HashMap<>();
        Set<String> questionTypeName = questionTypes.stream().map(ExamQuestionType::getName).collect(Collectors.toSet());
        Set<String> questionTypeId = questionTypes.stream().map(ExamQuestionType::getId).collect(Collectors.toSet());

        HashMap<Integer, String> typeMap = new HashMap<>();
        ArrayList<String> typeList = new ArrayList<>();
        typeMap.put(1, "单选题");
        typeMap.put(2, "多选题");
        typeMap.put(3, "判断题");
        typeMap.put(4, "简答题");
        typeList.add("单选题");
        typeList.add("多选题");
        typeList.add("判断题");
        typeList.add("简答题");

        HashMap<Integer, String> difficultyMap = new HashMap<>();
        ArrayList<String> difficultyList = new ArrayList<>();
        difficultyMap.put(1, "简单");
        difficultyMap.put(2, "一般");
        difficultyMap.put(3, "困难");
        difficultyList.add("简单");
        difficultyList.add("一般");
        difficultyList.add("困难");

        questionTypeName.forEach(item -> {
            questionTypeMap.put(item, questionTypeId.stream().filter(id -> questionTypes.stream().filter(type -> type.getName().equals(item)).findFirst().get().getId().equals(id)).findFirst().get());
        });

        for (List<String> rowData : rowDatas) {
            ExamQuestion question = new ExamQuestion();
            // 表头： 题目名称-题目分类-题目类型-题目难度-题目分数-题目选项A-题目选项B-题目选项C-题目选项D-题目答案-题目解析
            // 题目名称
            String questionName = rowData.get(0).trim();
            if (StringUtils.isBlank(questionName)) {
                throw new ApiException("第" + (rowDatas.indexOf(rowData) + 1) + "行的“题目名称“未填写");
            }
            if (tmpQuestionName.contains(questionName)) {
                throw new ApiException("第" + (rowDatas.indexOf(rowData) + 1) + "行的“题目名称“已存在");
            }
            question.setQuestion(questionName);
            // 题目分类
            String questionCategory = rowData.get(1).trim();
            if (StringUtils.isBlank(questionCategory)) {
                throw new ApiException("第" + (rowDatas.indexOf(rowData) + 1) + "行的“题目分类“未填写");
            }
            if (!questionTypeName.contains(questionCategory)) {
                throw new ApiException("第" + (rowDatas.indexOf(rowData) + 1) + "行的“题目分类“不存在");
            }
            question.setQuestionType(questionTypeMap.get(questionCategory));
            // 题目类型
            if (StringUtils.isBlank(rowData.get(2).trim())) {
                throw new ApiException("第" + (rowDatas.indexOf(rowData) + 1) + "行的“题目类型“未填写");
            }
            if (!typeList.contains(rowData.get(2).trim())) {
                throw new ApiException("第" + (rowDatas.indexOf(rowData) + 1) + "行的“题目类型“不存在");
            }
            question.setType(typeMap.entrySet().stream().filter(item -> item.getValue().equals(rowData.get(2).trim())).findFirst().get().getKey());
            // 题目难度
            if (StringUtils.isBlank(rowData.get(3).trim())) {
                throw new ApiException("第" + (rowDatas.indexOf(rowData) + 1) + "行的“题目难度“未填写");
            }
            if (!difficultyList.contains(rowData.get(3).trim())) {
                throw new ApiException("第" + (rowDatas.indexOf(rowData) + 1) + "行的“题目难度“不存在");
            }
            question.setDifficulty(difficultyMap.entrySet().stream().filter(item -> item.getValue().equals(rowData.get(3).trim())).findFirst().get().getKey());
            // 题目分数
            if (StringUtils.isBlank(rowData.get(4).trim())) {
                throw new ApiException("第" + (rowDatas.indexOf(rowData) + 1) + "行的“题目分数“未填写");
            }
            if (!rowData.get(4).trim().matches("^[0-9]*$")) {
                throw new ApiException("第" + (rowDatas.indexOf(rowData) + 1) + "行的“题目分数“格式不正确");
            }
            question.setScore(Integer.parseInt(rowData.get(4).trim()));
            // 题目答案
            if (StringUtils.isBlank(rowData.get(9).trim())) {
                throw new ApiException("第" + (rowDatas.indexOf(rowData) + 1) + "行的“题目答案“未填写");
            }
            question.setAnswer(rowData.get(9).trim());
            // 题目解析
            question.setAnalysis(rowData.get(10).trim());
            questionParams.add(question);
        }
        return questionParams;
    }

    /**
     * 验证excel数据，构建新增试题选项参数
     * @param rowDatas
     * @return
     */
    private List<ExamQuestionItem> validateExcelQuestionItem(List<List<String>> rowDatas) {
        List<ExamQuestionItem> questionItemList = new ArrayList<>();
        for (List<String> rowData : rowDatas) {
            ExamQuestionItem questionItemA = new ExamQuestionItem();
            ExamQuestionItem questionItemB = new ExamQuestionItem();
            ExamQuestionItem questionItemC = new ExamQuestionItem();
            ExamQuestionItem questionItemD = new ExamQuestionItem();
            // 表头： 题目名称-题目分类-题目类型-题目难度-题目分数-题目选项A-题目选项B-题目选项C-题目选项D-题目答案-题目解析
            // 题目选项A
            if (StringUtils.isBlank(rowData.get(5).trim())) {
                throw new ApiException("第" + (rowDatas.indexOf(rowData) + 1) + "行的“题目选项A“未填写");
            }
            // 题目选项B
            if (StringUtils.isBlank(rowData.get(6).trim())) {
                throw new ApiException("第" + (rowDatas.indexOf(rowData) + 1) + "行的“题目选项B“未填写");
            }
            // 题目选项C
            if (StringUtils.isBlank(rowData.get(7).trim())) {
                throw new ApiException("第" + (rowDatas.indexOf(rowData) + 1) + "行的“题目选项C“未填写");
            }
            // 题目选项D
            if (StringUtils.isBlank(rowData.get(8).trim())) {
                throw new ApiException("第" + (rowDatas.indexOf(rowData) + 1) + "行的“题目选项D“未填写");
            }
            questionItemA.setSortIndex(1);
            questionItemA.setName(rowData.get(5).trim());
            questionItemList.add(questionItemA);

            questionItemB.setSortIndex(2);
            questionItemB.setName(rowData.get(6).trim());
            questionItemList.add(questionItemB);

            questionItemC.setSortIndex(3);
            questionItemC.setName(rowData.get(7).trim());
            questionItemList.add(questionItemC);

            questionItemD.setSortIndex(4);
            questionItemD.setName(rowData.get(8).trim());
            questionItemList.add(questionItemD);
        }
        return questionItemList;
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
