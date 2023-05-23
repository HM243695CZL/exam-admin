package com.hl.yyx.modules.ums.service.impl;

import cn.hutool.core.lang.UUID;
import cn.hutool.core.util.ObjectUtil;
import cn.hutool.core.util.StrUtil;
import cn.hutool.http.HttpUtil;
import com.alibaba.fastjson.JSON;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.conditions.update.UpdateWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.hl.yyx.common.api.RedisKey;
import com.hl.yyx.common.constants.Constants;
import com.hl.yyx.common.exception.ApiException;
import com.hl.yyx.common.exception.Asserts;
import com.hl.yyx.common.util.IpUtil;
import com.hl.yyx.common.util.JWTUtils;
import com.hl.yyx.common.util.JwtTokenUtil;
import com.hl.yyx.common.util.UserThreadLocalUtil;
import com.hl.yyx.common.wx.UserThreadLocal;
import com.hl.yyx.domain.AdminUserDetails;
import com.hl.yyx.modules.ums.dto.AdminPageDTO;
import com.hl.yyx.modules.ums.dto.UpdatePassDTO;
import com.hl.yyx.modules.ums.mapper.UmsAdminMapper;
import com.hl.yyx.modules.ums.model.*;
import com.hl.yyx.modules.ums.service.*;
import com.hl.yyx.modules.wx.dto.WXAuthDTO;
import com.hl.yyx.modules.wx.dto.WxUserInfo;
import com.hl.yyx.modules.wx.service.WxService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.data.redis.core.StringRedisTemplate;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.concurrent.TimeUnit;
import java.util.stream.Collectors;

/**
 * <p>
 * 管理员表 服务实现类
 * </p>
 *
 * @author hl243695czyn
 * @since 2022-06-20
 */
@Service
@SuppressWarnings("all")
public class UmsAdminServiceImpl extends ServiceImpl<UmsAdminMapper, UmsAdmin> implements UmsAdminService {
    private static final Logger LOGGER = LoggerFactory.getLogger(UmsAdminServiceImpl.class);

    @Value("${wxmini.appid}")
    private String appId;

    @Value("${wxmini.secret}")
    private String secret;

    @Autowired
    private JwtTokenUtil jwtTokenUtil;

    @Autowired
    UmsAdminRoleService adminRoleService;

    @Autowired
    UmsRoleService roleService;

    @Autowired
    UmsDeptService deptService;

    @Autowired
    UmsCollegeMajorService collegeMajorService;

    @Autowired
    private UmsClassService classService;

    @Autowired
    private WxService wxService;

    @Autowired
    private StringRedisTemplate redisTemplate;

    /**
     * 分页查询
     *
     * @param paramsDTO
     * @return
     */
    @Override
    public Page<UmsAdmin> pageList(AdminPageDTO paramsDTO) {
        Page<UmsAdmin> page = new Page<>(paramsDTO.getPageIndex(), paramsDTO.getPageSize());
        QueryWrapper<UmsAdmin> queryWrapper = new QueryWrapper<>();
        if (StrUtil.isNotEmpty(paramsDTO.getUsername())) {
            queryWrapper.lambda().like(UmsAdmin::getUsername, paramsDTO.getUsername());
        }
        if (paramsDTO.getUserType() != null) {
            queryWrapper.lambda().eq(UmsAdmin::getUserType, paramsDTO.getUserType());
        }
        // 根据分页查询用户
        Page<UmsAdmin> pageList = page(page, queryWrapper);
        // 根据用户id获取角色id
        page.getRecords().forEach(this::setUserRoles);
        for (UmsAdmin item : pageList.getRecords()) {
            if (StrUtil.isNotEmpty(item.getDeptId())) {
                UmsDept dept = deptService.getById(item.getDeptId());
                item.setDeptName(dept.getName());
            }
            if (StrUtil.isNotEmpty(item.getCollegeId())) {
                // 获取学院名称
                QueryWrapper<UmsCollegeMajor> wrapper = new QueryWrapper<>();
                wrapper.lambda().eq(UmsCollegeMajor::getType, 1);
                wrapper.lambda().eq(UmsCollegeMajor::getId, item.getCollegeId());
                UmsCollegeMajor college = collegeMajorService.getOne(wrapper);
                item.setCollegeName(college.getName());

                // 获取专业名称
                QueryWrapper<UmsCollegeMajor> wrapperMajor = new QueryWrapper<>();
                wrapperMajor.lambda().eq(UmsCollegeMajor::getType, 0);
                wrapperMajor.lambda().eq(UmsCollegeMajor::getId, item.getMajorId());
                UmsCollegeMajor major = collegeMajorService.getOne(wrapperMajor);
                item.setMajorName(major.getName());

                // 获取班级名称
                UmsClass umsClass = classService.getById(item.getClassId());
                item.setClassName(umsClass.getName());
            }
        }
        return pageList;
    }

