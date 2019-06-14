package com.cloud.vod.utils;


import com.cloud.vod.utils.Process.FfprobeProcessStream;
import com.cloud.vod.utils.force.PrintStream;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.io.BufferedReader;
import java.io.File;
import java.io.IOException;
import java.io.InputStreamReader;
import java.text.MessageFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
* Copyright: Copyright (c) 2018 LanRu-Caifu
*
* @ClassName: FfmpegUtil.java
* @Description: 该类的功能描述
*
* @version: v1.0.0
* @author: yuxianfeng
* @date: 2018年12月3日 下午4:44:28
*
* Modification History:
* Date         Author          Version            Description
*---------------------------------------------------------*
* 2018年12月3日     Administrator           v1.0.0               修改原因
*/
public class FfmpegUtil {

	public static Logger logger = LoggerFactory.getLogger(FfmpegUtil.class);

	/**
	* @Function: FfmpegUtil.java
	* @Description: 使用ffmpeg获取视频总时间（秒）
	*
	* @param:
	* @return：void
	* @throws：异常描述
	*
	* @version: v1.0.0
	* @author: yuxianfeng
	* @date: 2018年12月3日 下午4:45:15
	*/
	public static int getVideoTime(String video_path) {

		List<String> commands = new ArrayList<>();
		commands.add("ffmpeg");
		commands.add("-i");
		commands.add(video_path);
		try {
			ProcessBuilder builder = new ProcessBuilder();
			builder.command(commands);
			Process p = builder.start();

			// 从输入流中读取视频信息
			BufferedReader br = new BufferedReader(new InputStreamReader(p.getErrorStream()));
			StringBuilder stringBuilder = new StringBuilder();
			String line = "";
			while ((line = br.readLine()) != null) {
				stringBuilder.append(line);
			}
			br.close();

			// 从视频信息中解析时长
			String regexDuration = "Duration: (.*?), start: (.*?), bitrate: (\\d*) kb\\/s";
			Pattern pattern = Pattern.compile(regexDuration);
			Matcher m = pattern.matcher(stringBuilder.toString());
			if (m.find()) {
				int time = getTimelen(m.group(1));

				return time;
				// System.out.println("视频时长：" + time + "s , 开始时间：" + m.group(2) + ", 比特率：" +
				// m.group(3) + "kb/s");
			}

			/*
			 * String regexVideo = "Video: (.*?), (.*?), (.*?)[,\\s]"; pattern =
			 * Pattern.compile(regexVideo); m = pattern.matcher(stringBuilder.toString());
			 * if (m.find()) { System.out.println("编码格式：" + m.group(1) + ", 视频格式：" +
			 * m.group(2) + ", 分辨率：" + m.group(3) + "kb/s"); }
			 */
		} catch (Exception e) {
			e.printStackTrace();
		}

		return 0;
	}

	// 格式:"00:00:10.68"
	private static int getTimelen(String timelen) {
		int min = 0;
		String strs[] = timelen.split(":");
		if (strs[0].compareTo("0") > 0) {
			// 秒
			min += Integer.valueOf(strs[0]) * 60 * 60;
		}
		if (strs[1].compareTo("0") > 0) {
			min += Integer.valueOf(strs[1]) * 60;
		}
		if (strs[2].compareTo("0") > 0) {
			min += Math.round(Float.valueOf(strs[2]));
		}
		return min;
	}

