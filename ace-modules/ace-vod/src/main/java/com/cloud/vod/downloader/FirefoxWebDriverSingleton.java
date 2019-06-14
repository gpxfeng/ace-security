package com.cloud.vod.downloader;


import com.cloud.vod.utils.PropertyConfigUtil;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.firefox.FirefoxDriver;
import org.openqa.selenium.firefox.FirefoxDriverLogLevel;
import org.openqa.selenium.firefox.FirefoxOptions;
import org.openqa.selenium.remote.CapabilityType;

import java.util.concurrent.TimeUnit;

public class FirefoxWebDriverSingleton {

	private static PropertyConfigUtil pConfigUtil = PropertyConfigUtil.getInstance("Configs.properties");

	private static String firefoxDriverPath = pConfigUtil.getValue("firefoxDriverPath");

	private static volatile WebDriver webDriver;

	public static WebDriver getInstance() {
		if (webDriver == null) {
			synchronized (FirefoxWebDriverSingleton.class) {
				if (webDriver == null) {
					System.setProperty("webdriver.gecko.driver", firefoxDriverPath);
					FirefoxOptions options = new FirefoxOptions();
					options.setHeadless(true); // 开启无头模式
					options.setLogLevel(FirefoxDriverLogLevel.INFO); // 日志等级
					options.setCapability("--user-agent",
							"Mozilla/5.0 (Windows NT 6.1; W…) Gecko/20100101 Firefox/63.0");
					options.setCapability(CapabilityType.ACCEPT_SSL_CERTS, true);
					options.setCapability(CapabilityType.ACCEPT_INSECURE_CERTS, true);

					webDriver = new FirefoxDriver(options);
					webDriver.manage().timeouts().implicitlyWait(30, TimeUnit.SECONDS); // 隐式等待10秒
					webDriver.manage().window().maximize(); // 最大化浏览器窗口
				}
			}
		}
		return webDriver;
	}

	public static void quitWebDriver() {
		if (webDriver != null) {
			webDriver.quit();
		}
	}

}
