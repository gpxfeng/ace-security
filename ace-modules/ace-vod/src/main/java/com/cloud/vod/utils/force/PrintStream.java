package com.cloud.vod.utils.force;

import lombok.extern.slf4j.Slf4j;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.util.Date;

@Slf4j
public class PrintStream extends Thread {
	// 控制线程状态
	volatile boolean status = true;
	BufferedReader br = null;
	String type = null;
	long lastTime = 0;

	public PrintStream(InputStream is, String type) {
		br = new BufferedReader(new InputStreamReader(is));
		this.type = type;
	}

	public void run() {
		@SuppressWarnings("unused")
        String msg = null;
		try {
			while (status) {
				if (br == null) {
					break;
				}
				if ((msg = br.readLine()) != null) {
					long nowTime = new Date().getTime();
					if (nowTime - lastTime >= 10000) {
//					    log.info(type + "消息：" + msg);
						lastTime = nowTime;
					}
				} else {
					break;
				}
			}
		} catch (IOException e) {
			log.error("", e.getMessage());
		}
	}

	public void destroy() {
		status = false;
	}
}
