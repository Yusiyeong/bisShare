package com.bs.address.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import com.bs.address.vo.AddressVo;

public interface AddressDao {

	//주소록 조회
	List<AddressVo> selectList(SqlSessionTemplate sst);

	//조직도 상세조회
	List<AddressVo> detailList(SqlSessionTemplate sst);

}
