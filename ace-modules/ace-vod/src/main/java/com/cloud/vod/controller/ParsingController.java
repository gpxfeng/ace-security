package com.cloud.vod.controller;


import com.cloud.vod.service.ParsingService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;


@Controller
@RequestMapping("/parse")
public class ParsingController {

	private Logger logger = LoggerFactory.getLogger(ParsingController.class);

	@Autowired
	private ParsingService parsingServiceImpl;


	@RequestMapping("/startParse")
	@ResponseBody
	public void startParse() {
		logger.info("ParsingController接受爬取请求");
		parsingServiceImpl.startParsing();
	}


}
