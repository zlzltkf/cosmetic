package com.example.cosmetic.controller.zzim;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import com.example.cosmetic.model.zzim.ZzimDAO;
import com.example.cosmetic.model.zzim.ZzimDTO;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/zzim/")
public class ZzimController {
   @Autowired
   ZzimDAO zzimDao;

//   @PostMapping("zzim_apply")
//   @ResponseBody
//   public String zzim_apply(@RequestParam(name="z_id") int z_id, HttpSession session) {
//      String userid = (String) session.getAttribute("userid");
//      if (userid != null) {
//         ZzimDTO dto = new ZzimDTO();
//         dto.setUserid(userid);
//         dto.setZ_id(z_id);
//         System.out.println(dto);
//         zzimDao.zzim_apply(dto);
//      }
//      return "success";
//   }
//
//   @PostMapping("zzim_clear")
//   @ResponseBody
//   public String zzim_clear(@RequestParam(name="z_id") int z_id, HttpSession session) {
//      String userid = (String) session.getAttribute("userid");
//      if (userid != null) {
//         ZzimDTO dto = new ZzimDTO();
//         dto.setUserid(userid);
//         dto.setZ_id(z_id);
//         System.out.println(dto);
//         zzimDao.zzim_clear(dto);
//      }
//      return "success";
//   }

   @PostMapping("zzim_apply")
   @ResponseBody
   public Map<String, String> zzim_apply(@RequestParam(name="p_id") int p_id, HttpSession session) {
       Map<String, String> response = new HashMap<>();
       String userid = (String) session.getAttribute("userid");
       if (userid != null) {
           // 좋아요한 상품인지 확인
           int count = zzimDao.check_zzim(userid, p_id);
           if (count == 0) {
               // 좋아요를 추가
               ZzimDTO dto = new ZzimDTO();
               dto.setUserid(userid);
               dto.setP_id(p_id);
               zzimDao.zzim_apply(userid, p_id);
               response.put("status", "success");
           } else {
               response.put("status", "alreadyLiked");
           }
       } else {
           response.put("status", "notLoggedIn");
       }
       return response;
   }

   @PostMapping("zzim_clear")
   @ResponseBody
   public Map<String, String> zzim_clear(@RequestParam(name="p_id") int p_id, HttpSession session) {
       Map<String, String> response = new HashMap<>();
       String userid = (String) session.getAttribute("userid");
       if (userid != null) {
           // 좋아요한 상품인지 확인
           int count = zzimDao.check_zzim(userid, p_id);
           if (count > 0) {
               // 좋아요를 해제
               ZzimDTO dto = new ZzimDTO();
               dto.setUserid(userid);
               dto.setP_id(p_id);
               zzimDao.zzim_clear(userid, p_id);
               response.put("status", "success"); // 성공적으로 좋아요가 해제되었음을 알리는 응답
           } else {
               response.put("status", "failure"); // 좋아요를 하지 않은 상품인 경우 실패로 응답
           }
       } else {
           response.put("status", "notLoggedIn"); // 로그인하지 않은 경우 실패로 응답
       }
       return response;
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