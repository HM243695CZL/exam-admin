package com.hl.yyx.modules.exam.controller;

import com.hl.yyx.common.api.CommonPage;
import com.hl.yyx.common.api.CommonResult;
import com.hl.yyx.common.log.LogAnnotation;
import com.hl.yyx.modules.exam.dto.ExamReviewPageDTO;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.*;

import com.hl.yyx.modules.exam.service.ExamReviewService;
import com.hl.yyx.modules.exam.model.ExamReview;

import java.util.List;

import org.springframework.web.bind.annotation.RestController;

/**
 * <p>
 * 复习资料 前端控制器
 * </p>
 *
 * @author hl243695czyn
 * @since 2023-10-23
 */
@Api(tags = "复习资料管理", description = "复习资料管理")
@RestController
@RequestMapping("/admin/exam/review")
    public class ExamReviewController {

    @Autowired
    private ExamReviewService examReviewService;

    // 分页查询
    @LogAnnotation()
    @ApiOperation("分页查询")
    @RequestMapping(value = "/page", method = RequestMethod.POST)
    public CommonResult page(@RequestBody ExamReviewPageDTO params) {
        return CommonResult.success(CommonPage.restPage(examReviewService.pageList(params)));
    }

    // 新增
    @LogAnnotation()
    @ApiOperation("新增复习资料")
    @RequestMapping(value = "/create", method = RequestMethod.POST)
    public CommonResult save(@RequestBody ExamReview examReview){
        return CommonResult.success(examReviewService.save(examReview));
    }

    // 更新
    @LogAnnotation()
    @ApiOperation("更新复习资料")
    @RequestMapping(value = "/update", method = RequestMethod.POST)
    public CommonResult update(@RequestBody ExamReview examReview){
        return CommonResult.success(examReviewService.updateById(examReview));
    }

    // 删除
    @LogAnnotation()
    @ApiOperation("删除复习资料")
    @RequestMapping(value = "/delete/{id}", method = RequestMethod.GET)
    public CommonResult delete(@PathVariable String id){
        return CommonResult.success( examReviewService.removeById(id));
    }

    // 批量删除
    @LogAnnotation()
    @ApiOperation("批量删除复习资料")
    @RequestMapping(value = "/batchDelete", method = RequestMethod.POST)
    public CommonResult delete(@RequestBody List<String> ids){
        return CommonResult.success( examReviewService.removeByIds(ids));
    }

    // 获取全部
    @LogAnnotation()
    @ApiOperation("获取全部复习资料")
    @RequestMapping(value = "/list", method = RequestMethod.GET)
    public CommonResult list(){
        return CommonResult.success(examReviewService.list());
    }

    // 查看
    @LogAnnotation()
    @ApiOperation("查看复习资料")
    @RequestMapping(value = "/view/{id}", method = RequestMethod.GET)
    public CommonResult findOne(@PathVariable String id){
        return CommonResult.success(examReviewService.getById(id));
    }

}

