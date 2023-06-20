package com.hl.yyx.modules.wx.controller;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.hl.yyx.common.api.CommonPage;
import com.hl.yyx.common.api.CommonResult;
import com.hl.yyx.common.log.LogAnnotation;
import com.hl.yyx.common.wx.NoWeiXinAuth;
import com.hl.yyx.dto.OssPolicyResult;
import com.hl.yyx.modules.exam.dto.PaperPageDTO;
import com.hl.yyx.modules.exam.dto.SubmitPaperDTO;
import com.hl.yyx.modules.exam.dto.WrongBookDTO;
import com.hl.yyx.modules.exam.model.ExamWrongBook;
import com.hl.yyx.modules.exam.service.ExamPaperService;
import com.hl.yyx.modules.exam.service.ExamWrongBookService;
import com.hl.yyx.modules.ums.model.UmsAdmin;
import com.hl.yyx.modules.ums.service.UmsAdminService;
import com.hl.yyx.modules.wx.dto.UpdateNicknameAndAvatarDTO;
import com.hl.yyx.modules.wx.dto.WXAuthDTO;
import com.hl.yyx.service.OssService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import lombok.extern.slf4j.Slf4j;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;

@RestController
@RequestMapping("/wx/user/")
@Api(tags = "微信端-用户", description = "微信端-用户")
@Slf4j
public class WxController {

    @Autowired
    private UmsAdminService adminService;

    @Autowired
    private ExamPaperService examPaperService;

    @Autowired
    private ExamWrongBookService examWrongBookService;

    @Autowired
    private OssService ossService;

    // 微信一键登录
    @LogAnnotation()
    @NoWeiXinAuth
    @ApiOperation("微信一键登录")
    @RequestMapping(value = "/loginByWeixin", method = RequestMethod.POST)
    public CommonResult authLogin(@RequestBody WXAuthDTO wxAuthDTO, HttpServletRequest request) {
        Object result = adminService.wxAuthLogin(wxAuthDTO, request);
        log.info("{}", result);
        return CommonResult.success(result);
    }

    // 获取sessionID
    @LogAnnotation()
    @NoWeiXinAuth
    @ApiOperation("微信登录获取sessionId")
    @RequestMapping(value = "/getSessionId", method = RequestMethod.GET)
    public CommonResult getSessionId(String code) {
        return CommonResult.success(adminService.getSessionId(code));
    }

    /**
     * 获取用户信息
     * @param refresh
     * @return
     */
    @LogAnnotation()
    @RequestMapping(value = "/getUserInfo", method = RequestMethod.GET)
    public CommonResult getUserInfo(@Param("refresh") Boolean refresh) {
        UmsAdmin admin = adminService.getUserInfo(refresh);
        return CommonResult.success(admin);
    }

    // 获取我的考试
    @ApiOperation("获取我的考试")
    @LogAnnotation()
    @RequestMapping(value = "/getMyExam", method = RequestMethod.POST)
    public CommonResult getMyExam(@RequestBody PaperPageDTO pageDTO) {
        return CommonResult.success(CommonPage.restPage(examPaperService.getMyExam(pageDTO)));
    }

    // 预览试卷
    @ApiOperation("预览试卷")
    @LogAnnotation()
    @RequestMapping(value = "/preview/{id}", method = RequestMethod.GET)
    public CommonResult preview(@PathVariable String id) {
        return CommonResult.success(examPaperService.view(id, true));
    }

    // 交卷
    @ApiOperation("交卷")
    @LogAnnotation()
    @RequestMapping(value = "/submitPaper", method = RequestMethod.POST)
    public CommonResult submitPaper(@RequestBody SubmitPaperDTO params) {
        return CommonResult.success(examPaperService.submitPaper(params));
    }

    // 查看
    @ApiOperation("查看试卷")
    @LogAnnotation()
    @RequestMapping(value = "/view/{id}", method = RequestMethod.GET)
    public CommonResult findOne(@PathVariable String id){
        return CommonResult.success(examPaperService.view(id, false));
    }

    // 获取我的错题
    @ApiOperation("获取我的错题")
    @LogAnnotation()
    @RequestMapping(value = "/wrongBookPage", method = RequestMethod.POST)
    public CommonResult getMyWrongBook(@RequestBody WrongBookDTO params) {
        Page<ExamWrongBook> wrongBookList = examWrongBookService.pageList(params);
        return CommonResult.success(CommonPage.restPage(wrongBookList));
    }

    @ApiOperation("修改用户昵称和头像")
    @LogAnnotation
    @RequestMapping(value = "changeNicknameAndAvatar", method = RequestMethod.POST)
    public CommonResult changeNicknameAndAvatar(@RequestBody UpdateNicknameAndAvatarDTO updateDto) {
        return CommonResult.success(adminService.changeNicknameAndAvatar(updateDto));
    }

    @ApiOperation(value = "oss上传签名生成")
    @RequestMapping(value = "/policy", method = RequestMethod.GET)
    @ResponseBody
    public CommonResult<OssPolicyResult> policy() {
        OssPolicyResult result = ossService.policy();
        return CommonResult.success(result);
    }
}
