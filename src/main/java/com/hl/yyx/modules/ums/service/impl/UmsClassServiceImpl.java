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

    @Autowired
    private UmsCollegeMajorService collegeMajorService;

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
        Page<UmsClass> classPage = page(page, queryWrapper);
        for (UmsClass item: classPage.getRecords()) {
            item.setCollegeName(getCollegeOrMajorName(item, 1));
            item.setMajorName( getCollegeOrMajorName(item, 0));
        }
        return classPage;
    }

    public String getCollegeOrMajorName(UmsClass item, Integer type) {
        QueryWrapper<UmsCollegeMajor> wrapper = new QueryWrapper<>();
        wrapper.lambda().eq(UmsCollegeMajor::getType, type);
        // 获取学院名称
        if (type == 1) {
            wrapper.lambda().eq(UmsCollegeMajor::getId, item.getCollegeId());
        }
        // 获取专业名称
        if (type == 0) {
            wrapper.lambda().eq(UmsCollegeMajor::getId, item.getMajorId());
        }
        UmsCollegeMajor college = collegeMajorService.getOne(wrapper);
        return college.getName();
    }


    @Override
    public List<UmsClass> list(ClassPageDTO paramsDTO) {
        QueryWrapper<UmsClass> queryWrapper = new QueryWrapper<>();
        if (StrUtil.isNotEmpty(paramsDTO.getCollegeId())) {
            queryWrapper.lambda().eq(UmsClass::getCollegeId, paramsDTO.getCollegeId());
        }
        if (StrUtil.isNotEmpty(paramsDTO.getMajorId())) {
            queryWrapper.lambda().eq(UmsClass::getMajorId, paramsDTO.getMajorId());
        }
        return list(queryWrapper);
    }
}
