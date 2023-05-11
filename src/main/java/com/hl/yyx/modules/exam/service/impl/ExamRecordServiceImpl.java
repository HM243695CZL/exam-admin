package com.hl.yyx.modules.exam.service.impl;

import cn.hutool.core.util.StrUtil;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.hl.yyx.common.util.UserThreadLocalUtil;
import com.hl.yyx.modules.exam.dto.PaperPageDTO;
import com.hl.yyx.modules.exam.model.ExamPaper;
import com.hl.yyx.modules.exam.model.ExamRecord;
import com.hl.yyx.modules.exam.mapper.ExamRecordMapper;
import com.hl.yyx.modules.exam.service.ExamPaperService;
import com.hl.yyx.modules.exam.service.ExamRecordService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.hl.yyx.modules.ums.model.UmsAdmin;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * <p>
 * 考试记录表 服务实现类
 * </p>
 *
 * @author hl243695czyn
 * @since 2023-05-09
 */
@Service
public class ExamRecordServiceImpl extends ServiceImpl<ExamRecordMapper, ExamRecord> implements ExamRecordService {

    @Autowired
    private ExamPaperService paperService;

}
