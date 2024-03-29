package com.hl.yyx.modules.ums.service;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.IService;
import com.hl.yyx.common.vo.PageParamsDTO;
import com.hl.yyx.domain.AdminUserDetails;
import com.hl.yyx.modules.ums.dto.AdminPageDTO;
import com.hl.yyx.modules.ums.dto.UmsAdminLoginParam;
import com.hl.yyx.modules.ums.dto.UpdatePassDTO;
import com.hl.yyx.modules.ums.model.UmsAdmin;
import com.hl.yyx.modules.wx.dto.UpdateNicknameAndAvatarDTO;
import com.hl.yyx.modules.wx.dto.WXAuthDTO;

import javax.servlet.http.HttpServletRequest;

/**
 * <p>
 * 管理员表 服务类
 * </p>
 *
 * @author hl243695czyn
 * @since 2022-06-20
 */
public interface UmsAdminService extends IService<UmsAdmin> {

    Page<UmsAdmin> pageList(AdminPageDTO paramsDTO);

    boolean create(UmsAdmin umsAdmin);

    boolean updateAdmin(UmsAdmin umsAdmin);

    UmsAdmin view(String id);

    boolean delete(String id);

    AdminUserDetails loadUserByUsername(String username);

    // 获取当前登录用户
    UmsAdmin getCurrentAdmin();

    String login(String username, String password, HttpServletRequest request);

    boolean updatePass(UpdatePassDTO passDTO);

    // 微信一键登录
    Object wxAuthLogin(WXAuthDTO wxAuthDTO, HttpServletRequest request);

    // 微信登录获取sessionId
    Object getSessionId(String code);

    UmsAdmin getUserInfo(Boolean refresh);

    /**
     * 修改用户昵称和头像
     * @param updateDto
     * @return
     */
    Boolean changeNicknameAndAvatar(UpdateNicknameAndAvatarDTO updateDto);

    Object register(UmsAdminLoginParam loginParam, HttpServletRequest request);
}
