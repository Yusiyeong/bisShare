package com.bs.cloud.vo;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class CloudAttVo {		// 필요없어서 그냥 지워도 될 듯 (파일 여러개 아니고 한개만 다운 받으니까)

	private String attNo;
	private String bno;
	private String originName;
	private String changeName;
	private String profilePath;	 		// == fileName
	private MultipartFile[] profile;		// 추가 함
	private String uploadDate;
	
}//class
