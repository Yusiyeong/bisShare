package com.bs;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class MainController {

	@RequestMapping("/")
	public String loginPage() {
		return "index";
	}
	
	@RequestMapping("/main")
	public String mainPage(Model model) {
		model.addAttribute("title", "BISSHARE");
		model.addAttribute("page", "main");
		return "layout/template";
	}
	
	

	
}
