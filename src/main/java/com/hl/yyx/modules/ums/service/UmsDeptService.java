package com.hl.yyx.modules.ums.service;

import com.hl.yyx.modules.ums.model.UmsDept;
import com.baomidou.mybatisplus.extension.service.IService;

import java.util.List;

/**
 * <p>
 * 部门表 服务类
 * </p>
 *
 * @author hl243695czyn
 * @since 2023-04-19
 */
public interface UmsDeptService extends IService<UmsDept> {

    List<UmsDept> getList();

}
