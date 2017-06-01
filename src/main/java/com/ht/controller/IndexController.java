package com.ht.controller;

import com.ht.service.MessageService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

/**
 * Created by WangGenshen on 5/17/16.
 */
@Controller
@RequestMapping("/")
public class IndexController {

    // 消息service
    @Resource
    private MessageService messageService;

    @RequestMapping(value = "index", method = RequestMethod.GET)
    public ModelAndView home(Model model, HttpSession session) {
        ModelAndView mav = new ModelAndView("index/index_left");
//        if (session.getAttribute("user") != null) {
//            List<Message> messages = messageService.queryAllList(((Users) session.getAttribute("user")).getId());
//            mav.addObject("messages", messages);
//        }
        return mav;
    }

    @RequestMapping(value = "redirect_index", method = RequestMethod.GET)
    public String redirectHome(Model model) {
        model.addAttribute("redirect", "redirect");
        return "index/index_left";
    }

}
