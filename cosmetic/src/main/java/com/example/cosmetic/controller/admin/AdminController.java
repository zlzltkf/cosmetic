package com.example.cosmetic.controller.admin;

import java.io.Console;
import java.io.File;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.example.cosmetic.model.admin.AdminDao;
import com.example.cosmetic.model.product.ProductDTO;

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
	
	//현진 및 만석쌤 버전
//	@PostMapping("insert")
//	public String insert(ProductDTO dto, 
//	                     @RequestParam("ctg_small") String small, 
//	                     @RequestParam("o_name") String[] oNames, 
//	                     @RequestParam("o_amount") String[] oAmounts,
//	                     HttpServletRequest request, 
//	                     HttpSession session) {
//	    String filename = "-";
//	    MultipartFile file = dto.getFile(); // 파일 객체 가져오기
//
//	    // 파일 업로드 처리
//	    if (file != null && !file.isEmpty() && file.getOriginalFilename() != null) {
//	        filename = file.getOriginalFilename(); // 파일명 설정
//
//	        try {
//	            ServletContext application = request.getSession().getServletContext();
//	            String path = application.getRealPath("/resources/admin/img");
//	            File directory = new File(path);
//
//	            if (!directory.exists()) {
//	                directory.mkdirs(); // 디렉토리가 없으면 생성
//	            }
//	            file.transferTo(new File(directory, filename)); // 파일 저장
//	        } catch (Exception e) {
//	            e.printStackTrace();
//	        }
//	    }
//
//	    // 대분류와 소분류 설정
//	    String ctg_big = small;
//	    int small_no = adminDao.small_no(ctg_big);
//	    dto.setP_cate(small_no);
//	    dto.setP_img1(filename); // 파일명 설정
//
//	    int price = dto.getP_price();
//	    adminDao.product_insert(dto);
//
//	    int p_id = adminDao.p_id();
//	    System.out.println("p_id" + p_id);
//
//	    // o_amount 값을 파싱하여 정수 배열로 변환
//	    List<Integer> oAmountList = new ArrayList<>();
//	    for (String oAmount : oAmounts) {
//	        String[] amounts = oAmount.split(",");
//	        for (String amountStr : amounts) {
//	            if (!amountStr.trim().isEmpty()) {
//	                try {
//	                    int amount = Integer.parseInt(amountStr.trim());
//	                    if(amount>0) {
//	                    	oAmountList.add(amount);
//	                    }
//	                } catch (NumberFormatException e) {
//	                    System.err.println("변환 실패");
//	                }
//	            }
//	        }
//	    }
//
//	    if (oNames != null && oAmounts != null) {
//	        for (int i = 0; i < oNames.length; i++) {
//	            String o_name = oNames[i];
//	            if(o_name.equals("0")) {
//	            	continue;
//	            }
//	            for (Integer o_amount : oAmountList) {
//	                dto.setO_price(price);
//	                dto.setO_p_id(p_id);
//	                dto.setO_name(o_name);
//	                dto.setO_amount(o_amount);
//	                dto.setP_stock(o_amount);
//	                adminDao.product_insert(dto);
//	                adminDao.option_insert(dto);
//	            }
//	        }
//	    }
//
//	    return "admin/write_view";
//	}
	
	//조규버전
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



////현진버전
//	@PostMapping("insert")
//	public String insert(ProductDTO dto, 
//	                     @RequestParam("ctg_small") String small, 
//	                     @RequestParam(value = "o_name", required = false) String[] oNames, 
//	                     @RequestParam(value = "o_amount", required = false) String[] oAmounts,
//	                     HttpServletRequest request, 
//	                     HttpSession session) {
//	    String filename = "-";
//	    MultipartFile file = dto.getFile(); // 파일 객체 가져오기
//
//	    // 파일 업로드 처리
//	    if (file != null && !file.isEmpty() && file.getOriginalFilename() != null) {
//	        filename = file.getOriginalFilename(); // 파일명 설정
//
//	        try {
//	            ServletContext application = request.getSession().getServletContext();
//	            String path = application.getRealPath("/resources/admin/img");
//	            File directory = new File(path);
//
//	            if (!directory.exists()) {
//	                directory.mkdirs(); // 디렉토리가 없으면 생성
//	            }
//	            file.transferTo(new File(directory, filename)); // 파일 저장
//	        } catch (Exception e) {
//	            e.printStackTrace();
//	        }
//	    }
//
//	    // 대분류와 소분류 설정
//	    String ctg_big = small;
//	    int small_no = adminDao.small_no(ctg_big);
//	    dto.setP_cate(small_no);
//	    dto.setP_img1(filename); // 파일명 설정
//
//	    // 상품 정보 추가
//	    int p_id = adminDao.p_id();
//	    System.out.println("p_id:" + p_id);
//	    int price = dto.getP_price();
//	    adminDao.product_insert(dto);
//
//	    // 상품 정보가 성공적으로 추가되었다면 옵션 정보 추가 및 재고 업데이트
//	    if (p_id != 0 && oNames != null && oAmounts != null && oNames.length == oAmounts.length) {
//	    	
//	        for (int i = 0; i < oNames.length; i++) {
//	            String o_name = oNames[i];
//	            String o_amountStr = oAmounts[i];
//
//	            if (o_name.equals("0") || o_amountStr.trim().isEmpty()) {
//	                continue;
//	            }
//
//	            try {
//	                int o_amount = Integer.parseInt(o_amountStr.trim());
//	                if (o_amount > 0) {
//	                    dto.setO_name(o_name);
//	                    dto.setO_amount(o_amount);
//	                    dto.setO_p_id(p_id);
//	                    dto.setP_price(price);
//	                    // 옵션 정보 추가
//	                    adminDao.option_insert(dto);
//	                    
//	                    // 상품의 재고에 옵션의 수량 합산하여 업데이트
//	                    adminDao.updateProductStock(p_id, o_amount);
//	                }
//	            } catch (NumberFormatException e) {
//	                System.err.println("변환 실패: " + o_amountStr);
//	            }
//	        }
//	    }
//
//	    return "admin/write_view";
//	}


}
