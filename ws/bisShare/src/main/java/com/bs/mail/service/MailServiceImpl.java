package com.bs.mail.service;

import java.util.Iterator;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.bs.employee.vo.EmployeeVo;
import com.bs.mail.dao.MailDao;
import com.bs.mail.vo.MailAttVo;
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
	@Transactional
	public int write(MailVo mv, List<EmployeeVo> recList, List<EmployeeVo> refList) {
		
		int result = md.insertOne(sst,mv);
		
		for(int i = 0; i<recList.size() ; i++) {
			if (refList != null) {
				for(int j=0; j<refList.size(); j++) {
					System.out.println(recList.get(i).getValue());
					String rec = recList.get(i).getValue();
					String ref = refList.get(j).getValue();
					mv.setReceive(rec);
					mv.setReference(ref);
					
					md.insertRecInfo(sst,mv);
				}
			} else {
				String rec = recList.get(i).getValue();
				mv.setReceive(rec);
				mv.setReference(null);
				md.insertRecInfo(sst,mv);
			}
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

/**
 * 상세보기
 */
	@Override
	public MailVo detail(MailVo mv) {
		
//		읽음표시하기
		md.updateReadYn(sst,mv);
		
		MailVo vo = md.selectOne(sst,mv);
		
		List<MailAttVo> mavList = md.selectFilePath(sst,mv);
		
		vo.setMavList(mavList);
		return vo;
	}


	@Override
	public List<MailVo> star(String empNo) {
		return md.selectStarList(sst,empNo);
	}


	@Override
	public String notRead(String empNo) {
		return md.selectnotReadCnt(sst,empNo);
	}


	@Override
	public void insertMailAtt(MailAttVo mav) {
		md.insertMailAtt(sst,mav);
	}

}
