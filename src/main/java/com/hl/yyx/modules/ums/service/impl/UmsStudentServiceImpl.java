package com.hl.yyx.modules.ums.service.impl;

import cn.hutool.core.util.StrUtil;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.hl.yyx.modules.ums.dto.StudentPageDTO;
import com.hl.yyx.modules.ums.model.UmsClass;
import com.hl.yyx.modules.ums.model.UmsCollegeMajor;
import com.hl.yyx.modules.ums.model.UmsStudent;
import com.hl.yyx.modules.ums.mapper.UmsStudentMapper;
import com.hl.yyx.modules.ums.service.UmsClassService;
import com.hl.yyx.modules.ums.service.UmsCollegeMajorService;
import com.hl.yyx.modules.ums.service.UmsStudentService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
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

    @Autowired
    private UmsCollegeMajorService collegeMajorService;

    @Autowired
    private UmsClassService classService;

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
        Page<UmsStudent> studentPage = page(page, queryWrapper);
        for (UmsStudent item: studentPage.getRecords()) {
            // 获取学院名称
            QueryWrapper<UmsCollegeMajor> wrapper = new QueryWrapper<>();
            wrapper.lambda().eq(UmsCollegeMajor::getType, 0);
            wrapper.lambda().eq(UmsCollegeMajor::getId, item.getCollege());
            UmsCollegeMajor college = collegeMajorService.getOne(wrapper);
            item.setCollegeName(college.getName());

            // 获取专业名称
            QueryWrapper<UmsCollegeMajor> wrapperMajor = new QueryWrapper<>();
            wrapperMajor.lambda().eq(UmsCollegeMajor::getType, 1);
            wrapperMajor.lambda().eq(UmsCollegeMajor::getId, item.getMajor());
            UmsCollegeMajor major = collegeMajorService.getOne(wrapperMajor);
            item.setMajorName(major.getName());

            // 获取班级名称
            UmsClass umsClass = classService.getById(item.getClassId());
            item.setClassName(umsClass.getName());
        }
        return studentPage;
    }
}
