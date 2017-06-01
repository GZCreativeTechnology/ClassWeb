package com.ht.controller;

import com.ht.bean.UserRole;
import com.ht.bean.Users;
import com.ht.common.Constants;
import com.ht.common.Methods;
import com.ht.common.util.EncryptUtil;
import com.ht.service.UserRoleService;
import com.ht.service.UsersService;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.IncorrectCredentialsException;
import org.apache.shiro.authc.UnknownAccountException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.authz.AuthorizationException;
import org.apache.shiro.session.Session;
import org.apache.shiro.subject.Subject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
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
 * Created by xiao-kang on 2017/2/27.
 */
@Controller
@RequestMapping("/users")
public class UsersController {

    private static final Logger logger = LoggerFactory.getLogger(PhotoController.class);

    @Resource
    private UsersService usersService;

    @Resource
    private UserRoleService userRoleService;
    /*
    * 显示班级成员
    * */
    @RequestMapping(value = "grade_member", method = RequestMethod.GET)
    public ModelAndView queryMember(HttpServletRequest req,HttpSession session){
        logger.info("查询班级所有成员");
        ModelAndView mav = new ModelAndView("gradeInfo/grade_member");
        Users user = (Users) session.getAttribute("user");
        List<Users> users = null;
        if(user != null){
            users = usersService.queryAll(user.getId());
        }else{
             users = usersService.queryAll(0);
        }

        mav.addObject("users",users);
        return mav;
    }


    /*
   * 添加班级成员
   * */
    @RequestMapping(value = "add_member", method = RequestMethod.POST)
    public String addMember(Users user, MultipartFile file){
        logger.info("添加班级成员");
        try {
            String fileName = Methods.createName(file.getOriginalFilename());
            String path = Methods.uploadPath("head") + fileName;
            if(!file.isEmpty()){
                file.transferTo(new File(path));
                user.setHead(Constants.UPLOAD_HEAD + Methods.createNewFolder() + "/" + fileName);
            }else{
                user.setHead("img/default.png");
            }
        }catch (IOException e){

        }
        user.setStatus(1);
        //getAge(user);
        getAgeBirthday(user);
        user.setPassword(EncryptUtil.md5Encrypt("123456"));
        usersService.insert(user);
        UserRole userRole = new UserRole();
        userRole.setRoleId(user.getRoleId());
        userRole.setUserId(user.getId());
        userRoleService.insert(userRole);
        return "redirect:grade_member";
    }

    /*
   * 根据ID查询成员
   * */
    private int ids;
    @RequestMapping(value = "queryById/{id}", method = RequestMethod.GET)
    public ModelAndView queryById(@PathVariable("id") int id){
        ids = id;
        logger.info("根据ID查询班级成员");
        ModelAndView mav = new ModelAndView("gradeInfo/member_detail");
        Users user = usersService.queryById(ids);
        UserRole userRole = userRoleService.queryByUserId(user.getId());
        mav.addObject("user",user);
        mav.addObject("roleId" ,userRole.getRoleId());
        return mav;
    }


    /*
   * 更新班级成员
   * */
    @RequestMapping(value = "update_member", method = RequestMethod.POST)
    public String updateMember(Users user, MultipartFile file,String head){
        logger.info("更新班级成员");
        try {
            String fileName = Methods.createName(file.getOriginalFilename());
            String path = Methods.uploadPath("head") + fileName;
            if(!file.isEmpty()){
                file.transferTo(new File(path));
                user.setHead(Constants.UPLOAD_HEAD + Methods.createNewFolder() + "/" + fileName);
            }else{
                user.setHead(head);
            }

        }catch (IOException e){

        }
       // getAge(user);
        getAgeBirthday(user);
        UserRole userRole = new UserRole();
        userRole.setRoleId(user.getRoleId());
        userRole.setUserId(user.getId());
        usersService.update(user);
        userRoleService.update(userRole);
        return "redirect:queryById/"+ids;
    }

    /*
   * 更新自己信息
   * */
    @RequestMapping(value = "update_myInfo", method = RequestMethod.POST)
    public String updateMyInfo(Users user, MultipartFile file,String head,HttpSession session){
        logger.info("更新自己信息");
        try {
            String fileName = Methods.createName(file.getOriginalFilename());
            String path = Methods.uploadPath("head") + fileName;
            if(!file.isEmpty()){
                file.transferTo(new File(path));
                user.setHead(Constants.UPLOAD_HEAD + Methods.createNewFolder() + "/" + fileName);
            }else{
                user.setHead(head);
            }

        }catch (IOException e){

        }
        //getAge(user);
        getAgeBirthday(user);
        user.setStatus(1);
        usersService.update(user);
        session.setAttribute("user",user);
        return "gradeInfo/my_detail";
    }

