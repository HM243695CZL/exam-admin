package com.hl.yyx.modules.ums.service;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.hl.yyx.modules.ums.dto.TeacherPageDTO;
import com.hl.yyx.modules.ums.model.UmsTeacher;
import com.baomidou.mybatisplus.extension.service.IService;

/**
 * <p>
 * 教师表 服务类
 * </p>
 *
 * @author hl243695czyn
 * @since 2023-04-19
 */
public interface UmsTeacherService extends IService<UmsTeacher> {

    Page<UmsTeacher> pageList(TeacherPageDTO pageDTO);
}
