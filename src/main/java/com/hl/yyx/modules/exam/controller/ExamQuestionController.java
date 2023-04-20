package com.hl.yyx.modules.exam.controller;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.hl.yyx.common.api.CommonPage;
import com.hl.yyx.common.api.CommonResult;
import com.hl.yyx.common.log.LogAnnotation;
import com.hl.yyx.modules.exam.dto.QuestionPageDTO;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.*;

import com.hl.yyx.modules.exam.service.ExamQuestionService;
import com.hl.yyx.modules.exam.model.ExamQuestion;

import org.springframework.web.bind.annotation.RestController;

/**
 * <p>
 * 试题表 前端控制器
 * </p>
 *
 * @author hl243695czyn
 * @since 2023-04-20
 */
@Api(value = "试题管理", description = "试题管理")
@RestController
@RequestMapping("/admin/exam/question")
    public class ExamQuestionController {

    @Autowired
    private ExamQuestionService examQuestionService;

    // 分页查询
    @LogAnnotation()
    @ApiOperation("分页查询")
    @RequestMapping(value = "/page", method = RequestMethod.POST)
    public CommonResult page(@RequestBody QuestionPageDTO params) {
        Page<ExamQuestion> questionList = examQuestionService.pageList(params);
        return CommonResult.success(CommonPage.restPage(questionList));
    }

    // 新增
    @LogAnnotation()
    @ApiOperation("新增试题")
    @RequestMapping(value = "/create", method = RequestMethod.POST)
    public CommonResult save(@RequestBody ExamQuestion examQuestion){
        return CommonResult.success(examQuestionService.create(examQuestion));
    }

    // 更新
    @LogAnnotation()
    @ApiOperation("更新试题")
    @RequestMapping(value = "/update", method = RequestMethod.POST)
    public CommonResult update(@RequestBody ExamQuestion examQuestion){
        return CommonResult.success(examQuestionService.updateQuestion(examQuestion));
    }

    // 删除
    @LogAnnotation()
    @ApiOperation("删除试题")
    @RequestMapping(value = "/delete/{id}", method = RequestMethod.GET)
    public CommonResult delete(@PathVariable String id){
        return CommonResult.success( examQuestionService.removeById(id));
    }

    // 获取全部
    @LogAnnotation()
    @ApiOperation("获取全部试题")
    @RequestMapping(value = "/list", method = RequestMethod.GET)
    public CommonResult list(){
        return CommonResult.success(examQuestionService.list());
    }

    // 查看
    @LogAnnotation()
    @ApiOperation("查看试题")
    @RequestMapping(value = "/view/{id}", method = RequestMethod.GET)
    public CommonResult findOne(@PathVariable String id){
        return CommonResult.success(examQuestionService.view(id));
    }

}

