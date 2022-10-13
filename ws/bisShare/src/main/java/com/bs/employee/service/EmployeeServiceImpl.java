package com.bs.employee.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.mybatis.spring.SqlSessionTemplate;

import com.bs.employee.dao.EmployeeDao;
import com.bs.employee.vo.EmployeeVo;

@Service
public class EmployeeServiceImpl implements EmployeeService {

	private final EmployeeDao md;
	private final SqlSessionTemplate sst;
	private final PasswordEncoder enc;
	
	@Autowired
	public EmployeeServiceImpl(EmployeeDao md, SqlSessionTemplate sst, PasswordEncoder enc) {
		super();
		this.md = md;
		this.sst = sst;
		this.enc = enc;
	}
	
	@Override
	public EmployeeVo login(EmployeeVo ev) {
		
		EmployeeVo dbMember = md.selectOneById(sst, ev.getId());
		
		if(enc.matches(ev.getPwd(), dbMember.getPwd())) {
			return dbMember;
		} else {
			return null;
		}
	}

	
}
