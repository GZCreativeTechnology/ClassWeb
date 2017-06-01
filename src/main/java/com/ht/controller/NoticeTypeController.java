package com.ht.controller;

import com.ht.bean.NoticeType;
import com.ht.service.NoticeTypeService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import java.util.List;

/**
 * 公告类型controller
 * Created by Zhangwenxing on 3/3/17.
 */
@Controller
@RequestMapping("/noticeType")
public class NoticeTypeController {
    private static final Logger logger = LoggerFactory.getLogger(NoticeTypeController.class);

    @Resource
    private NoticeTypeService noticeTypeService;

    @RequestMapping(value = "queryAll",method = RequestMethod.GET)
    public ModelAndView queryAll() {
        logger.info("显示全部公告类型");
        ModelAndView mav = new ModelAndView("noticeInfo/notice_info");
        List<NoticeType> noticeTypes = noticeTypeService.queryAll();
        mav.addObject("noticeTypes", noticeTypes);
        return mav;
    }

}
