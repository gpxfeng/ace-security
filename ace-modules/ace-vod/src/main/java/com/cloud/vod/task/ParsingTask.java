package com.cloud.vod.task;

import java.text.SimpleDateFormat;
import java.util.Date;

import com.cloud.vod.service.ParsingService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.scheduling.annotation.EnableScheduling;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;


@Component
@Configuration      //1.主要用于标记配置类，兼备Component的效果。
@EnableScheduling   // 2.开启定时任务
public class ParsingTask {
	private Logger logger = LoggerFactory.getLogger(ParsingTask.class);

	@Autowired
	private ParsingService parsingServiceImpl;


	@Scheduled(cron = "0 0 0 * * ? ") //单线程
	public void startJob(){
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		logger.info("开始定时爬取,时间="+dateFormat.format(new Date()));
		parsingServiceImpl.startParsing();
	}

}
