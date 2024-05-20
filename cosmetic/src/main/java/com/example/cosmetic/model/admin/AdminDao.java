package com.example.cosmetic.model.admin;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.example.cosmetic.model.member.MemberDTO;
import com.example.cosmetic.model.product.ProductDTO;

@Repository
public class AdminDao {
	
	@Autowired
	SqlSession sqlSession;
	
	//상품등록
	 public void product_insert(ProductDTO dto) {
	 sqlSession.insert("admin.product_insert", dto); }
	 
	//대분류
	public List<String> getBig() {
        return sqlSession.selectList("admin.big");
    }
	
	//소분류
	public List<String> getSmall(String ctg_big) {
		return sqlSession.selectList("admin.small", ctg_big);
	}
	
	//대분류명에 소분류 번호
	public int small_no(String ctg_small) {
		return sqlSession.selectOne("admin.small_no",ctg_small);
	}
	
	//옵션 테이블에 추가
	public void option_insert(ProductDTO dto) {
		sqlSession.insert("admin.option_insert",dto);
	}
	
	public int p_id() {
		return sqlSession.selectOne("admin.get_id");
	}
	
	//옵션 수량이 합쳐져서 p_stock
	public void updateProductStock(int p_id, int o_amount) {
	    Map<String, Object> params = new HashMap<>();
	    params.put("p_id", p_id);
	    params.put("o_amount", o_amount);
	    sqlSession.update("admin.update_product_stock", params);
	}
	
	//사용자 목록
	public List<Map<String, Object>> user_list(int start, int pageCnt) {
		 Map<String, Object> map = new HashMap<>();
	      map.put("start", start);
	      map.put("pageCnt", pageCnt);
	      return sqlSession.selectList("admin.user_list", map);
	}
	
	public int user_count() {
		return sqlSession.selectOne("admin.user_count");
	}
	
	public List<ProductDTO> search(String keyword, int start, int end) {
	      Map<String, Object> map = new HashMap<>();
	      map.put("keyword", keyword);
	      map.put("start", start);
	      map.put("end", end);
	      return sqlSession.selectList("admin.search",map);
	   }
	
	public int count(String keyword) {
	      return sqlSession.selectOne("admin.search_count",keyword);
	   }
	
	
	/*
	 * public MemberDTO detail(String userid) { Map<String, Object> map = new
	 * HashMap<>(); map.put("userid", userid); return
	 * sqlSession.selectOne("admin.user_detail", map); }
	 */
}
