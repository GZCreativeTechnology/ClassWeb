package com.ht.controller;

import com.ht.bean.NoticeInfo;
import com.ht.bean.NoticeType;
import com.ht.common.bean.Pager4EasyUI;
import com.ht.service.NoticeInfoService;
import com.ht.service.NoticeTypeService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.List;

/**
 * 公告分页Info controller
 * Created by Zhangwenxing on 2017/2/24.
 */
@Controller
@RequestMapping("/noticeInfo")
public class NoticeInfoController {
    private static final Logger logger = LoggerFactory.getLogger(NoticeInfoController.class);

    @Resource
    private NoticeInfoService noticeInfoService;
    @Resource
    private NoticeTypeService noticeTypeService;
    // 分页查询所有公告
    @RequestMapping(value = "queryByPage" ,method = RequestMethod.GET)
    public ModelAndView queryByPage(HttpServletRequest req, NoticeInfo noticeInfo){
        logger.info("分页显示公告");
        String pageNoStr =  req.getParameter("pageNoStr");
        int pageNo = 1;
        final int pageSize = 7;
        int total = noticeInfoService.count();
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
        Pager4EasyUI<NoticeInfo> pager = new Pager4EasyUI<NoticeInfo>();
        pager.setTotal(total);
        pager.setPageNo(pageNo);
        pager.setPageSize(pageSize);
        List<NoticeInfo> noticeInfos =  noticeInfoService.queryByPager(pager, noticeInfo);
        pager.setRows(noticeInfos);
        ModelAndView mav = new ModelAndView("noticeInfo/notice_info");
        List<NoticeType> noticeTypes = noticeTypeService.queryAll();
        mav.addObject("noticeTypes", noticeTypes);
        mav.addObject("noticeInfos", noticeInfos);
        mav.addObject("noticeInfoPageNo", pageNo);
        return mav;
    }

}
