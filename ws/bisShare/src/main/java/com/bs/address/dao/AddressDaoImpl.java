package com.bs.address.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import com.bs.address.vo.AddressVo;
import com.bs.common.PageVo;

@Repository
public class AddressDaoImpl implements AddressDao{

	//주소록 조회
	@Override
	public List<AddressVo> selectList(SqlSessionTemplate sst, PageVo pvo, Map<String, String> map) {
		return sst.selectList("addressMapper.selectList", map);
	}

	//직원상세조회
	@Override
	public List<AddressVo> detailList(SqlSessionTemplate sst) {
		return sst.selectList("addressMapper.detailList");
	}

	//목록 갯수 조회
	@Override
	public int selectCountAll(SqlSessionTemplate sst) {
		return sst.selectOne("addressMapper.selectCountAll");
	}


}
