package com.cloud.vod.utils.force;

import com.cloud.vod.utils.PropertyConfigUtil;
import lombok.extern.slf4j.Slf4j;
import net.sf.json.JSONObject;
import net.sf.json.JsonConfig;
import net.sf.json.util.CycleDetectionStrategy;
import org.apache.commons.lang3.StringUtils;

import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.*;

@Slf4j
public class VideoUtil {

	private static PropertyConfigUtil propertyConfigUtil = PropertyConfigUtil.getInstance(Defines.Property.PROFILE_SETTING);


	public final static String VOD_FILM_TYPE = "film";
	public final static String VOD_CAMERAS_TYPE = "cameras";

	public final static String VIDEO_VOD_TYPE = "4";
	public final static String VIDEO_LIVE_TYPE = "3";
	public final static String VIDEO_SERIADO_TYPE = "2";

	private static int maxResolution = 0;

	private static int maxDownLoadThread = 0;

	private static String drop_caches = null;

	private static String videoService = null;
	private static String subtitleService = null;
	private static String picService = null;
//	private static String localService = null;
//	private static String imageProjectPath = null;

	public static boolean isParseAllVideo() {
		String parseAllInWeek = propertyConfigUtil.getValue("parseAllInWeek");
		if (parseAllInWeek != null && !parseAllInWeek.equals("")) {
			int week = Integer.valueOf(parseAllInWeek);
			Calendar calendar = Calendar.getInstance();
			calendar.setTime(new Date(System.currentTimeMillis()));
			int dayOfWeek = calendar.get(Calendar.DAY_OF_WEEK);
			log.info("dayOfWeek = " + dayOfWeek + ", parse week = " + week);
			if (week == dayOfWeek) {
				return true;
			}
		}
		return false;
	}

	public static boolean isSaveForce() {
		boolean isSaveForce = propertyConfigUtil.getBoolean("isSaveForce");
//		log.info("isSaveForce="+isSaveForce);
		return isSaveForce;
	}

	public static void freeCaches() {
		log.info("freeCaches.........");
		try {
			String drop_caches = VideoUtil.getDropCachesPath();
			File shell = new File(drop_caches);
			if (!shell.exists()) {
				return;
			}
			String osName = System.getProperties().getProperty("os.name");
			if (osName.startsWith("Linux")) {

				String cmd = "sh " + drop_caches.substring(drop_caches.lastIndexOf("/") + 1);
				String filePath = drop_caches.substring(0, drop_caches.lastIndexOf("/") + 1);

				log.info("cmd=" + cmd);
				Process videoProcess = Runtime.getRuntime().exec(cmd, null, new File(filePath));

				PrintStream errorPrintStream = new PrintStream(videoProcess.getErrorStream(), "Error");
				PrintStream outPrintStream = new PrintStream(videoProcess.getInputStream(), "Info");

				errorPrintStream.start();
				outPrintStream.start();

				try {
					videoProcess.waitFor();
				} catch (InterruptedException e) {
					log.error("", e);
				}
				// 关闭两个线程
				outPrintStream.destroy();
				errorPrintStream.destroy();
				// 关闭命令主进程
				videoProcess.destroy();
			} else {
				log.info("not support OS");
				return;
			}
		} catch (IOException e) {
			log.error("", e);
		}
	}

	public static int getMaxResolution() {
		if (maxResolution == 0) {
			maxResolution = propertyConfigUtil.getIntValue("maxResolution");
		}
		if (maxResolution == 0) {
			maxResolution = 720;
		}
		return maxResolution;
	}

	public static int getMaxDownLoadThread() {
		if (maxDownLoadThread == 0) {
			maxDownLoadThread = propertyConfigUtil.getIntValue("maxDownLoadThread");
		}
		if (maxDownLoadThread == 0) {
			maxDownLoadThread = 720;
		}
		return maxDownLoadThread;
	}

