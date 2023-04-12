package com.hl.yyx.modules.ums.service.impl;

import cn.hutool.core.util.StrUtil;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.hl.yyx.modules.ums.dto.StudentPageDTO;
import com.hl.yyx.modules.ums.model.UmsStudent;
import com.hl.yyx.modules.ums.mapper.UmsStudentMapper;
import com.hl.yyx.modules.ums.service.UmsStudentService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

/**
 * <p>
 * 学生表 服务实现类
 * </p>
 *
 * @author hl243695czyn
 * @since 2023-04-10
 */
@Service
public class UmsStudentServiceImpl extends ServiceImpl<UmsStudentMapper, UmsStudent> implements UmsStudentService {

    @Override
    public Page<UmsStudent> pageList(StudentPageDTO paramsDTO) {
        Page<UmsStudent> page = new Page<>(paramsDTO.getPageIndex(), paramsDTO.getPageSize());
        QueryWrapper<UmsStudent> queryWrapper = new QueryWrapper<>();
        if (StrUtil.isNotEmpty(paramsDTO.getName())) {
            queryWrapper.lambda().like(UmsStudent::getName, paramsDTO.getName());
        }
        if (StrUtil.isNotEmpty(paramsDTO.getName())) {
            queryWrapper.lambda().like(UmsStudent::getNumber, paramsDTO.getNumber());
        }
        if (StrUtil.isNotEmpty(paramsDTO.getPhone())) {
            queryWrapper.lambda().like(UmsStudent::getPhone, paramsDTO.getPhone());
        }
        return page(page, queryWrapper);
    }
}
