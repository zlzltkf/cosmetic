package com.example.cosmetic.controller.order;

import java.io.Console;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.eclipse.tags.shaded.org.apache.xalan.xsltc.compiler.sym;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.cosmetic.model.order.OrderDAO;
import com.example.cosmetic.model.order.OrderDTO;
import com.fasterxml.jackson.databind.ObjectMapper;

import jakarta.servlet.http.HttpSession;

import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;

@Controller
@RequestMapping("/order/")
public class OrderController {

	@Autowired
	OrderDAO orderDAO;

	// 테스트
	@GetMapping("/")
	public String ordertest() {
		return "/product/order/ordertest";
	}

	// 장바구니의 주문하기 버튼 > 주문서 작성페이지
	@PostMapping("orderform.do")
	public String orderform(@RequestParam(name = "cart_id", required = false) String[] c_ids,
			@RequestParam(name = "p_order_id") String[] productIds, 
			@RequestParam(name = "amount") String[] amounts,

			@RequestParam(name = "price") int price, 
			@RequestParam(name = "delfee") int delfee,
			@RequestParam(name = "totalPrice") int totalPrice, 
			HttpSession session, Model model) {
		
		// session에서 userid 가져오기
		String userid = (String) session.getAttribute("userid");

		// 아이디 없을시 로그인 페이지로 이동
		if (userid == null) {
			return "redirect:/member/page_login";
		}

		// 상품정보 개별적으로 주문 아이템 테이블에 넣기
		List<Map<String, Object>> list = new ArrayList<>();

		for (int i = 0; i < amounts.length; i++) {

			int p_id = Integer.parseInt(productIds[i]);
			int amount = Integer.parseInt(amounts[i]);
			int c_id = Integer.parseInt(c_ids[i]);

			// p_id값으로 상품정보 가져오기
			// 이미지, 상품명, 상품가격
			String p_name = (String) orderDAO.orderedProducts(p_id).get("p_name");
			String p_img = (String) orderDAO.orderedProducts(p_id).get("p_img1");
			int p_price = (int) orderDAO.orderedProducts(p_id).get("p_price");

			// 정보를 map으로 합치기
			Map<String, Object> map = new HashMap<>();
			map.put("p_id", p_id);
			map.put("c_id", c_id);
			map.put("p_img", p_img);
			map.put("p_price", p_price);
			map.put("amount", amount);
			map.put("p_name", p_name);
			list.add(map);
		}

		// 포인트
		int currentPoint = orderDAO.showPoint(userid); // 보유한 포인트
		int addPoint = (int) Math.round(price * 0.01); // 포인트 비율 설정

		// 다음페이지로 전달
		model.addAttribute("list", list);

		model.addAttribute("price", price);
		model.addAttribute("delfee", delfee);
		model.addAttribute("totalPrice", totalPrice);

		model.addAttribute("currentPoint", currentPoint);
		model.addAttribute("addPoint", addPoint);

		return "/product/order/order_form";
	}

