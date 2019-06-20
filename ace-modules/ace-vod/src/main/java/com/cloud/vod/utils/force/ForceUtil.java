package com.cloud.vod.utils.force;


import com.cloud.vod.entity.Dramainfo;
import com.cloud.vod.entity.Videoinfo;
import com.cloud.vod.utils.HttpRequest;
import com.cloud.vod.utils.PropertyConfigUtil;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang3.StringUtils;
import org.dom4j.Document;
import org.dom4j.DocumentException;
import org.dom4j.DocumentHelper;
import org.dom4j.Element;

import java.util.*;


@SuppressWarnings({ "rawtypes","unchecked" })
@Slf4j
public class ForceUtil {
	private static PropertyConfigUtil propertyConfigUtil = PropertyConfigUtil.getInstance("Configs.properties");

	public static String[] UserAgent = { "Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101 Firefox/52.0" };

	public static String authorization = "";
	public static String forcecmsurl = "";
	public static String p2purl = "";

	public static String getForcecmsurl() {
		if (StringUtils.isEmpty(forcecmsurl)) {
			forcecmsurl = propertyConfigUtil.getValue("forcecmsurl");
		}
		return forcecmsurl;
	}

	public static String getForceP2purl() {
		if (StringUtils.isEmpty(p2purl)) {
			p2purl = propertyConfigUtil.getValue("fccsurl");
		}
		return p2purl;
	}

	public static String getAuthorization() {
		if (StringUtils.isEmpty(authorization)) {
			String userName = propertyConfigUtil.getValue("forceName");
			String password = propertyConfigUtil.getValue("forcePwd");
			new Base64();
			authorization = Base64.encode(new StringBuilder(String.valueOf(userName)).append(":").append(password).toString().getBytes());
		}
		return authorization;
	}

	public static Map<String, String> getHeaderMap() {

		Map<String, String> headers = new HashMap<String, String>();
		headers.put("Connection", "keep-alive");
		headers.put("User-agent", UserAgent[0]);
		headers.put("Content-Type", "application/x-www-form-urlencoded");
		headers.put("Authorization", "Basic  " + getAuthorization());
		return headers;
	}

