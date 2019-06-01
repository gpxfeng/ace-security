/**
 * Copyright © 2019 eSunny Info. Tech Ltd. All rights reserved.
 *
 * 功能描述：
 * @Package: com.VodWebCrawler.cms.util.Process
 * @author: yuxianfeng
 * @date: 2019年2月28日 上午11:35:28
 */

package com.cloud.vod.utils.Process;

import com.sun.jna.Library;
import com.sun.jna.Native;

/**
* Copyright: Copyright (c) 2019 LanRu-Caifu
*
* @ClassName: Kernel32.java
* @Description: 该类的功能描述
*
* @version: v1.0.0
* @author: yuxianfeng
* @date: 2019年2月28日 上午11:35:28
*/
public interface Kernel32 extends Library{
    @SuppressWarnings("deprecation")
    public static Kernel32 INSTANCE = (Kernel32) Native.loadLibrary("kernel32", Kernel32.class);
    public long GetProcessId(Long hProcess);
}