	// 단일상품 구매시
	@PostMapping("orderform_item.do")
	public String orderform_item(@RequestParam(name = "cart_id", required = false) String[] c_id1,
			@RequestParam(name = "p_order_id") String[] productId1, 
			@RequestParam(name = "amount") String[] amount1,

			@RequestParam(name = "p_o_price") String price1,
			@RequestParam(name = "delfee") String delfee1,
			@RequestParam(name = "totalPrice") String totalPrice1, 
			HttpSession session, Model model) {
		
		
		// session에서 userid 가져오기
		String userid = (String) session.getAttribute("userid");

		// 아이디 없을시 로그인 페이지로 이동
		if (userid == null) {
			return "redirect:/member/page_login";
		}

		// 상품정보 개별적으로 주문 아이템 테이블에 넣기
		List<Map<String, Object>> list = new ArrayList<>();
		
		for (int i=0; i<amount1.length; i++) {
			int p_id = Integer.parseInt(productId1[i]); 
			int amount = Integer.parseInt(amount1[i]);
			
			
			//p_id값으로 상품정보 가져오기 //이미지, 상품명, 상품가격 
			String p_name = (String) orderDAO.orderedProducts(p_id).get("p_name"); 
			String p_img = (String) orderDAO.orderedProducts(p_id).get("p_img1"); 
			  int p_price = (int) orderDAO.orderedProducts(p_id).get("p_price");
			  
			  //정보를 map으로 합치기 
			  Map<String, Object> map = new HashMap<>(); 
			  map.put("p_id", p_id); 
			  map.put("amount", amount); 
			  map.put("p_name", p_name);
			map.put("p_img", p_img); 
			map.put("p_price", p_price);
			  
			if (c_id1 != null) {
					int c_id = Integer.parseInt(c_id1[i]);
					map.put("c_id", c_id);  
				}
			  
			  list.add(map);
		}
		int price = Integer.parseInt(price1);
		int delfee = Integer.parseInt(delfee1);
		int totalPrice = Integer.parseInt(totalPrice1);
		  
		   
		  
		  //포인트 
		  int currentPoint = orderDAO.showPoint(userid); //보유한 포인트 
		  int addPoint = (int) Math.round(price * 0.01); //포인트 비율 설정
		  
		  //다음페이지로 전달 
		  model.addAttribute("list", list);
		  
		  model.addAttribute("price", price);
		  model.addAttribute("delfee", delfee);
		  model.addAttribute("totalPrice", totalPrice);
		  
		  model.addAttribute("currentPoint", currentPoint);
		  model.addAttribute("addPoint", addPoint);
		 
		return "/product/order/order_form";
	}

