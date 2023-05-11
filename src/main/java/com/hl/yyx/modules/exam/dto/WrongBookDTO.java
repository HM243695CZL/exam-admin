package com.hl.yyx.modules.exam.dto;

import com.hl.yyx.common.vo.PageParamsDTO;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

@Data
public class WrongBookDTO extends PageParamsDTO {

    @ApiModelProperty(value = "试题名称")
    private String questionName;
}