	/**
	* @Function: FfmpegUtil.java
	* @Description: 使用ffprobe提取视频元数据
	*
	* @param:
	* @return：void
	* @throws：异常描述
	*
	* @version: v1.0.0
	* @author: yuxianfeng
	* @date: 2019年3月5日 下午5:30:06
	*/
	public static String getVideoMetadata(String videoPath) {
		String videoMetadata = "";
		try {
			// 创建不同平台命令
			String cmd = null;
			String osName = System.getProperties().getProperty("os.name");
			if (osName.startsWith("Windows")) {
				cmd = "cmd /c ffprobe.exe -v quiet -print_format json -show_format -show_streams " + videoPath;
			} else if (osName.startsWith("Linux")) {
				cmd = "ffprobe -v quiet -print_format json -show_format -show_streams " + videoPath;
			} else {
				logger.info("not support OS");
				return videoMetadata;
			}

			// java调用命令行
			logger.info("getVideoMetadata---cmd=" + cmd);
			Process process = Runtime.getRuntime().exec(cmd);
			FfprobeProcessStream errorProcessStream = new FfprobeProcessStream(process.getErrorStream(), "Error");
			FfprobeProcessStream inputProcessStream = new FfprobeProcessStream(process.getInputStream(), "Info");

			errorProcessStream.start();
			inputProcessStream.start();
			process.waitFor();

			videoMetadata = inputProcessStream.getOutputInfo();

			errorProcessStream.destroy();
			inputProcessStream.destroy();
			process.destroy();
		} catch (IOException | InterruptedException e) {
			e.printStackTrace();
		}

		return videoMetadata;
	}

	/**
	* @Function: FfmpegUtil.java
	* @Description: 视频转换编码格式(根据outFilePath后缀)
	* 若成功则删除原有文件
	*
	* @param:
	* @return：boolean
	* @throws：异常描述
	*
	* @version: v1.0.0
	* @author: yuxianfeng
	* @date: 2019年2月28日 下午5:28:50
	*/
	public static boolean videoTranscoding(String inputFilePath, String outFilePath) {
		try {
			File outFile = new File(outFilePath);
			if (!outFile.getParentFile().exists()) {
				outFile.getParentFile().mkdirs();// 目录不存在的情况下，创建目录。
			}
			if (outFile.exists()) {
				outFile.delete();
			}

			// 创建不同平台命令
			String cmd = null;
			String osName = System.getProperties().getProperty("os.name");
			if (osName.startsWith("Windows")) {
				cmd = "cmd /c ffmpeg.exe -y -i {0} -vcodec copy -acodec copy {1}";
			} else if (osName.startsWith("Linux")) {
				cmd = "ffmpeg -y -i {0} -vcodec copy -acodec copy {1}";
			} else {
				logger.info("not support OS");
				return false;
			}

			// java调用命令行
			cmd = MessageFormat.format(cmd, inputFilePath, outFilePath);
			Process videoProcess = Runtime.getRuntime().exec(cmd);
			logger.info("videoTranscoding---cmd=" + cmd);
			PrintStream errorPrintStream = new PrintStream(videoProcess.getErrorStream(), "Error");
			PrintStream outPrintStream = new PrintStream(videoProcess.getInputStream(), "Info");

			errorPrintStream.start();
			outPrintStream.start();
			videoProcess.waitFor();

			// 关闭两个线程
			outPrintStream.destroy();
			errorPrintStream.destroy();
			// 关闭命令主进程
			videoProcess.destroy();

			File newFile = new File(outFilePath);
			File oldFile = new File(inputFilePath);
			if (newFile.exists()) {
				if (newFile.length() < 1048576) { // 1Mb
					newFile.delete();
					return false;
				} else {
					oldFile.delete();
					return true;
				}
			} else {
				return false;
			}

		} catch (Exception e) {
			return false;
		}
	}

