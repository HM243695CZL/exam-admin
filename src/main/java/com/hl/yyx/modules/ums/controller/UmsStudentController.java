package com.hl.yyx.modules.ums.controller;

import com.hl.yyx.common.api.CommonResult;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.*;

import com.hl.yyx.modules.ums.service.UmsStudentService;
import com.hl.yyx.modules.ums.model.UmsStudent;

import org.springframework.web.bind.annotation.RestController;

/**
 * <p>
 * 学生表 前端控制器
 * </p>
 *
 * @author hl243695czyn
 * @since 2023-04-10
 */
@Api(tags = "学生管理", description = "学生管理")
@RestController
@RequestMapping("/admin/student")
    public class UmsStudentController {

    @Autowired
    private UmsStudentService umsStudentService;

    // 新增
    @ApiOperation("新增学生")
    @RequestMapping(value = "/create", method = RequestMethod.POST)
    public CommonResult save(@RequestBody UmsStudent umsStudent){
        return CommonResult.success(umsStudentService.save(umsStudent));
    }

    // 更新
    @ApiOperation("更新学生")
    @RequestMapping(value = "/update", method = RequestMethod.POST)
    public CommonResult update(@RequestBody UmsStudent umsStudent){
        return CommonResult.success(umsStudentService.updateById(umsStudent));
    }

    // 删除
    @ApiOperation("删除学生")
    @RequestMapping(value = "/delete/{id}", method = RequestMethod.GET)
    public CommonResult delete(@PathVariable String id){
        return CommonResult.success( umsStudentService.removeById(id));
    }

    // 获取全部
    @ApiOperation("获取全部学生")
    @RequestMapping(value = "/list", method = RequestMethod.GET)
    public CommonResult list(){
        return CommonResult.success(umsStudentService.list());
    }

    // 查看
    @ApiOperation("查看学生")
    @RequestMapping(value = "/view/{id}", method = RequestMethod.GET)
    public CommonResult findOne(@PathVariable String id){
        return CommonResult.success(umsStudentService.getById(id));
    }

}