	// 주문서 작성완료시 > 주문완료 페이지
	@PostMapping("order.do")
	public String order(@RequestParam(name = "p_id") String[] productIds,
			@RequestParam(name = "c_id", required = false) String[] cartIds,
			@RequestParam(name = "amount") String[] amounts,

			@RequestParam(name = "price") int price, @RequestParam(name = "deliverCost") int deliverCost,
			@RequestParam(name = "totalPrice") int totalPrice, @RequestParam(name = "method") String method,
			@RequestParam(name = "username") String username, @RequestParam(name = "zipcode") String zipcode,
			@RequestParam(name = "address1") String address1, @RequestParam(name = "address2") String address2,
			@RequestParam(name = "tel") String tel, @RequestParam(name = "addPoint") int addPoint,
			@RequestParam(name = "usedPoint") int usedPoint,

			HttpSession session, Model model) {

		// session에서 userid 가져오기
		String userid = (String) session.getAttribute("userid");

		// 아이디 없을시 로그인 페이지로 이동
		if (userid == null) {
			return "redirect:/member/page_login";
		}

		// 주문 아이템 배열 생성
		int len = productIds.length;
		int[] orderItemIds = new int[len];

		// 상품정보 개별적으로 주문 아이템 테이블에 넣기
		for (int i = 0; i < productIds.length; i++) {

			Map<String, Object> map = new HashMap<>();
			map.put("p_id", productIds[i]);
			map.put("amount", amounts[i]);
			map.put("orderstatus", "주문완료");
			orderDAO.orderItemInsert(map);

			// 주문 아이템 테이블의 primary key값을 배열로 담아 가져오기
			int idx = orderDAO.getId();
			orderItemIds[i] = idx;
		}

		// 포인트 계산
		Map<String, Object> pointinfo = new HashMap<>();
		pointinfo.put("point", addPoint - usedPoint);
		pointinfo.put("userid", userid);
		orderDAO.pointUpdate(pointinfo);

		// 총합계 계산
		totalPrice = totalPrice - usedPoint;

		// 적립된 포인트 불러오기
		int userPoint = orderDAO.showPoint(userid);

		// 주문 테이블과 주문 아이템 테이블 출력하기
		List<Map<String, Object>> orderitems = new ArrayList<>();

		// 주문 아이템 기본키 값을 토대로 상품정보 출력하기
		for (int itemId : orderItemIds) {

			// 주문 아이템 테이블에서 p_id, amount, 주문상태 꺼내오기
			int p_id = (int) orderDAO.orderItems(itemId).get("p_id");
			int amount = (int) orderDAO.orderItems(itemId).get("amount");
			String orderStatus = (String) orderDAO.orderItems(itemId).get("orderStatus");

			// p_id값으로 상품정보 가져오기
			// 이미지, 상품명, 상품가격
			String p_name = (String) orderDAO.orderedProducts(p_id).get("p_name");
			String p_img = (String) orderDAO.orderedProducts(p_id).get("p_img1");
			int p_price = (int) orderDAO.orderedProducts(p_id).get("p_price");

			// 정보를 map으로 합친 후 orderitems 리스트에 넣기
			Map<String, Object> map = new HashMap<>();
			map.put("p_id", p_id);
			map.put("p_img", p_img);
			map.put("p_price", p_price);
			map.put("amount", amount);
			map.put("orderStatus", orderStatus);
			map.put("p_name", p_name);

			orderitems.add(map);
		}

		// 주문 테이블 출력하기
		// 주문 아이템 id 배열을 json 문자열 배열로 만들기
		ObjectMapper mapper = new ObjectMapper();
		String itemIds_JSON = null;
		int[] itemIdsArray = null;

		try {
			itemIds_JSON = mapper.writeValueAsString(orderItemIds);
		} catch (Exception e) {
			e.printStackTrace();
		}

		// dto로 전달
		OrderDTO dto = new OrderDTO();

		dto.setUserid(userid);
		dto.setOrderItemId(itemIds_JSON); // json 배열 값 넣기

		dto.setPrice(price);
		dto.setDeliverCost(deliverCost);
		dto.setTotalPrice(totalPrice);
		dto.setMethod(method);

		dto.setUsername(username);
		dto.setZipcode(zipcode);
		dto.setAddress1(address1);
		dto.setAddress2(address2);
		dto.setTel(tel);
		dto.setUserPoint(addPoint);

		// 데이터 삽입
		orderDAO.orderInsert(dto);

		// 데이터 불러오기
		long idx = orderDAO.getOrderId(); // 추가된 데이터의 기본키 값 가져오기
		OrderDTO order = orderDAO.orderSelect(idx);

		// 데이터 전달
		model.addAttribute("order", order); // 주문 테이블
		model.addAttribute("orderitems", orderitems); // 주문 아이템 테이블
		model.addAttribute("userPoint", userPoint); // 보유한 포인트
		model.addAttribute("usedPoint", usedPoint); // 사용한 포인트
		// 주문확인된 제품 cart에서 지우기
		if (cartIds != null || !cartIds[0].equals("")) {
			for (String c_id : cartIds) {
				int id = Integer.parseInt(c_id.trim());
				orderDAO.cartDelete(id);
			}
		} 

		return "/product/order/order_result";
	}