	/**
	 * 原力添加
	 *
	 * @param mediaUrl
	 * @return
	 */
	public static ForceVideo saveForceLiveVideo(String videoName, int videoType, String mediaUrl) {
		String[] ftds = propertyConfigUtil.getValue("ftds").split(",");

		log.info("forceSaveChannel mediaUrl=" + mediaUrl + ", name=" + videoName);
		if (mediaUrl == null || mediaUrl.length() == 0 || videoName == null || videoName.length() == 0) {
			return null;
		}

		Map<String, String> params = new HashMap<String, String>();
		params.put("cmd", "addchn");
		params.put("filetype", "ts");
		params.put("name", videoName);
		params.put("ptl", "auto");
		params.put("ptlimpl", "std");
		params.put("submit", "提交");
		params.put("vod", "0");
		params.put("sort", "");
		params.put("url", mediaUrl);

		if (videoType==1) {
			params.put("ftdsid", ftds[0]);
		}else if (videoType==2) {
			params.put("ftdsid", ftds[1]);
		}else if (videoType==4) {
			params.put("ftdsid", ftds[2]);
		}else {
			Random random = new Random();
			int num = random.nextInt(ftds.length);
			params.put("ftdsid", ftds[num]);
		}

		for (int i = 0; i < ftds.length; i++) {
			params.put("ftds_url_" + ftds[i], "");
		}

		String forcecmsurl = getForcecmsurl();
		String respone = "";
		try {
			respone = HttpRequest.get(forcecmsurl, params, true).authorization(getAuthorization()).headers(getHeaderMap()).body();
		} catch (Exception e) {
			log.error("", e);
		}
		log.info("respone=" + respone);

		Document document = null;
		try {
			document = DocumentHelper.parseText(respone);
		} catch (DocumentException e) {
			log.error("", e);
		}
		if (document == null) {
			return null;
		}
		Element root = document.getRootElement();
		List<Element> nodes = root.elements("channel");
		if (nodes == null || nodes.size() == 0) {
			return null;
		}
		for (Iterator it = nodes.iterator(); it.hasNext();) {
			Element element = (Element) it.next();
			String id = element.attributeValue("id");
			String name = element.attributeValue("name");
			String url = element.attributeValue("url");

			if (name.equals(videoName)) {
				ForceVideo forceVideo = new ForceVideo();
				forceVideo.setName(name);
				forceVideo.setId(id);
				forceVideo.setUrl(url);
				forceVideo.setP2pUrl(getForceP2purl() + id);
				log.info("force channelId=" + id);
				return forceVideo;
			}
		}

		return null;
	}
	/**
	 * 原力添加
	 *
	 * @param mediaUrl
	 * @return
	 */
	public static ForceVideo saveForceVodVideo(String videoName, int videoType, String mediaUrl) {
		String[] vod_ftds = propertyConfigUtil.getValue("vod_ftds").split(",");
		String[] vod_anime_ftds = propertyConfigUtil.getValue("vod_anime_ftds").split(",");
		String[] series_ftds = propertyConfigUtil.getValue("series_ftds").split(",");
		String[] anime_ftds = propertyConfigUtil.getValue("anime_ftds").split(",");

		log.info("forceSaveChannel mediaUrl=" + mediaUrl + ", name=" + videoName);
		if (mediaUrl == null || mediaUrl.length() == 0 || videoName == null || videoName.length() == 0) {
			return null;
		}
		IdentityHashMap<String, String> params=new IdentityHashMap<String, String>();
		params.put("cmd", "addchn");
		params.put("filetype", "auto");
		params.put("name", videoName);
		params.put("ptl", "file");
		params.put("ptlimpl", "std");
		params.put("submit", "提交");
		params.put("vod", "1");
		params.put("sort", "");
		params.put("url", "file:///" + mediaUrl);

		Random random = new Random();
		if (videoType==1) {
		    int num = random.nextInt(vod_ftds.length);
		    int num2= random.nextInt(vod_ftds.length);
		    while (num==num2) {
		    	num2=random.nextInt(vod_ftds.length);
			}
		    params.put(new String("ftdsid"), vod_ftds[num]);
			params.put(new String("ftdsid"), vod_ftds[num2]);
			for (int i = 0; i < vod_ftds.length; i++) {
			    params.put("ftds_url_" + vod_ftds[i], "");
			}

			//添加动漫服务器里的vod的ftds,vod服务器和动漫服务器是交叉备份视频的
		    params.put(new String("ftdsid"), vod_anime_ftds[num]);
			params.put(new String("ftdsid"), vod_anime_ftds[num2]);
			for (int i = 0; i < vod_anime_ftds.length; i++) {
			    params.put("ftds_url_" + vod_anime_ftds[i], "");
			}
		}else if (videoType==2) {
		    int num = random.nextInt(series_ftds.length);
		    int num2 = random.nextInt(series_ftds.length);
		    while (num==num2) {
		    	num2=random.nextInt(series_ftds.length);
			}

		    params.put(new String("ftdsid"), series_ftds[num]);
		    params.put(new String("ftdsid"), series_ftds[num2]);
            for (int i = 0; i < series_ftds.length; i++) {
                params.put("ftds_url_" + series_ftds[i], "");
            }
		}else if (videoType==4) {
            int num = random.nextInt(anime_ftds.length);
		    int num2 = random.nextInt(anime_ftds.length);
		    while (num==num2) {
		    	num2=random.nextInt(anime_ftds.length);
			}

		    params.put(new String("ftdsid"), anime_ftds[num]);
		    params.put(new String("ftdsid"), anime_ftds[num2]);
            for (int i = 0; i < anime_ftds.length; i++) {
                params.put("ftds_url_" + anime_ftds[i], "");
            }
		}

		String forcecmsurl = getForcecmsurl();
		String respone = "";
		try {
			respone = HttpRequest.get(forcecmsurl, params, true).authorization(getAuthorization()).headers(getHeaderMap()).body();
		} catch (Exception e) {
			log.error("", e);
		}
		log.info("respone=" + respone);

		Document document = null;
		try {
			document = DocumentHelper.parseText(respone);
		} catch (DocumentException e) {
			log.error("", e);
		}
		if (document == null) {
			return null;
		}
		Element root = document.getRootElement();
		List<Element> nodes = root.elements("channel");
		if (nodes == null || nodes.size() == 0) {
			return null;
		}
		for (Iterator it = nodes.iterator(); it.hasNext();) {
			Element element = (Element) it.next();
			String id = element.attributeValue("id");
			String name = element.attributeValue("name");
			String url = element.attributeValue("url");

			if (name.equals(videoName)) {
				ForceVideo forceVideo = new ForceVideo();
				forceVideo.setName(name);
				forceVideo.setId(id);
				forceVideo.setUrl(url);
				forceVideo.setP2pUrl(getForceP2purl() + id);
				log.info("force channelId=" + id);
				return forceVideo;
			}
		}

		return null;
	}

