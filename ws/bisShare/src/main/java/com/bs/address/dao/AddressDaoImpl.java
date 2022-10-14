package com.bs.address.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import com.bs.address.vo.AddressVo;

public class AddressDaoImpl implements AddressDao{

	//주소록 조회
	@Override
	public List<AddressVo> selectList(SqlSessionTemplate sst) {
		return sst.selectList("addressMapper.selectList");
	}

}
