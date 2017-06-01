package com.ht.controller;

import com.ht.bean.*;
import com.ht.common.bean.Pager4EasyUI;
import com.ht.service.*;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.subject.Subject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by 举 on 2017/2/26.
 */
@Controller
@RequestMapping("/matter")
public class MatterController {
    private static final Logger logger = LoggerFactory.getLogger(MatterController.class);

    @Resource
    private MatterService matterService;

    @Resource
    private UserMatterService userMatterService;

    @Resource
    private UsersService usersService;

    @Resource
    private CommentService commentService;

    @Resource
    private ReplyService replyService;

    @Resource
    private UserRoleService userRoleService;

    // 消息service
    @Resource
    private MessageService messageService;

    @Resource
    private HttpSession session;

    int matterId = 0 ;

    /**
     * 查询所有动态
     * @param model
     * @return
     */
    @RequestMapping(value = "queryByPage" ,method = RequestMethod.GET)
    public String queryByPage(Model model, HttpServletRequest req, UserMatter userMatter){
        logger.info("分页显示所有动态");
        String pageNoStr =  req.getParameter("pageNoStr");
        int pageNo = 1;
        final int pageSize = 10;
        int total = userMatterService.count();
        int totalPage = (total % pageSize) == 0 ? total / pageSize : (total / pageSize + 1);
        if (pageNoStr != null) {
            try {
                pageNo = Integer.valueOf(pageNoStr);
                if (pageNo <= 0) {
                    pageNo = 1;
                } else if (pageNo > totalPage) {
                    pageNo = totalPage;
                }
            } catch (NumberFormatException e) {
                logger.error("当前pgerNo类型转换失败");
            }
        }
        Pager4EasyUI<UserMatter> pager = new Pager4EasyUI<UserMatter>();
        pager.setTotal(total);
        pager.setPageNo(pageNo);
        pager.setPageSize(pageSize);
        List<UserMatter> matters =  userMatterService.queryMatter(pager, userMatter);
        pager.setRows(matters);
        Users users = (Users)session.getAttribute("user");
        if(users!=null) {
            for (UserMatter matter : matters) {
                    matter.setSessionId(users.getId());
                }
        }
        model.addAttribute("matterPageNo",pageNo);
        model.addAttribute("matters",matters);
        return "trends/social_feed" ;
    }

    /**
     * 动态详情页面
     * @return
     */
    @RequestMapping(value = "matterInFo" ,method = RequestMethod.GET)
    public String queryMatterInFo(Model model, int id) {
        Users sessionUser = (Users)session.getAttribute("user");
        List<Matter> matters = matterService.queryMC(id);
        Matter matter = matterService.queryById(id);
        matterId = id;
        Users user = usersService.queryById(matter.getUserId());
        model.addAttribute("id", matter.getId());
        model.addAttribute("userId", matter.getUserId());
        if(sessionUser!=null) {
            model.addAttribute("sessionUserId", sessionUser.getId());
        }
        model.addAttribute("userName", user.getUserName());
        model.addAttribute("userHead", user.getHead());
        model.addAttribute("title", matter.getTitle());
        model.addAttribute("createTime", matter.getCreateTime());
        model.addAttribute("des", matter.getDes());
        for (Matter m : matters) {
            Users users = usersService.queryById(m.getUserId());
            model.addAttribute("des", m.getDes());
            model.addAttribute("title", m.getTitle());
            model.addAttribute("comments", m.getComments());
            List<Comment> comment = m.getComments();
            for (Comment comment1 : comment) {
                Users users1 = usersService.queryById(comment1.getUserId());
                model.addAttribute("name", users1.getUserName());
                model.addAttribute("matterHead", users1.getHead());
                if(sessionUser!=null) {
                    comment1.setSessionId(users.getId());
                }
            }
        }
        model.addAttribute("userHead", user.getHead());
        return "trends/social_feed_info";
    }


    /**
     * 查询个人动态
     */
    @RequestMapping("MyMatter")
    public String queryMyMatter(Model model, HttpServletRequest req, UserMatter userMatter) {
        Users users = (Users)session.getAttribute("user");
        if (users != null) {
            logger.info("分页显示所有我的动态");
            String pageNoStr =  req.getParameter("pageNoStr");
            int pageNo = 1;
            final int pageSize = 10;
            int total = userMatterService.myCount(users.getId());
            int totalPage = (total % pageSize) == 0 ? total / pageSize : (total / pageSize + 1);
            if (pageNoStr != null) {
                try {
                    pageNo = Integer.valueOf(pageNoStr);
                    if (pageNo <= 0) {
                        pageNo = 1;
                    } else if (pageNo > totalPage) {
                        pageNo = totalPage;
                    }
                } catch (NumberFormatException e) {
                    logger.error("当前pgerNo类型转换失败");
                }
            }
            Pager4EasyUI<UserMatter> pager = new Pager4EasyUI<UserMatter>();
            pager.setTotal(total);
            pager.setPageNo(pageNo);
            pager.setPageSize(pageSize);
            List<UserMatter> matters =  userMatterService.queryMyMatter(users.getId(),pager, userMatter);
            pager.setRows(matters);
            model.addAttribute("myMatterPageNo",pageNo);
            model.addAttribute("matters",matters);
            model.addAttribute("head",users.getHead());
            return "trends/my_social_feed" ;
        } else {
            return "index/error";
        }

    }
    /**
     * 删除个人动态
     */
    @RequestMapping("delMatter")
    public ModelAndView deleteMatter(int id, String jsp) {
        ModelAndView mav = new ModelAndView(jsp);
        matterService.deleteById(id);
        return mav;
    }

