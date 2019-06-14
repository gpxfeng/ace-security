package com.cloud.vod.pipeline;


import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.alibaba.fastjson.JSONPath;
import com.cloud.vod.entity.Category;
import com.cloud.vod.entity.Dramainfo;
import com.cloud.vod.entity.Dramaregion;
import com.cloud.vod.entity.Videoinfo;
import com.cloud.vod.mapper.CategoryMapper;
import com.cloud.vod.mapper.DramainfoMapper;
import com.cloud.vod.mapper.DramaregionMapper;
import com.cloud.vod.mapper.VideoinfoMapper;
import com.cloud.vod.utils.FfmpegUtil;
import com.cloud.vod.utils.MyFileUtil;
import com.cloud.vod.utils.Process.BtProcessStream;
import com.cloud.vod.utils.Process.ProcessUtil;
import com.cloud.vod.utils.PropertyConfigUtil;
import com.cloud.vod.utils.SslUtils;
import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import us.codecraft.webmagic.ResultItems;
import us.codecraft.webmagic.Task;
import us.codecraft.webmagic.pipeline.Pipeline;

import java.io.File;
import java.io.InputStream;
import java.io.RandomAccessFile;
import java.net.HttpURLConnection;
import java.net.URL;
import java.text.SimpleDateFormat;
import java.util.*;

/**
 * Copyright: Copyright (c) 2019 LanRu-Caifu
 *
 * @ClassName: PipelineBase.java
 * @Description: 该类的功能描述
 *
 * @version: v1.0.0
 * @author: yuxianfeng
 * @date: 2019年2月27日 下午2:19:22
 *
 *        Modification History: Date Author Version Description
 *        ---------------------------------------------------------* 2019年2月27日
 *        Administrator v1.0.0 修改原因
 */
@Component
public class PipelineBase implements Pipeline {
    public static Logger logger = LoggerFactory.getLogger(PipelineBase.class);

    public final static PropertyConfigUtil PCONFIGUTIL = PropertyConfigUtil.getInstance("Configs.properties");

    public final static String USERAGENT = PCONFIGUTIL.getValue("userAgent");

    public final static String FIREFOXDRIVERPATH = PCONFIGUTIL.getValue("firefoxDriverPath");

    public final static String CHROMEDRIVERPATH = PCONFIGUTIL.getValue("chromeDriverPath");

    public final static String VOD_VIDEOSAVEPATH = PCONFIGUTIL.getValue("vod_videoSavePath");

    public final static String VOD_IMGSAVEPATH = PCONFIGUTIL.getValue("vod_imgSavePath");

    public final static String VOD_SUBTITLESAVEPATH = PCONFIGUTIL.getValue("vod_subtitleSavePath");

    public final static String VOD_BTTEMPORARYSAVEPATH = PCONFIGUTIL.getValue("vod_btTemporarySavePath");

    public final static String SERIES_VIDEOSAVEPATH = PCONFIGUTIL.getValue("series_videoSavePath");

    public final static String SERIES_IMGSAVEPATH = PCONFIGUTIL.getValue("series_imgSavePath");

    public final static String ANIME_VIDEOSAVEPATH = PCONFIGUTIL.getValue("anime_videoSavePath");

    public final static String ANIME_IMGSAVEPATH = PCONFIGUTIL.getValue("anime_imgSavePath");

    public final static String VIDEOCOMPETENCE = PCONFIGUTIL.getValue("videoCompetence");

    public final static String IMGCOMPETENCE = PCONFIGUTIL.getValue("imgCompetence");

    public final static String SEPARATOR = File.separator;

    @Autowired
    public CategoryMapper categoryDao;

    @Autowired
    public DramainfoMapper dramainfoDao;

    @Autowired
    public VideoinfoMapper videoinfoDao;

    @Autowired
    public DramaregionMapper dramaregionDao;

    @Override
    public void process(ResultItems resultItems, Task task) {

    }

