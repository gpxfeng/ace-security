package com.cloud.vod.utils;

import org.openqa.selenium.JavascriptExecutor;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.chrome.ChromeDriver;
import org.openqa.selenium.chrome.ChromeOptions;
import org.openqa.selenium.remote.CapabilityType;

import java.util.concurrent.TimeUnit;
import java.util.regex.Matcher;
import java.util.regex.Pattern;


public class WebDriverUtil {
    public final static PropertyConfigUtil PCONFIGUTIL = PropertyConfigUtil.getInstance("Configs.properties");

    public final static String CHROMEDRIVERPATH = PCONFIGUTIL.getValue("chromeDriverPath");

    public static WebDriver GetWebDriver() {
        //模拟浏览器
        System.setProperty("webdriver.chrome.driver", CHROMEDRIVERPATH);//驱动注入
        ChromeOptions options = new ChromeOptions();//生成实例
        options.setHeadless(true);//启动浏览器  无头模式
        options.addArguments("--no-sandbox");//取消沙盒环境
        options.addArguments("--start-maximized");//启动最大化
        options.addArguments("--test-type", "--ignore-certificate-errors");//置忽略 Chrome 浏览器证书错误报警提示
        //设置头部伪装
        options.addArguments("user-agent=Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.131 Safari/537.36");
        options.setCapability(CapabilityType.ACCEPT_SSL_CERTS, true);//设置不使用ssl安全协议
        options.setCapability(CapabilityType.ACCEPT_INSECURE_CERTS, true);//日志

        options.addArguments("-–disable-javascript");//禁用js
        //options.addArguments("--disable-gpu");//谷歌文档提到需要加上这个属性来规避bug
        //options.setExperimentalOption("excludeSwitches",new String[]{"enable-automation"});//开发者模式，跳过反爬 window.navigator.webdriver
        //options.addArguments("user-data-dir=selenium");//带上cookie
        //options.addArguments("disable-infobars");//隐藏Chrome正在受到自动软件的控制


        WebDriver webDriver = new ChromeDriver(options);//取实例
        webDriver.manage().timeouts().implicitlyWait(30, TimeUnit.SECONDS); // 隐式等待(秒) 页面加载
        webDriver.manage().window().maximize(); // 最大化浏览器窗口
        return webDriver;
    }


    public static String getMatcher(String regex, String source) {
        String result = "";
        Pattern pattern = Pattern.compile(regex);
        Matcher matcher = pattern.matcher(source);
        while (matcher.find()) {
            result = matcher.group();
            break;
        }
        return result;
    }

    public static void setAttribute(WebElement e, WebDriver d, String attributeName, String value) {
        JavascriptExecutor js = (JavascriptExecutor) d;
        // 执行JavaScriptdiamante修改页面元素属性。arguments[0]-[2]后面会用e,attributeName,value替换并执行
        js.executeScript("arguments[0].setAttribute(arguments[1],arguments[2])", e, attributeName, value);
    }

    public static void RemoveAttribute(WebElement e, WebDriver d, String attributeName) {
        JavascriptExecutor js = (JavascriptExecutor) d;
        // 执行JavaScriptdiamante修改页面元素属性。arguments[0]-[2]后面会用e,attributeName,value替换并执行
        js.executeScript("arguments[0].removeAttribute(arguments[1])", e, attributeName);

    }

}
