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
	
	//소분류
	//정렬
	//인기순
	public List<Map<String, Object>> sub_list_best(int no) {
		return sqlSession.selectList("product.sub_list_best", no);
	}
	
	//신상품순
	public List<Map<String, Object>> sub_list_new(int no) {
		return sqlSession.selectList("product.sub_list_new", no);
	}
	
	//판매순
	public List<Map<String, Object>> sub_list_sell(int no) {
		return sqlSession.selectList("product.sub_list_sell", no);
	}
	
	//닞은가격순
	public List<Map<String, Object>> sub_list_price(int no) {
		return sqlSession.selectList("product.sub_list_price", no);
	}
	
	//소분류 카테고리 코드 > 소분류 카테고리 이름으로 변환
	public Map<String, Object> get_cate_name(int no) {
		return sqlSession.selectOne("product.get_cate_name", no);
	}

	//디테일
	public ProductDTO detail(int p_id) {
		return sqlSession.selectOne("product.detail", p_id);
	}
	
	// 최근 본 상품
}


