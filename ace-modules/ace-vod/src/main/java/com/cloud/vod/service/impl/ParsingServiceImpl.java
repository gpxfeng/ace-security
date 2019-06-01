package com.cloud.vod.service.impl;


import com.cloud.vod.entity.Website;
import com.cloud.vod.mapper.WebsiteMapper;
import com.cloud.vod.service.ParsingService;
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

    public static Map<String, Integer> parseResult = new HashMap<>();

    @Autowired
    private WebsiteMapper websiteDao;

   /* @Autowired
    private TorrentFilmesParsing torrentFilmesParsing;

    @Autowired
    private MfilmesHdparsing mfilmesHdparsing;*/

    @Override
    public void startParsing() {
        Map<String, Object> map = new HashMap<>();
        map.put("type", 1);
        map.put("enable", 1);
        List<Website> websites = websiteDao.findWebsite(map);
        for (Website website : websites) {
            String websiteName = website.getName();
           /*if (websiteName.contains("torrentfilmes.biz")){
				logger.info("创建torrentfilmes.biz爬虫线程");
				parseResult.put(websiteName, 0);
				torrentFilmesParsing.setWebsiteName(websiteName);
				torrentFilmesParsing.setParseWebUrl(website.getWeburl());
				torrentFilmesParsing.setThreadNum(thefilmestorrents_threadNum);
				torrentFilmesParsing.start();
			}*/
           /*else if (websiteName.contains("mfilmeshd.com")) {
                logger.info("创建mfilmeshd.comm爬虫线程");
                parseResult.put(websiteName, 0);
                mfilmesHdparsing.setWebsiteName(websiteName);
                mfilmesHdparsing.setParseWebUrl(website.getWeburl());
                mfilmesHdparsing.setThreadNum(1);
                mfilmesHdparsing.start();
            }*/
            logger.debug("定时任务跑起来啦啦啦啦啦");

        }

    }

}
