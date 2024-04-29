package com.example.cosmetic.model.product;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ProductDAO {
	
	@Autowired
	SqlSession sqlSession;
	
	public List<Map<String, Object>> sub_list(int no) {
		return sqlSession.selectList("product.sub_list", no);
	}
}
