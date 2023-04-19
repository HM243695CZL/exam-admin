package com.hl.yyx.modules.ums.service.impl;

import cn.hutool.core.util.ObjectUtil;
import com.baomidou.mybatisplus.core.conditions.Wrapper;
import com.hl.yyx.modules.ums.model.UmsDept;
import com.hl.yyx.modules.ums.mapper.UmsDeptMapper;
import com.hl.yyx.modules.ums.service.UmsDeptService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

/**
 * <p>
 * 部门表 服务实现类
 * </p>
 *
 * @author hl243695czyn
 * @since 2023-04-19
 */
@Service
public class UmsDeptServiceImpl extends ServiceImpl<UmsDeptMapper, UmsDept> implements UmsDeptService {

    @Override
    public List<UmsDept> getList() {
        List<UmsDept> list = list();
        ArrayList<UmsDept> dataList = new ArrayList<>();
        for (UmsDept dept: list) {
            if (ObjectUtil.isEmpty(dept.getParentId())) {
                dept.setChildren(new ArrayList<UmsDept>());
                dataList.add(dept);
            }
        }
        for (UmsDept dept: dataList) {
            dept.getChildren().add(findDeptChildren(dept, list));
        }
        return dataList;
    }

    /**
     * 递归部门
     * @return
     */
    private UmsDept findDeptChildren(UmsDept dept, List<UmsDept> list) {
        dept.setChildren(new ArrayList<>());
        for (UmsDept item: list) {
            if (dept.getId().equals(item.getParentId())) {
                dept.getChildren().add(findDeptChildren(item, list));
            }
        }
        return dept;
    }
}
