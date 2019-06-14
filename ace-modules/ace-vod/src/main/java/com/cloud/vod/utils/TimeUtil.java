package com.cloud.vod.utils;

import com.cloud.vod.utils.force.Defines;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Locale;


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
