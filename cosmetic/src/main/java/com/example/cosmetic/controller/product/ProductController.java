package com.example.cosmetic.controller.product;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("/product/")
public class ProductController {

	//카테고리별 리스트
	@GetMapping("list.do")
	public String list(@RequestParam(name = "no", required = false) int no, Model model) {
		model.addAttribute("no", no);
		return "product/list";
	}
}
