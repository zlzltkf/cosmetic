package com.example.cosmetic.controller.mypage;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/mypage/")
public class MyPageController {
	
	@GetMapping("/")
	public String mypage() {
		return "/mypage/index";
	}
	

}
