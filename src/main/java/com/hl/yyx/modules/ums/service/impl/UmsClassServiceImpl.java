package com.hl.yyx.modules.ums.service.impl;

import cn.hutool.core.util.StrUtil;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.hl.yyx.modules.ums.dto.ClassPageDTO;
import com.hl.yyx.modules.ums.model.UmsClass;
import com.hl.yyx.modules.ums.mapper.UmsClassMapper;
import com.hl.yyx.modules.ums.model.UmsCollegeMajor;
import com.hl.yyx.modules.ums.service.UmsClassService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.hl.yyx.modules.ums.service.UmsCollegeMajorService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

/**
 * <p>
 * 班级表 服务实现类
 * </p>
 *
 * @author hl243695czyn
 * @since 2023-04-12
 */
@Service
public class UmsClassServiceImpl extends ServiceImpl<UmsClassMapper, UmsClass> implements UmsClassService {

    @Override
    public Page<UmsClass> pageList(ClassPageDTO paramsDTO) {
        Page<UmsClass> page = new Page<>(paramsDTO.getPageIndex(), paramsDTO.getPageSize());
        QueryWrapper<UmsClass> queryWrapper = new QueryWrapper<>();
        if (StrUtil.isNotEmpty(paramsDTO.getName())) {
            queryWrapper.lambda().like(UmsClass::getName, paramsDTO.getName());
        }
        if (StrUtil.isNotEmpty(paramsDTO.getCollegeId())) {
            queryWrapper.lambda().eq(UmsClass::getCollegeId, paramsDTO.getCollegeId());
        }
        if (StrUtil.isNotEmpty(paramsDTO.getMajorId())) {
            queryWrapper.lambda().eq(UmsClass::getMajorId, paramsDTO.getMajorId());
        }
        return page(page, queryWrapper);
    }
}
