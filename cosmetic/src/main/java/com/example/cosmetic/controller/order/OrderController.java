package com.example.cosmetic.controller.order;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
	
	//테스트
	@GetMapping("/")
	public String ordertest() {
		return "/product/order/ordertest";
	}
//	@GetMapping("test.do")
//	public String test(
//			HttpSession session,
//	        Model model
//			) {
//	    model.addAttribute("hello", "hello"); // 모델에 배열 추가
//	    return "/product/order/ordered_list";
//	}
	
	//장바구니의 주문하기 버튼 > 주문서 작성페이지
	@PostMapping("orderform.do")
	public String orderform(
			@RequestParam(name = "p_id") int[] productIds,
            @RequestParam(name = "amount") int[] amounts,
            
            @RequestParam(name = "price") int price,
            @RequestParam(name = "delfee") int delfee,
            @RequestParam(name = "totalPrice") int totalPrice,
            HttpSession session,
			Model model
			) {
		
		//session에서 userid 가져오기
		//session.setAttribute("userid", "aaaa");
		String userid = (String) session.getAttribute("userid");
		
		//카트의 상품정보 주문 아이템 테이블에 넣고 생성된 primary 키값을 다음페이지로 넘기기
		int len = productIds.length;
		int[] orderItemIds = new int[len]; 
		
		//상품정보 개별적으로 주문 아이템 테이블에 넣기
		for (int i=0; i<productIds.length; i++) {
			
			Map<String, Object> map = new HashMap<>();
			map.put("p_id", productIds[i]);
			map.put("amount", amounts[i]);
			map.put("orderstatus", "주문완료");
			orderDAO.orderItemInsert(map);
			
			//주문 아이템 테이블의 primary key값을 배열로 담아 가져오기
			int idx = orderDAO.getId();
			orderItemIds[i] = idx;
		}
		
		//포인트 
		int currentPoint = orderDAO.showPoint(userid); //보유한 포인트
		int addPoint = (int) Math.round(price * 0.2); //포인트 계산
		
		//다음페이지로 전달
		model.addAttribute("orderItemIds", orderItemIds);
		
		model.addAttribute("price", price);
		model.addAttribute("delfee", delfee);
		model.addAttribute("totalPrice", totalPrice);
		
		model.addAttribute("currentPoint", currentPoint);
		model.addAttribute("addPoint", addPoint);
		
		return "/product/order/order_form";
	}
	
	//주문서 작성완료시 > 주문완료 페이지
	@PostMapping("order.do")
	public String order(
			@RequestParam(name = "id") int[] itemIds,
	        
			@RequestParam(name = "price") int price,
	        @RequestParam(name = "deliverCost") int deliverCost,
	        @RequestParam(name = "totalPrice") int totalPrice,
	        @RequestParam(name = "method") String method,
	        @RequestParam(name = "username") String username,
	        @RequestParam(name = "zipcode") String zipcode,
	        @RequestParam(name = "address1") String address1,
	        @RequestParam(name = "address2") String address2,
	        @RequestParam(name = "tel") String tel,
	        @RequestParam(name = "addPoint") int addPoint,
	        @RequestParam(name = "usedPoint") int usedPoint,
	        
	        HttpSession session,
			Model model
	) {
		
		//session에서 userid 가져오기
		//session.setAttribute("userid", "aaaa");
		String userid = (String) session.getAttribute("userid");
		
		//포인트 계산
		Map<String, Object> pointinfo = new HashMap<>();
		pointinfo.put("point", addPoint-usedPoint);
		pointinfo.put("userid", userid);
		orderDAO.pointUpdate(pointinfo);
		
		//적립된 포인트 불러오기
		int totalPoint = orderDAO.showPoint(userid);
		
		//주문 테이블과 주문 아이템 테이블 출력하기
		
		List<Map<String, Object>> orderitems = new ArrayList<>();
		
		//주문 아이템 기본키 값을 토대로 상품정보 출력하기
		for (int itemId : itemIds) { 
			
			//주문 아이템 테이블에서 p_id, amount, 주문상태 꺼내오기
			int p_id = (int) orderDAO.orderItems(itemId).get("p_id");
			int amount = (int) orderDAO.orderItems(itemId).get("amount");
			String orderStatus = (String) orderDAO.orderItems(itemId).get("orderStatus");
			
			//p_id값으로 상품정보 가져오기
			//이미지, 상품명, 상품가격
			String p_name = (String) orderDAO.orderedProducts(p_id).get("p_name");
			String p_img = (String) orderDAO.orderedProducts(p_id).get("p_img1");
			int p_price = (int) orderDAO.orderedProducts(p_id).get("p_price");
			
			//정보를 map으로 합친 후 orderitems 리스트에 넣기
			Map<String, Object> map = new HashMap<>();
			map.put("p_id", p_id);
			map.put("p_img", p_img);
			map.put("p_price", p_price);
			map.put("amount", amount);
			map.put("orderStatus", orderStatus);
			map.put("p_name", p_name);
            
			orderitems.add(map);
        }
		
		//주문 테이블 출력하기
		//주문 아이템 id 배열을 json 문자열 배열로 만들기
		ObjectMapper mapper = new ObjectMapper();
	    String itemIds_JSON = null;
	    int[] itemIdsArray = null;
	    
	    try {
	    	itemIds_JSON = mapper.writeValueAsString(itemIds);
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    
		//dto로 전달
		OrderDTO dto = new OrderDTO();
		
		dto.setUserid(userid);
		dto.setOrderItemId(itemIds_JSON); //json 배열 값 넣기
		
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
		
		//데이터 삽입
		orderDAO.orderInsert(dto);
		
		//데이터 불러오기
		int idx = orderDAO.getId(); //추가된 데이터의 auto-increment 값 가져오기
		OrderDTO order = orderDAO.orderSelect(idx);
		
		//데이터 전달
		model.addAttribute("order", order); //주문 테이블
		model.addAttribute("orderitems", orderitems); //주문 아이템 테이블
		model.addAttribute("totalPoint", totalPoint);
		
		return "/product/order/order_result";
	}
	
	//주문 목록
	@GetMapping("orderlist.do")
	public String orderlist(
			HttpSession session,
	        Model model
			) {
		
		//session에서 userid 가져오기
		//session.setAttribute("userid", "aaaa");
		String userid = (String) session.getAttribute("userid");
	    
	    //주문목록 가져오기
		List<OrderDTO> list = null;
		list = orderDAO.orderList(userid);
	    
	    //orderlist의 orderitemId 로 상품정보 가져오기 
//		for (OrderDTO order : list) {
//			
//		    String orderItemIds = order.getOrderItemId();
//		    
//		    // 괄호 제거
//		    orderItemIds = orderItemIds.replaceAll("\\[|\\]", "");
//		    // 쉼표 구분
//		    String[] orderItemIdsArray = orderItemIds.split(",");
//		    
//		    
//		    for (String id : orderItemIdsArray) {
//		        System.out.println(id.trim()); // trim() 메서드를 호출하여 공백을 제거하고 출력
//		    }
//		}
	    
	    //상품목록과 상품 아이템 데이터를 합쳐서 리스트로 보내기
	    
	    //+추가되야 할 기능들
	    //주문취소
	    //배송/환불
	    //날짜별 검색
		
		//데이터 보내기
		model.addAttribute("list", list); // 모델에 배열 추가
		
		return "/product/order/ordered_list";
	}
	
	//주문자 정보 불러오기
	@ResponseBody
	@GetMapping("memberInfo.do")
	public Map<String, Object> memberInfo(
			@RequestParam(name = "userid") String userid,
			HttpSession session
	) {
		Map<String, Object> map = orderDAO.memberInfo(userid);
		return map;
	}
}
