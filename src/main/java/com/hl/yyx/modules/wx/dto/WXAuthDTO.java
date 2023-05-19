package com.hl.yyx.modules.wx.dto;

import lombok.Data;

@Data
public class WXAuthDTO {

    private String encryptedData;
    private String iv;
    private String sessionId;
}
