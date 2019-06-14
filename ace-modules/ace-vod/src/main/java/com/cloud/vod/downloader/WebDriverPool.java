package com.cloud.vod.downloader;


import com.cloud.vod.utils.PropertyConfigUtil;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.chrome.ChromeDriver;
import org.openqa.selenium.chrome.ChromeOptions;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.util.concurrent.BlockingDeque;
import java.util.concurrent.LinkedBlockingDeque;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.atomic.AtomicInteger;

public class WebDriverPool {
	private Logger logger = LoggerFactory.getLogger(getClass());
	private static PropertyConfigUtil pConfigUtil = PropertyConfigUtil.getInstance("Configs.properties");

	private int CAPACITY = 5;
	private AtomicInteger refCount = new AtomicInteger(0);

	/**
	 * store webDrivers available
	 */
	private BlockingDeque<WebDriver> innerQueue = new LinkedBlockingDeque<WebDriver>(CAPACITY);

	private static String CHROMEHEADLESS_PATH;
	private static ChromeOptions options;
	static {
		CHROMEHEADLESS_PATH = pConfigUtil.getValue("chromeDriverPath");
		System.setProperty("webdriver.chrome.driver", CHROMEHEADLESS_PATH);
		options = new ChromeOptions();
		options.setHeadless(true);

	}

	public WebDriverPool() {
	}

	public WebDriverPool(int poolsize) {
		this.CAPACITY = poolsize;
		innerQueue = new LinkedBlockingDeque<WebDriver>(poolsize);
	}

	public WebDriver get() throws InterruptedException {
		WebDriver poll = innerQueue.poll();
		if (poll != null) {
			return poll;
		}
		if (refCount.get() < CAPACITY) {
			synchronized (innerQueue) {
				if (refCount.get() < CAPACITY) {
					// 创建无界面浏览器对象
					WebDriver mDriver = new ChromeDriver(options);

					/*
					 * WebDriver自带了一个智能等待的方法。 dr.manage().timeouts().implicitlyWait(arg0, arg1）；
					 * Arg0：等待的时间长度，int 类型 ； Arg1：等待时间的单位 TimeUnit.SECONDS 一般用秒作为单位。
					 */
					mDriver.manage().timeouts().implicitlyWait(3, TimeUnit.SECONDS);

					innerQueue.add(mDriver);
					refCount.incrementAndGet();
				}
			}
		}
		return innerQueue.take();
	}

	public void returnToPool(WebDriver webDriver) {
		// webDriver.quit();
		// webDriver=null;
		innerQueue.add(webDriver);
	}

	public void close(WebDriver webDriver) {
		refCount.decrementAndGet();
		webDriver.close();
		webDriver.quit();
		webDriver = null;
	}

	public void shutdown() {
		try {
			for (WebDriver driver : innerQueue) {
				close(driver);
			}
			innerQueue.clear();
		} catch (Exception e) {
//            e.printStackTrace();
			logger.warn("webdriverpool关闭失败", e);
		}
	}
}
