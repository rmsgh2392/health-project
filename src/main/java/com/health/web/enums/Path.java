package com.health.web.enums;

import java.io.File;

public enum Path {
 UPLOAD_PATH;
	
	@Override
	public String toString() {
		String result = "";
		switch (this) {
		case UPLOAD_PATH:
			result = File.separator+"usr"+File.separator+"local"+File.separator+"tomcat9"+File.separator+"webapps"+File.separator+"ROOT"+File.separator+"resources"+File.separator+"upload"+File.separator;
			break;
		}
		return result;
	}
}
