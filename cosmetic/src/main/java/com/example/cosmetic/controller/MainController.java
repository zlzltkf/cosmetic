package com.example.cosmetic.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/")
public class MainController {

	@GetMapping("main")
	public String main() {
		return "main/main";
	}
	
	@GetMapping("login")
	public String login() {
		return "login/login";
	}
}