    /**
     * 删除评论
     */
    @RequestMapping("delComment")
    public ModelAndView deleteComment(int id, String jsp, int matterId1) {
        ModelAndView mav = new ModelAndView(jsp);
        commentService.deleteById(id);
        mav.addObject("id",matterId);
        return mav;
    }

    /**
     * 删除回复
     */
    @RequestMapping("delReply")
    public ModelAndView deleteReply(int id, String jsp, int matterId1) {
        ModelAndView mav = new ModelAndView(jsp);
        replyService.deleteById(id);
        mav.addObject("id",matterId);
        return mav;
    }

    /**
     * 添加个人动态
     */
    @RequestMapping("addMatter")
    public String addMatter(String content, String title, Matter matter) {
        Users users = (Users)session.getAttribute("user");
        if (users != null) {
            matter.setTitle(title);
            matter.setDes(content);
            matter.setStatus(1);
            matter.setUserId(users.getId());
            matterService.insert(matter);
            return "redirect:MyMatter";
        } else {
            return "error";
        }

    }

    // 评论动态
    @RequestMapping("addComment")
    public ModelAndView addComment(int id, int userId, String content, Comment comment, Model model) {
        Users users = (Users)session.getAttribute("user");
        if (users != null) {
            comment.setUserId(users.getId());
            comment.setDes(content);
            comment.setStatus(1);
            comment.setMatterId(id);
            commentService.insert(comment);
            Message m = new Message();
            m.setToUser(userId);
            m.setFoUser(users.getId());
            m.setMatterId(id);
            m.setDes(content);
            messageService.insert(m);// 当插入一条评论时, 增加一条新消息
            ModelAndView modelAndView = new ModelAndView("redirect:matterInFo");
            modelAndView.addObject("id",matterId);
            return modelAndView;
        } else {
            ModelAndView modelAndView = new ModelAndView("error");
            return modelAndView;
        }

    }

    // 点击评论的回复按钮查询所有回复
    @ResponseBody
    @RequestMapping("queryCR" )
    public List<Reply> queryCR(int id, HttpServletRequest req) {
        Users users = (Users)session.getAttribute("user");
        List<Comment> comments = commentService.queryByCMId(id);
        List<Reply> replys = new ArrayList<Reply>();
        for (Comment comment : comments) {
            replys = comment.getReplies();
            for (Reply reply : comment.getReplies()) {
                if(users != null) {
                    reply.setSessionHead(users.getHead());
                    reply.setSessionId(users.getId());
                    UserRole ur = userRoleService.queryByUserId(users.getId());
                    System.out.print(ur.getRoleId());
                    if(ur.getRoleId() != 4 && ur.getRoleId() != 5){
                        reply.setRoleId(1);
                    }
                }
                reply.setMatterId(comment.getMatter().getId());
                reply.setMatterUserId(comment.getMatter().getUserId());
            }
        }
        req.setAttribute("replys", replys);
        return replys;
    }

    // 回复评论的回复
    @ResponseBody
    @RequestMapping("addReplyR")
    public ModelAndView addReplyR(Reply reply, int id, String des, String userName, int userId) {
        Users users = (Users) session.getAttribute("user");
        ModelAndView mav = new ModelAndView();
        if (users != null) {
            reply.setUserId(users.getId());
            reply.setDes(users.getUserName() + "回复" + userName + ":" + des);
            reply.setStatus(1);
            reply.setCommentId(id);
            replyService.insert(reply);
            Message m = new Message();
            m.setToUser(userId);
            m.setFoUser(users.getId());
            m.setMatterId(matterId);
            m.setDes(des);
            messageService.insert(m);// 当插入一条回复时, 增加一条新消息
            mav.setViewName("redirect:matterInFo");
            mav.addObject("id",matterId);
            return mav;
        } else {
            mav.setViewName("redirect:login_page");
            return mav;
        }

    }

    // 回复评论
    @ResponseBody
    @RequestMapping("addReply")
    public ModelAndView addReply(Reply reply, int id, String des) {
        Users users = (Users)session.getAttribute("user");
        ModelAndView mav = new ModelAndView();
        if (users != null) {
            Comment comment = commentService.queryById(id);
            int toUser = comment.getUserId();
            reply.setUserId(users.getId());
            reply.setDes(des);
            reply.setStatus(1);
            reply.setCommentId(id);
            replyService.insert(reply);
            Message m = new Message();
            m.setToUser(toUser);
            m.setFoUser(users.getId());
            m.setMatterId(matterId);
            m.setDes(des);
            messageService.insert(m);// 当插入一条回复时, 增加一条新消息
            mav.setViewName("redirect:matterInFo");
            mav.addObject("id",matterId);
            return mav;
        } else {
            mav.setViewName("redirect:login_page");
            return mav;
        }

    }

    @RequestMapping(value = "login_page", method = RequestMethod.GET)
    public ModelAndView loginPage() {
        logger.info("跳转到用户登录页面");
        Subject subject = SecurityUtils.getSubject();
        subject.logout();
        ModelAndView mav = new ModelAndView("index/login");
        mav.addObject("login", 1);
        return mav;
    }

}
