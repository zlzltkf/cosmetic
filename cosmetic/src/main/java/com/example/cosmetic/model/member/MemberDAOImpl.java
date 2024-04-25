package com.example.cosmetic.model.member;

import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MemberDAOImpl implements MemberDAO {
	@Autowired
	SqlSession session;

	@Override
	public String login(String userid, String passwd) {
		Map<String, Object> map = new HashMap<>();
		map.put("userid", userid);
		map.put("passwd", passwd);
		return session.selectOne("member.login", map);
	}

}
