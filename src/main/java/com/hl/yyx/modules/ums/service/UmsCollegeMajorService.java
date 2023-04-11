package com.hl.yyx.modules.ums.service;

import com.hl.yyx.modules.ums.model.UmsCollegeMajor;
import com.baomidou.mybatisplus.extension.service.IService;

import java.util.List;

/**
 * <p>
 * 学院/专业表 服务类
 * </p>
 *
 * @author hl243695czyn
 * @since 2023-04-10
 */
public interface UmsCollegeMajorService extends IService<UmsCollegeMajor> {
    List<UmsCollegeMajor> getNodeList();
}
