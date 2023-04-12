package com.hl.yyx.modules.ums.service;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.hl.yyx.modules.ums.dto.StudentPageDTO;
import com.hl.yyx.modules.ums.model.UmsStudent;
import com.baomidou.mybatisplus.extension.service.IService;

/**
 * <p>
 * 学生表 服务类
 * </p>
 *
 * @author hl243695czyn
 * @since 2023-04-10
 */
public interface UmsStudentService extends IService<UmsStudent> {

    Page<UmsStudent> pageList(StudentPageDTO paramsDTO);
}
