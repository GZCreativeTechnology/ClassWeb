package com.ht.controller;

import com.ht.service.CommentService;
import com.ht.service.MessageService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;

/**
 * Created by AngeJob on 2017/3/6.
 */
@Controller
@RequestMapping("/comment")
public class CommentController {

    @Resource
    private CommentService commentService;

    // 消息service
    @Resource
    private MessageService messageService;

}
