package com.hl.yyx.modules.ums.controller;

import com.hl.yyx.common.api.CommonResult;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.*;

import com.hl.yyx.modules.ums.service.UmsFormService;
import com.hl.yyx.modules.ums.model.UmsForm;

import org.springframework.web.bind.annotation.RestController;

/**
 * <p>
 * 表单配置表 前端控制器
 * </p>
 *
 * @author hl243695czyn
 * @since 2023-04-10
 */
@RestController
@RequestMapping("/admin/form")
    public class UmsFormController {

@Autowired
private UmsFormService umsFormService;

// 新增
@RequestMapping(value = "/create", method = RequestMethod.POST)
public CommonResult save(@RequestBody UmsForm umsForm){
        return CommonResult.success(umsFormService.save(umsForm));
        }

// 更新
@RequestMapping(value = "/update", method = RequestMethod.POST)
public CommonResult update(@RequestBody UmsForm umsForm){
        return CommonResult.success(umsFormService.updateById(umsForm));
        }

// 删除
@RequestMapping(value = "/delete/{id}", method = RequestMethod.GET)
public CommonResult delete(@PathVariable String id){
        return CommonResult.success( umsFormService.removeById(id));
        }

// 获取全部
@RequestMapping(value = "/list", method = RequestMethod.GET)
public CommonResult list(){
        return CommonResult.success(umsFormService.list());
        }

// 查看
@RequestMapping(value = "/view/{id}", method = RequestMethod.GET)
public CommonResult findOne(@PathVariable String id){
        return CommonResult.success(umsFormService.getById(id));
        }

        }

