package com.bs.address.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import com.bs.address.vo.AddressVo;
import com.bs.common.PageVo;

public interface AddressDao {

	//주소록 검색 조회
	List<AddressVo> selectSearch(SqlSessionTemplate sst, PageVo pvo, Map<String, String> map);

	//조직도 조회
	List<AddressVo> selectList(SqlSessionTemplate sst, Map<String, String> map);
	
	//조직도 상세조회
	List<AddressVo> detailList(SqlSessionTemplate sst);

	//목록 갯수 조회
	int selectCountAll(SqlSessionTemplate sst, Map<String, String> map);

}
