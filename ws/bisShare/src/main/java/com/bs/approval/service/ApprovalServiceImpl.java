package com.bs.approval.service;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.bs.admin.dao.AdminDao;
import com.bs.approval.dao.ApprovalDao;
import com.bs.approval.vo.ApprovalVo;
import com.bs.employee.vo.EmployeeVo;

@Service
public class ApprovalServiceImpl implements ApprovalService{

	private final SqlSessionTemplate sst;
	private final ApprovalDao dao;
	private final AdminDao adminDao;
	
	public ApprovalServiceImpl(SqlSessionTemplate sst, ApprovalDao dao, AdminDao adminDao) {
		super();
		this.sst = sst;
		this.dao = dao;
		this.adminDao = adminDao;
	}

	@Override
	public int insertOne(ApprovalVo avo) {
		//결재 내용 insert
		int result = dao.insertDocu(sst, avo);
		
		return result;
	}

	//내가 작성한 기안서 목록
	@Override
	public List<ApprovalVo> getListByEmpNo(String empNo) {
		List<ApprovalVo> list = dao.getListByNo(sst, empNo);
		if(list != null) {
			for(int i = 0; i < list.size(); ++i) {
				list.set(i, checkProgress(list.get(i)));
			}
			return list;
		} else {
			return null;
		}
	}

	//기안서 1개 조회
	@Override
	public ApprovalVo getOneByNo(String adcNo, String empNo) {
		//기본 저장된 정보 DB에서 조회
		ApprovalVo vo = dao.getOneByNo(sst, adcNo);
		//일단 결재 진행정보 다시 배열로 담아주기
		vo.setAprverStatuses(vo.getAprverStatus().split(","));
		vo.setAgreeStatuses(vo.getAgreeStatus().split(","));
		String[] refStatusesArr = vo.getRefStatus().split(",");
		//결재권자, 합의자, 참조자 정보들 조회 해오기
		//결재권자
		// 저장된 EmpNo 배열로 전환
		vo.setAprverEmpNos(vo.getAprverEmpNo().split(","));
		// 배열의 길이만큼 회원정보 조회해온뒤 각 배열에 저장
		String[] AprverEmpNicks = new String[vo.getAprverEmpNos().length];
		String[] AprverEmpRanks = new String[vo.getAprverEmpNos().length];
		String[] AprverEmpDepts = new String[vo.getAprverEmpNos().length];
		for(int i = 0; i < vo.getAprverEmpNos().length; ++i) {
			EmployeeVo evo = adminDao.selectOne(sst, vo.getAprverEmpNos()[i]);
			AprverEmpNicks[i] = evo.getNick();
			AprverEmpDepts[i] = evo.getDeptNo();
			AprverEmpRanks[i] = evo.getRankNo();
		}
		vo.setAprverNicks(AprverEmpNicks);
		vo.setAprverDepts(AprverEmpDepts);
		vo.setAprverRanks(AprverEmpRanks);
		
		//합의자
		if(vo.getAgreeEmpNo() != null) {
			// 저장된 EmpNo 배열로 전환
			vo.setAgreeEmpNos(vo.getAgreeEmpNo().split(","));
			// 배열의 길이만큼 회원정보 조회해온뒤 각 배열에 저장
			String[] agreeEmpNicks = new String[vo.getAgreeEmpNos().length]; 
			for(int i = 0; i < vo.getAgreeEmpNos().length; ++i) {
				EmployeeVo evo = adminDao.selectOne(sst, vo.getAgreeEmpNos()[i]);
				agreeEmpNicks[i] = evo.getNick();
			}
			vo.setAgreeNicks(agreeEmpNicks);
		}
		
		//참조자
		if(vo.getRefEmpNo() != null) {
			// 저장된 EmpNo 배열로 전환
			vo.setRefEmpNos(vo.getRefEmpNo().split(","));
			// 배열의 길이만큼 회원정보 조회해온뒤 각 배열에 저장
			String[] refEmpNicks = new String[vo.getRefEmpNos().length]; 
			for(int i = 0; i < vo.getRefEmpNos().length; ++i) {
				EmployeeVo evo = adminDao.selectOne(sst, vo.getRefEmpNos()[i]);
				refEmpNicks[i] = evo.getNick();
				//로그인한 유저가 참조자일경우 참조 상태를 Y로 변경
				if(empNo.equals(vo.getRefEmpNos()[i])&&refStatusesArr[i].equals("N")) {refStatusesArr[i] = "Y";};
			}
			vo.setRefStatuses(refStatusesArr);
			vo.setRefNicks(refEmpNicks);
			
			//참조 현황 업데이트
			Map updateInfo = new HashMap<String, String>();
			
			String updateRefStatus = "";
			
			for(int i = 0; i < vo.getRefStatuses().length; ++i) {
				if(i>0) updateRefStatus += ",";
				updateRefStatus += vo.getRefStatuses()[i];
			}
			updateInfo.put("key", "ref");
			updateInfo.put("value", updateRefStatus);
			updateInfo.put("adcNo", vo.getAdcNo());
			
			dao.updateStatus(sst, updateInfo);
		}
		
		return checkProgress(vo);
	}//기안서 1개 조회 - END

