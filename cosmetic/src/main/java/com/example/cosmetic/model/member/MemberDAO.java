package com.example.cosmetic.model.member;

import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MemberDAO {

	@Autowired
	SqlSession session;

	// 로그인
	public String login(String userid, String passwd) {
		Map<String, Object> map = new HashMap<>();
		map.put("userid", userid);
		map.put("passwd", passwd);
		return session.selectOne("member.login", map);
	}

	// 회원가입
	public void join(MemberDTO dto) {
		session.insert("member.join", dto);
	}

	// 아이디 중복확인
	public String id_check(String userid) {
		return session.selectOne("member.id_check", userid);
	}
}
