package com.bs.address.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.bs.address.service.AddressService;
import com.bs.address.vo.AddressVo;

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
	public String addressList(Model model) {
//		List<AddressVo> voList = adds.selectList();
//		model.addAttribute("voList", voList);
		model.addAttribute("page", "address/address-list");
		return "layout/template";
	}
	
	//주소록 검색
	@GetMapping("search")
	public String addressSearch(Model model) {
		model.addAttribute("page", "address/address-search");
		return "layout/template";
	}
}
