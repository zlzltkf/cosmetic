package com.example.cosmetic.controller.admin;

import java.io.File;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.example.cosmetic.model.admin.AdminDao;
import com.example.cosmetic.model.member.MemberDTO;
import com.example.cosmetic.model.product.ProductDTO;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import jakarta.servlet.ServletContext;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/admin/")
public class AdminController {
	
	@Autowired
	AdminDao adminDao;
	
	@GetMapping("admin")
	public String main() {
		return "admin/admin_view";
	}
	
	@GetMapping("write_product")
	public String write_product(Model model) {
		
		List<String> Biglist = adminDao.getBig();
		
		model.addAttribute("list",Biglist);
		return "admin/write_view";
	}
	
	@GetMapping("Small")
	@ResponseBody
	public List<String> getSubcategories(@RequestParam(name="ctg_big") String ctg_big) {
	    // 주어진 대분류에 해당하는 소분류를 가져오는 로직을 구현
		List<String> Small = adminDao.getSmall(ctg_big);
	    return Small;
	}
	
	//조규버전 상품등록
	@PostMapping("insert")
	public String insert(ProductDTO dto, 
	                     @RequestParam("ctg_small") String small, 
	                     @RequestParam(value = "o_name", required = false) String[] oNames, 
	                     @RequestParam(value = "o_amount", required = false) String[] oAmounts,
	                     HttpServletRequest request, 
	                     HttpSession session) {
	    String filename = "-";
	    MultipartFile file = dto.getFile(); // 파일 객체 가져오기

	    // 파일 업로드 처리
	    if (file != null && !file.isEmpty() && file.getOriginalFilename() != null) {
	        filename = file.getOriginalFilename(); // 파일명 설정

	        try {
	            ServletContext application = request.getSession().getServletContext();
	            String path = application.getRealPath("../resources/admin/img");
	            File directory = new File(path);

	            if (!directory.exists()) {
	                directory.mkdirs(); // 디렉토리가 없으면 생성
	            }
	            file.transferTo(new File(directory, filename)); // 파일 저장
	        } catch (Exception e) {
	            e.printStackTrace();
	        }
	    }

	    // 대분류와 소분류 설정
	    String ctg_big = small;
	    int small_no = adminDao.small_no(ctg_big);
	    dto.setP_cate(small_no);
	    dto.setP_img1(filename); // 파일명 설정

	    int price = dto.getP_price();
	    adminDao.product_insert(dto);

	    int p_id = adminDao.p_id();
	    System.out.println("p_id: " + p_id);

	    // 디버그 출력 추가
	    System.out.println("oNames: " + Arrays.toString(oNames));
	    System.out.println("oAmounts: " + Arrays.toString(oAmounts));

	    if (oNames != null && oAmounts != null && oNames.length == oAmounts.length) {
	        System.out.println("조건이 만족되었습니다.");
	        for (int i = 0; i < oNames.length; i++) {
	            String o_name = oNames[i];
	            String o_amountStr = oAmounts[i];

	            if (o_name.equals("0") || o_amountStr.trim().isEmpty()) {
	                continue;
	            }

	            try {
	                int o_amount = Integer.parseInt(o_amountStr.trim());
	                if (o_amount > 0) {
	                    dto.setO_price(price);
	                    dto.setO_p_id(p_id);
	                    dto.setO_name(o_name);
	                    dto.setO_amount(o_amount);
	                    dto.setP_stock(o_amount);
	                   
	                    adminDao.option_insert(dto);
	                    
	                 // 상품의 재고에 옵션의 수량 합산하여 업데이트
	                    adminDao.updateProductStock(p_id, o_amount);
	                }
	            } catch (NumberFormatException e) {
	                System.err.println("변환 실패: " + o_amountStr);
	            }
	        }
	    } else {
	        System.out.println("조건이 만족되지 않았습니다.");
	    }
	    return "admin/write_view";
	}
	
	//사용자 기본 목록
	@GetMapping("user_list")
	public String user_list(@RequestParam(name = "curPage", defaultValue = "1") int curPage,Model model) {
		List<Map<String, Object>> list = null;
		int count = adminDao.user_count(); // 모든 회원 수
		PageUtil page_info = new PageUtil(count, curPage);
		int start = page_info.getPageBegin() - 1;
		int pageCnt = page_info.PAGE_SCALE;
		list = adminDao.user_list(start, pageCnt);
		model.addAttribute("list", list);
		model.addAttribute("page_info", page_info);
		model.addAttribute("count", count);
		return "admin/user_list";
	}
	
	//pageCnt에 따른 사용자 목록
	@GetMapping("select_user_list")
	public String select_user_list(@RequestParam(name = "curPage", defaultValue = "1") int curPage,@RequestParam(name = "pageCnt", defaultValue = "5") int pageCnt, Model model) {
		List<Map<String, Object>> list = null;
		int count = adminDao.user_count(); // 모든 회원 수
		PageUtil page_info = new PageUtil(count, curPage,pageCnt);
		int start = page_info.getPageBegin() - 1;
		list = adminDao.user_list(start, pageCnt);
		model.addAttribute("list", list);
		model.addAttribute("page_info", page_info);
		model.addAttribute("count", count);
		return "admin/user_list";
	}
	
	//키워드에 따른 사용자 목록
	@RequestMapping("search")
	public ModelAndView search(@RequestParam(name = "keyword") String keyword) {
		int count = adminDao.count(keyword);
		int cur_page = 1;
		PageUtil page = new PageUtil(count, cur_page);
		int start = page.getPageBegin();
		int end = page.getPageEnd();
		List<ProductDTO> list = adminDao.search(keyword, start, end);
		Map<String, Object> map = new HashMap<>();
		map.put("list", list);
		map.put("keyword", keyword);
		map.put("page", page);
		return new ModelAndView("admin/user_list", "map", map);
	}
	
	//사용자 기본 목록
	@GetMapping("order_list")
	public String order_list(@RequestParam(name = "curPage", defaultValue = "1") int curPage, Model model) {
	    int count = adminDao.order_count(); // 모든 회원 수

	    PageUtil page_info = new PageUtil(count, curPage);
	    int start = page_info.getPageBegin() - 1;
	    int pageCnt = page_info.PAGE_SCALE;

	    // 현재 페이지에 해당하는 사용자 목록 가져오기
	    List<Map<String, Object>> list = adminDao.order_list(start, pageCnt);
	    List<Map<String, Object>> user_list = adminDao.list();
	    System.out.println(user_list);
	    
	    // orderid에 따라 아이템 갯수를 저장할 Map
	    Map<Long, Integer> map = new HashMap<>();
	    Map<Long, String> status = new HashMap<>();
	    
	    // 각 주문에 대해 아이템 갯수를 계산
	    for (Map<String, Object> row : user_list) {
	        Long orderid = (Long) row.get("orderid"); // 주문 번호 가져오기
	        String ststus = adminDao.status(orderid);
	        int order_count = adminDao.user_order_count(orderid);
	        map.put(orderid, order_count); // orderCountMap에 주문 번호와 갯수를 추가
	        status.put(orderid, ststus);
	        System.out.println(order_count);
	    }

	    // 모델에 데이터 추가
	    model.addAttribute("list", list);
	    model.addAttribute("page_info", page_info);
	    model.addAttribute("count", count);
	    model.addAttribute("ordercount", map); // orderCountMap을 모델에 추가
	    model.addAttribute("orderstatus", status); // orderCountMap을 모델에 추가

	    return "admin/order_list";
	}

	
	// 상품목록
	@GetMapping("list_product")
	public String product_list() {
		return "admin/admin_product_list";
	}
}
