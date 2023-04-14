package com.hl.yyx.modules.ums.controller;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.hl.yyx.common.api.CommonPage;
import com.hl.yyx.common.api.CommonResult;
import com.hl.yyx.common.log.LogAnnotation;
import com.hl.yyx.modules.ums.dto.ClassPageDTO;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.*;

import com.hl.yyx.modules.ums.service.UmsClassService;
import com.hl.yyx.modules.ums.model.UmsClass;

import org.springframework.web.bind.annotation.RestController;

/**
 * <p>
 * 班级表 前端控制器
 * </p>
 *
 * @author hl243695czyn
 * @since 2023-04-12
 */
@RestController
@Api(tags = "班级管理", description = "班级管理")
@RequestMapping("/admin/class-mng")
    public class UmsClassController {

    @Autowired
    private UmsClassService umsClassService;

    // 分页查询
    @LogAnnotation()
    @ApiOperation("分页查询")
    @RequestMapping(value = "/page", method = RequestMethod.POST)
    public CommonResult page(@RequestBody ClassPageDTO paramsDTO) {
        Page<UmsClass> classList = umsClassService.pageList(paramsDTO);
        return CommonResult.success(CommonPage.restPage(classList));
    }

    // 新增
    @LogAnnotation()
    @ApiOperation("新增班级")
    @RequestMapping(value = "/create", method = RequestMethod.POST)
    public CommonResult save(@RequestBody UmsClass umsClass){
        return CommonResult.success(umsClassService.save(umsClass));
    }

    // 更新
    @LogAnnotation()
    @ApiOperation("更新班级")
    @RequestMapping(value = "/update", method = RequestMethod.POST)
    public CommonResult update(@RequestBody UmsClass umsClass){
        return CommonResult.success(umsClassService.updateById(umsClass));
    }

    // 删除
    @LogAnnotation()
    @ApiOperation("删除班级")
    @RequestMapping(value = "/delete/{id}", method = RequestMethod.GET)
    public CommonResult delete(@PathVariable String id){
        return CommonResult.success( umsClassService.removeById(id));
    }

    // 获取全部
    @LogAnnotation()
    @ApiOperation("获取全部班级")
    @RequestMapping(value = "/list", method = RequestMethod.GET)
    public CommonResult list(){
        return CommonResult.success(umsClassService.list());
    }

    // 查看
    @LogAnnotation()
    @ApiOperation("查看班级")
    @RequestMapping(value = "/view/{id}", method = RequestMethod.GET)
    public CommonResult findOne(@PathVariable String id){
        return CommonResult.success(umsClassService.getById(id));
    }

}

