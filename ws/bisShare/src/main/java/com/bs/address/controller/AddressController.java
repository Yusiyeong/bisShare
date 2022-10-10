package com.bs.address.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class AddressController {

	@GetMapping("address/list")
	public String addressList(Model model) {
		model.addAttribute("page", "address/address-list");
		return "layout/template";
	}
	
	@GetMapping("address/search")
	public String addressSearch(Model model) {
		model.addAttribute("page", "address/address-search");
		return "layout/template";
	}
}
