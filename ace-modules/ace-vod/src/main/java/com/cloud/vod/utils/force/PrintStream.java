package com.cloud.vod.utils.force;

import org.apache.log4j.Logger;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.util.Date;

public class PrintStream extends Thread {
	private Logger logger = Logger.getLogger(PrintStream.class);
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
//					    logger.info(type + "消息：" + msg);
						lastTime = nowTime;
					}
				} else {
					break;
				}
			}
		} catch (IOException e) {
			logger.error(e, e);
		}
	}

	public void destroy() {
		status = false;
	}
}
