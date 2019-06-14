package com.cloud.vod.utils;


import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.io.IOException;
import java.util.*;

/**
 * 去imdb网站爬取影片信息
 */
public class ImdbUtils {

    private static Logger logger = LoggerFactory.getLogger(ImdbUtils.class);

    public final static PropertyConfigUtil PCONFIGUTIL = PropertyConfigUtil.getInstance("Configs.properties");

    public final static String USERAGENT = PCONFIGUTIL.getValue("userAgent");

    public static Map<String, String> getInformation(String name) {
        try {
            String url = "https://www.imdb.com";
            Map<String, String> headMap = new HashMap<String, String>();
            Map<String, String> from = new HashMap<String, String>();
            headMap.put("accept", "text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3");
            headMap.put("accept-language", "zh-CN,zh;q=0.9,en;q=0.8");
            headMap.put("accept-encoding", "gzip, deflate, br");
            headMap.put("upgrade-insecure-requests", "1");
            headMap.put("User-Agent", USERAGENT);
            from.put("q", name);
            from.put("ref", "nv_sr_fn");
            from.put("s", "all");
            // 创建httpClient实例
            String httpRequest = HttpRequest.post(url + "/find", from, true).headers(headMap).body();
            String table = httpRequest.substring(httpRequest.indexOf("<table"), httpRequest.indexOf("</table"));
            ArrayList<String> typeUrlList = new ArrayList(Arrays.asList(table.split("<tr")));

            Iterator<String> iterator = typeUrlList.iterator();
            while (iterator.hasNext()) {
                String item = iterator.next();
                if (item.contains("Episode") || item.contains("series") || item.contains("table")) {
                    iterator.remove();
                }
            }
            String batUrl = "";
            for (String str : typeUrlList) {
                batUrl = str.substring(str.indexOf("<a href=\"") + 9, str.indexOf("><img"));
                batUrl = batUrl.replace("\"", "").trim();
                break;
            }

            Document doc = Jsoup.connect(url + batUrl).get();
            Element elementById = doc.getElementById("title-overview-widget");
            Map<String, String> Information = new HashMap<>();
            //封面
            Information.put("img",elementById.select("img[src]").attr("src"));
            //类型
            String[] typeAll = elementById.select(".subtext").text().split("\\|");
            String type = "";
            for (String s : typeAll) {
                if (s.contains(",")) {
                    type = s;
                    break;
                }
            }
           //查数据库Category的name，和typeAll循环比对，找出单个影片类型
            Information.put("type",type);
            //上映时间
            String titleData = elementById.select("a[title]").text();
            String ReleasedData = titleData.substring(0, titleData.indexOf("(") - 1);
            String year = ReleasedData.substring(ReleasedData.length() - 4);
            String day = ReleasedData.substring(0,2).trim();
            ReleasedData = getMonth(ReleasedData, year, day);
            Information.put("year",ReleasedData);
            //简介
            Information.put("introduce",doc.getElementsByClass("summary_text").text());
            //导演
            String Directors = elementById.select(".credit_summary_item:contains(Director)").text();
            Information.put("director",Directors.substring(Directors.indexOf(":") + 1));
            //主演
            String Stars = elementById.select(".credit_summary_item:contains(Stars)").text();
            Information.put("actors",Stars.substring(Stars.indexOf(":") + 1, Stars.lastIndexOf("|")));
            //国家
            Element Countrys = doc.getElementById("titleDetails");
            String country = Countrys.select(".txt-block:contains(Country)").text();
            String replace = country.substring(country.indexOf(":") + 1).replaceAll("\\|", ",");
            Information.put("country",replace);
            return Information;
        } catch (IOException e) {
            logger.error("ImdbUtils---error", e);
        }
        return null;
    }

    /**
     * 判断月份 笨方法
     * @param data
     * @param year
     * @param day
     * @return
     */
    public static String getMonth(String data, String year, String day) {
        if (data.contains("Jan")) {
            data = year + "-" + "01" + "-" + day;
        }
        if (data.contains("Feb")) {
            data = year + "-" + "02" + "-" + day;
        }
        if (data.contains("Mar")) {
            data = year + "-" + "03" + "-" + day;
        }
        if (data.contains("Apr")) {
            data = year + "-" + "04" + "-" + day;
        }
        if (data.contains("May")) {
            data = year + "-" + "05" + "-" + day;
        }
        if (data.contains("Jun")) {
            data = year + "-" + "06" + "-" + day;
        }
        if (data.contains("Jul")) {
            data = year + "-" + "07" + "-" + day;
        }
        if (data.contains("Aug")) {
            data = year + "-" + "08" + "-" + day;
        }
        if (data.contains("Sep")) {
            data = year + "-" + "09" + "-" + day;
        }
        if (data.contains("Oct")) {
            data = year + "-" + "10" + "-" + day;
        }
        if (data.contains("Nov")) {
            data = year + "-" + "11" + "-" + day;
        }
        if (data.contains("Dec")) {
            data = year + "-" + "12" + "-" + day;
        }
        return data;
    }
}
