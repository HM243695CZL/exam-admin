package com.hl.yyx.modules.exam.controller;

import com.hl.yyx.common.api.CommonResult;
import com.hl.yyx.common.log.LogAnnotation;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.*;

import com.hl.yyx.modules.exam.service.ExamPaperTypeService;
import com.hl.yyx.modules.exam.model.ExamPaperType;

import org.springframework.web.bind.annotation.RestController;

/**
 * <p>
 * 试题分类表 前端控制器
 * </p>
 *
 * @author hl243695czyn
 * @since 2023-04-19
 */
@Api(value = "试题分类管理", description = "试题分类管理")
@RestController
@RequestMapping("/admin/exam/paper-type")
    public class ExamPaperTypeController {

    @Autowired
    private ExamPaperTypeService examPaperTypeService;

    // 新增
    @LogAnnotation()
    @ApiOperation("新增试题分类")
    @RequestMapping(value = "/create", method = RequestMethod.POST)
    public CommonResult save(@RequestBody ExamPaperType examPaperType){
        return CommonResult.success(examPaperTypeService.save(examPaperType));
    }

    // 更新
    @LogAnnotation()
    @ApiOperation("更新试题分类")
    @RequestMapping(value = "/update", method = RequestMethod.POST)
    public CommonResult update(@RequestBody ExamPaperType examPaperType){
        return CommonResult.success(examPaperTypeService.updateById(examPaperType));
    }

    // 删除
    @LogAnnotation()
    @ApiOperation("删除试题分类")
    @RequestMapping(value = "/delete/{id}", method = RequestMethod.GET)
    public CommonResult delete(@PathVariable String id){
        return CommonResult.success( examPaperTypeService.removeById(id));
    }

    // 获取全部
    @LogAnnotation()
    @ApiOperation("获取全部试题分类")
    @RequestMapping(value = "/list", method = RequestMethod.GET)
    public CommonResult list(){
        return CommonResult.success(examPaperTypeService.getList());
    }

    // 查看
    @LogAnnotation()
    @ApiOperation("查看试题分类")
    @RequestMapping(value = "/view/{id}", method = RequestMethod.GET)
    public CommonResult findOne(@PathVariable String id){
        return CommonResult.success(examPaperTypeService.getById(id));
    }

}

