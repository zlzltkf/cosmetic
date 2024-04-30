package com.example.cosmetic.model.product;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.example.cosmetic.model.category.CategoryDTO;

@Repository
public class ProductDAO {
	
	@Autowired
	SqlSession sqlSession;
	
	public List<Map<String, Object>> sub_list(int no) {
		return sqlSession.selectList("product.sub_list", no);
	}
	public List<ProductDTO> list(int pageStart, int pageEnd) {
		Map<String, Object> map = new HashMap<>();
		map.put("start", pageStart);
		map.put("end", pageEnd);
		return sqlSession.selectList("product.product_list", map);
	}

	// 대분류 번호에 따른 소분류 제목 리스트
	public List<CategoryDTO> main_list(int ctg_b_no) {
		Map<String, Object> map = new HashMap<>();
		map.put("ctg_b_no", ctg_b_no);
		return sqlSession.selectList("product.main_category", map);
	}
	//대분류 번호에 따른 대분류 제목
	public String big_name(int ctg_b_no) {
		String name = sqlSession.selectOne("product.big_name", ctg_b_no);
	    return name;
	}

}


