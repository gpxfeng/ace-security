package com.cloud.vod.service.impl;


import com.cloud.vod.entity.Website;
import com.cloud.vod.mapper.WebsiteMapper;
import com.cloud.vod.parsing.HaiwaiyyParsing;
import com.cloud.vod.service.ParsingService;
import com.cloud.vod.utils.PropertyConfigUtil;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class ParsingServiceImpl implements ParsingService {

    private Logger logger = LoggerFactory.getLogger(ParsingServiceImpl.class);

    private PropertyConfigUtil pConfigUtil = PropertyConfigUtil.getInstance("Configs.properties");

    private int thefilmestorrents_threadNum = Integer.parseInt(pConfigUtil.getValue("thefilmestorrents_threadNum"));

    public static Map<String, Integer> parseResult = new HashMap<>();

    @Autowired
    private WebsiteMapper websiteDao;

    @Autowired
    private HaiwaiyyParsing haiwaiyyParsing;

    @Override
    public void startParsing() {
        Map<String, Object> map = new HashMap<>();
        map.put("type", 1);
        map.put("enable", 1);
        List<Website> websites = websiteDao.findWebsite(map);
        logger.debug("定时任务跑起来啦啦啦啦啦");
        for (Website website : websites) {
            String websiteName = website.getName();
            if (websiteName.contains("haiwaiyy.com")) {
                logger.info("创建haiwaiyy.com爬虫线程");
                parseResult.put(websiteName, 0);
                haiwaiyyParsing.setWebsiteName(websiteName);
                haiwaiyyParsing.setParseWebUrl(website.getWeburl());
                haiwaiyyParsing.setThreadNum(thefilmestorrents_threadNum);
                haiwaiyyParsing.start();
            }
        }
    }

}