    /**
     * 添加用户
     *
     * @param umsAdmin
     * @return
     */
    @Transactional
    @Override
    public boolean create(UmsAdmin umsAdmin) {
        // 设置用户初始密码
        umsAdmin.setPassword(Constants.INIT_PASSWORD);
        boolean result = save(umsAdmin);
        List<UmsAdminRole> adminRoleList = setAdminAndRole(umsAdmin.getRoleIds(), umsAdmin.getId());
        adminRoleService.saveBatch(adminRoleList);
        return result;
    }

    /**
     * 更新用户
     *
     * @param umsAdmin
     * @return
     */
    @Transactional
    @Override
    public boolean updateAdmin(UmsAdmin umsAdmin) {
        UmsAdmin admin = getById(umsAdmin.getId());
        umsAdmin.setPassword(admin.getPassword());
        boolean result = updateById(umsAdmin);
        // 清空当前用户的所有角色
        QueryWrapper<UmsAdminRole> queryWrapper = new QueryWrapper<>();
        queryWrapper.lambda().eq(UmsAdminRole::getAdminId, umsAdmin.getId());
        adminRoleService.remove(queryWrapper);

        List<UmsAdminRole> adminRoleList = setAdminAndRole(umsAdmin.getRoleIds(), umsAdmin.getId());
        adminRoleService.saveBatch(adminRoleList);

        return result;
    }

    /**
     * 查看用户
     *
     * @param id
     * @return
     */
    @Override
    public UmsAdmin view(String id) {
        UmsAdmin admin = getById(id);
        // 查询用户所有的角色id
        List<Integer> roleIds = adminRoleService.list(new QueryWrapper<UmsAdminRole>().eq("admin_id", id))
                .stream().map(UmsAdminRole::getRoleId).collect(Collectors.toList());
        admin.setRoleIds(roleIds);
        return admin;
    }

    /**
     * 删除用户
     *
     * @param id
     * @return
     */
    @Transactional
    @Override
    public boolean delete(String id) {
        // 清空当前用户的所有角色
        QueryWrapper<UmsAdminRole> queryWrapper = new QueryWrapper<>();
        queryWrapper.lambda().eq(UmsAdminRole::getAdminId, id);
        adminRoleService.remove(queryWrapper);
        return removeById(id);
    }

    /**
     * 根据用户名获取用户
     *
     * @param username 用户名
     * @return
     */
    @Override
    public AdminUserDetails loadUserByUsername(String username) {
        UmsAdmin admin = getAdminByUsername(username);
        if (admin != null) {
            return new AdminUserDetails(admin);
        }
        throw new ApiException("用户不存在");
    }