	public static String getDropCachesPath() {
		if (drop_caches == null || drop_caches.equals("")) {
			drop_caches = propertyConfigUtil.getValue("drop_caches");
		}
		if (drop_caches != null && !drop_caches.equals("")) {
			return drop_caches;
		}
		return null;
	}

//	public static String getImageProjectPath() {
//		if (imageProjectPath == null || imageProjectPath.equals("")) {
//			imageProjectPath = propertyConfigUtil.getValue("imagePath");
//		}
//		if (imageProjectPath != null && !imageProjectPath.equals("")) {
//			return imageProjectPath;
//		}
//		return null;
//	}

	public static String getPicServiceAddr() {
		// log.info("getPicServiceAddr......");
		if (picService == null || picService.equals("")) {
			picService = propertyConfigUtil.getValue("imageService");
		}
		if (picService != null && !picService.equals("")) {
			return picService;
		}
		return null;
	}

	public static String getSubtitleServiceAddr() {
		// log.info("getPicServiceAddr......");
		if (subtitleService == null || subtitleService.equals("")) {
			subtitleService = propertyConfigUtil.getValue("subtitleService");
		}
		if (subtitleService != null && !subtitleService.equals("")) {
			return subtitleService;
		}
		return null;
	}

	public static String getVideoServiceAddr() {
		// log.info("getPicServiceAddr......");
		if (videoService == null || videoService.equals("")) {
			videoService = propertyConfigUtil.getValue("videoService");
		}
		if (videoService != null && !videoService.equals("")) {
			return videoService;
		}
		return null;
	}

//	public static String getLocalServiceAddr() {
//		log.info("getLocalServiceAddr......");
//		if (localService == null || localService.equals("")) {
//			localService = propertyConfigUtil.getValue("localService");
//		}
//		if (localService != null && !localService.equals("")) {
//			return localService;
//		}
//		return null;
//	}

	public static JsonConfig getJsonConfig() {
		JsonConfig config = new JsonConfig();
		config.setIgnoreDefaultExcludes(false);
		config.setCycleDetectionStrategy(CycleDetectionStrategy.LENIENT);
		config.setExcludes(new String[] {// 只要设置这个数组，指定过滤哪些字段。
		"allRowsCount", "behindPage", "class", "dataList", "rowsPerPage", "createtime", "dataJson", "duration", "dataType",
				// "filmePage",
				"filmeType", "height", "homePage", "htmlType", "playerSrc", "playerType", "provider", "skin", "streamer", "videoFormat", "width", "status", "cookie", "filmeAddr" });
		return config;
	}

	public static JsonConfig getIptvJsonConfig() {
		JsonConfig config = new JsonConfig();
		config.setIgnoreDefaultExcludes(false);
		config.setCycleDetectionStrategy(CycleDetectionStrategy.LENIENT);
		config.setExcludes(new String[] {// 只要设置这个数组，指定过滤哪些字段。
		"videourl", "id", "enable", "pageurl", "version", "updatetime", "allRowsCount", "behindPage", "class", "dataList", "rowsPerPage", "createtime", "dataJson", "duration", "dataType", "filmePage", "filmeType", "height", "homePage", "htmlType", "playerSrc", "playerType", "provider", "skin", "streamer", "videoFormat", "width", "status", "cookie", "language", "pubYear", "subtitle", "country", "description", "filmeAddr" });
		return config;
	}

	public static JsonConfig getIptvVideoJsonConfig() {
		JsonConfig config = new JsonConfig();
		config.setIgnoreDefaultExcludes(false);
		config.setCycleDetectionStrategy(CycleDetectionStrategy.LENIENT);
		config.setExcludes(new String[] {// 只要设置这个数组，指定过滤哪些字段。
		"id", "enable", "pageurl", "version", "updatetime", "allRowsCount", "behindPage", "class", "dataList", "rowsPerPage", "createtime", "dataJson", "duration", "dataType", "filmePage", "filmeType", "height", "homePage", "htmlType", "playerSrc", "playerType", "provider", "skin", "streamer", "videoFormat", "width", "status", "cookie", "language", "pubYear", "subtitle", "country", "description", "filmeAddr" });
		return config;
	}