	// 주문 목록
	@GetMapping("orderlist.do")
	public String orderlist(
			HttpSession session, Model model
			) {

		// session에서 userid 가져오기
		String userid = (String) session.getAttribute("userid");

		// 주문목록 가져오기
		List<OrderDTO> list = null;
		list = orderDAO.orderList(userid);

		// orderlist의 orderitemId 로 상품정보 가져오기
		List<Map<String, Object>> orderitemlist = new ArrayList<>();

		for (OrderDTO item : list) {

			long orderid = item.getOrderid();
			String orderItemIds = item.getOrderItemId();

			// orderItemIds을 배열로 바꾸기
			// 괄호 제거
			orderItemIds = orderItemIds.replaceAll("\\[|\\]", "");

			//주문아이템 배열이 비어있지 않으면
			if (orderItemIds != null && !orderItemIds.equals("")) {
				// 쉼표 구분
				String[] orderItemIdsArray = orderItemIds.split(",");

				// 상품정보 가져오기
				for (String id : orderItemIdsArray) {

					Map<String, Object> order = new HashMap<>();
					int idx = Integer.parseInt(id.trim());
					
					// 주문 아이템 테이블에서 p_id, amount, 주문상태 꺼내오기
					int p_id = (int) orderDAO.orderItems(idx).get("p_id");
					
					int amount = (int) orderDAO.orderItems(idx).get("amount");
					String orderStatus = (String) orderDAO.orderItems(idx).get("orderStatus");

					// p_id값으로 상품정보 가져오기
					// 이미지, 상품명, 상품가격
					String p_name = (String) orderDAO.orderedProducts(p_id).get("p_name");
					String p_img = (String) orderDAO.orderedProducts(p_id).get("p_img1");
					int p_price = (int) orderDAO.orderedProducts(p_id).get("p_price");

					// 정보를 map으로 합친 후 orderitems 리스트에 넣기
					Map<String, Object> map = new HashMap<>();
//						map.put("orderid", orderid);
					map.put("idx", idx);
					map.put("p_id", p_id);
					map.put("p_img", p_img);
					map.put("p_price", p_price);
					map.put("amount", amount);
					map.put("orderStatus", orderStatus);
					map.put("p_name", p_name);

					order.put("orderid", orderid);
					order.put("map", map);

					orderitemlist.add(order);
				}
				
			} 
		}

		// +추가되야 할 기능들
		
		// 배송/환불
		// 날짜별 검색

		// 데이터 보내기
		model.addAttribute("order", orderitemlist);
		model.addAttribute("list", list); // 모델에 배열 추가

		return "/product/order/ordered_list";
	}

	// 주문자 정보 불러오기
	@ResponseBody
	@GetMapping("memberInfo.do")
	public Map<String, Object> memberInfo(@RequestParam(name = "userid") String userid, HttpSession session) {
		Map<String, Object> map = orderDAO.memberInfo(userid);
		return map;
	}
	
	//@RequestParam(name = "price") int price
	// 주문취소
	@GetMapping("delete_order.do")
	public String delete_order(
			@RequestParam(name = "orderid") String orderid,
			@RequestParam(name = "itemid") String itemid,
			Model model
	) {
		long o_id = Long.parseLong(orderid);
		int i_id = Integer.parseInt(itemid);
		
		//주문 테이블에서 배열값 업데이트한 후 아이템 데이터 지우기
		//주문 테이블에서 배열값 가져오기
		String orderItemIds = orderDAO.orderItemIdSelect(o_id);
		
		String noBrackets = orderItemIds.replace("[", "").replace("]", "");
        String[] s_ids = noBrackets.split(",");
        
        StringBuilder result = new StringBuilder();
        result.append("[");

        boolean first = true;
        for (String s : s_ids) {
            int s_id = Integer.parseInt(s.trim());
            if (s_id != i_id) {
                if (!first) {
                    result.append(", ");
                }
                result.append(s_id);
                first = false;
            }
        }

        result.append("]");
        
        Map<String, Object> map = new HashMap<>();
        map.put("orderItemId", result.toString());
        map.put("orderid", o_id);
        
        //주문 아이템 배열이 비어있지 않으면
        if (result != null && !result.equals("[]")) {
        	
        	//배열 업데이트
        	orderDAO.orderlistUpdate(map);
        	//주문 아이템 테이블에서 id값 지우기
    		orderDAO.orderItemDelete(i_id);
    		
    		String resultids = orderDAO.orderItemIdSelect(o_id);
    		if (resultids != null && resultids.equals("[]")) {
        		orderDAO.orderDelete(o_id);
        	}
        }
		
		return "redirect:/order/orderlist.do";
	}
	
}
