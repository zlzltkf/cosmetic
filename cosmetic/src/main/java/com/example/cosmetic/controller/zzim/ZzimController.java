package com.example.cosmetic.controller.zzim;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import com.example.cosmetic.model.zzim.ZzimDAO;
import com.example.cosmetic.model.zzim.ZzimDTO;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/zzim/")
public class ZzimController {
	@Autowired
	ZzimDAO zzimDao;

	@PostMapping("zzim_apply")
	@ResponseBody
	public String zzim_apply(@RequestParam(name="z_id") int z_id, HttpSession session) {
		String userid = (String) session.getAttribute("userid");
		if (userid != null) {
			ZzimDTO dto = new ZzimDTO();
			dto.setUserid(userid);
			dto.setZ_id(z_id);
			System.out.println(dto);
			zzimDao.zzim_apply(dto);
		}
		return "success";
	}

	@PostMapping("zzim_clear")
	@ResponseBody
	public String zzim_clear(@RequestParam(name="z_id") int z_id, HttpSession session) {
		String userid = (String) session.getAttribute("userid");
		if (userid != null) {
			ZzimDTO dto = new ZzimDTO();
			dto.setUserid(userid);
			dto.setZ_id(z_id);
			System.out.println(dto);
			zzimDao.zzim_clear(dto);
		}
		return "success";
	}

	@GetMapping("zzim_list")
	public ModelAndView zzim_list(ModelAndView mav, HttpSession session) {
		String userid = (String) session.getAttribute("userid");
		mav.setViewName("product/lovelist");
		mav.addObject("list", zzimDao.zzim_list(userid));

		return mav;
	}

	@GetMapping("zzim_delete/{z_id}")
	public String zzim_delete(@PathVariable(name = "z_id") int z_id) {
		zzimDao.zzim_delete(z_id);
		return "redirect:/love/love_list";
	}

	@PostMapping("zzim_delete_all")
	public String zzim_delete_all(HttpServletRequest request) {
		String[] num = request.getParameterValues("num");
		if (num != null) {
			for (int i = 0; i < num.length; i++) {
				zzimDao.zzim_delete(Integer.parseInt(num[i]));
			}
		}
		return "redirect:/love/love_list";
	}

}
