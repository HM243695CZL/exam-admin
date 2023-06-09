package com.hl.yyx.modules.ums.controller;

import com.hl.yyx.common.api.CommonResult;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.*;

import com.hl.yyx.modules.ums.service.UmsCollegeMajorService;
import com.hl.yyx.modules.ums.model.UmsCollegeMajor;

import org.springframework.web.bind.annotation.RestController;

/**
 * <p>
 * 学院/专业表 前端控制器
 * </p>
 *
 * @author hl243695czyn
 * @since 2023-04-10
 */
@Api(tags = "学院-专业管理", description = "学院-专业管理")
@RestController
@RequestMapping("/admin/college-major")
    public class UmsCollegeMajorController {

    @Autowired
    private UmsCollegeMajorService umsCollegeMajorService;

    // 新增学院-专业
    @ApiOperation("新增学院-专业")
    @RequestMapping(value = "/create", method = RequestMethod.POST)
    public CommonResult save(@RequestBody UmsCollegeMajor umsCollegeMajor){
        return CommonResult.success(umsCollegeMajorService.save(umsCollegeMajor));
    }

    // 更新学院-专业
    @ApiOperation("更新学院-专业")
    @RequestMapping(value = "/update", method = RequestMethod.POST)
    public CommonResult update(@RequestBody UmsCollegeMajor umsCollegeMajor){
        return CommonResult.success(umsCollegeMajorService.updateById(umsCollegeMajor));
    }

    // 删除学院-专业
    @ApiOperation("删除学院-专业")
    @RequestMapping(value = "/delete/{id}", method = RequestMethod.GET)
    public CommonResult delete(@PathVariable String id){
        return CommonResult.success( umsCollegeMajorService.removeById(id));
    }

    // 获取全部学院-专业
    @ApiOperation("获取全部学院-专业")
    @RequestMapping(value = "/list", method = RequestMethod.GET)
    public CommonResult list(){
        return CommonResult.success(umsCollegeMajorService.getNodeList());
    }

    // 查看学院-专业
    @ApiOperation("新增学院-专业")
    @RequestMapping(value = "/view/{id}", method = RequestMethod.GET)
    public CommonResult findOne(@PathVariable String id){
        return CommonResult.success(umsCollegeMajorService.getById(id));
    }

}

