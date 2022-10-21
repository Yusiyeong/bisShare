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
	@GetMapping("list")
	public String addressList(Model model, HttpServletRequest req) {
		
		String keyword = req.getParameter("keyword");
		String field = req.getParameter("field");
		
		Map<String, String> map = new HashMap<String, String>();
		map.put("keyword", keyword);
		map.put("field", field);
		
		int listCount = adds.selectListCount(map);	
		int currentPage = Integer.parseInt(req.getParameter("p"));	
		int pageLimit = 5;	
		int boardLimit = 9;
		
		PageVo pvo = Pagination.getPageVo(listCount, currentPage, pageLimit, boardLimit);
		
		List<AddressVo> voList = adds.selectList(pvo, map);
		List<AddressVo> dvoList = adds.detailList();
		model.addAttribute("voList", voList);
		model.addAttribute("dvoList", dvoList);
		model.addAttribute("pvo", pvo);
		model.addAttribute("page", "address/address-list");
		return "layout/template";
	}
	
	//주소록 검색
	@GetMapping("search")
	public String addressSearch(Model model, HttpServletRequest req) {
		String keyword = req.getParameter("keyword");
		String field = req.getParameter("field");
		
		Map<String, String> map = new HashMap<String, String>();
		map.put("keyword", keyword);
		map.put("field", field);
		
		int listCount = adds.selectListCount(map);	
		int currentPage = Integer.parseInt(req.getParameter("p"));	
		int pageLimit = 5;	
		int boardLimit = 9;
		
		PageVo pvo = Pagination.getPageVo(listCount, currentPage, pageLimit, boardLimit);
		
		List<AddressVo> voList = adds.selectList(pvo, map);
		model.addAttribute("voList", voList);
		model.addAttribute("pvo", pvo);
		model.addAttribute("page", "address/address-search");
		return "layout/template";
	}
}
