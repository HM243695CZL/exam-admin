package com.hl.yyx.modules.ums.dto;

import com.hl.yyx.common.vo.PageParamsDTO;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

@Data
public class ClassPageDTO extends PageParamsDTO {

    @ApiModelProperty(value = "班级名称")
    private String name;

    @ApiModelProperty(value = "学院id")
    private String collegeId;

    @ApiModelProperty(value = "专业id")
    private String majorId;
}
