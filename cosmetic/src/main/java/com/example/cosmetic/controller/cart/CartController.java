package com.example.cosmetic.controller.cart;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
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
	@GetMapping("delete/{c_id}")
	public String delete(@PathVariable(name = "c_id") int c_id) {
		cartDao.delete(c_id);
		return "redirect:/cart/list";
	}
	@ResponseBody
	@PostMapping("select_delete")
	public String select_delete(@RequestParam("nums") String[] nums) {
	    if (nums != null && nums.length > 0) {
	        for (String num : nums) {
	            cartDao.delete(Integer.parseInt(num));
	        }
	        return "삭제되었습니다"; // 또는 다른 성공 메시지
	    } else {
	        return "선택된 상품이 없습니다"; // 선택된 상품이 없는 경우에 대한 메시지
	    }
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
	//장바구니 담기 기능
	@PostMapping("insert")
	public String insert(@RequestBody Map<String, Object> requestMap, HttpSession session) {
	    String userid = (String) session.getAttribute("userid");
	    if (userid == null) {
	        return "redirect:/member/page_login";
	    }
	    int p_id = (int) requestMap.get("p_id");
	    List<Map<String, Object>> selectedOptions = (List<Map<String, Object>>) requestMap.get("options");
	    // 선택한 옵션들을 이용하여 CartDTO 생성 및 저장 로직 수행
	    for (Map<String, Object> option : selectedOptions) {
	        String optionName = (String) option.get("o_name");
	        if (optionName.equals("매수량-+")) {
		       optionName=null;
		    }
	        int money = (int) option.get("p_price");
	        int quantity = (int) option.get("amount");
	        CartDTO dto = new CartDTO();
	        dto.setP_id(p_id);
	        dto.setO_name(optionName);
	        dto.setAmount(quantity);
	        dto.setUserid(userid);
	        dto.setMoney(money);
	        cartDao.insert(dto);
	    }

	    return "redirect:/cart/list";
	}

}
