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

}//class
