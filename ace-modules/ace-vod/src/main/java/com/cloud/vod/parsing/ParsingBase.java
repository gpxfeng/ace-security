package com.cloud.vod.parsing;

import com.cloud.vod.pipeline.PipelineBase;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;
import us.codecraft.webmagic.Page;
import us.codecraft.webmagic.Site;
import us.codecraft.webmagic.processor.PageProcessor;

@Getter
@Setter
@ToString
@NoArgsConstructor
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


    public void parsingPage(Page page) {

    }

    public void parsingFilmInfo(Page page) {

    }


}
