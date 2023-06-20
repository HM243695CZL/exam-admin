package com.hl.yyx.modules.wx.dto;

import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

/**
 * 修改用户昵称和头像
 */
@Data
public class UpdateNicknameAndAvatarDTO {

    @ApiModelProperty(value = "用户昵称")
    private String nickname;

    @ApiModelProperty(value = "用户头像")
    private String avatar;
}
