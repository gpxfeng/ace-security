package com.cloud.vod.parsing;


import com.cloud.vod.pipeline.PipelineBase;
import us.codecraft.webmagic.Page;
import us.codecraft.webmagic.Site;
import us.codecraft.webmagic.processor.PageProcessor;

/**
 * Copyright: Copyright (c) 2019 LanRu-Caifu
 *
 * @ClassName: ParsingBase.java
 * @Description: 该类的功能描述
 *
 * @version: v1.0.0
 * @author: yuxianfeng
 * @date: 2019年2月27日 上午10:44:43
 *
 *        Modification History: Date Author Version Description
 *        ---------------------------------------------------------* 2019年2月27日
 *        Administrator v1.0.0 修改原因
 */
public class ParsingBase extends Thread implements PageProcessor{

    private int threadNum = 1;

    private String parseWebUrl = "";

    private String websiteName = "";

    // 部分一：抓取网站的相关配置，包括编码、抓取间隔、重试次数等、超时时间
    private Site site = Site.me().setRetryTimes(5).setCycleRetryTimes(5).setSleepTime(10*1000).setTimeOut(3*60*1000).setCharset("UTF-8")
            .setUserAgent(PipelineBase.USERAGENT);

    @Override
    public Site getSite() {
        return site;
    }

    @Override
    public void process(Page page) {

    }

    @Override
    public void run() {
        super.run();
    }

    /**
    * @Function: ParsingBase.java
    * @Description: 解析页码地址，添加到待爬取队列中
    *
    * @param:
    * @return：void
    * @throws：异常描述
    *
    * @version: v1.0.0
    * @author: yuxianfeng
    * @date: 2019年3月2日 下午5:04:09
    */
    public void parsingPage(Page page) {

    }

    /**
    * @Function: ParsingBase.java
    * @Description: 解析电影信息并保存，交由pipeline模块处理
    *
    * @param:
    * @return：void
    * @throws：异常描述
    *
    * @version: v1.0.0
    * @author: yuxianfeng
    * @date: 2019年3月2日 下午5:03:55
    */
    public void parsingFilmInfo(Page page) {

    }

    /**
     * @return the threadNum
     */
    public int getThreadNum() {
        return threadNum;
    }

    /**
     * @param threadNum the threadNum to set
     */
    public void setThreadNum(int threadNum) {
        this.threadNum = threadNum;
    }

    /**
     * @return the parseWebUrl
     */
    public String getParseWebUrl() {
        return parseWebUrl;
    }

    /**
     * @param parseWebUrl the parseWebUrl to set
     */
    public void setParseWebUrl(String parseWebUrl) {
        this.parseWebUrl = parseWebUrl;
    }

    /**
     * @return the websiteName
     */
    public String getWebsiteName() {
        return websiteName;
    }

    /**
     * @param websiteName the websiteName to set
     */
    public void setWebsiteName(String websiteName) {
        this.websiteName = websiteName;
    }

    /**
     * @param site the site to set
     */
    public void setSite(Site site) {
        this.site = site;
    }

    public ParsingBase(int threadNum, String parseWebUrl, String websiteName) {
        super();
        this.threadNum = threadNum;
        this.parseWebUrl = parseWebUrl;
        this.websiteName = websiteName;
    }

    public ParsingBase() {
        super();
    }


}
