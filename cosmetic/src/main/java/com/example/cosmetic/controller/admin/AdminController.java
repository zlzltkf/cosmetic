package com.example.cosmetic.controller.admin;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/admin/")
@Controller
public class AdminController {
	
	@GetMapping("admin")
	public String main() {
		return "admin/admin_view";
	}

}
