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
	public List<String> getListByEmpNo(String empNo) {
		return dao.getListByNo(sst, empNo);
	}

	//기안서 1개 조회
	@Override
	public ApprovalVo getOneByNo(String adcNo) {
		//기본 저장된 정보 DB에서 조회
		ApprovalVo vo = dao.getOneByNo(sst, adcNo);
		//일단 결재 진행정보 다시 배열로 담아주기
		vo.setAprverStatuses(vo.getAprverStatus().split(","));
		vo.setAgreeStatuses(vo.getAgreeStatus().split(","));
		vo.setRefStatuses(vo.getRefStatus().split(","));
		
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
			}
			vo.setRefNicks(refEmpNicks);
		}
		
		return vo;
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
			vo.setAgreeEmpNos(vo.getAgreeEmpNo().split(","));
			vo.setRefEmpNos(vo.getRefEmpNo().split(","));
			//변수 생성 (로그인한 emp의 권한이 들어가있는지 확인)
			boolean isAprver = Arrays.asList(vo.getAprverEmpNos()).contains(empNo);
			boolean isAgree = Arrays.asList(vo.getAgreeEmpNos()).contains(empNo);
			boolean isRef = Arrays.asList(vo.getRefEmpNos()).contains(empNo);
			//결과에 따라 list에 담아줌
			if(isAprver) { myAuthoList.add(vo); vo.setMyAutho("결재권자");}
			else if(isAgree) { myAuthoList.add(vo); vo.setMyAutho("합의");}
			else if(isRef) { myAuthoList.add(vo); vo.setMyAutho("참조");}
		}
		return myAuthoList;
	}

	
	//기안서 진행도 체크
	public static void checkProgress(List<ApprovalVo> voList) {
		
		
		
	}
	
	
}//class



















