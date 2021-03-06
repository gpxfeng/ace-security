package com.cloud.vod.utils.Process;

import lombok.extern.slf4j.Slf4j;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;




import java.util.Date;


/**
* Copyright: Copyright (c) 2019 LanRu-Caifu
*
* @ClassName: ProcessStream.java
* @Description: 该类的功能描述
*
* @version: v1.0.0
* @author: yuxianfeng
* @date: 2019年3月1日 下午7:18:26
*/
@Slf4j
public class BtProcessStream extends Thread {
    // 控制线程状态
    volatile boolean threadStatus = true;
    volatile boolean btDownloadResult = false;
    BufferedReader br = null;
    String type = null;
    List<Long> pids;

    public BtProcessStream(InputStream is, String type, List<Long> pids) {
        br = new BufferedReader(new InputStreamReader(is));
        this.type = type;
        this.pids=pids;
    }

    public void run() {
        String msg = null;
        Integer progress=0;
        long nowTime,startTime = new Date().getTime();
        try {
            while (threadStatus) {
                if (br == null) {
                    break;
                }
                if ((msg = br.readLine()) != null) {
//                    logger.info(type+"---"+progress+"---"+msg);

                    Pattern r = Pattern.compile("Progress: ([0-9]+).");     //获取输出信息中的bt下载进度
                    Matcher m = r.matcher(msg);
                    if (m.find()) {
                        progress= Integer.valueOf(m.group(1));
                    }

                    if (msg.contains("State changed from \"Incomplete\" to \"Complete\"")) {       //bt下载完成
                        log.info(type+"---bt下载成功");
                        btDownloadResult=true;
                        ProcessUtil.stopProcess(pids);
                        break;
                    }

                    nowTime = new Date().getTime();
                    if (nowTime - startTime >= (3*60*1000)) {      //3分钟后检测bt是否下载
                        if (progress<1) {
                            log.info(type+"---bt下载超时");     //##下载中，35%,突然kill     ##有进程未关闭
                            ProcessUtil.stopProcess(pids);
                            break;
                        }
                    }
                } else {
                    break;
                }
            }


        } catch (IOException e) {
            log.error("io异常", e);
        }
    }

    public void destroy() {
        threadStatus = false;
        ProcessUtil.stopProcess(pids);
    }

    public boolean getBtDownloadResult() {
        return btDownloadResult;
    }

}