	public static void updateFtdsid(int videoType, String p2pId) {
		String[] vod_ftds = propertyConfigUtil.getValue("vod_ftds").split(",");
		String[] vod_anime_ftds = propertyConfigUtil.getValue("vod_anime_ftds").split(",");
		String[] series_ftds = propertyConfigUtil.getValue("series_ftds").split(",");
		String[] anime_ftds = propertyConfigUtil.getValue("anime_ftds").split(",");

		IdentityHashMap<String, String> params=new IdentityHashMap<String, String>();
		params.put("cmd", "modifychn");
		params.put("filetype", "auto");
		params.put("id", p2pId);
		params.put("ptl", "file");
		params.put("ptlimpl", "std");
		params.put("submit", "修改");
		params.put("vod", "1");

		Random random = new Random();
		if (videoType==1) {
			//添加vod服务器里的vod的ftds
		    int num = random.nextInt(vod_ftds.length);
		    int num2= random.nextInt(vod_ftds.length);
		    while (num==num2) {
		    	num2=random.nextInt(vod_ftds.length);
			}
		    params.put(new String("ftdsid"), vod_ftds[num]);
			params.put(new String("ftdsid"), vod_ftds[num2]);
			for (int i = 0; i < vod_ftds.length; i++) {
			    params.put("ftds_url_" + vod_ftds[i], "");
			}

			//添加动漫服务器里的vod的ftds,vod服务器和动漫服务器是交叉备份视频的
		    params.put(new String("ftdsid"), vod_anime_ftds[num]);
			params.put(new String("ftdsid"), vod_anime_ftds[num2]);
			for (int i = 0; i < vod_anime_ftds.length; i++) {
			    params.put("ftds_url_" + vod_anime_ftds[i], "");
			}
		}else if (videoType==2) {
		    int num = random.nextInt(series_ftds.length);
		    int num2 = random.nextInt(series_ftds.length);
		    while (num==num2) {
		    	num2=random.nextInt(series_ftds.length);
			}

		    params.put(new String("ftdsid"), series_ftds[num]);
		    params.put(new String("ftdsid"), series_ftds[num2]);
            for (int i = 0; i < series_ftds.length; i++) {
                params.put("ftds_url_" + series_ftds[i], "");
            }
		}else if (videoType==4) {
            int num = random.nextInt(anime_ftds.length);
		    int num2 = random.nextInt(anime_ftds.length);
		    while (num==num2) {
		    	num2=random.nextInt(anime_ftds.length);
			}

		    params.put(new String("ftdsid"), anime_ftds[num]);
		    params.put(new String("ftdsid"), anime_ftds[num2]);
            for (int i = 0; i < anime_ftds.length; i++) {
                params.put("ftds_url_" + anime_ftds[i], "");
            }
		}

		String forcecmsurl = getForcecmsurl();
		String respone = "";
		try {
			respone = HttpRequest.post(forcecmsurl, params, true).authorization(getAuthorization()).headers(getHeaderMap()).body();
		} catch (Exception e) {
			log.error("", e);
		}
//		log.info("respone=" + respone);
	}


	public static List<String> checkFtds(String p2pId) {
		List<String> ftdsList=new ArrayList<>();

		Map<String, String> params = new HashMap<String, String>();
		params.put("cmd", "getpage");
		params.put("page", "chninfo");
		params.put("id", p2pId);

		String forcecmsurl = getForcecmsurl();
		String respone = "";
		try {
			respone = HttpRequest.get(forcecmsurl, params, true).authorization(getAuthorization()).headers(getHeaderMap()).body();
		} catch (Exception e) {
			log.error("", e);
		}
		Document document = null;
		try {
			document = DocumentHelper.parseText(respone);
		} catch (DocumentException e) {
			log.error("", e);
		}
		if (document == null) {
			return ftdsList;
		}

		Element root = document.getRootElement();
		List<Element> nodes = root.elements("channel");
		if (nodes == null || nodes.size() == 0) {
			return ftdsList;
		}

		for (Iterator it = nodes.iterator(); it.hasNext();) {
			Element element = (Element) it.next();
			String ftdsid = element.attributeValue("ftdsid");
			ftdsList= Arrays.asList(ftdsid.split(";"));
		}

		return ftdsList;
	}