    /**
     * @Function: PipelineBase.java
     * @Description: 下载网络文件
     *
     * @param:
     * @return：boolean
     * @throws：异常描述
     *
     * @version: v1.0.0
     * @author: yuxianfeng
     * @date: 2019年2月27日 下午5:06:13
     */
    public boolean downloadFile(String filePath, String fileUrl) {
        boolean downloadResult = false;

        File file = new File(filePath);
        try {
            // 创建文件
            if (!file.getParentFile().exists()) {
                file.mkdirs(); // 目录不存在的情况下，创建目录。
            }
            if (file.exists()) {
                file.delete(); // 文件存在时删除并重新创建
                file.createNewFile();
            } else {
                file.createNewFile();
            }

            // 下载
            URL url = new URL(fileUrl);

            if ("https".equalsIgnoreCase(url.getProtocol())) {
                SslUtils.ignoreSsl(); // 跳过HTTPS安全证书验证
            }

            HttpURLConnection conn = (HttpURLConnection) url.openConnection();
            conn.setReadTimeout(60000);
            conn.setConnectTimeout(60000);
            conn.setRequestMethod("GET");
            conn.setRequestProperty("User-Agent", USERAGENT);

            if (conn.getResponseCode() == 200) {
                long fileSize = conn.getContentLength();
                logger.info("下载地址：" + fileUrl + "，文件大小：" + MyFileUtil.formetFileSize(fileSize));
                InputStream inputStream = conn.getInputStream();
                RandomAccessFile out = new RandomAccessFile(file, "rw");
                int len = 0;
                byte[] buffer = new byte[1024];
                while (inputStream != null && (len = inputStream.read(buffer)) >= 0) {
                    out.write(buffer, 0, len);
                }

                inputStream.close();
                out.close();
            } else {
                logger.info("下载地址：" + fileUrl + "，状态码：" + conn.getResponseCode() + "，下载失败");
            }

        } catch (Exception e) {
            logger.error("下载出现异常，地址：" + fileUrl);
        }

        if (file.exists()) {
            if (file.length() > 1024) {      // 1kb
                downloadResult = true;
            } else {
                file.delete();
            }
        }

        return downloadResult;
    }


    /**
     * @Function: PipelineBase.java
     * @Description: 使用transmission-cli下载bt,注意filePath为/home/data/vod/video/影片名称/，下载失败则删除此文件
     *
     * @param:
     * @return：boolean
     * @throws：异常描述
     *
     * @version: v1.0.0
     * @author: yuxianfeng
     * @date: 2019年3月5日 上午11:26:04
     */
    public boolean btDownload(String filePath, String magneticLink) {
        boolean result = false;
        try {
            //创建不同平台命令
            String cmd = null;
            String osName = System.getProperties().getProperty("os.name");
            if (osName.startsWith("Linux")) {
                cmd = "transmission-cli -w " + filePath + " " + magneticLink;
            } else {
                logger.info("not support OS");
                return false;
            }

            //java调用命令行
            Process btProcess = Runtime.getRuntime().exec(cmd);
            List<Long> pids = ProcessUtil.getProcessPid(btProcess);
            logger.info("btDownload---cmd=" + cmd);
            BtProcessStream errorProcessStream = new BtProcessStream(btProcess.getErrorStream(), "Error", pids);
            BtProcessStream inputProcessStream = new BtProcessStream(btProcess.getInputStream(), "Info", pids);

            errorProcessStream.start();
            inputProcessStream.start();
            btProcess.waitFor();

            if (errorProcessStream.getBtDownloadResult() || inputProcessStream.getBtDownloadResult()) {
                result = true;
            } else {
                File file = new File(filePath);
                MyFileUtil.deleteDir(file);
            }

            // 关闭两个线程
            errorProcessStream.destroy();
            inputProcessStream.destroy();
            // 关闭命令主进程
            btProcess.destroy();

        } catch (Exception e) {
            logger.error("btDownload---error", e);
        }

        return result;
    }

