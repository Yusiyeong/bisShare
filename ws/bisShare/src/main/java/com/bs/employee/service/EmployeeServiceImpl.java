package com.bs.employee.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import com.bs.employee.dao.EmployeeDao;
import com.bs.employee.vo.EmployeeVo;

@Service
public class EmployeeServiceImpl implements EmployeeService {

	private final EmployeeDao md;
	private final SqlSessionTemplate sst;
	private final PasswordEncoder enc;		//암호화
	
	@Autowired
	public EmployeeServiceImpl(EmployeeDao md, SqlSessionTemplate sst, PasswordEncoder enc) {
		super();
		this.md = md;
		this.sst = sst;
		this.enc = enc;
	}
	
	// 로그인
	@Override
	public EmployeeVo login(EmployeeVo ev) {
		
		EmployeeVo dbMember = md.selectOneById(sst, ev.getId());
		
		if(enc.matches(ev.getPwd(), dbMember.getPwd())) {
			return dbMember;
		} else {
			return null;
		}
	}//login

	// 사원등록
	@Override
	public int insertMember(EmployeeVo ev) {

		// 암호화
		ev.encodePwd(enc);
		
		return md.insertOne(sst, ev);
		
		
	}//insertMember

	@Override
	public List<EmployeeVo> getList() {
		return md.getList(sst);
	}


	
}//class
