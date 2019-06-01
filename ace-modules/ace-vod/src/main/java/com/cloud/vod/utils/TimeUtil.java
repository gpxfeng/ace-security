/**
 * Program  : TimeUtil.java
 * Author   : panxin
 * Create   : 2008-11-4 ����08:00:32
 *
 * Copyright 2006 by Embedded Internet Solutions Inc.,
 * All rights reserved.
 *
 * This software is the confidential and proprietary information
 * of Embedded Internet Solutions Inc.("Confidential Information").
 * You shall not disclose such Confidential Information and shall
 * use it only in accordance with the terms of the license agreement
 * you entered into with Embedded Internet Solutions Inc.
 *
 */
package com.cloud.vod.utils;

import com.VodWebCrawler.cms.util.force.Defines;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Locale;

/**
 *
 * @author panxin
 * @version 1.0.0
 * @2008-11-4 ����08:00:32
 */
public class TimeUtil {
    public static final String DEFAULT_TIME = "yyyyMMdd";
    public static final SimpleDateFormat DEFAULT_TIME_SRT = new SimpleDateFormat(DEFAULT_TIME, Locale.getDefault());

	public static String getFormatTime() {
		String formatTime = Defines.TimeFormat.FORMAT_TIME_STRING;
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat(formatTime);
		Date date = new Date();
		String timer = simpleDateFormat.format(date);
		return timer;
	}
	public static String getFormatMillisecondTime() {
		String formatTime = Defines.TimeFormat.FORMAT_TIME_STRING;
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat(formatTime);
		Date date = new Date();
		String timer = simpleDateFormat.format(date);
		return timer;
	}
	public static String getFormatTime(long time) {
		Date date = new Date(time);
		String formatTime = Defines.TimeFormat.FORMAT_TIME_STRING;
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat(formatTime);
		String timer = simpleDateFormat.format(date);
		return timer;
	}

	public static Date getDate(String stringTime) {
		String formatTime = Defines.TimeFormat.FORMAT_TIME_STRING;
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat(formatTime);
		Date date = null;
		try {
			date = simpleDateFormat.parse(stringTime);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		return date;
	}

	public static String getFormatTime(Date date) {
		String formatTime = Defines.TimeFormat.FORMAT_TIME_STRING;
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat(formatTime);
		String timer = simpleDateFormat.format(date);
		return timer;
	}

}
