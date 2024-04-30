package com.example.cosmetic.controller.product;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.example.cosmetic.model.category.CategoryDTO;
import com.example.cosmetic.model.product.ProductDAO;
import com.example.cosmetic.model.product.ProductDTO;

@Controller
@RequestMapping("/product/")
public class ProductController {

	@Autowired
	ProductDAO productDao;

	// 카테고리별 리스트
	@GetMapping("list.do")
	public String list(@RequestParam(name = "no", required = false) int no, Model model) {
		model.addAttribute("no", no);
		return "product/list";
	}

	@GetMapping("main_view")
	public ModelAndView main_view(@RequestParam(name = "ctg_b_no") int ctg_b_no, ModelAndView mav) {
		String name = productDao.big_name(ctg_b_no);
		List<CategoryDTO> items = productDao.main_list(ctg_b_no);
		mav.setViewName("product/main_category");
		mav.addObject("items", items);
		mav.addObject("name", name);
		System.out.println(name);
		return mav;
	}
	
	// 소분류 카테고리 리스트
	@GetMapping("sub_view.do")
	public String sub(
			@RequestParam(name = "no", required = false) int no, 
			@RequestParam(name = "order", required = false, defaultValue = "best") String order,
			Model model) {
		
		List<Map<String, Object>> list = null;
		
		//카테고리 이름 가져오기
		Map<String, Object> ctg = productDao.get_cate_name(no);

		int ctg_b_no = (int) ctg.get("ctg_b_no");
		
		List<CategoryDTO> items = productDao.main_list(ctg_b_no);
		
		if (order.equals("best")) {
			list = productDao.sub_list_best(no);
			
		} else if (order.equals("new")) {
			list = productDao.sub_list_new(no);
			
		} else if (order.equals("sell")) {
			list = productDao.sub_list_sell(no);
			
		} else if (order.equals("price")) {
			list = productDao.sub_list_price(no);
		} 
		
		model.addAttribute("ctg", ctg);
		model.addAttribute("ctg_items", items);
		model.addAttribute("list", list);
		return "product/sub_category";
	}

	// 디테일 화면
		@GetMapping("/detail/{p_id}")
		public ModelAndView detail(@PathVariable(name="p_id") int p_id, ModelAndView mav) {
			mav.setViewName("product/detail");
			mav.addObject("dto", productDao.detail(p_id));
			return mav;
		}
	
}
