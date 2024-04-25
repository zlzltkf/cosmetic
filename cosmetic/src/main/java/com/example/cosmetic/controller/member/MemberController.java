package com.example.cosmetic.controller.member;


import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;

import com.example.cosmetic.model.member.MemberDAO;

import jakarta.servlet.http.HttpSession;

@Controller
public class MemberController {
	@Autowired
	MemberDAO memberDao;

	//로그인 화면으로 이동
	   @GetMapping("page_login")
	   public String page_login() {
	      return "login/login";
	   }
	   
	   //회원가입 화면으로 이동
	   @GetMapping("page_join")
	   public String page_join() {
	      return "login/join";
	   }

	@PostMapping("login")
	public ResponseEntity<Map<String, Object>> login(@RequestBody Map<String, String> data,
	                                                 HttpSession session) {
	    String userid = data.get("userid");
	    String passwd = data.get("passwd");
	    String name = data.get("name");
	    String nickname = memberDao.login(userid, passwd);
	    Map<String, Object> response = new HashMap<>();
	    if (nickname == null) {
	        response.put("message", "아이디 또는 비밀번호가 일치하지 않습니다.");
	        return ResponseEntity.ok(response);
	    } else {
	        session.setAttribute("userid", userid);
	        session.setAttribute("nickname", nickname);
	        session.setAttribute("name",name);
	        response.put("success", true);
	        return ResponseEntity.ok(response);
	    }
	}
	
	@GetMapping("logout")
	public String logout(HttpSession session) {
		session.invalidate(); // 세션 초기화
		return "main/main";
	}


}
