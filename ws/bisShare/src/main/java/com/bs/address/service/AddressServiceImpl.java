package com.bs.address.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Service;

import com.bs.address.dao.AddressDao;
import com.bs.address.vo.AddressVo;

@Service
public class AddressServiceImpl implements AddressService{

	private final SqlSessionTemplate sst;
	
	private final AddressDao adddao;
	
	public AddressServiceImpl(SqlSessionTemplate sst, AddressDao adddao) {
		this.sst = sst;
		this.adddao = adddao;
	}



	//주소록 조회
	@Override
	public List<AddressVo> selectList() {
		return adddao.selectList(sst);
	}

}
