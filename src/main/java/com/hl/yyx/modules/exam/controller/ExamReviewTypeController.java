package com.hl.yyx.modules.exam.controller;

import com.hl.yyx.common.api.CommonResult;
import com.hl.yyx.common.log.LogAnnotation;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.*;

import com.hl.yyx.modules.exam.service.ExamReviewTypeService;
import com.hl.yyx.modules.exam.model.ExamReviewType;

import java.util.List;

import org.springframework.web.bind.annotation.RestController;

/**
 * <p>
 * 复习资料分类表 前端控制器
 * </p>
 *
 * @author hl243695czyn
 * @since 2023-10-23
 */
@RestController
@RequestMapping("/admin/exam/review-type")
    public class ExamReviewTypeController {

    @Autowired
    private ExamReviewTypeService examReviewTypeService;

    // 新增
    @LogAnnotation()
    @ApiOperation("新增复习资料分类")
    @RequestMapping(value = "/create", method = RequestMethod.POST)
    public CommonResult save(@RequestBody ExamReviewType examReviewType){
        return CommonResult.success(examReviewTypeService.save(examReviewType));
    }

    // 更新
    @LogAnnotation()
    @ApiOperation("更新复习资料分类")
    @RequestMapping(value = "/update", method = RequestMethod.POST)
    public CommonResult update(@RequestBody ExamReviewType examReviewType){
        return CommonResult.success(examReviewTypeService.updateById(examReviewType));
    }

    // 删除
    @LogAnnotation()
    @ApiOperation("删除复习资料分类")
    @RequestMapping(value = "/delete/{id}", method = RequestMethod.GET)
    public CommonResult delete(@PathVariable String id){
        return CommonResult.success( examReviewTypeService.removeById(id));
    }

    // 获取全部
    @LogAnnotation()
    @ApiOperation("获取全部复习资料分类")
    @RequestMapping(value = "/list", method = RequestMethod.GET)
    public CommonResult list(){
        return CommonResult.success(examReviewTypeService.getList());
    }

    // 查看
    @LogAnnotation()
    @ApiOperation("查看复习资料分类")
    @RequestMapping(value = "/view/{id}", method = RequestMethod.GET)
    public CommonResult findOne(@PathVariable String id){
        return CommonResult.success(examReviewTypeService.getById(id));
    }

}

