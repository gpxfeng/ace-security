package com.cloud.vod.controller;


import com.cloud.vod.mapper.DramainfoMapper;
import com.cloud.vod.entity.Category;
import com.cloud.vod.entity.Dramainfo;
import com.cloud.vod.entity.VideoType;
import com.alibaba.fastjson.JSONObject;
import com.cloud.vod.mapper.VideoTypeMapper;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletResponse;
import java.util.List;


@Controller
@RequestMapping("test")
public class TestController {

    private Logger logger = LoggerFactory.getLogger(TestController.class);

    @Autowired
    public DramainfoMapper dramainfoDao;

   @Autowired
    public VideoTypeMapper videoTypeDao;

    /**
     * 上传测试
     * @param params
     * @return
     * @throws
     */
    @RequestMapping(value = "/upload", method = {RequestMethod.POST})
    public @ResponseBody
    String upload(HttpServletResponse response, @RequestBody String params) throws Exception {
        String paramsStr = (String) JSONObject.parseObject(params).get("params");
        JSONObject jsonObject = JSONObject.parseObject(paramsStr);
        String movieName = (String) jsonObject.get("movieName");
        String imgUrl = (String) jsonObject.get("imgUrl");
        //创建Dramainfo对象
        Dramainfo dramainfo = new Dramainfo();
        dramainfo.setName(movieName);
        dramainfo.setImageurl(imgUrl);
        int resultDra = dramainfoDao.addDramainfo(dramainfo);
        if (resultDra == 1) {
            return "200";
        }
        return "失败";
    }

    /**
     * 查找所有分类
     * @param response
     * @return
     * @throws
     */
    @RequestMapping(value = "/findTypeAll", method = {RequestMethod.GET})
    public @ResponseBody
    String findTypeAll(HttpServletResponse response) throws Exception {
        List<VideoType> allType = videoTypeDao.findAllType();
        String toJSONString = JSONObject.toJSONString(allType);
        return toJSONString;
    }


    @RequestMapping(value = "/findVideoType", method = {RequestMethod.GET})
    public @ResponseBody
    String findVideoType(HttpServletResponse response,String id) throws Exception {
        List<Category> allType= videoTypeDao.findVideoType(id);
        String toJSONStr = JSONObject.toJSONString(allType);
        return toJSONStr;
    }



}
