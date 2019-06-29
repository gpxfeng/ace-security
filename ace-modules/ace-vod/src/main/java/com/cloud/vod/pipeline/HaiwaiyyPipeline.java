package com.cloud.vod.pipeline;


import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.alibaba.fastjson.JSONPath;
import com.cloud.vod.entity.Dramainfo;
import com.cloud.vod.entity.Videoinfo;
import com.cloud.vod.utils.FfmpegUtil;
import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;
import us.codecraft.webmagic.ResultItems;
import us.codecraft.webmagic.Task;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.*;

@Component
public class HaiwaiyyPipeline extends PipelineBase {
    private static Logger logger = LoggerFactory.getLogger(HaiwaiyyPipeline.class);

    @Override
    public void process(ResultItems resultItems, Task task) {
        try {
            //从爬虫结果中获取信息
            String websiteName = resultItems.get("websiteName");          //网站名称
            String movieName = resultItems.get("movieName");              //影片名称
            String introduce = resultItems.get("introduce");              //简介
            String imgUrl = resultItems.get("img");                       //封面地址
            String year = resultItems.get("year");                        //年份
            String type = resultItems.get("type");                        //类型
            int vidType = resultItems.get("vidType");                     //视频类型 1电影，2连续剧，3成人，4动漫，5回看
            String actors = resultItems.get("actors");                    //主演
            String director = resultItems.get("director");                //导演
            String country = resultItems.get("country");                  //发布国家
            String language = resultItems.get("language");                //语言
            Map<String, String> downloadMap = resultItems.get("downloadMap");   //视频地址

            //查询数据库中是否此影片
            Map<String, Object> map = new HashMap<String, Object>();
            map.put("name", movieName);
            map.put("type", vidType);
            Dramainfo  drama = dramainfoDao.findDramainfoByName(map);
            // 判断数据库是否存在
            if (drama == null) {
                //格式化影片名称
                String folderName="";
                if (movieName != null && !movieName.equals("")) {
                    folderName = movieName.replaceAll("[^\\u4e00-\\u9fa5_a-zA-Z0-9]", "");
                    folderName = folderName.replace("[^\\u4e00-\\u9fa5_a-zA-Z0-9]", "");
                }
                if (StringUtils.isEmpty(folderName)) {
                    folderName = new Date().getTime() + "";
                }


                //下载封面
                String imgFilePath = "";
                if (vidType == 1) {
                    imgFilePath = VOD_IMGSAVEPATH + folderName + ".jpg";
                } else if (vidType == 2) {
                    imgFilePath = SERIES_IMGSAVEPATH +  folderName + ".jpg";
                } else if (vidType == 4) {
                    imgFilePath = ANIME_IMGSAVEPATH +  folderName + ".jpg";
                }

                boolean downloadImg = downloadFile(imgFilePath, imgUrl);
                if (downloadImg) {
                    logger.info(movieName + "封面下载成功");
                } else {
                    logger.info(movieName + "封面下载失败");
                    imgFilePath = imgUrl;
                }
                logger.info("封面路径" + imgFilePath);

                //下载视频
                String filePath = "";
                boolean DownloadResult = false;
                int size = downloadMap.size();
                if (size <= 3) {
                    if (vidType == 1) {
                        filePath = VOD_VIDEOSAVEPATH +  folderName + ".mkv";
                    } else if (vidType == 4) {
                        filePath = ANIME_VIDEOSAVEPATH +  folderName + ".mkv";
                    }
                    //电影发布
                    MoviePublish(websiteName, movieName, introduce, year, vidType, actors, director, language, downloadMap, imgFilePath, downloadImg, filePath, DownloadResult, type, country);
                } else {
                    //获取当前时间,影片时长
                    String date = (new SimpleDateFormat("yyyy-MM-dd HH:mm:ss")).format(new Date());
                    int sec=0;

                    //获取类型type的id
                    String[] typeArr = type.split(",");
                    ArrayList<String> typeNameList = new ArrayList<String>(Arrays.asList(typeArr));
                    List<Integer> typeIdList = getCategoryIdList(1, typeNameList);

                    //获取国家的id
                    ArrayList<String> countryArr = new ArrayList<String>(Arrays.asList(country.split(",")));
                    List<Integer> countryList = getRegionIdList(countryArr);

                    //创建数据对象,下载视频,添加对象到集合,并发布
                    List<Videoinfo> videoinfos = new ArrayList<>();
                    for (Map.Entry<String, String> downMap : downloadMap.entrySet()) {
                        if (vidType == 2) {
                            filePath = SERIES_VIDEOSAVEPATH +  folderName + downMap.getKey() + ".mkv";
                        } else if (vidType == 4) {
                            filePath = ANIME_VIDEOSAVEPATH +  folderName + downMap.getKey() + ".mkv";
                        }
                        DownloadResult = FfmpegUtil.videoTranscoding(downMap.getValue(), filePath);
                        if (DownloadResult) {
                            //影片时长
                            sec = FfmpegUtil.getVideoTime(filePath);

                            //判断视频语言    中文的判断语言,类型,国家id
                            if (StringUtils.isEmpty(language)) {
                                language = GetVideoLanguage(language);
                            }

                            //创建videoinfo对象
                            Videoinfo videoinfo = new Videoinfo();
                            videoinfo.setName(movieName);
                            videoinfo.setImageurl(imgFilePath);
                            videoinfo.setFilepath(filePath);
                            videoinfo.setPageurl(websiteName);
                            videoinfo.setEnable(1);
                            videoinfo.setCreatetime(date);
                            videoinfo.setUpdatetime(date);
                            videoinfo.setCateid(typeIdList.get(0));//国家id
                            videoinfo.setType(vidType);

                            String num = downMap.getKey().replaceAll("[^0-9]", "").trim();//集数
                            videoinfo.setNum(Integer.parseInt(num));
                            videoinfo.setTemp(1);//季度有中文二和数字2 不好做判断
                            videoinfo.setLanguage(language);
                            videoinfo.setQuality("720p");
                            videoinfos.add(videoinfo);
                        }
                    }
                    //创建Dramainfo对象
                    Dramainfo dramainfo = new Dramainfo();
                    dramainfo.setName(movieName);
                    dramainfo.setFilepath(filePath);
                    dramainfo.setEnable(1);
                    dramainfo.setImageurl(imgFilePath);
                    String typeId = typeIdList.toString().replace("[", "").replace("]", "").replace(" ", "");
                    dramainfo.setCateid(typeId); //类型
                    dramainfo.setRegionid(StringUtils.join(countryList.toArray(), ","));//国家id
                    dramainfo.setActors(actors);
                    dramainfo.setDescription(introduce);
                    dramainfo.setDirector(director);
                    dramainfo.setCreatetime(date);
                    dramainfo.setUpdatetime(date);
                    dramainfo.setType(vidType);
                    dramainfo.setDuration((sec / 60) + " Minutos");
                    dramainfo.setRdate(year);
                    //数据发布
                    logger.info(movieName + "开始数据发布");
                    release(dramainfo, videoinfos);
                    logger.info(movieName + "发布成功");
                }
            } else {
                logger.info("数据库已存在");
            }
        } catch (Exception e) {
            logger.error("HaiwaiyyPipeline---error", e);
        }
    }

