package com.example.cosmetic.controller.product;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.cosmetic.model.product.ProductDAO;
import com.example.cosmetic.model.product.ProductDTO;

@Controller
@RequestMapping("/product/")
public class ProductController {
	
	@Autowired
	ProductDAO productDao;

	//카테고리별 리스트
	@GetMapping("list.do")
	public String list(@RequestParam(name = "no", required = false) int no, Model model) {
		model.addAttribute("no", no);
		return "product/list";
	}
	
	//대분류 카테고리 리스트
   @GetMapping("main_view")
   public String main() {
      return "product/main_category";
   }
   
   //소분류 카테고리 리스트
   @GetMapping("sub_view.do")
   public String sub(
		   @RequestParam(name = "no", required = false) int no,
		   Model model
		   ) {
	   List<Map<String, Object>> list = productDao.sub_list(no);
	   model.addAttribute("list", list);
      return "product/sub_category";
   }
   
   
}
