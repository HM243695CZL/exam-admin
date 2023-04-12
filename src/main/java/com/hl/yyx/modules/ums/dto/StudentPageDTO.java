package com.hl.yyx.modules.ums.dto;

import com.hl.yyx.common.vo.PageParamsDTO;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

@Data
public class StudentPageDTO extends PageParamsDTO {

    @ApiModelProperty(value = "姓名")
    private String name;

    @ApiModelProperty(value = "学号")
    private String number;

    @ApiModelProperty(value = "手机号")
    private String phone;
}
