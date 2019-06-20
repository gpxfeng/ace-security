package com.cloud.vod.utils.force;

import lombok.extern.slf4j.Slf4j;

import java.util.Base64;
import javax.crypto.Cipher;
import javax.crypto.spec.IvParameterSpec;
import javax.crypto.spec.SecretKeySpec;

@SuppressWarnings("unused")
@Slf4j
public class DES {
    private static byte[] iv = new byte[]{(byte) 0, (byte) 0, (byte) 0, (byte) 0, (byte) 0, (byte) 0, (byte) 0, (byte) 0};

    public static String encryptDESURL(String encryptString, String encryptKey) throws Exception {
        IvParameterSpec zeroIv = new IvParameterSpec(iv);
        SecretKeySpec key = new SecretKeySpec(encryptKey.getBytes(), "DES");
        Cipher cipher = Cipher.getInstance("DES");
        cipher.init(Cipher.ENCRYPT_MODE, key);
        byte[] encryptedData = cipher.doFinal(encryptString.getBytes("utf-8"));
        String content = Base64.getEncoder().encodeToString(encryptedData);
        content = content.replaceAll("\n", "").trim();
        return content;
    }

    public static String decryptDESURL(String decryptString, String decryptKey) throws Exception {
        byte[] byteMi = Base64.getDecoder().decode(decryptString);
        IvParameterSpec zeroIv = new IvParameterSpec(iv);
        SecretKeySpec key = new SecretKeySpec(decryptKey.getBytes(), "DES");
        Cipher cipher = Cipher.getInstance("DES");
        cipher.init(Cipher.DECRYPT_MODE, key);
        return new String(cipher.doFinal(byteMi));
    }

    public static String encryptDESContent(String encryptString, String encryptKey) throws Exception {
        IvParameterSpec zeroIv = new IvParameterSpec(iv);
        SecretKeySpec key = new SecretKeySpec(encryptKey.getBytes(), "DES");
        Cipher cipher = Cipher.getInstance("DES");
        cipher.init(Cipher.ENCRYPT_MODE, key);
        byte[] encryptedData = cipher.doFinal(encryptString.getBytes("utf-8"));

        String content = Base64.getEncoder().encodeToString(encryptedData);
        content = content.replaceAll("\n", "").trim();
        return content;
    }

    public static String decryptDESContent(String decryptString, String decryptKey) throws Exception {
        byte[] byteMi = Base64.getDecoder().decode(decryptString);
        IvParameterSpec zeroIv = new IvParameterSpec(iv);
        SecretKeySpec key = new SecretKeySpec(decryptKey.getBytes(), "DES");
        Cipher cipher = Cipher.getInstance("DES");
        cipher.init(Cipher.DECRYPT_MODE, key);
        return new String(cipher.doFinal(byteMi));
    }

    public static void main(String[] args) {
		try {
			String aa = "{\"clienttype\":\"2\", \"system\":\"AUDISAT_A5\", \"model\":\"AUDISAT_A5\", \"brand\":\"SUN1507E\", \"launcher\":\"AUDISAT_A5\", \"mac\":\"3C0003000081\", \"stbid\":\"6600030000000E\", \"chipid\":\"D265B4B70B2E3335\", \"name\":\"Beans_VOD\", \"versioncode\":\"1295\", \"timemillis\":\"599465408\", \"sign\":\"d39a4fac8e3eecb65f3e4d6b6c6f70b9\"}";
			aa = "{ \"clienttype\": \"2\", \"system\": \"AUDISAT_A2\", \"model\": \"AUDISAT_A2\", \"brand\": \"ALI3526\", \"launcher\": \"AUDISAT_A2\", \"mac\": \"14212b592c91\", \"stbid\": \"84030400\", \"chipid\": \"02E215212B592C91\", \"name\": \"Beans_VOD\", \"versioncode\": \"1240\", \"timemillis\": \"3338685808\", \"sign\": \"13b677f7d55da4dfa7238b373eb9c3c0\" }";
			System.out.println(new String(aa.getBytes()));
			String bb = encryptDESURL(aa, "content=");
			System.out.println(bb);
			String cc = decryptDESURL(bb, "content=");
			System.out.println(cc);
		} catch (Exception e) {
			e.printStackTrace();
		}
//		String str = "a_4q5wrrmynm5ezhe9ifzh7mtxffvqtsb7r5ibatx70lhpbe8qiui56b7brzyjjommu5rudcvxjalzj2jcvsjlrmvawq8vpika7xxc3kyuqmvzb-1u_7tlqq_sxdm2mitqdzaq0mtmxjypc4iurxbt7mblfqe3x5xyc5qcbwq82fene4he6dpgq4i7ccd1yulcij9ahum29n60lc242ufcl6kfg8jhyfvvfj8wey7-y37shi9wvn4azgvdprj6awgiuz9_we_7ce2vl4x-kqff4ep0iafrjtfpaugezhlv-xythdqsznnnsoxxne1fw_kki0yz3ck2lhc_pu7cacokp0dmwo31ex";

		String str = "5t9YY9J595LinUaMHgyMQprO2TQQu_-kuRbrf_kdTyvaPJ2b48BQl40GTCHUsBGQ_c2wD1v7T4d-5dKvTI7C6r9zM9rUj_3gdvM6wawZu5WQ3PO-nzcvh4ze_puexJScVny8QPM5NC7YGEXUyZS0NjdeeeG24SlcLlkEUaFwev0Q25M_iC_DV9MaIj5PakZZnvsJYdyUsFbK6F6pl_8zmhkPA_dLyxbjoNFg0xl6nR2CpIAamga6uBLoEyq-0fnj-0UOwWGmrD1G0PGBQv7OoYDcvtEeBMk6R8demXLKvsB43qqzGxvz4kId0AcADOUHDr2a6kjQwuxutDGpcNeAHaUbBaxrMorxTY5Lsp6geWrMSo_BmTOzO7ZS8pSwIT-iLPU5wytP7NM3zRWYnzWnkleFIqLY9_ZklXIlhJ6onxZ4w6FmwPDWygN8TKtZstAXW7BtjNjJAnU=";
		try {
			str = decryptDESURL(str, "20171225");
			System.out.println(str);
		} catch (Exception e) {
			e.printStackTrace();
		}

	}
}
