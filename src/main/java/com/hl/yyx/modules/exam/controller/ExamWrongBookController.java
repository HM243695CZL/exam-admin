package com.hl.yyx.modules.exam.controller;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.hl.yyx.common.api.CommonPage;
import com.hl.yyx.common.api.CommonResult;
import com.hl.yyx.common.log.LogAnnotation;
import com.hl.yyx.modules.exam.dto.WrongBookDTO;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.*;

import com.hl.yyx.modules.exam.service.ExamWrongBookService;
import com.hl.yyx.modules.exam.model.ExamWrongBook;

import org.springframework.web.bind.annotation.RestController;

import java.util.List;

/**
 * <p>
 * 错题表 前端控制器
 * </p>
 *
 * @author hl243695czyn
 * @since 2023-05-11
 */
@Api(tags = "错题本", description = "错题本")
@RestController
@RequestMapping("/admin/exam/wrongBook")
    public class ExamWrongBookController {

    @Autowired
    private ExamWrongBookService examWrongBookService;

    // 分页
    @ApiOperation("分页查询")
    @LogAnnotation()
    @RequestMapping(value = "/page", method = RequestMethod.POST)
    public CommonResult page(@RequestBody WrongBookDTO params) {
        Page<ExamWrongBook> wrongBookList = examWrongBookService.pageList(params);
        return CommonResult.success(CommonPage.restPage(wrongBookList));
    }

    // 新增
    @RequestMapping(value = "/create", method = RequestMethod.POST)
    public CommonResult save(@RequestBody ExamWrongBook examWrongBook){
        return CommonResult.success(examWrongBookService.save(examWrongBook));
    }

    // 更新
    @RequestMapping(value = "/update", method = RequestMethod.POST)
    public CommonResult update(@RequestBody ExamWrongBook examWrongBook){
        return CommonResult.success(examWrongBookService.updateById(examWrongBook));
    }

    // 删除
    @RequestMapping(value = "/delete/{id}", method = RequestMethod.GET)
    public CommonResult delete(@PathVariable String id){
        return CommonResult.success( examWrongBookService.removeById(id));
    }

    // 批量删除
    @RequestMapping(value = "/batchDelete", method = RequestMethod.POST)
    public CommonResult delete(@RequestBody List<String> ids){
        return CommonResult.success( examWrongBookService.removeByIds(ids));
    }

    // 获取全部
    @RequestMapping(value = "/list", method = RequestMethod.GET)
    public CommonResult list(){
        return CommonResult.success(examWrongBookService.list());
    }

    // 查看
    @RequestMapping(value = "/view/{id}", method = RequestMethod.GET)
    public CommonResult findOne(@PathVariable String id){
        return CommonResult.success(examWrongBookService.getById(id));
    }

}

