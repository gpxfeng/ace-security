package com.cloud.vod.parsing;



import com.cloud.vod.downloader.MyHttpClientDownloader.HttpClientDownloader_RepairTlsHttps;
import com.cloud.vod.pipeline.HaiwaiyyPipeline;
import com.cloud.vod.utils.WebDriverUtil;
import org.apache.commons.lang3.StringUtils;
import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import us.codecraft.webmagic.Page;
import us.codecraft.webmagic.Spider;
import us.codecraft.webmagic.pipeline.ConsolePipeline;

import java.util.*;

@Component
public class HaiwaiyyParsing extends ParsingBase {

    @Autowired
    private HaiwaiyyPipeline haiwaiyyPipeline;

    @Override
    public void process(Page page) {
        try {
            if (page.getUrl().regex("https://www.haiwaiyy.com/vod-type-id-\\d+-pg-\\d+.html").match()) {
                parsingFilm(page);
            } else if (page.getUrl().regex("https://www.haiwaiyy.com/vod-detail-id-\\d+.html").match()) {
                parsingFilmInfo(page);
            } else if (page.getUrl().regex("https://www.haiwaiyy.com/").match()) {
                parsingType(page);
            } else {
                page.setSkip(true);
            }
        } catch (Exception e) {
            page.setSkip(true);
        }
    }

    /**
     * @Description: 解析类型地址，添加到待爬取队列中
     */
    public void parsingType(Page page) {
        List<String> typeUrlList = page.getHtml().xpath("/html/body/div[1]/div[2]/div/div[2]/ul[1]/li/a").links().all();
        page.addTargetRequests(typeUrlList);
        page.setSkip(true);
    }

    /**
     * @Description: 解析页码和影片地址，添加到待爬取队列中
     */
    public void parsingFilm(Page page) {
        List<String> filmInfoUrlList = page.getHtml().xpath("//div[@class=\"mod_video_list\"]/ul/li/a").links().all();
        page.addTargetRequests(filmInfoUrlList);

        List<String> pageUrlList = page.getHtml().xpath("//*[@id=\"pager\"]/a").links().all();
        page.addTargetRequests(pageUrlList);
        page.setSkip(true);
    }

    /**
     * @Description: 解析电影信息并保存，交由pipeline模块处理
     */
    public void parsingFilmInfo(Page page) {
        // 封面地址
        page.putField("img", "https://www.haiwaiyy.com" + page.getHtml().xpath("//div[@class=\"img\"]/a/img/@src").toString());
        //名称
        page.putField("movieName", page.getHtml().xpath("//div[@class=\"mod_txt\"]/div/h1/em/text()").toString());
        //简介
        page.putField("introduce", page.getHtml().xpath("//div[@class=\"mod_show_box mt15\"]/div[2]/font/font/text()").toString());
        //年份
        page.putField("year", page.getHtml().xpath("//div[@class=\"mod_txt\"]/ul/li[6]/a/text()").toString());
        //类型
        String type = page.getHtml().xpath("//div[@class=\"mod_txt\"]/ul/li[2]/span/a/text()").toString();
        page.putField("type", type);
        //视频类型 1电影，2连续剧，3成人，4动漫，5回看
        int vidType = 1;
        if (type.contains("剧")) {
            vidType = 2;
        } else if (type.contains("动漫")) {
            vidType = 4;
        } else if (type.contains("综艺")) {
            page.setSkip(true);
            return;
        }
        page.putField("vidType", vidType);
        //主演
        List<String> actors = page.getHtml().xpath("//div[@class=\"mod_txt\"]/ul/li[3]/a/text()").all();
        page.putField("actors", StringUtils.join(actors.toArray(), ","));

        //导演
        page.putField("director", page.getHtml().xpath("//div[@class=\"mod_txt\"]/ul/li[4]/a/text()").toString());
        //发布国家
        page.putField("country", page.getHtml().xpath("//div[@class=\"mod_txt\"]/ul/li[5]/a/text()").toString());
        //语言
        page.putField("language", page.getHtml().xpath("//div[@class=\"mod_txt\"]/ul/li[5]/font[@color='#2b2415']/text()").toString());

        //播放地址
        List<String> stringList = page.getHtml().xpath("//div[@id=\"dizhi\"]/div/ul/li/a/text()").all();
        //如果是多集数,多专线,需要去重减少webDriver连接次数
        Set set = new HashSet();
        List newList = new ArrayList();
        for (Iterator iter = stringList.iterator(); iter.hasNext(); ) {
            Object element = iter.next();
            if (set.add(element))
                newList.add(element);
        }
        stringList.clear();
        stringList.addAll(newList);

        List<String> aList = page.getHtml().xpath("//div[@id=\"dizhi\"]/div/ul/li/a").links().all();
        // 视频链接
        Map<String, String> mp4UrlMap = new HashMap<>();
        WebDriver webDriver = WebDriverUtil.GetWebDriver();
        try {
            for (int i = 0; i < stringList.size(); i++) {
                for (int j = 0; j < aList.size(); j++) {
                    if (i == j) {
                        //打开新网页
                        webDriver.get(aList.get(j));
                        WebElement elementIf = webDriver.findElement(By.xpath("//*[@id=\"playleft\"]/iframe[2]"));
                        webDriver.get(elementIf.getAttribute("src"));
                        String doc = webDriver.getPageSource();
                        if (doc.contains("videoObject")) {//海外专线
                            String videoUrl = doc.substring(doc.indexOf("videoObject") + 14, doc.lastIndexOf("var player") - 2);
                            String video = videoUrl.substring(videoUrl.indexOf("video:") + 7, videoUrl.lastIndexOf("'"));
                            mp4UrlMap.put(stringList.get(i), video);
                        } else if (doc.contains("m3u8url")) {//美洲专线
                            String videoUrl = doc.substring(doc.indexOf("m3u8url") + 9, doc.lastIndexOf("DPlayer") - 12);
                            String video = videoUrl.substring(videoUrl.indexOf("'") + 1, videoUrl.lastIndexOf("'"));
                            mp4UrlMap.put(stringList.get(i), video);
                        }
                    }
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
            webDriver.quit();
        }finally {
            webDriver.quit();
        }
        //视频链接
        if (mp4UrlMap.isEmpty()) {
            page.setSkip(true);
            return;
        } else {
            page.putField("downloadMap", mp4UrlMap);
        }
        //网站名称
        page.putField("websiteName", getWebsiteName());
    }

    @Override
    public void run() {
        String parseWebUrl = getParseWebUrl();
        if (parseWebUrl != "" && parseWebUrl != null) {
            Spider.create(this)
                    .addUrl(parseWebUrl)
                    .setDownloader(new HttpClientDownloader_RepairTlsHttps())
                    .addPipeline(haiwaiyyPipeline)
                    .thread(getThreadNum())
                    .run();
        }
    }

    public static void main(String[] args) {
        Spider.create(new HaiwaiyyParsing())
                .addUrl("https://www.haiwaiyy.com/vod-detail-id-40639.html")
                .setDownloader(new HttpClientDownloader_RepairTlsHttps())
                .addPipeline(new ConsolePipeline())
                .thread(1)
                .run();
    }


}
