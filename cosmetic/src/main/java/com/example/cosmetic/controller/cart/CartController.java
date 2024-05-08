package com.example.cosmetic.controller.cart;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.example.cosmetic.model.cart.CartDAO;
import com.example.cosmetic.model.cart.CartDTO;
import com.example.cosmetic.model.member.MemberDAO;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/cart/")
public class CartController {
	@Autowired
	CartDAO cartDao;
	@Autowired
	MemberDAO memberDao;

	//장바구니에서 상품 하나 삭제
	@GetMapping("delete")
	public String delete(@RequestParam(name = "c_id") int c_id) {
		cartDao.delete(c_id);
		return "redirect:/cart/list";
	}
	//장바구니에서 전체 삭제
	@GetMapping("deleteAll")
	public String deleteAll(HttpSession session) {
		String userid = (String) session.getAttribute("userid");
		if (userid != null) {
			cartDao.delete_all(userid);
		}
		return "redirect:/cart/list";
	}
	//장바구니에서 선택 된 상품 삭제 
	@GetMapping("selected_delete")
	public String selected_delete(@RequestParam(name="c_id") int[] c_id, HttpServletRequest request) {
	    String[] select = request.getParameterValues("c_id");
	    if (select != null) {
	        for (int i = 0; i < select.length; i++) {
	            cartDao.delete(Integer.parseInt(select[i]));
	            System.out.println(select);
	        }
	    }
	    return "redirect:/cart/list";
	}
	
	@PostMapping("update")
	public String update(@RequestParam(name = "amount") int[] amount, @RequestParam(name = "c_id") int[] c_id,
			HttpSession session) {
		String userid = (String) session.getAttribute("userid");
		if (userid == null) {
			return "redirect:/member/login.do";
		}
		for (int i = 0; i < c_id.length; i++) {
			if (amount[i] == 0) {
				cartDao.delete(c_id[i]);
			} else {
				CartDTO dto = new CartDTO();
				dto.setUserid(userid);
				dto.setC_id(c_id[i]);
				dto.setAmount(amount[i]);
				cartDao.update_cart(dto);
			}
		}
		return "redirect:/shop/cart/list.do";
	}

	@GetMapping("list")
	public ModelAndView list(HttpSession session, ModelAndView mav) {
		Map<String, Object> map = new HashMap<>();
		String userid = (String) session.getAttribute("userid");
		if (userid != null) {
			List<CartDTO> list = cartDao.list_cart(userid);
			int sumMoney = cartDao.sum_money(userid);
			int fee = sumMoney >= 30000 ? 0 : 2500;
			map.put("sumMoney", sumMoney);
			map.put("fee", fee);
			map.put("sum", sumMoney + fee);
			map.put("list", list);
			map.put("count", list.size());
			mav.setViewName("product/cart");
			mav.addObject("map", map);
			return mav;
		} else {
			return new ModelAndView("/member/page_login");
		}
	}

	@PostMapping("insert")
	public String insert(CartDTO dto, HttpSession session) {
		String userid = (String) session.getAttribute("userid");
		if (userid == null) {
			return "redirect:/member/page_login";
		}
		dto.setUserid(userid);
		cartDao.insert(dto);
		return "redirect:/cart/list";
	}
}
