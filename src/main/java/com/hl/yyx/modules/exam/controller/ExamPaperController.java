package com.hl.yyx.modules.exam.controller;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.hl.yyx.common.api.CommonPage;
import com.hl.yyx.common.api.CommonResult;
import com.hl.yyx.common.log.LogAnnotation;
import com.hl.yyx.modules.exam.dto.PaperPageDTO;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.*;

import com.hl.yyx.modules.exam.service.ExamPaperService;
import com.hl.yyx.modules.exam.model.ExamPaper;

import org.springframework.web.bind.annotation.RestController;

/**
 * <p>
 * 试卷库 前端控制器
 * </p>
 *
 * @author hl243695czyn
 * @since 2023-04-28
 */
@Api(tags = "试卷库", description = "试卷库")
@RestController
@RequestMapping("/admin/exam/paper")
    public class ExamPaperController {

    @Autowired
    private ExamPaperService examPaperService;

    // 分页查询
    @ApiOperation("分页查询")
    @LogAnnotation()
    @RequestMapping(value = "/page", method = RequestMethod.POST)
    public CommonResult page(@RequestBody PaperPageDTO params) {
        Page<ExamPaper> paperList = examPaperService.pageList(params);
        return CommonResult.success(CommonPage.restPage(paperList));
    }

    // 新增
    @ApiOperation("新增试卷")
    @LogAnnotation()
    @RequestMapping(value = "/create", method = RequestMethod.POST)
    public CommonResult save(@RequestBody ExamPaper examPaper){
        return CommonResult.success(examPaperService.create(examPaper));
    }

    // 更新
    @ApiOperation("更新试卷")
    @LogAnnotation()
    @RequestMapping(value = "/update", method = RequestMethod.POST)
    public CommonResult update(@RequestBody ExamPaper examPaper){
        return CommonResult.success(examPaperService.updateById(examPaper));
    }

    // 删除
    @ApiOperation("删除试卷")
    @LogAnnotation()
    @RequestMapping(value = "/delete/{id}", method = RequestMethod.GET)
    public CommonResult delete(@PathVariable String id){
        return CommonResult.success( examPaperService.removeById(id));
    }

    // 获取全部
    @ApiOperation("获取全部试卷")
    @LogAnnotation()
    @RequestMapping(value = "/list", method = RequestMethod.GET)
    public CommonResult list(){
        return CommonResult.success(examPaperService.list());
    }

    // 查看
    @ApiOperation("查看试卷")
    @LogAnnotation()
    @RequestMapping(value = "/view/{id}", method = RequestMethod.GET)
    public CommonResult findOne(@PathVariable String id){
        return CommonResult.success(examPaperService.getById(id));
    }

}