    /**
     * @Function: PipelineBase.java
     * @Description: bt多余文件删除, 返回视频，字幕路径Map
     *               filePath为/home/data/vod/btTemporarySave/影片名称/
     *
     * @param:
     * @return：boolean
     * @throws：异常描述
     *
     * @version: v1.0.0
     * @author: yuxianfeng
     * @date: 2019年3月5日 上午11:39:31
     */
    public Map<String, String> btExtraFileDeletion(String filePath) {
        logger.info("bt多余文件删除处理，文件路径=" + filePath);
        Map<String, String> map = new HashMap<>();
        String videoPath = "";
        String subtitlePath = "";
        try {

            //移动视频，字幕文件。删除多余文件
            File dirFile = new File(filePath);        //  /home/data/vod/btTemporarySave/filmName/
            String filmName = dirFile.getName();
            if (dirFile.exists()) {
                File[] btDirFiles = dirFile.listFiles();      //  /home/data/vod/btTemporarySave/filmName/[btDir]
                for (File btDir : btDirFiles) {

                    //下载路径下，下载结果为文件夹
                    if (btDir.isDirectory()) {

                        File[] btFiles = btDir.listFiles();
                        for (File btFile : btFiles) {       //  /home/data/vod/btTemporarySave/filmName/[btDir]/bt.mkv
                            String btFileName = btFile.getName();
                            long btFileLength = btFile.length();
                            if (btFileName.endsWith(".srt") && btFileLength > (10 * 1024)) {
                                subtitlePath = VOD_SUBTITLESAVEPATH + SEPARATOR + filmName + ".srt";
                                btFile.renameTo(new File(subtitlePath));
                            }
                            if (btFileLength > (100 * 1048576)) {      //100Mb
                                String suffix = btFileName.substring(btFileName.lastIndexOf("."), btFileName.length());
                                videoPath = VOD_VIDEOSAVEPATH + SEPARATOR + filmName + suffix;
                                btFile.renameTo(new File(videoPath));
                            }
                        }

                    } else {        //下载路径下，下载结果为文件
                        String btFileName = btDir.getName();
                        long btFileLength = btDir.length();
                        if (btFileLength > (100 * 1048576)) {      //100Mb
                            String suffix = btFileName.substring(btFileName.lastIndexOf("."), btFileName.length());
                            videoPath = VOD_VIDEOSAVEPATH + SEPARATOR + filmName + suffix;
                            btDir.renameTo(new File(videoPath));
                        }

                    }

                }
                MyFileUtil.deleteDir(dirFile);
            }

        } catch (Exception e) {
            logger.error("btFileProcess", e);
        }

        map.put("videoPath", videoPath);
        map.put("subtitlePath", subtitlePath);
        return map;
    }

    /**
     * @Function: PipelineBase.java
     * @Description: bt视频文件处理, 更改格式，码率，双音轨，添加字幕
     *               返回<语言：视频路径>的map
     *
     * @param:
     * @return：Map<String,String>
     * @throws：异常描述
     *
     * @version: v1.0.0
     * @author: yuxianfeng
     * @date: 2019年3月9日 下午5:31:23
     */
    public Map<String, String> btFileProcess(String videoPath, String subtitlePath) {
        Map<String, String> dualAudioFilePathMap = new HashMap<>();

        //文件改动成功，进入下一步，获取视频元信息（json）
        String videoInfoStr = FfmpegUtil.getVideoMetadata(videoPath);

        JSONObject videoInfoJson = JSONObject.parseObject(videoInfoStr);
        JSONArray streamArr = (JSONArray) JSONPath.eval(videoInfoJson, "$.streams");  //视频流信息

        Map<String, JSONArray> streamMap = new HashMap<>();
        for (Object object : streamArr) {

            //获取id,类型，语言
            JSONObject stream = JSONObject.parseObject(object.toString());
            String streamIndex = JSONPath.eval(stream, "$.index").toString();
            String streamType = JSONPath.eval(stream, "$.codec_type").toString();
            boolean languageStatus = JSONPath.contains(stream, "$.tags.language");

            //将结果封装到json中
            JSONArray jsonArray = new JSONArray();
            JSONObject object2 = new JSONObject();
            object2.put("index", streamIndex);
            if (languageStatus) {
                String language = JSONPath.eval(stream, "$.tags.language").toString();
                object2.put("language", language);
            }

            //将不同流的结果保存在map中（一部影片可以有多个视频流，音频流，字幕流...,因此保存在jsonArray中）
            if (streamMap.containsKey(streamType)) {
                JSONArray jsonArray2 = streamMap.get(streamType);
                jsonArray2.add(object2);
                jsonArray = jsonArray2;
            } else {
                jsonArray.add(object2);
            }
            streamMap.put(streamType, jsonArray);
        }

        //视频是否需要转换编码格式(转换为mkv格式)
        boolean videoTranscodingStatus = !videoPath.endsWith(".mkv");
        if (videoTranscodingStatus) {
            String outFilePath = videoPath.substring(0, videoPath.lastIndexOf(".")) + ".mkv";
            boolean vtResult = FfmpegUtil.videoTranscoding(videoPath, outFilePath);
            if (vtResult) {
                videoPath = outFilePath;
            }
        }

        //视频是否需要改变码率(大于3000kbit/s，则改变为2000kbit/s,25帧)
        String bitRateStr = (String) JSONPath.eval(videoInfoJson, "$.format.bit_rate");
        Integer bitRate = Integer.parseInt(bitRateStr) / 1000;   //码率 kbit/s（一千位每秒）
        if (bitRate > 3000) {
            String outFilePath = videoPath.replaceAll(".mkv", "_changeBitRate.mkv");
            boolean changeBitRateResult = FfmpegUtil.changeBitRate(videoPath, outFilePath);
            if (changeBitRateResult) {
                videoPath = outFilePath;
            }
        }

        //视频是否是双音频，若有字幕文件则添加
        if (streamMap.get("audio").size() > 1) {
            JSONArray video = streamMap.get("video");
            JSONArray audio = streamMap.get("audio");
            String videoIndex = (String) JSONPath.eval(video, "$[0].index");
            for (int i = 0; i < audio.size(); i++) {
                String audioIndex = (String) JSONPath.eval(audio, "$[" + i + "].index");
                String audioLanguage = (String) JSONPath.eval(audio, "$[" + i + "].language");
                String outFilePath = videoPath.replaceAll(".mkv", "_" + audioLanguage + ".mkv");
                boolean dualAudioResult = FfmpegUtil.dualAudioSeparation(videoPath, outFilePath, subtitlePath, videoIndex, audioIndex);
                if (dualAudioResult) {
                    dualAudioFilePathMap.put(audioLanguage, outFilePath);
                }
            }
        }

        if (dualAudioFilePathMap.size() > 1) {
            File file = new File(videoPath);
            file.delete();
        } else {
            String audioLanguage = (String) JSONPath.eval(streamMap.get("audio"), "$[0].language");
            dualAudioFilePathMap.put(audioLanguage, videoPath);
        }

        return dualAudioFilePathMap;

    }

