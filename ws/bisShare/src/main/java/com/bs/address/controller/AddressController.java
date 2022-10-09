package com.bs.address.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class AddressController {

	@GetMapping("address")
	public String addressList(Model model) {
		model.addAttribute("page", "address/addressList");
		return "layout/template";
	}
}
