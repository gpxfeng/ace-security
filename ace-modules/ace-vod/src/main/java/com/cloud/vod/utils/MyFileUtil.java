package com.cloud.vod.utils;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import org.apache.commons.lang3.ArrayUtils;

import java.io.*;
import java.net.HttpURLConnection;
import java.net.URL;
import java.text.DecimalFormat;
import java.util.List;

public class MyFileUtil {
	/**
	 * 将爬取的数据转出Json格式
	 *
	 * @param date
	 * @param timeList
	 * @param titleList
	 * @return
	 */
	public static JSONObject getJson(String date, List<String> timeList, List<String> titleList) {
		JSONArray prgItem = new JSONArray();
		for (int i = 0; i < timeList.size(); i++) {
			JSONObject jsonObject = new JSONObject();
			jsonObject.put("time", timeList.get(i).replace("~", "-"));
			jsonObject.put("name", titleList.get(i));
			prgItem.add(jsonObject);
		}

		JSONObject timeTable = new JSONObject();
		JSONObject item = new JSONObject();
		JSONObject itemValue = new JSONObject();
		itemValue.put("name", date);
		itemValue.put("date", date);
		itemValue.put("prgItem", prgItem);
		item.put("item", itemValue);
		timeTable.put("timeTable", item);

		return timeTable;
	}

	/**
	 * 创建文件
	 *
	 * @param jsonObject
	 * @param path
	 */
	public static boolean creationFile(JSONObject jsonObject, String path) {
		File file = new File(path);

		if (!file.getParentFile().exists()) {
			file.mkdirs();// 目录不存在的情况下，创建目录。
		}

		Writer io = null;
		try {
			if (file.exists()) {
				file.delete();
				file.createNewFile();
			} else {
				file.createNewFile();
			}

			io = new FileWriter(file);
			io.write(jsonObject.toJSONString());
			return true;
		} catch (IOException e) {
			e.printStackTrace();
			return false;
		} finally {
			try {
				io.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	}

    /**
    * @Function: PipelineBase.java
    * @Description: 转换文件大小
    *
    * @param:
    * @return：String
    * @throws：异常描述
    *
    * @version: v1.0.0
    * @author: yuxianfeng
    * @date: 2019年2月27日 下午4:58:05
    */
    public static String formetFileSize(long fileS) {
        DecimalFormat df = new DecimalFormat("#.00");
        String fileSizeString = "";
        String wrongSize = "0B";
        if (fileS == 0) {
            return wrongSize;
        }
        if (fileS < 1024) {
            fileSizeString = df.format((double) fileS) + "B";
        } else if (fileS < 1048576) {
            fileSizeString = df.format((double) fileS / 1024) + "KB";
        } else if (fileS < 1073741824) {
            fileSizeString = df.format((double) fileS / 1048576) + "MB";
        } else {
            fileSizeString = df.format((double) fileS / 1073741824) + "GB";
        }
        return fileSizeString;
    }

	public static void downloadPicture(String urlStr, String path) {
		try {

			URL url = new URL(urlStr);
			HttpURLConnection conn = (HttpURLConnection) url.openConnection();
			conn.setRequestProperty("User-Agent",
					"Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/61.0.3163.100 Safari/537.36)"); // 防止报403错误。

			conn.setRequestMethod("GET"); // 声明请求方式
			conn.setConnectTimeout(3000); // 设置连接超时
			if (conn.getResponseCode() == 200) {
				InputStream inputStream = conn.getInputStream(); // 得到一个输入流

				// 从服务端返回数据，相对客户端为流入
				byte[] data = readInstream(inputStream); // 得到数据
				File file = new File(path); // 创建保存文件
				FileOutputStream outputStream = new FileOutputStream(file);// 创建一个文件的输出流

				outputStream.write(data); // 把所有的二进值数据全部写入到我们建好的文件中
				outputStream.close(); // 关闭输出流
				System.out.println("下载完成！");
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	// 读取流文件的内容
	private static byte[] readInstream(InputStream inputStream) throws Exception {


		ByteArrayOutputStream byteArrayOutputStream = new ByteArrayOutputStream(); // 创建ByteArrayOutputStream
																					// 对象
		byte[] buffer = new byte[1024]; // 声明缓冲区
		int length = -1; // 定义读取默认长度

		while ((length = inputStream.read(buffer)) != -1) {
			byteArrayOutputStream.write(buffer, 0, length);
			// 把缓存区中输出到内存中
		}
		;
		byteArrayOutputStream.close(); // 关闭输出流
		inputStream.close(); // 关闭输入流

		return byteArrayOutputStream.toByteArray();
		// 返回这个输出流的字节数组
	}

	/**
	 * 递归删除目录下的所有文件及子目录下所有文件
	 *
	 * @param dir
	 * @return
	 */
	public static boolean deleteDir(File dir) {
		if (dir.isDirectory()) {
			String[] children = dir.list();
			for (int i = 0; i  < children.length; i++) {
				boolean success = deleteDir(new File(dir, children[i]));
				if (!success) {
					return false;
				}
			}
		}
		return dir.delete();
	}

	public static String[] removeArrayElement(String[] arr, String val) {
		int resultLen = 0;
		String[] resultArr=new String[arr.length-1];
		for (int i = 0; i < arr.length; i++) {
			if (!arr[i].equals(val)) {
				resultArr[resultLen] = arr[i];
				resultLen++;
			}
		}
		 return resultArr;
	}


	public static void main(String[] args) {
		String[] a= {"a","b","c"};

		a=removeArrayElement(a, "b");
		System.out.println(ArrayUtils.toString(a));
	}



}
