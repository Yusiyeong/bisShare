package com.bs.employee.vo;

import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class EmployeeVo {
	
	private String empNo;
	private String id;
	private String pwd;
	private String nick;
	private String phone;
	private String email;
	private String address;
	private String ssNo;
	private String hireDate;
	private String salary;
	private String status;
	private String profilePath;			// == fileName
	private MultipartFile profile;		// 추가 함
	private String companyNo;
	private String deptNo;
	private String rankNo;
	
	
	// 암호화
	public void encodePwd(PasswordEncoder pwdEnc) {
		this.pwd = pwdEnc.encode(pwd);
	}//encodePwd
	
}//class
