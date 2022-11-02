package com.bs.address.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.bs.address.service.AddressService;
import com.bs.address.vo.AddressVo;
import com.bs.common.PageVo;
import com.bs.common.Pagination;

@Controller
@RequestMapping("address")
public class AddressController {
	
	private final AddressService adds;
	
	@Autowired
	public AddressController(AddressService adds) {
		this.adds = adds;
	}

	//조직도
	@GetMapping("list/{pno}")
	public String addressList(Model model, HttpServletRequest req, @PathVariable int pno) {
		
		String keyword = req.getParameter("keyword");
		String field = req.getParameter("field");
		
		Map<String, String> map = new HashMap<String, String>();
		map.put("keyword", keyword);
		map.put("field", field);
		
		
		List<AddressVo> voList = adds.selectList(map);
		List<AddressVo> dvoList = adds.detailList();
		model.addAttribute("voList", voList);
		model.addAttribute("dvoList", dvoList);
		model.addAttribute("page", "address/address-list");
		return "layout/template";
	}
	
	//주소록 검색
	@GetMapping(value = {"search/{pno}" , "search"})
	public String addressSearch(Model model, HttpServletRequest req, @PathVariable(required = false) Integer pno) {
		
		//pno가 null일때 1의 값을 주도록함, int -> Integer로 변경
		if(pno == null) {
			pno = 1;
		}
		
		String keyword = req.getParameter("keyword");
		String field = req.getParameter("field");
		
		Map<String, String> map = new HashMap<String, String>();
		map.put("keyword", keyword);
		map.put("field", field);
		
		int totalCount = adds.selectTotalCnt(map);
		
		PageVo pvo = Pagination.getPageVo(totalCount, pno, 5, 10);
		
		List<AddressVo> voList = adds.selectSearch(pvo, map);
		model.addAttribute("voList", voList);
		model.addAttribute("pvo", pvo);
		model.addAttribute("field", field);
		model.addAttribute("keyword", keyword);
		model.addAttribute("page", "address/address-search");
		return "layout/template";
	}
}