	public static JsonConfig getHomeJsonConfig() {
		JsonConfig config = new JsonConfig();
		config.setIgnoreDefaultExcludes(false);
		config.setCycleDetectionStrategy(CycleDetectionStrategy.LENIENT);
		config.setExcludes(new String[] {// 只要设置这个数组，指定过滤哪些字段。
		"enable", "id", "format", "version", "folder", "status", "isparseall", "isparse", "parsekey", "parsepage", "weburl", "userid", "createby", "editby", "edittime", "createtime" });
		return config;
	}

	public static JsonConfig getCategoryListJsonConfig() {
		JsonConfig config = new JsonConfig();
		config.setIgnoreDefaultExcludes(false);
		config.setCycleDetectionStrategy(CycleDetectionStrategy.LENIENT);
		config.setExcludes(new String[] { "url", "urlkey", "version", "id", "folder", "enable", "dataList", "createtime", "pageurl", "status", "videourl", "createby", "editby", "edittime" });
		return config;
	}

	public static JsonConfig getVodVideoListJsonConfig() {
		JsonConfig config = new JsonConfig();
		config.setIgnoreDefaultExcludes(false);
		config.setCycleDetectionStrategy(CycleDetectionStrategy.LENIENT);
		config.setExcludes(new String[] {// Ö»ÒªÉèÖÃÕâ¸öÊý×é£¬Ö¸¶¨¹ýÂËÄÄÐ©×Ö¶Î¡£
		"enable", "id", "version", "createtime", "pageurl", "status", "subtitle", "videourl", "updatetime" });
		return config;
	}

	public static JsonConfig getVodVideoJsonConfig() {
		JsonConfig config = new JsonConfig();
		config.setIgnoreDefaultExcludes(false);
		config.setCycleDetectionStrategy(CycleDetectionStrategy.LENIENT);
		config.setExcludes(new String[] {// Ö»ÒªÉèÖÃÕâ¸öÊý×é£¬Ö¸¶¨¹ýÂËÄÄÐ©×Ö¶Î¡£
		"enable", "id", "version", "createtime", "status", "updatetime" });
		return config;
	}

	public static JsonConfig getAdsJsonConfig() {
		JsonConfig config = new JsonConfig();
		config.setIgnoreDefaultExcludes(false);
		config.setCycleDetectionStrategy(CycleDetectionStrategy.LENIENT);
		config.setExcludes(new String[] {// 只要设置这个数组，指定过滤哪些字段。
		"uid", "appid", "status", "createtime" });
		return config;
	}

	public static JsonConfig getTimeJsonConfig() {
		JsonConfig config = new JsonConfig();
		config.setIgnoreDefaultExcludes(false);
		config.setCycleDetectionStrategy(CycleDetectionStrategy.LENIENT);
		config.setExcludes(new String[] {// 只要设置这个数组，指定过滤哪些字段。
		"createtime", "edittime", "updatetime", "version", "enable" });
		return config;
	}

	public static JsonConfig getSeriadoListJsonConfig() {
		JsonConfig config = new JsonConfig();
		config.setIgnoreDefaultExcludes(false);
		config.setCycleDetectionStrategy(CycleDetectionStrategy.LENIENT);
		config.setExcludes(new String[] {// Ö»ÒªÉèÖÃÕâ¸öÊý×é£¬Ö¸¶¨¹ýÂËÄÄÐ©×Ö¶Î¡£
		"allRowsCount", "behindPage", "class", "dataList", "rowsPerPage", "createtime", "dataJson", "duration", "dataType", "filmePage", "filmeType", "height", "homePage", "htmlType", "playerSrc", "playerType", "provider", "skin", "streamer", "videoFormat", "width", "status", "cookie", "filmeAddr", "country", "pubYear", "parentid", "temparray", "totaltemp", "description" });
		return config;
	}

