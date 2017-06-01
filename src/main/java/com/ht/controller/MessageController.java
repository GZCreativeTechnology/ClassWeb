package com.ht.controller;

import com.ht.bean.Message;
import com.ht.bean.Users;
import com.ht.service.MessageService;
import com.ht.service.ReplyService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import java.util.List;

/**
 * 消息controller
 * Created by Zhangwenxing on 3/3/17.
 */
@Controller
@RequestMapping("/message")
public class MessageController {
    private static final Logger logger = LoggerFactory.getLogger(MessageController.class);
    @Resource
    private HttpSession session;
    @Resource
    private MessageService messageService;
    @Resource
    private ReplyService replyService;

    @RequestMapping(value = "message_page", method = RequestMethod.GET)
    public ModelAndView showMessagePage(HttpSession session) {
        logger.info("查询消息");
        ModelAndView mav = new ModelAndView("index/message");
        // 查询所有消息
        if(session.getAttribute("user")!=null) {
            List<Message> messagesAll = messageService.queryAllListByStatus(((Users) session.getAttribute("user")).getId());
            mav.addObject("messagesAll", messagesAll);
            mav.addObject("sessionUserHead", ((Users) session.getAttribute("user")).getHead());
        }
        return mav;
    }

    @RequestMapping(value = "updateAll",method = RequestMethod.GET)
    public ModelAndView updateAll(HttpSession session) {
        logger.info("修改消息状态");
        ModelAndView mav = new ModelAndView("index/index_left");
        // 把消息全部设置为已读
        messageService.updateAll(((Users) session.getAttribute("user")).getId());
        return mav;
    }

    @ResponseBody
    @RequestMapping(value = "queryAllJS",method = RequestMethod.GET)
    public List<Message> queryAllJS(HttpSession session) {
        logger.info("查询消息");
        if(session.getAttribute("user")!=null) {
            // 查询所有消息, 且状态为未读
            return messageService.queryAllList(((Users) session.getAttribute("user")).getId());
        }
        return null;
    }

}
