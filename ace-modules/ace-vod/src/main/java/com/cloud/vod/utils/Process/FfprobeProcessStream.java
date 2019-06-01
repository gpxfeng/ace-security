/**
 * Copyright © 2019 eSunny Info. Tech Ltd. All rights reserved.
 *
 * 功能描述：
 * @Package: com.VodWebCrawler.cms.util.Process
 * @author: yuxianfeng
 * @date: 2019年3月1日 下午7:18:26
 */

package com.cloud.vod.utils.Process;

import org.apache.log4j.Logger;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;


public class FfprobeProcessStream extends Thread {
    private Logger logger = Logger.getLogger(FfprobeProcessStream.class);
    // 控制线程状态
    volatile boolean threadStatus = true;
    volatile StringBuffer OutputInfo=new StringBuffer();
    BufferedReader br = null;
    String type = null;

    public FfprobeProcessStream(InputStream is, String type) {
        br = new BufferedReader(new InputStreamReader(is));
        this.type = type;
    }

    public void run() {
        String msg = null;
        try {
            while (threadStatus) {
                if (br == null) {
                    break;
                }
                if ((msg = br.readLine()) != null) {
                    OutputInfo.append(msg.trim());
                } else {
                    break;
                }
            }


        } catch (IOException e) {
            logger.error(e, e);
        }
    }

    public void destroy() {
        threadStatus = false;
    }

    public String getOutputInfo() {
        return OutputInfo.toString();
    }

}
