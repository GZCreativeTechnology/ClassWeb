package com.ht.controller;

import com.ht.bean.Notice;
import com.ht.bean.Users;
import com.ht.service.NoticeService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

/**
 * 公告controller
 * Created by Zhangwenxing on 2017/2/24.
 */
@Controller
@RequestMapping("/notice")
public class NoticeController {
    private static final Logger logger = LoggerFactory.getLogger(NoticeController.class);

    @Resource
    private NoticeService noticeService;

    // 根据id查找公告
    @ResponseBody
    @RequestMapping(value = "queryById/{id}" ,method = RequestMethod.GET)
    public Notice queryById(@PathVariable("id") int id){
        logger.info("根据id查找公告");
        return noticeService.queryById(id);
    }

    // 添加公告
    @RequestMapping(value = "insert/{name}/{des}/{typeId}" ,method = RequestMethod.POST)
    public ModelAndView insert(HttpSession session, @PathVariable("name") String name, @PathVariable("des") String des, @PathVariable("typeId") int typeId){
        logger.info("添加公告");
        Notice n = new Notice();
        Users u = (Users)session.getAttribute("user");
        n.setDes(des);
        n.setName(name);
        n.setUserId(u.getId());// session中的user
        n.setNoticeTypeId(typeId);
        noticeService.insert(n);
       return new ModelAndView("noticeInfo/notice_info");
    }
    // 修改公告
    @RequestMapping(value = "update/{id}/{name}/{des}/{typeId}" ,method = RequestMethod.POST)
    public String update(HttpSession session, @PathVariable("id") int id, @PathVariable("name") String name, @PathVariable("des") String des, @PathVariable("typeId") int typeId){
        logger.info("修改公告");
        Notice n = new Notice();
        Users u = (Users)session.getAttribute("user");
        n.setDes(des);
        n.setName(name);
        n.setNoticeId(id);
        n.setNoticeTypeId(typeId);
        n.setUserId(u.getId());// session中的user
        noticeService.update(n);
        return "noticeInfo/notice_info";
    }
    // 根据id删除公告
    @ResponseBody
    @RequestMapping(value = "deleteById/{id}" ,method = RequestMethod.GET)
    public String deleteById(@PathVariable("id") int id){
        logger.info("根据id删除公告");
        noticeService.deleteById(id);
        return "noticeInfo/notice_info";
    }
}