    /**
     * 我的详情信息
     * @return
     */
    @RequestMapping(value = "my_detail" ,method = RequestMethod.GET)
    public String showMYDetail(){
        return "gradeInfo/my_detail";
    }

    /**
     * 修改密码页面
     * @return
     */
    @RequestMapping(value = "pwd_pages" ,method = RequestMethod.GET)
    public String showUpdatePwd(){
        return "gradeInfo/update_pwd";
    }

    /**
     * 修改密码
     * @return
     */

    @RequestMapping(value = "update_pwd",method = RequestMethod.POST)
    public String updatePwd(String newPwd,HttpSession session){
        Users user = (Users)session.getAttribute("user");
        user.setPassword(EncryptUtil.md5Encrypt(newPwd));
        usersService.editPwd(user);
        return "redirect:login_page";
    }

    @RequestMapping(value = "login_page", method = RequestMethod.GET)
    public String loginPage() {
        logger.info("跳转到用户登录页面");
        Subject subject = SecurityUtils.getSubject();
        subject.logout();
        return "index/login";
    }

    @RequestMapping(value = "login", method = RequestMethod.POST)
    public String login(Users user, HttpServletRequest req) {
        Subject subject = SecurityUtils.getSubject();
        String newPassword = EncryptUtil.md5Encrypt(user.getPassword());
        UsernamePasswordToken token = new UsernamePasswordToken(user.getPhone(), newPassword);
        try {
            logger.info("用户验证登录成功");
            subject.login(token);
            Session session = subject.getSession();
            user = usersService.queryByPhone(user.getPhone());
            session.setAttribute("user", user);
            return "redirect:/index";
        } catch (AuthorizationException e) { // 没有权限
            req.setAttribute("error", "没有权限");
        } catch (UnknownAccountException e) { // 未知的账户异常
            req.setAttribute("error", "没有该账户");
        } catch (IncorrectCredentialsException e) { // 不正确的凭证异常
            req.setAttribute("error", "密码错误");
        } catch (AuthenticationException e) { // 账号验证失败
            req.setAttribute("error", "账号验证失败");
        }
        logger.error("用户验证失败");
        return "index/login";
    }

    @RequestMapping(value = "logout", method = RequestMethod.GET)
    public String logout() {
        logger.info("用户退出登录");
        Subject subject = SecurityUtils.getSubject();
        subject.logout();
        return "index/login";
    }

    /*
    * 根据用户手机号查询有没有该用户
    * */
    @ResponseBody
    @RequestMapping(value = "checkPhone", method = RequestMethod.GET)
    public  boolean checkLoginName(String phone) {
        Users user = usersService.queryByPhone(phone);
        if(user == null){
            return false;
        }
        return true;
    }

    /*
  * 根据用户密码查询是否和数据一致
  * */
    @ResponseBody
    @RequestMapping(value = "checkPwd", method = RequestMethod.GET)
    public  String checkPwd(String pwd, HttpSession session) {
        Users user = (Users)session.getAttribute("user");
        String strPwd = EncryptUtil.md5Encrypt(pwd);
        if(strPwd.equals(user.getPassword())){
            return "yes";
        }
        return "no";
    }

    /*
    * 根据页面的生日算出年龄
    * */
    public void getAge(Users user){
        int date = Integer.valueOf(new SimpleDateFormat("yyyy").format(new Date()));
        int birthday = 0;
        if(!user.getBirthday().equals("") && user.getBirthday() != null){
            birthday = Integer.valueOf(user.getBirthday().substring(0,4));
        }
        user.setAge(date - birthday);
        user.setPassword(EncryptUtil.md5Encrypt("123456"));
    }

    /*
  * 根据页面的身份证算出年龄和生日
  * */
    public void getAgeBirthday(Users user){
        int date = Integer.valueOf(new SimpleDateFormat("yyyy").format(new Date()));
        int age = 0;
        int birthday = 0;
        if(!user.getIdCard().equals("") && user.getIdCard() != null){
            age = Integer.valueOf(user.getIdCard().substring(6,10));
            birthday = Integer.valueOf(user.getIdCard().substring(6,14));
        }
        StringBuffer birthdayStr = new StringBuffer(String.valueOf(birthday));
        birthdayStr.insert(4,"-");
        birthdayStr.insert(7,"-");
        user.setBirthday(String.valueOf(birthdayStr));
        user.setAge(date - age);

    }

}

