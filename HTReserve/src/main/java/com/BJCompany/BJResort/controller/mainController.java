package com.BJCompany.BJResort.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/main/*")
public class mainController {

	@RequestMapping("/index.do")
	public String index() {
		return "index";
	}
}
