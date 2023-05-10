package com.hl.yyx.modules.exam.controller;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.hl.yyx.common.api.CommonPage;
import com.hl.yyx.common.api.CommonResult;
import com.hl.yyx.common.log.LogAnnotation;
import com.hl.yyx.modules.exam.dto.PaperPageDTO;
import com.hl.yyx.modules.exam.model.ExamRecord;
import com.hl.yyx.modules.exam.service.ExamRecordService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

@Api(tags = "考试记录", description = "考试记录")
@RestController
@RequestMapping("/admin/exam/record")
public class ExamRecordController {

    @Autowired
    private ExamRecordService examRecordService;

    // 分页查询
    @ApiOperation("分页查询")
    @LogAnnotation()
    @RequestMapping(value = "/page", method = RequestMethod.POST)
    public CommonResult page(@RequestBody PaperPageDTO params) {
        Page<ExamRecord> recordList = examRecordService.pageList(params);
        return CommonResult.success(CommonPage.restPage(recordList));
    }

    // 查看
    @ApiOperation("查看考试记录")
    @LogAnnotation()
    @RequestMapping(value = "/view/{id}", method = RequestMethod.GET)
    public CommonResult view(@PathVariable String id) {
        return CommonResult.success(examRecordService.getById(id));
    }
}
