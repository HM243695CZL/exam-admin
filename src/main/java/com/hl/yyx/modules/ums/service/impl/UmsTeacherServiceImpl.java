package com.hl.yyx.modules.ums.service.impl;

import cn.hutool.core.util.StrUtil;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.hl.yyx.modules.ums.dto.TeacherPageDTO;
import com.hl.yyx.modules.ums.model.UmsDept;
import com.hl.yyx.modules.ums.model.UmsTeacher;
import com.hl.yyx.modules.ums.mapper.UmsTeacherMapper;
import com.hl.yyx.modules.ums.service.UmsDeptService;
import com.hl.yyx.modules.ums.service.UmsTeacherService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * <p>
 * 教师表 服务实现类
 * </p>
 *
 * @author hl243695czyn
 * @since 2023-04-19
 */
@Service
public class UmsTeacherServiceImpl extends ServiceImpl<UmsTeacherMapper, UmsTeacher> implements UmsTeacherService {

    @Autowired
    private UmsDeptService deptService;

    @Override
    public Page<UmsTeacher> pageList(TeacherPageDTO pageDTO) {
        Page<UmsTeacher> page = new Page<>(pageDTO.getPageIndex(), pageDTO.getPageSize());
        QueryWrapper<UmsTeacher> queryWrapper = new QueryWrapper<>();
        if (StrUtil.isNotEmpty(pageDTO.getName())) {
            queryWrapper.lambda().like(UmsTeacher::getName, pageDTO.getName());
        }
        if (StrUtil.isNotEmpty(pageDTO.getNumber())) {
            queryWrapper.lambda().like(UmsTeacher::getNumber, pageDTO.getNumber());
        }
        if (StrUtil.isNotEmpty(pageDTO.getEmail())) {
            queryWrapper.lambda().like(UmsTeacher::getEmail, pageDTO.getEmail());
        }
        if (StrUtil.isNotEmpty(pageDTO.getPhone())) {
            queryWrapper.lambda().like(UmsTeacher::getPhone, pageDTO.getPhone());
        }
        Page<UmsTeacher> pageList = page(page, queryWrapper);
        for (UmsTeacher item: pageList.getRecords()) {
            UmsDept dept = deptService.getById(item.getDeptId());
            item.setDeptName(dept.getName());
        }
        return pageList;
    }
}
