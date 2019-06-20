package com.cloud.vod.utils.Process;

import lombok.extern.slf4j.Slf4j;


import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;


@Slf4j
public class FfprobeProcessStream extends Thread {
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
            log.error("", e);
        }
    }

    public void destroy() {
        threadStatus = false;
    }

    public String getOutputInfo() {
        return OutputInfo.toString();
    }

}