    /**
     * 登录
     *
     * @param username 用户名
     * @param password 密码
     * @return
     */
    @Override
    public String login(String username, String password, HttpServletRequest request) {
        String token = null;
        try {
            AdminUserDetails userDetails = loadUserByUsername(username);
            if (userDetails == null) {
                Asserts.fail("用户名不存在");
            }
            if (!userDetails.getPassword().equals(password)) {
                Asserts.fail("密码错误");
            }
            // 生成springSecurity的通过认证标识
            UsernamePasswordAuthenticationToken authentication = new UsernamePasswordAuthenticationToken(userDetails, null, userDetails.getAuthorities());
            SecurityContextHolder.getContext().setAuthentication(authentication);
            token = jwtTokenUtil.generateToken(userDetails);
            // 更新上次登录时间和登录ip
            UmsAdmin currentAdmin = getCurrentAdmin();
            UpdateWrapper<UmsAdmin> updateWrapper = new UpdateWrapper<>();
            updateWrapper.lambda().eq(UmsAdmin::getId, currentAdmin.getId());
            updateWrapper.set("last_login_ip", IpUtil.getIpAddr(request));
            updateWrapper.set("last_login_time", new Date());
            update(updateWrapper);
        } catch (AuthenticationException e) {
            LOGGER.warn("登录异常：{}", e.getMessage());
        }
        return token;
    }

    /**
     * 修改密码
     *
     * @return
     */
    @Override
    public boolean updatePass(UpdatePassDTO passDTO) {
        UpdateWrapper<UmsAdmin> updateWrapper = new UpdateWrapper<>();
        updateWrapper.lambda().eq(UmsAdmin::getId, passDTO.getId());
        updateWrapper.set("password", passDTO.getPassword());
        return update(updateWrapper);
    }

