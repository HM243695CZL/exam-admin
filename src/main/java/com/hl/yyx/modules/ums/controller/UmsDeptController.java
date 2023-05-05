package com.hl.yyx.modules.ums.controller;

import com.hl.yyx.common.api.CommonResult;
import com.hl.yyx.common.log.LogAnnotation;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.*;

import com.hl.yyx.modules.ums.service.UmsDeptService;
import com.hl.yyx.modules.ums.model.UmsDept;

import org.springframework.web.bind.annotation.RestController;

/**
 * <p>
 * 部门表 前端控制器
 * </p>
 *
 * @author hl243695czyn
 * @since 2023-04-19
 */
@Api(tags = "部门管理", description = "部门管理")
@RestController
@RequestMapping("/admin/dept")
    public class UmsDeptController {

    @Autowired
    private UmsDeptService umsDeptService;

    // 新增
    @LogAnnotation()
    @ApiOperation("新增部门")
    @RequestMapping(value = "/create", method = RequestMethod.POST)
    public CommonResult save(@RequestBody UmsDept umsDept){
        return CommonResult.success(umsDeptService.save(umsDept));
    }

    // 更新
    @LogAnnotation()
    @ApiOperation("更新部门")
    @RequestMapping(value = "/update", method = RequestMethod.POST)
    public CommonResult update(@RequestBody UmsDept umsDept){
        return CommonResult.success(umsDeptService.updateById(umsDept));
    }

    // 删除
    @LogAnnotation()
    @ApiOperation("删除部门")
    @RequestMapping(value = "/delete/{id}", method = RequestMethod.GET)
    public CommonResult delete(@PathVariable String id){
        return CommonResult.success( umsDeptService.removeById(id));
    }

    // 获取全部
    @LogAnnotation()
    @ApiOperation("获取全部部门")
    @RequestMapping(value = "/list", method = RequestMethod.GET)
    public CommonResult list(){
        return CommonResult.success(umsDeptService.getList());
    }

    // 查看
    @LogAnnotation()
    @ApiOperation("查看部门")
    @RequestMapping(value = "/view/{id}", method = RequestMethod.GET)
    public CommonResult findOne(@PathVariable String id){
        return CommonResult.success(umsDeptService.getById(id));
    }

}

