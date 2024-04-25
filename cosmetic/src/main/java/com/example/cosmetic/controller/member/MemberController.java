package com.example.cosmetic.controller.member;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import com.example.cosmetic.model.member.MemberDAO;
import com.example.cosmetic.model.member.MemberDTO;
import jakarta.servlet.http.HttpSession;

@Controller
public class MemberController {
	@Autowired
	MemberDAO memberDao;

	// 로그인 화면으로 이동
	@GetMapping("page_login")
	public String page_login() {
		return "login/login";
	}

	// 회원가입 화면으로 이동
	@GetMapping("page_join")
	public String page_join() {
		return "login/join";
	}

	// 로그인 기능
	@PostMapping("login")
	public ResponseEntity<Map<String, Object>> login(@RequestBody Map<String, String> data, HttpSession session) {
		String userid = data.get("userid");
		String passwd = data.get("passwd");
		String nickname = memberDao.login(userid, passwd);
		Map<String, Object> response = new HashMap<>();
		if (nickname == null) {
			response.put("message", "아이디 또는 비밀번호가 일치하지 않습니다.");
			return ResponseEntity.ok(response);
		} else {
			session.setAttribute("userid", userid);
			session.setAttribute("nickname", nickname);
			response.put("success", true);
			return ResponseEntity.ok(response);
		}
	}

	// 로그아웃 기능
	@GetMapping("logout")
	public String logout(HttpSession session) {
		session.invalidate(); // 세션 초기화
		return "main/main";
	}

	// 회원가입 기능
	@PostMapping("join")
	public String join(@RequestParam(name = "userid") String userid, @RequestParam(name = "passwd") String passwd,
			@RequestParam(name = "name") String name, @RequestParam(name = "nickname") String nickname,
			@RequestParam(name = "birth") int birth, @RequestParam(name = "phone") String phone,
			@RequestParam(name = "email") String email, @RequestParam(name = "address1") String address1,
			@RequestParam(name = "address2") String address2) {
		// String pass = memberDao.encrypt(passwd); // => 추후 비밀번호 암호화
		MemberDTO dto = new MemberDTO();
		dto.setUserid(userid);
		dto.setPasswd(passwd);
		dto.setName(name);
		dto.setNickname(nickname);
		dto.setBirth(birth);
		dto.setPhone(phone);
		dto.setEmail(email);
		dto.setAddress1(address1);
		dto.setAddress2(address2);
		memberDao.join(dto); // document 저장
		return "redirect:/page_login";
	}

	// 회원가입 => 아이디 중복확인
	@PostMapping("id_check")
	public ResponseEntity<Map<String, String>> check(@RequestParam(name = "userid") String userid) {
		String count = "";
		if (userid == "") { // userid가 빈값이면 == 입력 안하면즉시 false반납
			count = "false";
		} else {
			count = memberDao.id_check(userid); // userid 있는지 검사해서
			if (count == null) { // count가 null이면 "true" 문자열로 설정
				count = "true";
			}
		}
		System.out.println(count);
		Map<String, String> response = new HashMap<>();
		response.put("count", count);

		return ResponseEntity.ok(response);
	}

}
