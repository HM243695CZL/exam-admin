package com.hl.yyx.modules.wx.controller;

import com.hl.yyx.common.api.CommonResult;
import com.hl.yyx.common.log.LogAnnotation;
import com.hl.yyx.common.wx.NoWeiXinAuth;
import com.hl.yyx.modules.ums.model.UmsAdmin;
import com.hl.yyx.modules.ums.service.UmsAdminService;
import com.hl.yyx.modules.wx.dto.WXAuthDTO;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import lombok.extern.slf4j.Slf4j;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletRequest;

@RestController
@RequestMapping("/wx/user/")
@Api(tags = "微信端-用户", description = "微信端-用户")
@Slf4j
public class WxController {

    @Autowired
    private UmsAdminService adminService;

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
}