	public static String deleteForceVideo(String id, String name, boolean isVod) {
		log.info("force del F_id=" + id + ", F_name=" + name);
		if (id == null || id.length() == 0 || name == null || name.length() == 0) {
			return "";
		}
		Map<String, String> params = new HashMap<String, String>();
		params.put("cmd", "delchn");
		params.put("begin", "0");// 第几个开始
		params.put("count", "1");// 往后获取个数
		params.put("vod", isVod ? "1" : "0");
		params.put("name", name);// 删除对象名称
		params.put("id", id);// 删除对象id

		String url = getForcecmsurl();
		String authorization = getAuthorization();

		String respone = "";
		try {
			respone = HttpRequest.get(url, params, true).authorization(authorization).headers(getHeaderMap()).body();
		} catch (Exception e) {
			log.error("", e);
		}
		log.info("force del respone=" + respone);
		return respone;
	}

	public static ForceVideo getForceVideo(String videoName, String mediaUrl, boolean isVod) {
		// http://167.114.65.183:50001/admin?cmd=getpage&page=chnlist&begin=0&count=20&name=file%3A%2F%2F%2FE%3A%2Fhome%2Fdata%2Fvod%2Fterror%2Fdominao.mp4
		Map<String, String> params = new HashMap<String, String>();
		params.put("cmd", "getpage");
		params.put("begin", "0");
		params.put("count", "2");
		params.put("page", "chnlist");
		params.put("name", mediaUrl);// TODO:视频地址

		String forcecmsurl = getForcecmsurl();
		String respone = "";
		try {
			respone = HttpRequest.get(forcecmsurl, params, true).authorization(getAuthorization()).headers(getHeaderMap()).body();
		} catch (Exception e) {
			log.error("", e);
		}
		Document document = null;
		try {
			document = DocumentHelper.parseText(respone);
		} catch (DocumentException e) {
			log.error("", e);
		}
		if (document == null) {
			return null;
		}
		Element root = document.getRootElement();
		List<Element> nodes = root.elements("channel");
		if (nodes == null || nodes.size() == 0) {
			return null;
		}

		ForceVideo forceVideo = null;
		for (Iterator it = nodes.iterator(); it.hasNext();) {
			Element element = (Element) it.next();
			String id = element.attributeValue("id");
			String name = element.attributeValue("name");
			String url = element.attributeValue("url");

			if (name.equals(videoName) && url.contains(mediaUrl)) {
				forceVideo = new ForceVideo();
				forceVideo.setName(name);
				forceVideo.setId(id);
				forceVideo.setUrl(url);
				forceVideo.setP2pUrl(getForceP2purl() + id);
				log.info("force channelId=" + id);
			} else if (!name.equals(videoName) && url.contains(mediaUrl)) {
//				String baseUrl = mediaUrl.substring(0, mediaUrl.lastIndexOf("/"));
//				if (url.contains(baseUrl)) {
//					deleteForceVideo(id, name, isVod);
//				}
			}
		}

		return forceVideo;
	}


	public static void deleteForceVideoOnExist(Videoinfo videoInfo) {

		String videoName = videoInfo.getName();
		String mediaUrl = videoInfo.getFilepath();

		boolean isVod = true;

		ForceVideo forceVideo = getForceVideo(videoName, mediaUrl, isVod);
		if (forceVideo != null) {
			deleteForceVideo(forceVideo.getId(), forceVideo.getName(), isVod);
		}
	}

	public static void deleteForceVideoOnExist(Dramainfo drama, Videoinfo videoInfo) {
		String folderName = VideoUtil.getVideoFileName(drama.getName()).toLowerCase();
		String videoName = folderName + "_" + videoInfo.getTemp() + "_" + videoInfo.getName();
		String mediaUrl = videoInfo.getFilepath();

		boolean isVod = true;
		if (Defines.VideoType.SEX_TYPE == videoInfo.getType()) {
			isVod = false;
		}
		ForceVideo forceVideo = getForceVideo(videoName, mediaUrl, isVod);
		if (forceVideo != null) {
			deleteForceVideo(forceVideo.getId(), forceVideo.getName(), isVod);
		}
	}
}
