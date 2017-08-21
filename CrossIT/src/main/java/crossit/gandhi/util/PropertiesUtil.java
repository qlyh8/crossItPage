package crossit.gandhi.util;

import java.util.ResourceBundle;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;


/**
 사용예 ) common.p﻿roperties  
 FileUploadPath=C:/eucom/upload

Class에서 사용예)
  public class OOOOOO {
    public static final String FileUploadPath = PropertiesUtil.getProperites("FileUploadPath");
  }
*/

public class PropertiesUtil {
	
	private transient final Logger logger = LoggerFactory.getLogger(getClass());

	private PropertiesUtil() { }; // 생성자 막음. new 로 생성안되도록.

	private static ResourceBundle bundle;

	private static String PROPERTIE_PATH = "common";

	static {
		bundle = ResourceBundle.getBundle(PROPERTIE_PATH);
	}

	/**
	 * 프로퍼티 파일의 정보를 얻는다.
	 * 
	 * @param key
	 * @return
	 */
	public static String getProperites(String key) {
		return bundle.getString(key);
	}

	public static int getPropertiesInt(String key) {
		String value = bundle.getString(key);

		try {
			return Integer.parseInt(value.trim());
		} catch (Exception e) {
			return -1;
		}
	}

	/**
	 * Properties 설정파일을 재로드 한다.
	 */
	public static void reloadPropertie() {
		if (bundle != null) {
			bundle = null;
		}
		bundle = ResourceBundle.getBundle(PROPERTIE_PATH);
	}

	/**
	 * Release properties
	 */
	public static void releaseProperties() {
		if (bundle != null) {
			bundle = null;
		}
	}
}
