package com.ht.controller;

import com.ht.bean.Grade;
import com.ht.service.GradeService;
import com.ht.service.MessageService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import java.util.List;

/**
 * Created by WangGenshen on 5/17/16.
 */
@Controller
@RequestMapping("/")
public class IndexController {

    // 消息service
    @Resource
    private MessageService messageService;
    @Resource
    private GradeService gradeService;

    @RequestMapping(value = "index", method = RequestMethod.GET)
    public ModelAndView home(Model model, HttpSession session) {
        ModelAndView mav = new ModelAndView("index/index_left");
        List<Grade> grade = gradeService.queryAll();
        mav.addObject("gradeInfo", grade.get(0));
        return mav;
    }

    @RequestMapping(value = "redirect_index", method = RequestMethod.GET)
    public String redirectHome(Model model) {
        model.addAttribute("redirect", "redirect");
        return "index/index_left";
    }

    /**
     * 查询班级信息
     */
    @ResponseBody
    @RequestMapping(value = "gradeIndex", method = RequestMethod.GET)
    public Grade gradeIndex(Model model) {
        List<Grade> grade = gradeService.queryAll();
        return grade.get(0);
    }
}
