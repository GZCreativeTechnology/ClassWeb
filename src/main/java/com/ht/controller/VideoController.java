package com.ht.controller;

import com.ht.bean.Users;
import com.ht.bean.Video;
import com.ht.common.Constants;
import com.ht.common.Methods;
import com.ht.common.bean.Pager;
import com.ht.common.bean.Pager4EasyUI;
import com.ht.common.util.PagerUtil;
import com.ht.service.VideoService;
import org.apache.ibatis.annotations.Param;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.util.Date;
import java.util.List;

/**
 * Created by Administrator on 2017/2/24.
 */
@Controller
@RequestMapping("video")
public class VideoController {

    private static final Logger logger = LoggerFactory.getLogger(VideoController.class);

    @Resource
    private VideoService videoService;

    /**
     * 分页查询视频
     * @return
     */
    @RequestMapping(value = "pager", method = RequestMethod.GET)
    public ModelAndView searchVideo(@Param("page")String page, @Param("rows")String rows, Video video) {
        ModelAndView mav = new ModelAndView("classFootprint/video");
        Pager4EasyUI<Video> pager = new Pager4EasyUI<Video>();
        int total = videoService.count();
        pager.setTotal(total);
        pager.setPageNo(Integer.valueOf(page));
        pager.setPageSize(Integer.valueOf(rows));
        List<Video> videos =  videoService.queryByPager(pager, video);
        pager.setRows(videos);
        mav.addObject("videos", pager);
        return mav;
    }

    /**
     * 上传视频
     * @return
     */
    @RequestMapping(value = "add", method = RequestMethod.POST)
    public ModelAndView addVideo(MultipartFile file, Video video, HttpSession session) {
        ModelAndView mav = new ModelAndView("classFootprint/video");
        logger.info("上传视频");
        try {
            String fileName = Methods.createName(file.getOriginalFilename());
            String path = Methods.uploadPath("video") + fileName;
            if (video != null) {
                file.transferTo(new File(path));
                Users user = (Users) session.getAttribute("user");
                video.setUser(user);
                video.setUrl(Constants.UPLOAD_VIDEO + Methods.createNewFolder() + "/" + fileName);
                video.setCreateTime(new Date());
                video.setStatus(1);
                videoService.insert(video);
                Pager4EasyUI<Video> pager = new Pager4EasyUI<Video>();
                int total = videoService.count();
                pager.setTotal(total);
                pager.setPageNo(1);
                pager.setPageSize(10);
                List<Video> videos =  videoService.queryByPager(pager, video);
                pager.setRows(videos);
                mav.addObject("videos", pager);
            }
        } catch (IllegalStateException e) {
            logger.error("视频上传失败");
            e.printStackTrace();
        } catch (IOException e) {
            logger.error("视频上传失败");
            e.printStackTrace();
        }
        return mav;
    }

    /**
     * 根据id查询视频详情
     * @param id
     * @return
     */
    @RequestMapping(value = "id", method = RequestMethod.GET)
    public ModelAndView queryById(String id) {
        logger.info("查看视频的详情");
        ModelAndView mav = new ModelAndView("classFootprint/videoDetail");
        Video video = videoService.queryById(id);
        mav.addObject("video", video);
        return mav;
    }

    @RequestMapping(value = "edit", method = RequestMethod.POST)
    public ModelAndView updateVideo(Video video, MultipartFile file){
        logger.info("修改视频信息");
        ModelAndView mav = new ModelAndView("classFootprint/videoDetail");
        try {
            String fileName = Methods.createName(file.getOriginalFilename());
            String path = Methods.uploadPath("video") + fileName;
            if(!file.isEmpty()){
                file.transferTo(new File(path));
                video.setUrl(Constants.UPLOAD_VIDEO + Methods.createNewFolder() + "/" + fileName);
            }
            video.setCreateTime(new Date());
            videoService.update(video);
            mav.addObject("video", video);
            logger.info("修改成功");
        } catch (IllegalStateException e) {
            logger.error("视频上传失败");
            e.printStackTrace();
        } catch (IOException e) {
            logger.error("视频上传失败");
            e.printStackTrace();
        }
        return mav;
    }

    @RequestMapping(value = "del", method = RequestMethod.GET)
    public ModelAndView deleteVideo(String id) {
        ModelAndView mav = new ModelAndView("classFootprint/video");
        logger.info("根据id删除视频");
        Video video = new Video();
        video.setId(Integer.valueOf(id));
        videoService.delete(video);
        Pager4EasyUI<Video> pager = new Pager4EasyUI<Video>();
        int total = videoService.count();
        pager.setTotal(total);
        pager.setPageNo(1);
        pager.setPageSize(10);
        List<Video> videos =  videoService.queryByPager(pager, video);
        pager.setRows(videos);
        mav.addObject("videos", pager);
        return mav;
    }
}