    /**
     * @Function: PipelineBase.java
     * @Description: 获取Category的id, 不存在则创建
     *
     * @param:
     * @return：List<Integer>
     * @throws：异常描述
     *
     * @version: v1.0.0
     * @author: yuxianfeng
     * @date: 2019年3月11日 下午8:39:58
     */
    public List<Integer> getCategoryIdList(Integer type, List<String> categoryNameList) {
        List<Integer> categoryIdList = new ArrayList<>();
        for (String categoryName : categoryNameList) {
            categoryName = categoryName.trim();
            Map<String, Object> categoryParame = new HashMap<>();
            categoryParame.put("type", type);
            categoryParame.put("name", categoryName);
            Category category = null;
            category = categoryDao.findCategoryByTypeAndName(categoryParame);

            if (category != null) {
                categoryIdList.add(category.getId());
            } else {
                int maxSequence = categoryDao.findMaxSequenceByType(type);
                String date = (new SimpleDateFormat("yyyy-MM-dd HH:mm:ss"))
                        .format(new Date());
                category = new Category();
                category.setName(categoryName);
                category.setCreatetime(date);
                category.setUpdatetime(date);
                category.setFilepath("/home/data/vod/video/");
                category.setImgpath("/home/data/vod/image/");
                category.setSubtitlepath("/home/data/vod/subtitle/");
                category.setEnable(1);
                category.setType(type);
                category.setSequence(maxSequence + 1);
                categoryDao.addCategory(category);

                logger.info("type=" + type + ",创建类型标签：" + categoryName);
                categoryIdList.add(category.getId());
            }
        }

        return categoryIdList;
    }

    /**
     * @Function: PipelineBase.java
     * @Description: 影片发布（原力，数据库）
     *
     * @param:
     * @return：boolean
     * @throws：异常描述
     *
     * @version: v1.0.0
     * @author: yuxianfeng
     * @date: 2019年3月9日 下午6:03:44
     */
    public void release(Dramainfo dramainfo, List<Videoinfo> videoinfos) {
        try {
            String name = dramainfo.getName();
            Dramainfo dbDramainfo = dramainfoDao.findDramainfoPresence(dramainfo);

            if (dbDramainfo == null) {

                int result = dramainfoDao.addDramainfo(dramainfo);

                if (result == 1) {

                    logger.info(name + "添加Dramainfo成功。");
                    dbDramainfo = dramainfo;
                    int dramainfoId = dbDramainfo.getId();

                    if (dramainfoId != 0) {

                        for (Videoinfo videoinfo : videoinfos) {
                            // 原力发布
//                            ForceVideo forceVideo = ForceUtil.saveForceVodVideo(videoinfo.getName(), videoinfo.getType(), videoinfo.getFilepath());
//                            videoinfo.setP2purl(forceVideo.getP2pUrl());
//                            videoinfo.setDramaid(dramainfoId);
//                            logger.info(name + "原力p2p地址：" + forceVideo.getP2pUrl());

                            int vResult = videoinfoDao.addVideoinfo(videoinfo);
                            if (vResult == 1) {
                                logger.info(name + "_" + videoinfo.getLanguage() + ",添加Videoinfo成功。");

                                //修改文件夹权限
//                                FfmpegUtil.chmodChange(IMGCOMPETENCE, VOD_IMGSAVEPATH);
//                                FfmpegUtil.chmodChange(VIDEOCOMPETENCE, VOD_VIDEOSAVEPATH);
                            } else {
                                logger.info(name + "_" + videoinfo.getLanguage() + ",添加Videoinfo失败。");
                            }
                        }

                    } else {
                        logger.info(name + "Dramainfo ID为0");
                    }

                } else {
                    logger.info(name + "添加Dramainfo失败。");
                }
            } else {
                logger.info(name + "Dramainfo已存在。");
            }


        } catch (Exception e) {
            logger.error("Exception", e);
        }
    }