	/**
	* @Function: FfmpegUtil.java
	* @Description: 改变视频码率
	*
	* @param:
	* @return：boolean
	* @throws：异常描述
	*
	* @version: v1.0.0
	* @author: yuxianfeng
	* @date: 2019年3月11日 下午8:00:56
	*/
	public static boolean changeBitRate(String inputFilePath, String outFilePath) {
		try {
			File outFile = new File(outFilePath);
			if (!outFile.getParentFile().exists()) {
				outFile.getParentFile().mkdirs();// 目录不存在的情况下，创建目录。
			}
			if (outFile.exists()) {
				outFile.delete();
			}

			// 创建不同平台命令
			String cmd = null;
			String osName = System.getProperties().getProperty("os.name");
			if (osName.startsWith("Windows")) {
				cmd = "cmd /c ffmpeg.exe -y -i {0} -b:v 2M -minrate 2M -maxrate 2M -bufsize 4M {1}";
			} else if (osName.startsWith("Linux")) {
				cmd = "ffmpeg -y -i {0} -b:v 2M -minrate 2M -maxrate 2M -bufsize 4M {1}";
			} else {
				logger.info("not support OS");
				return false;
			}

			// java调用命令行
			cmd = MessageFormat.format(cmd, inputFilePath, outFilePath);
			Process videoProcess = Runtime.getRuntime().exec(cmd);
			logger.info("changeBitRate---cmd=" + cmd);
			PrintStream errorPrintStream = new PrintStream(videoProcess.getErrorStream(), "Error");
			PrintStream outPrintStream = new PrintStream(videoProcess.getInputStream(), "Info");

			errorPrintStream.start();
			outPrintStream.start();
			videoProcess.waitFor();

			// 关闭两个线程
			outPrintStream.destroy();
			errorPrintStream.destroy();
			// 关闭命令主进程
			videoProcess.destroy();

			File newFile = new File(outFilePath);
			File oldFile = new File(inputFilePath);
			if (newFile.exists()) {
				if (newFile.length() < 1048576) { // 1Mb
					newFile.delete();
					return false;
				} else {
					oldFile.delete();
					return true;
				}
			} else {
				return false;
			}

		} catch (Exception e) {
			return false;
		}
	}

	/**
	* @Function: FfmpegUtil.java
	* @Description: 双音频分离,若有字幕文件则添加
	*
	* @param:
	* @return：boolean
	* @throws：异常描述
	*
	* @version: v1.0.0
	* @author: yuxianfeng
	* @date: 2019年3月9日 下午4:25:54
	*/
	public static boolean dualAudioSeparation(String inputFilePath, String outFilePath, String subtitlePath,
                                              String videoIndex, String audioIndex) {
		try {
			File outFile = new File(outFilePath);
			if (!outFile.getParentFile().exists()) {
				outFile.getParentFile().mkdirs();// 目录不存在的情况下，创建目录。
			}
			if (outFile.exists()) {
				outFile.delete();
			}

			// 创建不同平台命令
			String cmd = null;
			String osName = System.getProperties().getProperty("os.name");

			// 若有字幕文件则添加
			if (subtitlePath != "" && subtitlePath != null) {
				cmd = "-y -i " + inputFilePath + " -sub_charenc UTF-8 -i " + subtitlePath + " -map 0:" + videoIndex
						+ " -vcodec copy -map 0:" + audioIndex
						+ " -acodec copy -map 1 -scodec srt -metadata:s:s:0 language=por -disposition:s:0 default " + outFilePath;
			} else {
				cmd = "-y -i " + inputFilePath + " -map 0:" + videoIndex + " -vcodec copy -map 0:" + audioIndex
						+ " -acodec copy " + outFilePath;
			}

			if (osName.startsWith("Windows")) {
				cmd = "cmd /c ffmpeg.exe " + cmd;
			} else if (osName.startsWith("Linux")) {
				cmd = "ffmpeg " + cmd;
			} else {
				logger.info("not support OS");
				return false;
			}

			// java调用命令行
			Process videoProcess = Runtime.getRuntime().exec(cmd);
			logger.info("dualAudioSeparation---cmd=" + cmd);
			PrintStream errorPrintStream = new PrintStream(videoProcess.getErrorStream(), "Error");
			PrintStream outPrintStream = new PrintStream(videoProcess.getInputStream(), "Info");

			errorPrintStream.start();
			outPrintStream.start();
			videoProcess.waitFor();

			// 关闭两个线程
			outPrintStream.destroy();
			errorPrintStream.destroy();
			// 关闭命令主进程
			videoProcess.destroy();

			File newFile = new File(outFilePath);
			if (newFile.exists()) {
				if (newFile.length() < 1048576) { // 1Mb
					newFile.delete();
					return false;
				} else {
					return true;
				}
			} else {
				return false;
			}

		} catch (Exception e) {
			return false;
		}
	}

