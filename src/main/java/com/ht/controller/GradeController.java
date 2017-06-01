package com.ht.controller;

import com.ht.bean.Grade;
import com.ht.bean.Users;
import com.ht.bean.Written;
import com.ht.common.Constants;
import com.ht.common.Methods;
import com.ht.common.bean.Pager;
import com.ht.common.bean.Pager4EasyUI;
import com.ht.common.util.PagerUtil;
import com.ht.service.GradeService;
import com.ht.service.UsersService;
import com.ht.service.WrittenService;
import org.apache.ibatis.annotations.Param;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.context.ContextLoader;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

/**
 * Created by xiao-kang on 2017/2/18.
 */
@Controller
@RequestMapping("/grade")
public class GradeController {

    private static final Logger logger = LoggerFactory.getLogger(PhotoController.class);

    @Resource
    private GradeService gradeService;

    @Resource
    private UsersService usersService;

    @Resource
    private WrittenService writtenService;

    /*
    * 查出班级信息，显示班级信息页面
    * */
    @RequestMapping(value = "grade_info",method = RequestMethod.GET)
    public ModelAndView queryGrade(Written written, HttpServletRequest req,HttpSession session){
        logger.info("跳转到班级信息页面");
        String pageNoStr = req.getParameter("pageNo");
        List<Grade> grade = gradeService.queryAll();
        Users user = usersService.queryById(grade.get(0).getUserId());
        int pageNo = 1;
        int pageSize = 5;
        int total = writtenService.count();
        int totalPage = (total % pageSize )== 0 ? total / pageSize :(total / pageSize +1);
        if(pageNoStr != null){
            try {
                pageNo = Integer.valueOf(pageNoStr);
                if(pageNo <= 0){
                    pageNo = 1;
                }else if(pageNo > totalPage){
                    pageNo = totalPage;
                }

            }catch (NumberFormatException e){

            }
        }
        Pager pager = new Pager(pageNo,pageSize,0);
        List<Written> writtens = writtenService.queryPager(pager);
        Users sessionId = (Users)session.getAttribute("user");
        if(sessionId != null){
            for(Written w: writtens){
                w.setSessionId(sessionId.getId());
            }
        }

        ModelAndView mav = new ModelAndView("gradeInfo/grade_info");
        mav.addObject("writtens", writtens);
        mav.addObject("pageNo", pageNo);
        mav.addObject("grade",grade.get(0));
        mav.addObject("user",user);
        return mav;
    }




    /*
    * 修改班级
    * */
    @RequestMapping(value = "update",method = RequestMethod.POST)
    public String updateGrade(Grade grade, MultipartFile file,String logo){
        logger.info("修改班级");
            try {
                String fileName = Methods.createName(file.getOriginalFilename());
                String path = Methods.uploadPath("logo") + fileName;
                if(!file.isEmpty()){
                    file.transferTo(new File(path));
                    grade.setLogo(Constants.UPLOAD_LOGO + Methods.createNewFolder() + "/" + fileName);
                }else{
                    grade.setLogo(logo);

                }
                gradeService.update(grade);

            }catch (IOException e){

            }
            return "redirect:grade_info";


    }

    /*
    * 添加留言
    * */

    @RequestMapping(value = "add_written", method = RequestMethod.POST)
    public String addWritten(Written written,HttpSession session){
        logger.info("发表班级留言");
        Users user = (Users)session.getAttribute("user");
        written.setCreateTime(new Date());
        written.setUser(user);
        writtenService.insert(written);
        return "redirect:grade_info";
    }

      /*
    * 删除留言
    * */

    @RequestMapping(value = "delete_written", method = RequestMethod.GET)
    public String deleteByWritten(String id){
        logger.info("删除班级留言");
        writtenService.deleteById(Integer.valueOf(id));
        return "redirect:grade_info";
    }



}