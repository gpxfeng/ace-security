package com.cloud.vod.parsing;


import com.cloud.vod.downloader.MyHttpClientDownloader.HttpClientDownloader_RepairTlsHttps;
import com.cloud.vod.pipeline.ThefilmestorrentsPipeline;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import us.codecraft.webmagic.Page;
import us.codecraft.webmagic.Spider;
import us.codecraft.webmagic.selector.Html;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

@Component
public class ThefilmestorrentsParsing extends ParsingBase {

    @Autowired
    private ThefilmestorrentsPipeline thefilmestorrentsPipeline;

    @Override
    public void process(Page page) {
        try {
            if (page.getUrl().regex("https://www.thefilmestorrents.com/page/\\d+/").match()) {
                parsingPage(page);
            } else if (page.getUrl().regex("https://www.thefilmestorrents.com/[A-Za-z0-9_-]+/").match()) {
                parsingFilmInfo(page);
            }
        } catch (Exception e) {
            page.setSkip(true);
        }
    }

    /**
     * @Function: ThefilmestorrentsParsing.java
     * @Description: 解析页码地址，添加到待爬取队列中
     *
     */
    public void parsingPage(Page page) {
        List<String> pageUrlList = page.getHtml().xpath("//div[@class='wp-pagenavi']/a[@title~='Page']").links().all();
        page.addTargetRequests(pageUrlList);

        List<String> filmInfoUrlList = page.getHtml().xpath("//h2[@class='post-title']/a").links().all();
        page.addTargetRequests(filmInfoUrlList);

        page.setSkip(true);
    }

    /**
     * @Function: ThefilmestorrentsParsing.java
     * @Description: 解析电影信息并保存，交由pipeline模块处理
     *
     */
    public void parsingFilmInfo(Page page) {
        // 封面地址
        page.putField("img", page.getHtml().xpath("//div[@class='post-content']/p[1]/a[1]/img/@src").toString());

        String[] filmInfoArr = page.getHtml().xpath("//div[@class='post-content']/p[1]").toString().split("<br>");
        for (String filmInfoStr : filmInfoArr) {
            if (filmInfoStr.contains("Baixar")) { // 名称
                page.putField("Baixar", filmInfoStr.substring(filmInfoStr.lastIndexOf("</b>") + 4, filmInfoStr.length())
                        .replaceAll("&nbsp;", "").trim());
            } else if (filmInfoStr.contains("Lançamento")) { // 年份
                page.putField("Lançamento", filmInfoStr.substring(filmInfoStr.lastIndexOf("</b>") + 4, filmInfoStr.length())
                        .replaceAll("&nbsp;", "").trim());
            } else if (filmInfoStr.contains("Gênero")) { // 类型
                page.putField("Gênero", filmInfoStr.substring(filmInfoStr.lastIndexOf("</b>") + 4, filmInfoStr.length())
                        .replaceAll("&nbsp;", "").trim());
            }
        }

        String content = page.getHtml().xpath("//div[@class='post-content']").toString();
        content = content.replaceAll("<p", "@@<p");
        String[] contentArr = content.split("@@");

        //连续剧跳过
        Pattern r = Pattern.compile("Episódio (\\d+):");
        Matcher m = r.matcher(content);
        if (m.find()) {
            page.setSkip(true);
        }

        // 简介
        String sinopseStr = "";
        Pattern pattern = Pattern.compile("SINOPSE</span>: </strong>(.*)</p>");
        Matcher matcher = pattern.matcher(content);
        if (matcher.find( )) {
            sinopseStr=matcher.group(1);
        }
        page.putField("Sinopse", sinopseStr);

        // 磁力链接
        Map<String, String> btUrlMap = new HashMap<>();
        for (int i = 1; i < contentArr.length; i++) {
            String pString = contentArr[i];
            String pString2 = contentArr[i - 1];
            if (pString.contains("magnet:?xt=")) {
                if (pString.contains("1080p") && pString.contains("(MKV)")
                        || pString2.contains("1080p") && pString2.contains("(MKV)")) {
                    btUrlMap.put("1", new Html(pString).xpath("//a/@href").toString().trim());
                } else if (pString.contains("720p") && pString.contains("(MKV)")
                        || pString2.contains("720p") && pString2.contains("(MKV)")) {
                    btUrlMap.put("2", new Html(pString).xpath("//a/@href").toString().trim());
                } else if (pString.contains("1080p") || pString2.contains("1080p")) {
                    btUrlMap.put("3", new Html(pString).xpath("//a/@href").toString().trim());
                } else if (pString.contains("720p") || pString2.contains("720p")) {
                    btUrlMap.put("4", new Html(pString).xpath("//a/@href").toString().trim());
                }
            }
        }
        page.putField("btUrlMap", btUrlMap);

        //网站名称
        page.putField("websiteName", getWebsiteName());
    }

    @Override
    public void run() {
        String parseWebUrl=getParseWebUrl();

        if (parseWebUrl != "" && parseWebUrl != null) {
            Spider.create(this)
            .addUrl(parseWebUrl)
            .setDownloader(new HttpClientDownloader_RepairTlsHttps())
            .addPipeline(thefilmestorrentsPipeline)
            .thread(getThreadNum())
            .run();
        }
    }

}
