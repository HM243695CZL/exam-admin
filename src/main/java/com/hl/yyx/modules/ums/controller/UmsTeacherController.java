package com.hl.yyx.modules.ums.controller;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.hl.yyx.common.api.CommonPage;
import com.hl.yyx.common.api.CommonResult;
import com.hl.yyx.common.log.LogAnnotation;
import com.hl.yyx.modules.ums.dto.TeacherPageDTO;
import com.hl.yyx.modules.ums.model.UmsTeacher;
import com.hl.yyx.modules.ums.service.UmsTeacherService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

/**
 * <p>
 * 教师表 前端控制器
 * </p>
 *
 * @author hl243695czyn
 * @since 2023-04-19
 */
@Api(tags = "教师管理", description = "教师管理")
@RestController
@RequestMapping("/admin/teacher")
    public class UmsTeacherController {

    @Autowired
    private UmsTeacherService umsTeacherService;

    // 分页查询
    @LogAnnotation()
    @ApiOperation("分页查询")
    @RequestMapping(value = "/page", method = RequestMethod.POST)
    public CommonResult page(@RequestBody TeacherPageDTO pageDTO) {
        Page<UmsTeacher> teacherList = umsTeacherService.pageList(pageDTO);
        return CommonResult.success(CommonPage.restPage(teacherList));
    }

    // 新增
    @LogAnnotation()
    @ApiOperation("新增教师")
    @RequestMapping(value = "/create", method = RequestMethod.POST)
    public CommonResult save(@RequestBody UmsTeacher umsTeacher){
        return CommonResult.success(umsTeacherService.save(umsTeacher));
    }

    // 更新
    @LogAnnotation()
    @ApiOperation("更新教师")
    @RequestMapping(value = "/update", method = RequestMethod.POST)
    public CommonResult update(@RequestBody UmsTeacher umsTeacher){
        return CommonResult.success(umsTeacherService.updateById(umsTeacher));
    }

    // 删除
    @LogAnnotation()
    @ApiOperation("删除教师")
    @RequestMapping(value = "/delete/{id}", method = RequestMethod.GET)
    public CommonResult delete(@PathVariable String id){
        return CommonResult.success( umsTeacherService.removeById(id));
    }

    // 获取全部
    @LogAnnotation()
    @ApiOperation("获取全部教师")
    @RequestMapping(value = "/list", method = RequestMethod.GET)
    public CommonResult list(){
        return CommonResult.success(umsTeacherService.list());
    }

    // 查看
    @LogAnnotation()
    @ApiOperation("查看教师")
    @RequestMapping(value = "/view/{id}", method = RequestMethod.GET)
    public CommonResult findOne(@PathVariable String id){
        return CommonResult.success(umsTeacherService.getById(id));
    }

}

