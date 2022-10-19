package com.bs.address.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Service;

import com.bs.address.dao.AddressDao;
import com.bs.address.vo.AddressVo;

@Service
public class AddressServiceImpl implements AddressService{

	private final SqlSessionTemplate sst;
	
	private final AddressDao dao;

	public AddressServiceImpl(SqlSessionTemplate sst, AddressDao dao) {
		super();
		this.sst = sst;
		this.dao = dao;
	}

	
	//주소록 조회
	@Override
	public List<AddressVo> selectList() {
		return dao.selectList(sst);
	}

	//조직도 상세조회
	@Override
	public List<AddressVo> detailList() {
		return dao.detailList(sst);
	}

}