	//나에게 권한있는 기안서 조회
	@Override
	public List<ApprovalVo> getListAuthorMy(String empNo) {
		
		//기안서 전체 조회
		List<ApprovalVo> allAprvList = dao.getListAll(sst);
		
		List<ApprovalVo> myAuthoList = new ArrayList<ApprovalVo>();
		
		for(ApprovalVo vo : allAprvList) {
			// DB에서 꺼내온 데이터 배열로 변환
			vo.setAprverEmpNos(vo.getAprverEmpNo().split(","));;
			if(vo.getAgreeEmpNo()!=null)vo.setAgreeEmpNos(vo.getAgreeEmpNo().split(","));
			if(vo.getRefEmpNo()!=null)vo.setRefEmpNos(vo.getRefEmpNo().split(","));
			//변수 생성 (로그인한 emp의 권한이 들어가있는지 확인)
			boolean isAprver = Arrays.asList(vo.getAprverEmpNos()).contains(empNo);
			boolean isAgree = Arrays.asList(vo.getAgreeEmpNos()).contains(empNo);
			boolean isRef = Arrays.asList(vo.getRefEmpNos()).contains(empNo);
			//결과에 따라 list에 담아줌
			if(isAprver) { myAuthoList.add(vo); vo.setMyAutho("결재권자");}
			else if(isAgree) { myAuthoList.add(vo); vo.setMyAutho("합의");}
			else if(isRef) { myAuthoList.add(vo); vo.setMyAutho("참조");}
		}
		for(int i = 0; i < myAuthoList.size(); ++i) {
			myAuthoList.set(i, checkProgress(myAuthoList.get(i)));
		}
		return myAuthoList;
	}

	
	//기안서 진행도 체크
	public static ApprovalVo checkProgress(ApprovalVo vo) {
		
			//합의자 수
			int agreeCnt = 0;
			
			//결재, 합의 Y인 수
			int approveYesCnt = 0;
			int agreeYesCnt = 0;
			
			//결재권자, 합의자 배열로 담아주기 -> Y인 수 카운팅
			vo.setAprverStatuses(vo.getAprverStatus().split(","));;
			if(vo.getAgreeEmpNo()!=null) {
				vo.setAgreeStatuses(vo.getAgreeStatus().split(","));
				agreeCnt = vo.getAgreeStatuses().length;
				for(int i = 0; i < agreeCnt; ++i) {
					if(vo.getAgreeStatuses()[i].equals("Y")) {
						++agreeYesCnt;
					}
				}
			}
			int aprverCnt = vo.getAprverStatuses().length;
			for(int i = 0; i < aprverCnt; ++i) {
				if(vo.getAprverStatuses()[i].equals("Y")) {
					++approveYesCnt;
				}
			}
			
			// 총 Y로 나와야 하는 수 = 결재권자 + 합의자
			int entireNum = aprverCnt + agreeCnt;
			// 백분율로 계산 -> 버림
			double progressNum = (((double)approveYesCnt+(double)agreeYesCnt)/(double)entireNum)*100;
			String progress = Integer.toString((int)progressNum);
			vo.setProgress(progress);
			
		return vo;
	}

	//결재권자가 결재 눌렀을때
	@Override
	public int updateAprvStatus(ApprovalVo avo, String loginEmpNo) {

		Map updateInfo = new HashMap<String, String>();
		
		avo.setAprverStatuses(avo.getAprverStatus().split(","));
		avo.setAprverEmpNos(avo.getAprverEmpNo().split(","));
		
		String updateAprverStatus = "";
		
		for(int i = 0; i < avo.getAprverStatuses().length; ++i) {
			if(i>0) updateAprverStatus += ",";
			if(loginEmpNo.equals(avo.getAprverEmpNos()[i])) updateAprverStatus += "Y";
			else updateAprverStatus += avo.getAprverStatuses()[i];
		}
		updateInfo.put("key", "aprv");
		updateInfo.put("value", updateAprverStatus);
		updateInfo.put("adcNo", avo.getAdcNo());
		
		return dao.updateStatus(sst, updateInfo);
	}
	
	//합의자가 결재 눌렀을때
	@Override
	public int updateAgreeStatus(ApprovalVo avo, String loginEmpNo) {

		Map updateInfo = new HashMap<String, String>();
		
		avo.setAgreeStatuses(avo.getAgreeStatus().split(","));
		avo.setAgreeEmpNos(avo.getAgreeEmpNo().split(","));
		
		String updateAgreeStatus = "";
		
		for(int i = 0; i < avo.getAgreeStatuses().length; ++i) {
			if(i>0) updateAgreeStatus += ",";
			if(loginEmpNo.equals(avo.getAgreeEmpNos()[i])) updateAgreeStatus += "Y";
			else updateAgreeStatus += avo.getAgreeStatuses()[i];
		}
		updateInfo.put("key", "agree");
		updateInfo.put("value", updateAgreeStatus);
		updateInfo.put("adcNo", avo.getAdcNo());
		
		return dao.updateStatus(sst, updateInfo);
	}
	
	
}//class



















