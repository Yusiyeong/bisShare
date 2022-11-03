package com.bs.mail.service;

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
					String rec = recList.get(i).getValue();
					String ref = refList.get(j).getValue();
					mv.setReceive(rec);
					mv.setReference(ref);
					
					md.insertRecInfo(sst,mv);
				}
				String rec = recList.get(i).getValue();
				mv.setReceive(rec);
				mv.setReference(null);
				
				md.insertRecInfo(sst,mv);
				
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
	public String checkStar(MailVo mv) {
		
		String star = md.selectStar(sst,mv);
		String changeStar = "";
		
		if(star.equals("Y")) {
			changeStar = "'N'";
		} else {
			changeStar = "'Y'";
		}
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
		String references = md.selectReferences(sst,mv);
		vo.setReference(references);
		List<MailAttVo> mavList = md.selectFilePath(sst,mv);
		
		if(mavList.size() == 0) {
			mavList = null;
		}
		if (mavList != null) {
			vo.setMavList(mavList);
		}
		
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


	@Override
	public int delChecked(List<String> checkArr, EmployeeVo loginVo, int filter) {
		
		int result = 1;
		
		for(int i=0 ; i < checkArr.size() ; i++) {
			
			MailVo mv = new MailVo();
			mv.setReceive(loginVo.getEmpNo());
			mv.setMailNo(checkArr.get(i));
			if (filter == 0) {
				mv.setStatus("1");
			} else if (filter == 1) {
//				참조된 메일 삭제는 휴지통 X 바로 삭제
				mv.setReference(loginVo.getEmpNo());
				mv.setStatus("1");
			} else if (filter == 2) {
				mv.setStatus("1");
			} else if (filter == 3) {
				mv.setStatus("2");
			}
			int x = md.updateCheckStatus(sst, mv);
			result = result * x;
		}
		
		return result;
	}


	@Override
	public List<MailVo> reference(String empNo) {
		return md.reference(sst,empNo);
	}


	@Override
	public MailVo detailRef(MailVo mv) {
		
//		읽음표시하기
		md.updateReadYn(sst,mv);
		
		MailVo vo = md.selectRefOne(sst,mv);
		String references = md.selectRefForRef(sst,mv);
		vo.setReference(references);
		List<MailAttVo> mavList = md.selectFilePath(sst,mv);
		
		if(mavList.size() == 0) {
			mavList = null;
		}
		if (mavList != null) {
			vo.setMavList(mavList);
		}
		
		return vo;
	}


	@Override
	public List<MailVo> send(String empNo) {
		return md.selectSendList(sst,empNo);
	}


	@Override
	public MailVo detailSend(MailVo mv) {
		
		MailVo vo = md.selectSendOne(sst,mv);
		String references = md.selectSendReferences(sst,mv);
		vo.setReference(references);
		List<MailAttVo> mavList = md.selectFilePath(sst,mv);
		
		if(mavList.size() == 0) {
			mavList = null;
		}
		if (mavList != null) {
			vo.setMavList(mavList);
		}
		
		return vo;
	}


	@Override
	public List<MailVo> trashcan(String empNo) {
		return md.selectStatusOne(sst,empNo);
	}


	@Override
	public List<MailVo> detailTrash(MailVo mv) {
		
		
		List<MailVo> vo = md.selectTrashOne(sst,mv);

		List<MailVo> references = md.selectTrashReferences(sst,mv);
		if (references.size() > 0) vo.get(0).setReference(references.get(0).getReference());
		List<MailAttVo> mavList = md.selectFilePath(sst,mv);
		
		if(mavList.size() == 0) {
			mavList = null;
		}
		if (mavList != null) {
			vo.get(0).setMavList(mavList);
		}
		
		return vo;
	}


	@Override
	public List<MailVo> draft(String empNo) {
		return md.selectDraft(sst,empNo);
	}


	@Override
	public int draftWrite(MailVo mv, List<EmployeeVo> recList, List<EmployeeVo> refList) {
		
		int result = 0;
		
		String recStr = "";
		String refStr = "";
		
		for(EmployeeVo e : recList) {
			recStr += e.getNick() + ",";
		}
		String recStr1 = recStr.substring(0,recStr.length()-1);
		
		mv.setReceive(recStr1);
		
		if(refList != null) {
			for(EmployeeVo e : refList) {
				refStr += e.getNick() + ",";
			}
			String refStr1 = refStr.substring(0,refStr.length()-1);
			
			mv.setReference(refStr1);
		} else {
			mv.setReference(null);
		}
		
		result = md.insertDraft(sst,mv);
		
		return result;
	}


	@Override
	public MailVo draftDetail(String mailNo) {
		
		MailVo mv = md.selectDraftDetail(sst,mailNo);
		List<MailAttVo> mavList = md.selectDraftFilePath(sst,mailNo);
		
		if(mavList.size() == 0) {
			mavList = null;
		}
		if (mavList != null) {
			mv.setMavList(mavList);
		}
		
		return mv;
	}


	@Override
	public int delCheckedDraft(List<String> checkArr, EmployeeVo loginVo) {
		
		int result = 1;
		
		for(int i=0 ; i < checkArr.size() ; i++) {
			
			MailVo mv = new MailVo();
			mv.setMailNo(checkArr.get(i));
			int x = md.updateCheckStatusDraft(sst, mv);
			result = result * x;
		}
		
		return result;
	}


	@Override
	public void insertDraftAtt(MailAttVo mav) {
		md.insertDraftAtt(sst,mav);
	}


	@Override
	public List<MailVo> unreadMailList(String empNo) {
		return md.selectUnreadMailList(sst,empNo);
	}

}
