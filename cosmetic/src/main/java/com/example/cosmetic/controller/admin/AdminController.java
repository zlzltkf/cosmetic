package com.example.cosmetic.controller.admin;

import java.io.File;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.example.cosmetic.model.product.Admin_ProductDAO;
import com.example.cosmetic.model.product.ProductDTO;

import jakarta.servlet.ServletContext;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;


@RequestMapping("/admin/")
@Controller
public class AdminController {
	
	
	@Autowired
	Admin_ProductDAO admin_productDAO;
	
	@GetMapping("admin")
	public String main() {
		return "admin/admin_view";
	}
	
	@GetMapping("write_product")
	public String write_product() {
		return "admin/write_view";
	}
	
	// 상품 추가
		@PostMapping("insert")
		public String insert(ProductDTO dto, HttpServletRequest request, HttpSession session) {
		    String filename = "-";
		    MultipartFile file = dto.getFile(); // 파일 객체 가져오기

		    // 파일이 비어있지 않고, 파일의 원본 이름이 null이 아닌 경우에만 처리
		    if (file != null && !file.isEmpty() && file.getOriginalFilename() != null) {
		        filename = file.getOriginalFilename(); // 파일명 설정

		        try {
		            ServletContext application = request.getSession().getServletContext();
		            String path = application.getRealPath("/resources/images/");
		            File directory = new File(path);

		            if (!directory.exists()) {
		                directory.mkdirs(); // 디렉토리가 없으면 생성
		            }

		            // 파일 저장
		            file.transferTo(new File(directory, filename));
		        } catch (Exception e) {
		            e.printStackTrace();
		            // 파일 저장 중 오류 발생 시, 적절한 예외 처리 로직 추가 가능
		        }
		    }
		    
		    dto.setP_img1(filename); // 파일명 설정
		    admin_productDAO.insert(dto);
		     // 데이터베이스에 저장
		    return "redirect:/product/list";
		}
		
		@GetMapping("big")
		public ModelAndView getBig(ModelAndView mav) {
			mav.setViewName("admin/write_view");
			List<String>list = admin_productDAO.getBig();
			mav.addObject("list", list);
			System.out.println(list);
			return mav;
		}
}
