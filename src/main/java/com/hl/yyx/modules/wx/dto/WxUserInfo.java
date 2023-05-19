package com.hl.yyx.modules.wx.dto;

import lombok.Data;

/**
 * 微信解密之后返回的数据格式
 */
@Data
public class WxUserInfo {

    private String openId;

    private String nickName;

    private Integer gender;

    private String city;

    private String province;

    private String country;

    private String avatarUrl;

    private String unionId;
}
