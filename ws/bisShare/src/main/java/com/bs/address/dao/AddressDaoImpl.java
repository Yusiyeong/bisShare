package com.bs.address.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import com.bs.address.vo.AddressVo;

@Repository
public class AddressDaoImpl implements AddressDao{

	//주소록 조회
	@Override
	public List<AddressVo> selectList(SqlSessionTemplate sst) {
		return sst.selectList("addressMapper.selectList");
	}

	@Override
	public List<AddressVo> detailList(SqlSessionTemplate sst) {
		return sst.selectList("addressMapper.detailList");
	}
	

}
