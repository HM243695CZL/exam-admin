package com.hl.yyx.modules.ums.service.impl;

import cn.hutool.core.util.ObjectUtil;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.hl.yyx.modules.ums.model.UmsCollegeMajor;
import com.hl.yyx.modules.ums.mapper.UmsCollegeMajorMapper;
import com.hl.yyx.modules.ums.service.UmsCollegeMajorService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

/**
 * <p>
 * 学院/专业表 服务实现类
 * </p>
 *
 * @author hl243695czyn
 * @since 2023-04-10
 */
@Service
public class UmsCollegeMajorServiceImpl extends ServiceImpl<UmsCollegeMajorMapper, UmsCollegeMajor> implements UmsCollegeMajorService {

    /**
     * 获取树形节点
     * @return
     */
    @Override
    public List<UmsCollegeMajor> getNodeList() {
        ArrayList<UmsCollegeMajor> dataList = new ArrayList<>();
        List<UmsCollegeMajor> nodeList = list();
        for (UmsCollegeMajor node : nodeList) {
            if (ObjectUtil.isEmpty(node.getParentId())) {
                node.setChildren(new ArrayList<>());
                dataList.add(node);
            }
        }
        for (UmsCollegeMajor node : dataList) {
            node.getChildren().add(findNodeChildren(node, nodeList));
        }
        return dataList;
    }

    /**
     * 递归节点
     * @param node 父级节点
     * @param nodeList  节点列表
     * @return
     */
    private UmsCollegeMajor findNodeChildren(UmsCollegeMajor node, List<UmsCollegeMajor> nodeList) {
        node.setChildren(new ArrayList<>());
        for (UmsCollegeMajor item : nodeList) {
            if (node.getId().equals(item.getParentId())) {
                node.getChildren().add(findNodeChildren(item, nodeList));
            }
        }
        return node;
    }
}
