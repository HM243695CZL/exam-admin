package com.hl.yyx.modules.exam.service;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.hl.yyx.modules.exam.dto.WrongBookDTO;
import com.hl.yyx.modules.exam.model.ExamWrongBook;
import com.baomidou.mybatisplus.extension.service.IService;

/**
 * <p>
 * 错题表 服务类
 * </p>
 *
 * @author hl243695czyn
 * @since 2023-05-11
 */
public interface ExamWrongBookService extends IService<ExamWrongBook> {

    Page<ExamWrongBook> pageList(WrongBookDTO params);
}
