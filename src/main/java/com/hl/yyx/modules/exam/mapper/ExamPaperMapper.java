package com.hl.yyx.modules.exam.mapper;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.hl.yyx.modules.exam.dto.PaperPageDTO;
import com.hl.yyx.modules.exam.model.ExamPaper;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Param;

/**
 * <p>
 * 试卷库 Mapper 接口
 * </p>
 *
 * @author hl243695czyn
 * @since 2023-04-28
 */
public interface ExamPaperMapper extends BaseMapper<ExamPaper> {

    Page<ExamPaper> getMyExamPageList(Page<ExamPaper> page,
                                      @Param("pageDTO") PaperPageDTO pageDTO,
                                      @Param("currentUserClassId") String currentUserClassId
    );
}
