package com.bs.address.service;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bs.address.dao.AddressDao;
import com.bs.address.vo.AddressVo;
import com.bs.common.PageVo;

@Service
public class AddressServiceImpl implements AddressService{

	private final SqlSessionTemplate sst;
	
	private final AddressDao dao;

	@Autowired
	public AddressServiceImpl(SqlSessionTemplate sst, AddressDao dao) {
		this.sst = sst;
		this.dao = dao;
	}

	
	//주소록 조회
	@Override
	public List<AddressVo> selectList(PageVo pvo, Map<String, String> map) {
		return dao.selectList(sst, pvo, map);
	}

	//조직도 상세조회
	@Override
	public List<AddressVo> detailList() {
		return dao.detailList(sst);
	}

	//목록 갯수 조회
	@Override
	public int selectTotalCnt() {
		return dao.selectCountAll(sst);
	}

	
	

}
