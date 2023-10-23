package com.hl.yyx.modules.exam.service.impl;

import cn.hutool.core.util.ObjectUtil;
import com.hl.yyx.modules.exam.model.ExamReviewType;
import com.hl.yyx.modules.exam.mapper.ExamReviewTypeMapper;
import com.hl.yyx.modules.exam.service.ExamReviewTypeService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

/**
 * <p>
 * 复习资料分类表 服务实现类
 * </p>
 *
 * @author hl243695czyn
 * @since 2023-10-23
 */
@Service
public class ExamReviewTypeServiceImpl extends ServiceImpl<ExamReviewTypeMapper, ExamReviewType> implements ExamReviewTypeService {

    @Override
    public List<ExamReviewType> getList() {
        List<ExamReviewType> list = list();
        ArrayList<ExamReviewType> dataList = new ArrayList<>();
        for (ExamReviewType review: list) {
            if (ObjectUtil.isEmpty(review.getParentId())) {
                review.setChildren(new ArrayList<>());
                dataList.add(review);
            }
        }
        for (ExamReviewType review: dataList) {
            review.getChildren().add(findReviewChildren(review, list));
        }
        return dataList;
    }

    /**
     * 递归复习资料分类
     * @return
     */
    private ExamReviewType findReviewChildren(ExamReviewType review, List<ExamReviewType> list) {
        review.setChildren(new ArrayList<>());
        for (ExamReviewType item: list) {
            if (review.getId().equals(item.getParentId())) {
                review.getChildren().add(findReviewChildren(item, list));
            }
        }
        return review;
    }
}
