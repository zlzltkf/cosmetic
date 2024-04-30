package com.example.cosmetic.controller.product;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.example.cosmetic.model.category.CategoryDTO;
import com.example.cosmetic.model.product.ProductDAO;
import com.example.cosmetic.model.product.ProductDTO;

import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

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

	// 디테일 화면 ( detail_before => 여기서 온 쿠키 안에 리스트 저장)
		@GetMapping("/detail/{p_id}")
		public String detail(@PathVariable(name="p_id") int p_id, Model model, HttpServletRequest request) {
			ProductDTO dto = productDao.detail(p_id);
			
			//Cookie => 여기서 r_list로 p_id를 쿠키 저장
		    Cookie[] cookies = request.getCookies();
		    List <ProductDTO> r_list = new ArrayList<ProductDTO>();
		    if (cookies != null) {
		      for (int i = cookies.length - 1; i >= 0; i--) {
		        if (cookies[i].getName().startsWith("recent")) {
		          String no = cookies[i].getValue();
		          ProductDTO r_dto = productDao.detail(Integer.parseInt(no));
		          r_list.add(r_dto);
		        }
		      }
		    }
			model.addAttribute("r_list", r_list);
			model.addAttribute("dto", dto);
			
			return "product/detail";
		}
	
		// detail로 가기전에 쿠키를 만들어서 p_id와 함께 디테일 화면으로 리다이렉트
		@GetMapping("detail_before")
		public String detail_before(@RequestParam(name="p_id") int p_id, HttpServletResponse response) {
		  //쿠키의 단점 : 클라이언트(=브라우저)에 저장이 되는데, 문자열만 저장할 수 있다.
		  Cookie cookie = new Cookie("recent" + p_id, String.valueOf(p_id));
		  cookie.setPath("/"); //root에 저장
		  cookie.setMaxAge(60 * 60 * 24); //하루동안 저장
		  response.addCookie(cookie); //전송!
		  return "redirect:/product/detail/" + p_id; // 여기서 디테일 화면으로!
		}

		// 최근 본 상품
		@GetMapping("recent_cookie")
		public String recent_cookie(Model model, HttpServletRequest request) {
		    Cookie[] cookies = request.getCookies();
		    List<ProductDTO> r_list = new ArrayList<>();
		    if (cookies != null) {
		        for (Cookie cookie : cookies) {
		            if (cookie.getName().startsWith("recent")) {
		                int no = Integer.parseInt(cookie.getValue());
		                ProductDTO recent = productDao.detail(no);
		                r_list.add(recent);
		            }
		        }
		    }
		    model.addAttribute("r_list", r_list);
		    System.out.println("recent_cookie:"+r_list);
		    return "product/recent";
		}
}
