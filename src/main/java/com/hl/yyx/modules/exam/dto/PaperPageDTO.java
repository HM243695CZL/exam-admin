package com.hl.yyx.modules.exam.dto;

import com.hl.yyx.common.vo.PageParamsDTO;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

@Data
public class PaperPageDTO extends PageParamsDTO {

    @ApiModelProperty(value = "试卷名称")
    private String name;
}
