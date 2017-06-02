package com.ht.controller;

import com.ht.bean.Photo;
import com.ht.bean.Users;
import com.ht.common.Constants;
import com.ht.common.Methods;
import com.ht.info.Data;
import com.ht.info.PhotoInfo;
import com.ht.service.PhotoService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
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
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * Created by Administrator on 2017/2/24.
 */
@Controller
@RequestMapping("photo")
public class PhotoController {

    private static final Logger logger = LoggerFactory.getLogger(PhotoController.class);

    @Resource
    private PhotoService photoService;

    @RequestMapping(value = "show_photo", method = RequestMethod.GET)
    public ModelAndView showPhoto() {
        logger.info("跳转到班级相册页面");
        ModelAndView mav = new ModelAndView("classFootprint/photo");
        List<Photo> photoList = photoService.queryByRandom();
        mav.addObject("photoList", photoList);
        return mav;
    }

    @RequestMapping(value = "upload", method = RequestMethod.POST)
    public String upload(Photo photo, MultipartFile file, HttpServletRequest req, HttpSession session) {
        logger.info("上传图片");
        try {
            String fileName = Methods.createName(file.getOriginalFilename());
            String path = Methods.uploadPath("img") + fileName;
            if (photo != null) {
                file.transferTo(new File(path));
                Users user = (Users) session.getAttribute("user");
                photo.setUser(user);
                photo.setImage(Constants.UPLOAD_IMAGES + Methods.createNewFolder() + "/" + fileName);
                photo.setCreateTime(new Date());
                photo.setStatus(1);
                photoService.insert(photo);
            }
        } catch (IllegalStateException e) {
            logger.error("图片上传失败");
            e.printStackTrace();
        } catch (IOException e) {
            logger.error("图片上传失败");
            e.printStackTrace();
        }
        return "redirect: show_photo";

    }

    @ResponseBody
    @RequestMapping(value = "random", method = RequestMethod.GET)
    public Data queryRandom() {
        logger.info("随机查询前50条数据，做瀑布流");
        Data data = new Data();
        List<PhotoInfo> photoInfos = new ArrayList<PhotoInfo>();
        List<Photo> photos = photoService.queryByRandom();
        for (Photo p : photos) {
            PhotoInfo pi = new PhotoInfo();
            pi.setId(p.getId());
            pi.setSrc(p.getImage());
            photoInfos.add(pi);
        }
        data.setData(photoInfos);
        return data;
    }

    @RequestMapping(value = "id", method = RequestMethod.GET)
    public ModelAndView queryById(String id) {
        logger.info("查看相片的详情");
        ModelAndView mav = new ModelAndView("classFootprint/photoDetail");
        Photo photo = photoService.queryById(id);
        mav.addObject("photo", photo);
        return mav;
    }

    @RequestMapping(value = "random_photo", method = RequestMethod.GET)
    public ModelAndView queryByRandomNotId(int id) {
        logger.info("随即查询相册,不等于当前相册");
        ModelAndView mav = new ModelAndView("classFootprint/photoDetail");
        Photo photo = photoService.queryByRandomNotId(id);
        mav.addObject("photo", photo);
        return mav;
    }

    @RequestMapping(value = "edit", method = RequestMethod.POST)
    public ModelAndView updatePhoto(Photo photo, MultipartFile file) {
        logger.info("修改图片信息");
        ModelAndView mav = new ModelAndView("classFootprint/photoDetail");
        try {
            String fileName = Methods.createName(file.getOriginalFilename());
            String path = Methods.uploadPath("img") + fileName;
            if (!file.isEmpty()) {
                file.transferTo(new File(path));
                photo.setImage(Constants.UPLOAD_IMAGES + Methods.createNewFolder() + "/" + fileName);
            }
            photo.setCreateTime(new Date());
            photoService.update(photo);
            mav.addObject("photo", photo);
            logger.info("修改成功");
        } catch (IllegalStateException e) {
            logger.error("图片上传失败");
            e.printStackTrace();
        } catch (IOException e) {
            logger.error("图片上传失败");
            e.printStackTrace();
        }
        return mav;
    }

    @RequestMapping(value = "del", method = RequestMethod.GET)
    public String deletePhoto(String id) {
        logger.info("根据id删除图片");
        Photo photo = new Photo();
        photo.setId(Integer.valueOf(id));
        photoService.delete(photo);
        return "redirect:show_photo";
    }

}