	/**
	* @Function: FfmpegUtil.java
	* @Description: 给视频添加字幕<br>
	      * 字幕文件格式为str
	*
	* @param:
	* @return：boolean
	* @throws：异常描述
	*
	* @version: v1.0.0
	* @author: yuxianfeng
	* @date: 2019年3月20日 下午5:32:07
	*/
	public static boolean videoAddSubtitle(String inputVideoFilePath, String outVideoFilePath,
                                           String subtitleFilePath) {
		try {
			File outFile = new File(outVideoFilePath);
			if (!outFile.getParentFile().exists()) {
				outFile.getParentFile().mkdirs();// 目录不存在的情况下，创建目录。
			}
			if (outFile.exists()) {
				outFile.delete();
			}

			// 创建不同平台命令
			String cmd = null;
			String osName = System.getProperties().getProperty("os.name");
			if (osName.startsWith("Windows")) {
				cmd = "cmd /c ffmpeg.exe -y -i " + inputVideoFilePath + " -sub_charenc UTF-8 -i " + subtitleFilePath
						+ " -vcodec copy -acodec copy -scodec srt -metadata:s:s:0 language=por -disposition:s:0 default " + outVideoFilePath;
			} else if (osName.startsWith("Linux")) {
				cmd = "ffmpeg -y -i " + inputVideoFilePath + " -sub_charenc UTF-8 -i " + subtitleFilePath
						+ " -vcodec copy -acodec copy -scodec srt -metadata:s:s:0 language=por -disposition:s:0 default " + outVideoFilePath;
			} else {
				logger.info("not support OS");
				return false;
			}

			// java调用命令行
			Process videoProcess = Runtime.getRuntime().exec(cmd);
			logger.info("videoAddSubtitle---cmd=" + cmd);
			PrintStream errorPrintStream = new PrintStream(videoProcess.getErrorStream(), "Error");
			PrintStream outPrintStream = new PrintStream(videoProcess.getInputStream(), "Info");

			errorPrintStream.start();
			outPrintStream.start();
			videoProcess.waitFor();

			// 关闭两个线程
			outPrintStream.destroy();
			errorPrintStream.destroy();
			// 关闭命令主进程
			videoProcess.destroy();

			File newFile = new File(outVideoFilePath);
			File oldFile = new File(inputVideoFilePath);
			if (newFile.exists()) {
				if (newFile.length() < 1048576) { // 1Mb
					newFile.delete();
					return false;
				} else {
					oldFile.delete();
					return true;
				}
			} else {
				return false;
			}

		} catch (Exception e) {
			return false;
		}
	}

	/**
	* @Function: FfmpegUtil.java
	* @Description: 修改文件夹权限
	*
	* @param:
	* @return：void
	* @throws：异常描述
	*
	* @version: v1.0.0
	* @author: yuxianfeng
	* @date: 2019年3月14日 下午7:52:31
	*/
	public static void chmodChange(String chmod, String filePath) {
		// 修改文件夹权限
		String cmd = "chmod -R {0} {1}";
		cmd = MessageFormat.format(cmd, chmod, filePath);
		try {
			logger.info("修改文件夹权限，cmd=" + cmd);
			Runtime.getRuntime().exec(cmd);
		} catch (IOException e) {
			logger.error("修改文件夹权限出现错误");
		}
	}

