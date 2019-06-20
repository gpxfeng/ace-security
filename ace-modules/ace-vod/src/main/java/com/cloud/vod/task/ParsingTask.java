package com.cloud.vod.task;

import java.text.SimpleDateFormat;
import java.util.Date;

import com.cloud.vod.service.ParsingService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.CommandLineRunner;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.annotation.Order;
import org.springframework.scheduling.annotation.EnableScheduling;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;


@Component
@Configuration      //1.主要用于标记配置类，兼备Component的效果。
@EnableScheduling   // 2.开启定时任务
@Slf4j
@Order(value=1)
public class ParsingTask implements CommandLineRunner {
	@Autowired
	private ParsingService parsingServiceImpl;

	@Override
	public void run(String... args) throws Exception {
		log.info("项目启动执行一次,value=1");
		try {
			startJob();
		}catch(Exception e){
			log.error("执行失败",e);
		}
	}

	@Scheduled(cron = "0 0 0 * * ? ") //单线程
	public void startJob(){
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		log.info("开始定时爬取,时间="+dateFormat.format(new Date()));
		parsingServiceImpl.startParsing();
	}

}