	public static JsonConfig getSeriadoByPageJsonConfig() {
		JsonConfig config = new JsonConfig();
		config.setIgnoreDefaultExcludes(false);
		config.setCycleDetectionStrategy(CycleDetectionStrategy.LENIENT);
		config.setExcludes(new String[] {// Ö»ÒªÉèÖÃÕâ¸öÊý×é£¬Ö¸¶¨¹ýÂËÄÄÐ©×Ö¶Î¡£
		"allRowsCount", "behindPage", "class", "dataList", "rowsPerPage", "createtime", "dataJson", "duration", "dataType", "filmePage", "filmeType", "height", "homePage", "htmlType", "playerSrc", "playerType", "provider", "skin", "streamer", "videoFormat", "width", "status", "cookie", "filmeAddr", "country", "pubYear", "parentid", "number", "numname", "tempname", "temporada" });
		return config;
	}

	public static boolean sendUrl(String str) {
		if (str.startsWith("http://") || str.startsWith("https://") || str.startsWith("rtsp://") || str.startsWith("rtmp://") || str.startsWith("mms://") || str.startsWith("rtsp://")) {
			return true;
		}
		return false;
	}

	public static String md5(String string) {
		byte[] hash;
		try {
			hash = MessageDigest.getInstance("MD5").digest(string.getBytes("UTF-8"));
		} catch (NoSuchAlgorithmException e) {
			throw new RuntimeException("Huh, MD5 should be supported?", e);
		} catch (UnsupportedEncodingException e) {
			throw new RuntimeException("Huh, UTF-8 should be supported?", e);
		}

		StringBuilder hex = new StringBuilder(hash.length * 2);
		for (byte b : hash) {
			if ((b & 0xFF) < 0x10) {
				hex.append("0");
			}
			hex.append(Integer.toHexString(b & 0xFF));
		}
		return hex.toString();
	}


	public static int getServiceId(String spzdy, String type, String filmType) {
		int serviceid = -1;
		if (spzdy == null || spzdy.equals("")) {
			return serviceid;
		}
		JSONObject jsonObject = JSONObject.fromObject(spzdy);
		if (!jsonObject.has(type)) {
			return serviceid;
		}
		if (type.equals(VideoUtil.VIDEO_VOD_TYPE) && filmType != null && !filmType.equals("")) {
			jsonObject = jsonObject.getJSONObject(type);
			if (!jsonObject.has(filmType)) {
				return serviceid;
			}
			serviceid = Integer.valueOf(jsonObject.getString(filmType));
		} else {
			serviceid = Integer.valueOf(jsonObject.getString(type));
		}
		return serviceid;
	}

	public static Map<Integer, String> getServerTemplateSelectSource() {
		Map<Integer, String> templateMap = new HashMap<Integer, String>();
		templateMap.put(4, "Categorias Video");
		templateMap.put(3, "Simple Video");
		templateMap.put(2, "Seriado Video");
		return templateMap;
	}

	public static Integer[] getServerids(String serverids) {
		Integer[] serverid = null;
		if (StringUtils.isEmpty(serverids)) {
			return serverid;
		}
		String[] server_id = null;
		if (!serverids.contains(",")) {
			serverids = serverids + ",";
		}
		server_id = serverids.split(",");
		serverid = new Integer[server_id.length];
		for (int i = 0; i < server_id.length; i++) {
			serverid[i] = Integer.valueOf(server_id[i]);
		}
		return serverid;
	}

	public static String getChannelStateUrl() {
		return propertyConfigUtil.getValue("channelStateUrl");
	}

	public static String filterString(String str) {
		str = str.replace("&", "＆");
		str = str.replaceAll("&", "＆");
		return str;
	}

	public static String getVideoFileType(String url) {
		if (url.contains("?")) {
			url = url.substring(0, url.indexOf("?"));
		}
		if (url.contains("/")) {
			url = url.substring(url.lastIndexOf("/") + 1);
		}
		if (url.contains(".")) {
			url = url.substring(url.lastIndexOf("."));
		}
		if (StringUtils.isEmpty(url) || !url.contains(".")) {
			url = ".mp4";
		}

		return url;
	}