    /**
     * 微信登录
     * @param wxAuthDTO
     * @param request
     * @return
     */
    @Override
    public Object wxAuthLogin(WXAuthDTO wxAuthDTO, HttpServletRequest request) {
        /**
         * 对wxAuthDTO解密
         * 解密完成， 得到微信用户信息  包含openId， 性别， 昵称 等信息
         * openId是唯一的，去用户表中查询openId是否存在  存在则登录
         * 不存在  则注册
         * 使用jwt技术，生成token，并返回
         */
        try {
            String json = wxService.wxDecrypt(wxAuthDTO.getEncryptedData(), wxAuthDTO.getSessionId(), wxAuthDTO.getIv());
            WxUserInfo wxUserInfo = JSON.parseObject(json, WxUserInfo.class);
            String openId = wxUserInfo.getOpenId();
            QueryWrapper<UmsAdmin> wrapper = new QueryWrapper<>();
            wrapper.lambda().eq(UmsAdmin::getWxOpenId, openId);
            UmsAdmin admin = getOne(wrapper);
            if (admin == null) {
                // 注册
                UmsAdmin umsAdmin = wxUserInfoToUser(wxUserInfo, request, wxAuthDTO.getSessionId());
                // 将注册的新用户分配到“微信1班”
                QueryWrapper<UmsClass> queryWrapper = new QueryWrapper<>();
                queryWrapper.lambda().eq(UmsClass::getName, "微信1班");
                UmsClass umsClass = classService.getOne(queryWrapper);
                umsAdmin.setUserType(2);
                umsAdmin.setCollegeId(umsClass.getCollegeId());
                umsAdmin.setMajorId(umsClass.getMajorId());
                umsAdmin.setClassId(umsClass.getId());
                save(umsAdmin);
                return login(umsAdmin);
            } else {
                // 登录
                admin.setLastLoginTime(new Date());
                admin.setLastLoginIp(IpUtil.getIpAddr(request));
                admin.setSessionKey(wxAuthDTO.getSessionId());
                return login(admin);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    @Override
    public Object getSessionId(String code) {
        /**
         * 拼接一个url，微信登录凭证校验接口
         * 发起一个http的调用，获取微信的返回结果，存到redis
         * 生成一个sessionId，返回给前端，用做当前登录用户的标识
         */
        String url = "https://api.weixin.qq.com/sns/jscode2session?appid={0}&secret={1}&js_code={2}&grant_type=authorization_code";
        String replaceUrl = url.replace("{0}", appId).replace("{1}", secret).replace("{2}", code);
        String result = HttpUtil.get(replaceUrl);
        String uuid = UUID.randomUUID().toString();
        redisTemplate.opsForValue().set(RedisKey.WX_SESSION_ID + uuid, result, 30, TimeUnit.MINUTES);
        HashMap<String, String> map = new HashMap<>();
        map.put("sessionId", uuid);
        return map;
    }

    /**
     * 获取微信用户信息
     * @param refresh
     * @return
     */
    @Override
    public UmsAdmin getUserInfo(Boolean refresh) {
        UmsAdmin umsAdmin = UserThreadLocalUtil.get();
        if (refresh) {
            String token = JWTUtils.sign(umsAdmin.getId());
            redisTemplate.opsForValue().set(RedisKey.TOKEN_KEY + token, JSON.toJSONString(umsAdmin), 7, TimeUnit.DAYS);
        }
        return umsAdmin;
    }

    /**
     * 将wxUserInfo 转为UmsAdmin对象
     * @param wxUserInfo
     * @param request
     * @param sessionId
     * @return
     */
    private UmsAdmin wxUserInfoToUser(WxUserInfo wxUserInfo, HttpServletRequest request, String sessionId) {
        UmsAdmin umsAdmin = new UmsAdmin();
        umsAdmin.setUsername(wxUserInfo.getOpenId());
        umsAdmin.setPassword(wxUserInfo.getOpenId());
        umsAdmin.setWxOpenId(wxUserInfo.getOpenId());
        umsAdmin.setAvatar(wxUserInfo.getAvatarUrl());
        umsAdmin.setNickName(wxUserInfo.getNickName());
        umsAdmin.setSex(wxUserInfo.getGender());
        umsAdmin.setLastLoginIp(IpUtil.getIpAddr(request));
        umsAdmin.setLastLoginTime(new Date());
        umsAdmin.setSessionKey(sessionId);
        return umsAdmin;
    }

    /**
     * 登录
     * @param admin
     * @return
     */
    private HashMap<Object, Object> login(UmsAdmin admin) {
        // token
        String token = JWTUtils.sign(admin.getId());
        admin.setPassword(null);
        admin.setUsername(null);
        admin.setWxOpenId(null);
        HashMap<Object, Object> result = new HashMap<>();
        result.put("token", token);
        // 将用户信息保存到redis中
        redisTemplate.opsForValue().set(RedisKey.TOKEN_KEY + token, JSON.toJSONString(admin), 7, TimeUnit.DAYS);
        return result;
    }

    /**
     * 设置用户和角色的关联关系
     *
     * @param roleList 角色列表
     * @param userId   用户id
     * @return
     */
    public List<UmsAdminRole> setAdminAndRole(List<Integer> roleList, String userId) {
        List<UmsAdminRole> adminRoleList = new ArrayList<>();
        for (Integer roleId : roleList) {
            UmsAdminRole adminRole = new UmsAdminRole();
            adminRole.setAdminId(userId);
            adminRole.setRoleId(roleId);
            adminRoleList.add(adminRole);
        }
        return adminRoleList;
    }

    /**
     * 根据用户名获取用户信息
     *
     * @param username 用户名
     * @return
     */
    public UmsAdmin getAdminByUsername(String username) {
        QueryWrapper<UmsAdmin> wrapper = new QueryWrapper<>();
        wrapper.lambda().eq(UmsAdmin::getUsername, username);
        return getOne(wrapper);
    }

    /**
     * 获取当前用户
     *
     * @return
     */
    public UmsAdmin getCurrentAdmin() {
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        AdminUserDetails admin = (AdminUserDetails) authentication.getPrincipal();
        UmsAdmin userInfo = admin.getUmsAdmin();
        setUserRoles(userInfo);
        return admin.getUmsAdmin();
    }

    /**
     * 设置用户的roles字段
     *
     * @param userInfo
     */
    private void setUserRoles(UmsAdmin userInfo) {
        List<Integer> roleIds = adminRoleService.list(new QueryWrapper<UmsAdminRole>().eq("admin_id", userInfo.getId())
                .select("role_id")).stream().map(UmsAdminRole::getRoleId).collect(Collectors.toList());
        if (!ObjectUtil.isEmpty(roleIds)) {
            // 根据角色表查询对应的角色名称
            List<String> roleName = roleService.listByIds(roleIds).stream().map(UmsRole::getKey).collect(Collectors.toList());
            userInfo.setRoles(roleName);
        }
    }
}