    /**
     * 电影发布
     *
     * @param websiteName
     * @param movieName
     * @param introduce
     * @param year
     * @param vidType
     * @param actors
     * @param director
     * @param language
     * @param downloadMap
     * @param imgFilePath
     * @param downloadImg
     * @param filePath
     * @param downloadResult
     */
    public void MoviePublish(String websiteName, String movieName, String introduce, String year, int vidType, String actors, String director, String language, Map<String, String> downloadMap, String imgFilePath, boolean downloadImg, String filePath, boolean downloadResult, String type, String country) {

        for (Map.Entry<String, String> downMap : downloadMap.entrySet()) {
            downloadResult = FfmpegUtil.videoTranscoding(downMap.getValue(), filePath);
            if (downloadResult) {
                break;
            }
        }
        if (downloadResult) {
            //获取当前时间，影片时长
            String date = (new SimpleDateFormat("yyyy-MM-dd HH:mm:ss")).format(new Date());
            int sec = FfmpegUtil.getVideoTime(filePath);

            //获取类型type的id
            String[] typeArr = type.split(",");
            ArrayList<String> typeNameList = new ArrayList<String>(Arrays.asList(typeArr));
            List<Integer> typeIdList = getCategoryIdList(1, typeNameList);

            //获取国家的id
            ArrayList<String> countryArr = new ArrayList<String>(Arrays.asList(country.split(",")));
            List<Integer> countryList = getRegionIdList(countryArr);

            //判断视频语言    中文的判断语言,类型,国家id
            if (StringUtils.isEmpty(language)) {
                language = GetVideoLanguage(language);
            }

            //创建数据对象，并发布
            List<Videoinfo> videoinfos = new ArrayList<>();
            //创建videoinfo对象
            Videoinfo videoinfo = new Videoinfo();
            videoinfo.setName(movieName);
            videoinfo.setImageurl(imgFilePath);
            videoinfo.setFilepath(filePath);
            videoinfo.setPageurl(websiteName);
            videoinfo.setEnable(1);
            videoinfo.setCreatetime(date);
            videoinfo.setUpdatetime(date);
            videoinfo.setCateid(typeIdList.get(0));//国家 country
            videoinfo.setType(1);
            videoinfo.setNum(1);
            videoinfo.setTemp(1);
            videoinfo.setLanguage(language);
            videoinfo.setQuality("720p");
            videoinfos.add(videoinfo);

            //创建Dramainfo对象
            Dramainfo dramainfo = new Dramainfo();
            dramainfo.setName(movieName);
            dramainfo.setFilepath(filePath);
            dramainfo.setEnable(1);
            dramainfo.setImageurl(imgFilePath);
            String typeId = typeIdList.toString().replace("[", "").replace("]", "").replace(" ", "");
            dramainfo.setCateid(typeId); //类型
            dramainfo.setRegionid(StringUtils.join(countryList.toArray(), ","));//国家id
            dramainfo.setActors(actors);
            dramainfo.setDescription(introduce);
            dramainfo.setDirector(director);
            dramainfo.setCreatetime(date);
            dramainfo.setUpdatetime(date);
            dramainfo.setType(vidType);
            dramainfo.setDuration((sec / 60) + " Minutos");
            dramainfo.setRdate(year);
            //数据发布            可能要重写逻辑
            logger.info(movieName + "开始数据发布");
            release(dramainfo, videoinfos);
            logger.info(movieName + "发布成功");
        } else {
            logger.info("视频下载失败，删除图片");
            if (downloadImg) {
                File imgFile = new File(imgFilePath);
                imgFile.delete();
            }
        }
    }

    /**
     * 获取视频语言
     * @param language
     * @return
     */
    public String GetVideoLanguage(String language) {
        String videoInfoStr = FfmpegUtil.getVideoMetadata("C:\\Users\\Administrator\\Desktop\\vod\\video\\1560423559845.mkv");
        //文件改动成功，进入下一步，获取视频元信息
        JSONObject videoInfoJson = JSONObject.parseObject(videoInfoStr);
        JSONArray streamArr = (JSONArray) JSONPath.eval(videoInfoJson, "$.streams");  //视频流信息
        for (Object object : streamArr) {
            //获取语言
            JSONObject stream = JSONObject.parseObject(object.toString());
            String codecType = JSONPath.eval(stream, "$.codec_type").toString();
            if (codecType.equals("audio")) {
                try {
                    language = JSONPath.eval(stream, "$.tags.language").toString();
                    //多音频流中有葡语
                    if (language.contains("chi")) {
                        language = "国语";
                    }else if (language.contains("und")) {
                        language = "德语";
                    } else {
                        language = "原音";
                    }
                } catch (Exception e) {
                    logger.error("音频查看异常");
                    language = "原音";
                }
            }
        }
        return language;
    }
}
