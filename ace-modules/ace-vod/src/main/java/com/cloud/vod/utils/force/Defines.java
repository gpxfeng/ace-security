package com.cloud.vod.utils.force;

import java.io.BufferedReader;

/**
 * @author apps1
 *
 */
public class Defines {
	public static String ZIP = ".zip";
	public static String MB = "mb_";
	public static String FLAG = "_";
	public static final String IMAGETYPE_REGEXP = ".+\\.(gif|jpg|png|bmp|jpeg|tiff|mpg|mpeg)$";

	public static final class TimeFormat {
		public static final String FORMAT_TIME_STRING = "yyyy-MM-dd HH:mm:ss";
		public static final String FORMAT_DATE_STRING = "yyyy-MM-dd";
		public static final String FORMAT_SECOND_STRING = "HH:mm:ss";
		public static final String FORMAT_DATE_STRINGS = "yyyyMMdd";
	}

	public static final class Page {
		public static final int MAX_COUNT = 10;
	}

	/*
	 * public static final class Property { public static final String
	 * PROFILE_PAEAMS = "params.properties"; public static final String
	 * XMLBEAN_APP = "app.properties"; public static final String
	 * PROFILE_SETTING = "app.properties"; }
	 */

	public static final class Property {
		public static final String PROFILE_SETTING = "setting.properties";
		public static final String PROFILE_PAEAMS = "params.properties";
		public static final String XMLBEAN_APP = "app.properties";

	}

	public static final class Common {
		public static final int SEARCH_NUM = 1000;
		public static final String KEY_SPLIT = ",";
	}

	public static final class CachedType {
		public static final String USER_ID = "USER_ID_";
	}

	public static final class Ende {
		public static final String XML_ = "UTF-8";
	}

	public static final class BufferedItem {
		public static BufferedReader ACTIVE_READER = null;
	}

	public static final class ModelFile {
		public static final String INDEX_HTML = "wlzx-index.htm";
		public static final String LIST_HTML = "wlzx-list.htm";
		public static final String IMG_HTML = "wlzx-img.htm";
		public static final String NR1 = "wlzx-1nr.htm";
		public static final String NR2 = "wlzx-2nr.htm";
		public static final String NR3 = "wlzx-3nr.htm";
	}

	public static final class PIC {
		public static final String JPG= ".jpg";
		public static final String JPEG= ".jpeg";
		public static final String BMP= ".bmp";
		public static final String GIF= ".gif";
		public static final String PNG= ".png";
	}
	public static final class Language {
		public static final String DUBLADO= "Dublado";
		public static final String LEGENDADO= "Legendado";
		public static final String TODAS_AS_TEMPORADAS= "Todas as Temporadas";
	}
	public static final class VideoType {
		public static final int VOD_TYPE = 1;
		public static final int SERIADO_TYPE = 2;
		public static final int SEX_TYPE = 3;
		public static final String SERIES= "series";
		public static final String VOD= "vod";
		public static final String SEX= "sex";

	}

	public static final class AppType {
		public static final int LAUNCHER_TYPE = -1;
		public static final int SYSTEM_TYPE = 0;
	}

	public static final class VideoQuality {
		public static final int HD_QUALITY = 3;
		public static final int DVD_QUALITY = 2;
		public static final int TS_QUALITY = 1;
		public static final int UNKNOWN_QUALITY = 0;
		public static final String HD = "HD";
		public static final String DVD = "DVD";
		public static final String TS = "TS";
		public static final String UNKNOWN = "UNKNOWN";
	}
}
