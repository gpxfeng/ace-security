/**
 * Copyright © 2019 eSunny Info. Tech Ltd. All rights reserved.
 *
 * 功能描述：
 * @Package: com.VodWebCrawler.cms.util
 * @author: yuxianfeng
 * @date: 2019年2月28日 上午11:15:48
 */

package com.cloud.vod.utils.Process;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;
import java.util.stream.Stream;

/**
 * Copyright: Copyright (c) 2019 LanRu-Caifu
 *
 * @ClassName: ProcessUtil.java
 * @Description: 该类的功能描述
 *
 * @version: v1.0.0
 * @author: yuxianfeng
 * @date: 2019年2月28日 上午11:15:48
 */
public class ProcessUtil {
    public static Logger logger = LoggerFactory.getLogger(ProcessUtil.class);

    /**
     * @Function: ProcessUtil.java
     * @Description: 获取进程pid(JDK9)
     *
     * @param:
     * @return：long
     * @throws：异常描述
     *
     * @version: v1.0.0
     * @author: yuxianfeng
     * @date: 2019年2月28日 下午4:20:00
     */
    public static List<Long> getProcessPid(Process process) {
        List<Long> pids = new ArrayList<>();
        Stream<ProcessHandle> stream = process.descendants();
        List<ProcessHandle> list = stream.collect(Collectors.toList());
        for (ProcessHandle processHandle : list) {
            pids.add(processHandle.pid());
        }
        pids.add(process.pid());

        for (int i = 0; i < pids.size(); i++) {
            logger.info("pid[" + i + "]=" + pids.get(i));
        }
        return pids;
    }

    /**
     * @Function: ProcessUtil.java
     * @Description: 终止进程
     *
     * @param:
     * @return：void
     * @throws：异常描述
     *
     * @version: v1.0.0
     * @author: yuxianfeng
     * @date: 2019年2月28日 下午4:30:40
     */
    public static void stopProcess(List<Long> pids) {
        String osName = System.getProperties().getProperty("os.name");
        for (Long pid : pids) {
            String cmd = "";
            if (osName.startsWith("Windows")) {
                cmd = "taskkill /pid " + pid + " /f /t";
            } else if (osName.startsWith("Linux")) {
                cmd = "kill -9 " + pid;
            }

            try {
                logger.info("stopProcess---cmd=" + cmd);
                Runtime.getRuntime().exec(cmd);
            } catch (IOException e) {
                e.printStackTrace();
            }
        }

    }

}
