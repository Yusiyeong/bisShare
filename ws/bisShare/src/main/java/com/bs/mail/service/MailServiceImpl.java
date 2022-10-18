package com.bs.mail.service;

import java.util.Iterator;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bs.employee.vo.EmployeeVo;
import com.bs.mail.dao.MailDao;
import com.bs.mail.vo.MailVo;

@Service
public class MailServiceImpl implements MailService{
	
	private final MailDao md;
	private final SqlSessionTemplate sst;
	
	@Autowired
	public MailServiceImpl(MailDao md, SqlSessionTemplate sst) {
		this.md = md;
		this.sst = sst;
	}


	/**
	 * 메일 발송
	 */
	@Override
	public int write(MailVo mv, List<EmployeeVo> recList, List<EmployeeVo> refList) {
		
		int result = md.insertOne(sst,mv);
		
		for(int i = 0; i<recList.size() ; i++) {
			recList.get(i).getEmpNo();
		}
		for(int i=0; i<refList.size(); i++) {
			refList.get(i).getEmpNo();
		}
		
		return result;
	}

	/**
	 * 받은 메일 전부
	 */
	@Override
	public List<MailVo> receive(String empNo) {
		return md.selectAll(sst,empNo);
	}

	/**
	 *	중요 표시 변경 
	 */
	@Override
	public String checkStar(String mailNo) {
		
		String star = md.selectStar(sst,mailNo);
		String changeStar = "";
		
		if(star.equals("Y")) {
			changeStar = "'N'";
		} else {
			changeStar = "'Y'";
		}
		MailVo mv = new MailVo();
		mv.setMailNo(mailNo);
		mv.setStar(changeStar);
		
		md.updateStar(sst,mv);
		
		return changeStar;
	}


	@Override
	public MailVo detail(String mailNo) {
		
//		읽음표시하기
		md.updateReadYn(sst,mailNo);
		
		return md.selectOne(sst,mailNo);
	}


	@Override
	public List<MailVo> star(String empNo) {
		return md.selectStarList(sst,empNo);
	}


	@Override
	public String notRead(String empNo) {
		return md.selectnotReadCnt(sst,empNo);
	}

}