	public static String getVideoFileName(String str) {
		if (str != null && !str.equals("")) {
			str = str.replaceAll("[^0-9a-zA-Z]", "");
			str = str.replace("[^0-9a-zA-Z]", "");
		}
		if (StringUtils.isEmpty(str)) {
			str = new Date().getTime() + "";
		}
		return str.toLowerCase();
	}

	public static String getImageFileName(String url) {
		if (url != null && !url.equals("")) {
			if (url.contains("?")) {
				url = url.substring(0, url.indexOf("?"));
			}
			url = url.substring(url.lastIndexOf("/") + 1);
		}
		return url;
	}

	public static String getImageFileType(String url) {
		if (StringUtils.isEmpty(url)) {
			return ".jpg";
		}
		if (url.contains("?")) {
			url = url.substring(0, url.indexOf("?"));
		}
		if (url.contains("/")) {
			url = url.substring(url.lastIndexOf("/") + 1);
		}
		if (url.contains(".")) {
			url = url.substring(url.lastIndexOf("."));
		}
		if (StringUtils.isEmpty(url) || !url.contains(".")) {
			url = ".jpg";
		}
		if (url.contains("php")) {
			url = ".jpg";
		}
		return url;
	}

	public static String getSubtitleFileType(String url) {
		if (StringUtils.isEmpty(url)) {
			return ".vtt";
		}
		if (url.contains("?")) {
			url = url.substring(0, url.indexOf("?"));
		}
		if (url.contains("/")) {
			url = url.substring(url.lastIndexOf("/") + 1);
		}
		if (url.contains(".")) {
			url = url.substring(url.lastIndexOf("."));
		}
		if (StringUtils.isEmpty(url) || !url.contains(".")) {
			url = ".vtt";
		}
		if (url.contains("php")) {
			url = ".vtt";
		}
		return url;
	}

	public static String getFilmeType(String url) {
		if (url.contains("mp4")) {
			return "mp4";
		} else if (url.contains("flv")) {
			return "flv";
		} else if (url.contains("ts")) {
			return "ts";
		} else if (url.contains("mkv")) {
			return "mkv";
		} else if (url.contains("m3u8")) {
			return "m3u8";
		} else {
			if (url.indexOf("?") != -1) {
				url = url.substring(0, url.indexOf("?"));
			}
			url = url.substring(url.lastIndexOf(".") + 1);
			return url;
		}
	}

	public static String getFixUrl(Map<String, String> urlMap) {
		if (urlMap.containsKey("mp4")) {
			return urlMap.get("mp4");
		} else if (urlMap.containsKey("flv")) {
			return urlMap.get("flv");
		} else if (urlMap.containsKey("ts")) {
			return urlMap.get("ts");
		} else if (urlMap.containsKey("mkv")) {
			return urlMap.get("mkv");
		} else if (urlMap.containsKey("m3u8")) {
			return urlMap.get("m3u8");
		} else {
			Set<String> keySet = urlMap.keySet();
			return urlMap.get(keySet.iterator().next());
		}
	}

	public static String chanageName(String fName) {
		if (fName != null && !fName.equals("")) {
			if (fName.contains(Defines.Language.LEGENDADO)) {
				fName = fName.substring(0, fName.indexOf(Defines.Language.LEGENDADO));
			}
			if (fName.contains(Defines.Language.DUBLADO)) {
				fName = fName.substring(0, fName.indexOf(Defines.Language.DUBLADO));
			}
			if (fName.contains(Defines.Language.TODAS_AS_TEMPORADAS)) {
				fName = fName.substring(0, fName.indexOf(Defines.Language.TODAS_AS_TEMPORADAS));
			}
			fName = fName.trim();
			if (fName.endsWith("–")) {
				fName = fName.substring(0, fName.lastIndexOf("–"));
			}
			fName = fName.trim();
			if (fName.endsWith("-")) {
				fName = fName.substring(0, fName.lastIndexOf("-"));
			}
			fName = fName.trim();
		}
		return fName;
	}

	public static void main(String[] args) {
		System.out.println(getImageFileType("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRh8U6gEUv-glJ7I26QJsJzgakzXpyg3jCI8GtfrKcPiVoM2m6l"));
	}
}