    /**
     * @Function: PipelineBase.java
     * @Description: 去除影片信息参数中的特殊字符
     *
     * @param:
     * @return：String
     * @throws：异常描述
     *
     * @version: v1.0.0
     * @author: yuxianfeng
     * @date: 2019年2月27日 下午4:34:28
     */
    public String formatParame(String parame) {
        if (StringUtils.isEmpty(parame) || StringUtils.isBlank(parame)) {
            return "";
        }
        if (parame.contains("&nbsp;")) {
            parame = parame.replace("&nbsp;", "");
        }
        if (parame.contains("N/A")) {
            parame = parame.replace("N/A", "");
        }
        if (parame.contains("&")) {
            parame = parame.replace("&", "");
        }
        if (parame.contains("'")) {
            parame = parame.replace("'", "");
        }

        return parame.trim();
    }

    /**
     * 判断视频语言
     * @param videoPath
     *  @author: dengshifeng
     * @return
     */
    public static Boolean languageStatus(String videoPath) {
        String videoInfoStr = FfmpegUtil.getVideoMetadata(videoPath);
        //文件改动成功，进入下一步，获取视频元信息
        JSONObject videoInfoJson = JSONObject.parseObject(videoInfoStr);
        JSONArray streamArr = (JSONArray) JSONPath.eval(videoInfoJson, "$.streams");  //视频流信息
        for (Object object : streamArr) {
            //获取语言
            JSONObject stream = JSONObject.parseObject(object.toString());
            String type = JSONPath.eval(stream, "$.codec_type").toString();
            if (type.equals("audio")) {
                try {
                    String language = JSONPath.eval(stream, "$.tags.language").toString();
                    //多音频流中有葡语
                    if (language.equals("por")) {
                        return true;
                    }
                } catch (Exception e) {
                    logger.error("音频查看异常");
                }
            }

        }
        return false;
    }

    /**
     * 根据name查询数据库国家id
     * @author: dengshifeng
     * @param countryArr
     * @return
     */
    public List<Integer> getRegionIdList(List<String> countryArr) {
        List<Integer> regionIdList = new ArrayList<>();
        Integer id = 0;
        for (String contryStr : countryArr) {
            id = dramaregionDao.findRegionIdListByName(contryStr.trim());
            if (id != 0) {
                regionIdList.add(id);
            } else {
                Dramaregion dramaregion = new Dramaregion();
                dramaregion.setName(contryStr.trim());
                int i = dramaregionDao.addRegionByName(dramaregion);
                if (i == 1) {
                    id = dramaregionDao.findRegionIdListByName(contryStr.trim());
                    regionIdList.add(id);
                }
            }
        }
        return regionIdList;
    }

    /**
     * 判断有没有字幕
     * @param subtista
     * @param filePath
     * @return
     */
    public Boolean getasubtista(Boolean subtista, String filePath) {
        String videoInfoStr = FfmpegUtil.getVideoMetadata(filePath);
        //文件改动成功，进入下一步，获取视频元信息
        JSONObject videoInfoJson = JSONObject.parseObject(videoInfoStr);
        JSONArray streamArr = (JSONArray) JSONPath.eval(videoInfoJson, "$.streams");  //视频流信息
        try {
            for (Object object : streamArr) {
                //获取语言
                JSONObject stream = JSONObject.parseObject(object.toString());
                String typesub = JSONPath.eval(stream, "$.codec_type").toString();
                if (typesub.contains("subtitle")) {
                    //有字幕
                    subtista = true;
                }
            }
        } catch (Exception e) {
            return subtista;
        }
        return subtista;
    }

}
