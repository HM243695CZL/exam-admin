package com.hl.yyx.modules.ums.service;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.hl.yyx.modules.ums.dto.ClassPageDTO;
import com.hl.yyx.modules.ums.model.UmsClass;
import com.baomidou.mybatisplus.extension.service.IService;

import java.util.List;

/**
 * <p>
 * 班级表 服务类
 * </p>
 *
 * @author hl243695czyn
 * @since 2023-04-12
 */
public interface UmsClassService extends IService<UmsClass> {

    Page<UmsClass> pageList(ClassPageDTO paramsDTO);

    List<UmsClass> list(ClassPageDTO paramsDTO);
}
