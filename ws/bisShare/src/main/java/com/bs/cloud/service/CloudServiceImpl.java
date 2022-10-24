package com.bs.cloud.service;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bs.cloud.dao.CloudDao;
import com.bs.cloud.vo.CloudVo;
import com.bs.common.PageVo;

@Service
public class CloudServiceImpl implements CloudService{

	private final SqlSessionTemplate sst;
	private final CloudDao cd;
	
	@Autowired
	public CloudServiceImpl(SqlSessionTemplate sst, CloudDao cd) {
		super();
		this.sst = sst;
		this.cd = cd;
	}

	// 페이징 처리
	@Override
	public int selectTotalCnt() {
		return cd.selectCountAll(sst);
	}//selectTotalCnt

	// 게시글 목록 조회
	@Override
	public List<CloudVo> selectList(PageVo pv, Map<String, String> map) {
		return cd.selectList(sst, pv, map);
	}//selectList

	// 게시글 작성 + 파일 업로드
	@Override
	public int write(CloudVo vo) {
		return cd.insertBoard(sst, vo);
	}//write

	// 게시글 상세조회 + 조회수 증가
	@Override
	public CloudVo selectOne(String boardNo) {
		
		int result = cd.increaseCnt(sst, boardNo);	// 조회수 증가
		if(result == 1) {
			return cd.selectOne(sst, boardNo);	// 상세 조회
		}else {
			return null;
		}
		
	}//selectOne

	// 게시글 수정
	@Override
	public int edit(CloudVo vo) {
		return cd.edit(sst, vo);
	}//edit

	
	// 게시글 삭제
	@Override
	public int delete(String boardNo) {
		return cd.delete(sst, boardNo);
	}//delete
	
	
	
}//class
