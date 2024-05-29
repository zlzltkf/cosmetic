package com.example.cosmetic.controller.admin;

import java.util.Arrays;
import java.util.Date;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.example.cosmetic.model.admin.AdminDao;
import com.example.cosmetic.model.member.MemberDTO;
import com.example.cosmetic.model.order.OrderDTO;
import com.example.cosmetic.model.product.ProductDTO;
import com.example.cosmetic.model.product.ProductService;
import com.example.cosmetic.model.review.ReviewService;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import jakarta.servlet.ServletContext;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/admin/")
public class AdminController {

	@Autowired
	ProductService productService;

	@Autowired
	AdminDao adminDao;

	@GetMapping("admin")
	public String main() {
		return "admin/admin_view";
	}

	@GetMapping("write_product")
	public String write_product(Model model) {

		List<String> Biglist = adminDao.getBig();

		model.addAttribute("list", Biglist);
		return "admin/write_view";
	}

	@GetMapping("Small")
	@ResponseBody
	public List<String> getSubcategories(@RequestParam(name = "ctg_big") String ctg_big) {
		// 주어진 대분류에 해당하는 소분류를 가져오는 로직을 구현
		List<String> Small = adminDao.getSmall(ctg_big);
		return Small;
	}

	// 조규버전 상품등록
	@PostMapping("insert")
	public String insert(ProductDTO dto, @RequestParam("ctg_small") String small,
			@RequestParam(value = "o_name", required = false) String[] oNames,
			@RequestParam(value = "o_amount", required = false) String[] oAmounts,
			@RequestParam(name = "file", required = false) String[] file, HttpServletRequest request,
			HttpSession session) {

		// 대분류와 소분류 설정
		String ctg_big = small;
		int small_no = adminDao.small_no(ctg_big);
		dto.setP_cate(small_no);

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

				if (o_name.equals("0") || o_name.trim().isEmpty() || o_amountStr == null
						|| o_amountStr.trim().isEmpty()) {
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
						dto.setP_detail(dto.getP_detail());

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
		productService.insertProduct(dto, file);
		return "admin/write_view";
	}

	// 사용자 기본 목록
	@GetMapping("user_list")
	public String user_list(@RequestParam(name = "curPage", defaultValue = "1") int curPage,
			@RequestParam(name = "searchKeyword", defaultValue = "") String searchKeyword, Model model) {
		List<MemberDTO> list = null;
		Map<String, Object> user = new HashMap<>();
		user.put("searchKeyword", searchKeyword); // 검색어 추가
		System.out.println(searchKeyword);
		int count1 = adminDao.admin_user_count(user);
		PageUtil page_info = new PageUtil(count1, curPage);
		int start = page_info.getPageBegin() - 1;
		int pageCnt = page_info.PAGE_SCALE;
		user.put("start", start);
		user.put("pageCnt", pageCnt);
		list = adminDao.user_list(user);

		model.addAttribute("list", list);
		model.addAttribute("page_info", page_info);
		model.addAttribute("count", count1);
		return "admin/user_list";
	}

	/*
	 * // pageCnt(보여지는 갯수)에 따른 사용자 목록
	 * 
	 * @GetMapping("select_user_list") public String
	 * select_user_list(@RequestParam(name = "curPage", defaultValue = "1") int
	 * curPage,
	 * 
	 * @RequestParam(name = "pageCnt", defaultValue = "5") int pageCnt, Model model)
	 * { List<Map<String, Object>> list = null; int count = adminDao.user_count();
	 * // 모든 회원 수 PageUtil page_info = new PageUtil(count, curPage, pageCnt); int
	 * start = page_info.getPageBegin() - 1; list = adminDao.user_list(start,
	 * pageCnt); model.addAttribute("list", list); model.addAttribute("page_info",
	 * page_info); model.addAttribute("count", count); return "admin/user_list"; }
	 */



	@GetMapping("order_list")
	public String order_list(@RequestParam(name = "curPage", defaultValue = "1") int curPage,
			@RequestParam(name = "f_date", defaultValue = "") String f_date,
			@RequestParam(name = "l_date", defaultValue = "") String l_date,
			@RequestParam(name = "searchKeyword", defaultValue = "") String searchKeyword, Model model) {
		List<OrderDTO> list = null;
		String fDate = "";
		String lDate = "";

		if (!f_date.equals("") && !l_date.equals("")) {
			fDate = f_date + " 00:00:00"; // 날짜 형식 변환
			lDate = l_date + " 23:59:59"; // 날짜 형식 변환
		}

		Map<String, Object> listInfo = new HashMap<>();
		listInfo.put("searchKeyword", searchKeyword); // 검색어 추가
		// System.out.println(searchKeyword);
		listInfo.put("startDate", fDate);
		listInfo.put("endDate", lDate);
		// System.out.println("날짜="+fDate+lDate);
		int count1 = adminDao.admin_orderCount(listInfo);
		// System.out.println(count1);
		PageUtil page_info = new PageUtil(count1, curPage);
		int start = page_info.getPageBegin() - 1;
		int pageCnt = page_info.PAGE_SCALE;

		listInfo.put("start", start);
		listInfo.put("pageCnt", pageCnt);

		list = adminDao.admin_orderlist(listInfo);
		// System.out.println(list);
		// 주문 상태 조회

		/*
		 * Map<Long, String> status = new HashMap<>(); for (OrderDTO order : list) {
		 * Long orderid = order.getOrderid(); String ststus = adminDao.status(orderid);
		 * status.put(orderid, ststus); }
		 */

		// 모델에 데이터 추가
		model.addAttribute("list", list);
		model.addAttribute("page_info", page_info);
		model.addAttribute("count", count1);
		// model.addAttribute("orderstatus", status); // 주문 상태를 모델에 추가
		// 날짜 보내기
		model.addAttribute("f_date", fDate.toString());
		model.addAttribute("l_date", lDate.toString());
		return "admin/order_list";
	}

	/*
	 * // 상품목록
	 * 
	 * @GetMapping("list_product") public String product_list(Model model) {
	 * List<String> Biglist = adminDao.getBig(); model.addAttribute("list",Biglist);
	 * return "admin/admin_product_list"; }
	 */

	@GetMapping("/small_list/{ctg_small}")
	@ResponseBody
	public List<ProductDTO> small_list(@RequestParam(name = "curPage", defaultValue = "1") int curPage,
			@PathVariable(name = "ctg_small") String ctg_small, Model model) {
		int ctg_s_no = adminDao.s_no(ctg_small);
		List<ProductDTO> list = adminDao.s_list(ctg_s_no);
		model.addAttribute("list", list);
		return list;
	}

	// 상품 기본 목록
	@GetMapping("list_product")
	public String product_list(@RequestParam(name = "curPage", defaultValue = "1") int curPage, Model model) {
		List<String> Biglist = adminDao.getBig();
		List<Map<String, Object>> list = null;
		int count = adminDao.product_count(); // 모든 회원 수
		PageUtil page_info = new PageUtil(count, curPage);
		int start = page_info.getPageBegin() - 1;
		int pageCnt = 10;

		list = adminDao.product_list(start, pageCnt);
		model.addAttribute("Biglist", Biglist);
		model.addAttribute("list", list);
		model.addAttribute("page_info", page_info);
		model.addAttribute("count", count);
		return "admin/admin_product_list";
	}

	// 주문번호에 따른 상세주문내역
	@GetMapping("/admin_order_detail/{orderid}")
	public String orderlist(@PathVariable(name = "orderid") long orderid, Model model) {
		// 주문목록 가져오기
		List<OrderDTO> list = null;
		list = adminDao.admin_order_detail(orderid);
		model.addAttribute("list", list);
		return "admin/order_detail";
	}
}
