package com.cloud.vod.pipeline;


import com.cloud.vod.entity.Dramainfo;
import com.cloud.vod.entity.Videoinfo;
import com.cloud.vod.utils.FfmpegUtil;
import com.cloud.vod.utils.force.VideoUtil;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;
import us.codecraft.webmagic.ResultItems;
import us.codecraft.webmagic.Task;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.*;

/**
* Copyright: Copyright (c) 2019 LanRu-Caifu
*
* @ClassName: ThefilmestorrentsPipeline.java
* @Description: Thefilmestorrents爬虫结果处理类
*
* @version: v1.0.0
* @author: yuxianfeng
* @date: 2019年2月23日 下午3:12:29
*/
@Component
public class ThefilmestorrentsPipeline extends PipelineBase{

    private static Logger logger = LoggerFactory.getLogger(ThefilmestorrentsPipeline.class);

    @Override
    public void process(ResultItems resultItems, Task task) {
        try {
            //从爬虫结果中获取信息
            String websiteName=resultItems.get("websiteName");          //网站名称
            String name=resultItems.get("Baixar");                      //影片名称
            String rdate=resultItems.get("Lançamento");                 //上映年份
            String categorys=resultItems.get("Gênero");                 //类型
            String description=resultItems.get("Sinopse");              //简介
            String imgUrl=resultItems.get("img");                       //封面网络地址
            Map<String, String> btUrlMap=resultItems.get("btUrlMap");   //磁力链接

            //查询数据库中是否此影片
            Map<String, Object> map = new HashMap<String, Object>();
            map.put("name", name);
            map.put("type", 1);
            Dramainfo drama = null;
            drama = dramainfoDao.findDramainfoByName(map);

            if (drama == null) { // 判断数据库是否存在

                //格式化影片名称
                String folderName = VideoUtil.getVideoFileName(name);

                //下载封面
                String suffix=imgUrl.substring(imgUrl.lastIndexOf("."),imgUrl.length());
                String imgFilePath = VOD_IMGSAVEPATH + SEPARATOR + folderName + suffix;
                boolean downloadImg = downloadFile(imgFilePath, imgUrl);
                if (downloadImg) {
                    logger.info(name + "封面下载成功");
                } else {
                    logger.info(name + "封面下载失败");
                    imgFilePath = imgUrl;
                }
                logger.info("封面路径" + imgFilePath);

                //下载视频和字幕
                String filePath=VOD_BTTEMPORARYSAVEPATH+SEPARATOR+folderName;
                logger.info("名称="+name+",bt路径="+filePath);
                boolean btDownloadResult=false;

                //按照map的Key排序
                Object[] key_arr = btUrlMap.keySet().toArray();
                Arrays.sort(key_arr);
                for  (Object key : key_arr) {
                    String value = btUrlMap.get(key);
                    btDownloadResult=btDownload(filePath, value);
                    if (btDownloadResult) {
                        break;
                    }
                }
                logger.info(name+"bt下载结果="+btDownloadResult);

                //视频下载成功
                if (btDownloadResult) {

                    //多余文件删除,返回视频，字幕路径Map
                    Map<String, String> btExtraMap=btExtraFileDeletion(filePath);
                    String subtitlePath=btExtraMap.get("subtitlePath");
                    String videoPath=btExtraMap.get("videoPath");

                    if (videoPath!="") {
                        logger.info("bt多余文件处理成功，videoPath="+videoPath+", subtitlePath="+subtitlePath);

                        //获取当前时间，影片时长
                        String date = (new SimpleDateFormat("yyyy-MM-dd HH:mm:ss")).format(new Date());
                        int sec = FfmpegUtil.getVideoTime(videoPath);

                        //获取Category的id
                        categorys=categorys.replaceAll("|", ",");
                        String[] categoryArr=categorys.split(",");
                        ArrayList<String> categoryNameList = new ArrayList<String>(Arrays.asList(categoryArr));
                        List<Integer> categoryIdList=getCategoryIdList(1,categoryNameList);

                        //视频文件处理,更改格式，码率，双音轨，添加字幕
                        logger.info("bt视频文件处理,更改格式，码率，双音轨，添加字幕，videoPath="+videoPath);
                        Map<String, String> dualAudioFilePathMap=btFileProcess(videoPath,subtitlePath);

                        //频道是否存在字幕文件，无字幕则不发布
                        boolean porLanguageStatus=false;
                        boolean subtitleStatus=false;
                        if (subtitlePath!=""&&subtitlePath!=null) {
                            subtitleStatus=true;
                        }
                        if (dualAudioFilePathMap.containsKey("por")) {
                            porLanguageStatus=true;
                        }

                        //创建数据对象，并发布
                        List<Videoinfo> videoinfos=new ArrayList<>();
                        for (Map.Entry<String, String> entry: dualAudioFilePathMap.entrySet()) {
                            String audioLanguage=entry.getKey();
                            String videoFilePath=entry.getValue();

                            if (audioLanguage.contains("por")) {    //葡萄牙语
                                audioLanguage="Dublado";            //配音
                            } else {
                                audioLanguage="Legendado";          //原音
                            }

                            //创建videoinfo对象
                            Videoinfo videoinfo = new Videoinfo();
                            videoinfo.setName(name);
                            videoinfo.setImageurl(imgFilePath);
                            videoinfo.setFilepath(videoFilePath);
                            videoinfo.setSubtitle(subtitlePath);
                            videoinfo.setPageurl(websiteName);
                            videoinfo.setEnable(subtitleStatus||audioLanguage.equals("Dublado")?1:0);
                            videoinfo.setCreatetime(date);
                            videoinfo.setUpdatetime(date);
                            videoinfo.setCateid(categoryIdList.get(0));
                            videoinfo.setType(1);
                            videoinfo.setNum(1);
                            videoinfo.setTemp(1);
                            videoinfo.setLanguage(audioLanguage);
                            videoinfo.setQuality("720p");

                            videoinfos.add(videoinfo);
                        }

                        //创建Dramainfo对象
                        Dramainfo dramainfo = new Dramainfo();
                        dramainfo.setName(name);
                        dramainfo.setEnable(porLanguageStatus||subtitleStatus?1:0);
                        dramainfo.setImageurl(imgFilePath);
                        String categoryId = categoryIdList.toString().replace("[", "").replace("]", "").replace(" ", "");
                        dramainfo.setCateid(categoryId);
                        dramainfo.setCreatetime(date);
                        dramainfo.setUpdatetime(date);
                        dramainfo.setType(1);
                        dramainfo.setFilepath(VOD_VIDEOSAVEPATH);
                        dramainfo.setDuration((sec / 60) + " Minutos");
                        dramainfo.setRdate(rdate);
                        dramainfo.setDescription(description);

                        //数据发布
                        logger.info(name+"开始数据发布");
                        release(dramainfo, videoinfos);
                    }

                }else {
                    //bt下载失败，删除图片
                    if (downloadImg) {
                        File imgFile=new File(imgFilePath);
                        imgFile.delete();
                    }

                }
            }else {
                logger.info(name + "数据库已存在，跳过");
            }

        } catch (Exception e) {
            logger.error("ThefilmestorrentsPipeline---error", e);
        }

    }

}