	/**
	* @Title: subtitleTranscoding
	* @Description: TODO(字幕格式转换,vtt,srt,ass)<br>
	* inputSubtitleFilePath 例如：/home/data/vod/subtitle/a.vtt	<br>
	* outputSubtitleFilePath 例如：/home/data/vod/subtitle/a.srt	<br>
	*
	* @parameter @param inputSubtitleFilePath
	* @parameter @param outputSubtitleFilePath
	* @parameter @return	参数
	* @return boolean	返回类型
	*/
	public static boolean subtitleTranscoding(String inputSubtitleFilePath, String outputSubtitleFilePath) {
		try {
			File outFile = new File(outputSubtitleFilePath);
			if (!outFile.getParentFile().exists()) {
				outFile.getParentFile().mkdirs();// 目录不存在的情况下，创建目录。
			}
			if (outFile.exists()) {
				outFile.delete();
			}

			// 创建不同平台命令
			String cmd = null;
			String osName = System.getProperties().getProperty("os.name");
			if (osName.startsWith("Windows")) {
				cmd = "cmd /c ffmpeg.exe -y -sub_charenc UTF-8 -i " + inputSubtitleFilePath + " " + outputSubtitleFilePath;
			} else if (osName.startsWith("Linux")) {
				cmd = "ffmpeg -y -sub_charenc UTF-8 -i " + inputSubtitleFilePath + " " + outputSubtitleFilePath;
			} else {
				logger.info("not support OS");
				return false;
			}

			// java调用命令行
			Process videoProcess = Runtime.getRuntime().exec(cmd);
			logger.info("subtitleTranscoding---cmd=" + cmd);
			PrintStream errorPrintStream = new PrintStream(videoProcess.getErrorStream(), "Error");
			PrintStream outPrintStream = new PrintStream(videoProcess.getInputStream(), "Info");

			errorPrintStream.start();
			outPrintStream.start();
			videoProcess.waitFor();

			// 关闭两个线程
			outPrintStream.destroy();
			errorPrintStream.destroy();
			// 关闭命令主进程
			videoProcess.destroy();

			File newFile = new File(outputSubtitleFilePath);
			File oldFile = new File(inputSubtitleFilePath);
			if (newFile.exists()) {
				if (newFile.length() < 1024) { // 1kb
					newFile.delete();
					return false;
				} else {
					oldFile.delete();
					return true;
				}
			} else {
				return false;
			}

		} catch (Exception e) {
			return false;
		}
	}



	/**
	* @Title: imgTranscoding
	* @Description: TODO((图片格式转换,jpg,png...)<br>
	* inputSubtitleFilePath 例如：/home/data/vod/subtitle/a.png	<br>
	* outputSubtitleFilePath 例如：/home/data/vod/subtitle/a.jpg	<br>
	*
	* @parameter @param inputImgFilePath
	* @parameter @param outputImgFilePath
	* @parameter @return	参数
	* @return boolean	返回类型
	*/
	public static boolean imgTranscoding(String inputImgFilePath, String outputImgFilePath) {
		try {
			File outFile = new File(outputImgFilePath);
			if (!outFile.getParentFile().exists()) {
				outFile.getParentFile().mkdirs();// 目录不存在的情况下，创建目录。
			}
			if (outFile.exists()) {
				outFile.delete();
			}

			// 创建不同平台命令
			String cmd = null;
			String osName = System.getProperties().getProperty("os.name");
			if (osName.startsWith("Windows")) {
				cmd = "cmd /c ffmpeg.exe -y -i " + inputImgFilePath + " -c copy " + outputImgFilePath;
			} else if (osName.startsWith("Linux")) {
				cmd = "ffmpeg -y -i " + inputImgFilePath + " -c copy " + outputImgFilePath;
			} else {
				logger.info("not support OS");
				return false;
			}

			// java调用命令行
			Process videoProcess = Runtime.getRuntime().exec(cmd);
			logger.info("imgTranscoding---cmd=" + cmd);
			PrintStream errorPrintStream = new PrintStream(videoProcess.getErrorStream(), "Error");
			PrintStream outPrintStream = new PrintStream(videoProcess.getInputStream(), "Info");

			errorPrintStream.start();
			outPrintStream.start();
			videoProcess.waitFor();

			// 关闭两个线程
			outPrintStream.destroy();
			errorPrintStream.destroy();
			// 关闭命令主进程
			videoProcess.destroy();

			File newFile = new File(outputImgFilePath);
			File oldFile = new File(inputImgFilePath);
			if (newFile.exists()) {
				if (newFile.length() < 1024) { // 1kb
					newFile.delete();
					return false;
				} else {
					oldFile.delete();
					return true;
				}
			} else {
				return false;
			}

		} catch (Exception e) {
			return false;
		}
	}

}
