package com.ht.controller;

import com.ht.bean.Notice;
import com.ht.bean.Users;
import com.ht.common.Constants;
import com.ht.common.message.IndustrySMS;
import com.ht.service.NoticeService;
import com.ht.service.UsersService;
import com.ht.thread.SendEmailThread;
import com.jh.email.Mail;
import com.jh.email.MailSender;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import sun.applet.Main;

import javax.annotation.Resource;
import javax.mail.BodyPart;
import javax.mail.MessagingException;
import javax.mail.Multipart;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMultipart;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;

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

    @Resource
    private UsersService usersService;

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

        List<Users> users = usersService.queryAll(u.getId());

        List<Mail> mailList = new ArrayList<Mail>();
        String phone = "";
        for (Users user : users) {
            // 群发邮件
            String email = user.getQq() + "@qq.com";
            Mail mail = new Mail();
            mail.setRecipients(email);
            mail.setSubject(name);
            mail.setType(Mail.HTML);
            Multipart multipart = new MimeMultipart();
            BodyPart part1 = new MimeBodyPart();
            try {
                part1.setContent("<p>" + des + "</p>", mail.getType());
                multipart.addBodyPart(part1);
                mail.setMultipart(multipart);
                mailList.add(mail);
            } catch (MessagingException e) {
            }

            // 群发短信通知
            if (phone.equals("")) {
                phone = user.getPhone();
            } else {
                phone += "," + user.getPhone();
            }

        }
        new Thread(new SendEmailThread(mailList)).start();
        String to = phone;
        String smsContent = "【创意科技】亲爱的老同学，有新公告更新了哦，请前往班级网站查看最新公告。";
        IndustrySMS is = new IndustrySMS(to, smsContent);
        is.execute();

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
