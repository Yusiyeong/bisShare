package com.bs.common;

import java.io.File;
import java.io.IOException;

import org.springframework.web.multipart.MultipartFile;

public class FileUploader {

public static String fileUpload(MultipartFile f, String savePath) {
		
		// 원본파일명 
		String originName = f.getOriginalFilename();
		
		File target = new File(savePath + originName);
		
		try {
			f.transferTo(target);
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		return originName;
		
	}

	public static String fileUploadWithChangName(MultipartFile f, String savePath) {
		
		String originName = f.getOriginalFilename();
		String ext = originName.substring( originName.lastIndexOf(".") );
		
		long now = System.currentTimeMillis();
		int random = (int)(Math.random() * 90000 + 10000);
		String changeName = now + "_" + random + ext;
		
		File target = new File(savePath + changeName);
		
		try {
			f.transferTo(target);
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		return changeName;
		
	}


}//class
