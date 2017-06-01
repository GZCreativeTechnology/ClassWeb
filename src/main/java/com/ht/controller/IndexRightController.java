package com.ht.controller;

import com.ht.bean.Grade;
import com.ht.bean.NoticeInfo;
import com.ht.bean.UserMatter;
import com.ht.bean.Users;
import com.ht.service.GradeService;
import com.ht.service.NoticeInfoService;
import com.ht.service.UserMatterService;
import com.ht.service.UsersService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import java.util.List;

/**
 * index_right 显示班级, 最新动态, 最新公告controller
 * Created by Zhangwenxing on 3/3/17.
 */
@Controller
@RequestMapping("/right")
public class IndexRightController {
    private static final Logger logger = LoggerFactory.getLogger(IndexRightController.class);

    @Resource
    private NoticeInfoService noticeInfoService;

    @Resource
    private UsersService usersService;

    @Resource
    private GradeService gradeService;

    @Resource
    private UserMatterService userMatterService;

    @RequestMapping(value = "queryByIndex" ,method = RequestMethod.GET)
    public ModelAndView queryByIndex(){
        logger.info("进入index_right, 显示班级信息, 最新动态, 最新公告");
        ModelAndView mav = new ModelAndView("index/index_right");
        List<NoticeInfo> noticeInfo = noticeInfoService.queryByIndex();// 公告信息
        Grade grade = gradeService.queryById(1);// 班级信息
        Users user = usersService.queryById(grade.getUserId());//用户信息
        List<UserMatter> matters = userMatterService.queryMatterByIndex();// 动态信息
        mav.addObject("grade", grade);
        mav.addObject("noticeInfo", noticeInfo);
        mav.addObject("user", user);
        mav.addObject("matters", matters);
        return mav;
    }



}
