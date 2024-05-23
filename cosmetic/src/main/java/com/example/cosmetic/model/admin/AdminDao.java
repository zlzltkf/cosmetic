package com.example.cosmetic.model.admin;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

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
	
	public List<Map<String, Object>> order_list(int start, int pageCnt) {
		 Map<String, Object> map = new HashMap<>();
	      map.put("start", start);
	      map.put("pageCnt", pageCnt);
	      return sqlSession.selectList("admin.order_list", map);
	}
	
	public int order_count() {
		return sqlSession.selectOne("admin.order_count");
	}
	
	public int user_order_count(Long orderid) {
		return sqlSession.selectOne("admin.user_order_count",orderid);
	}
	
	public List<Map<String, Object>> list() {
	      return sqlSession.selectList("admin.list");
	}
	
	public String status(Long orderid) {
		return sqlSession.selectOne("admin.status",orderid);
	}
	
	public int s_no(String ctg_small){
		return sqlSession.selectOne("admin.s_no",ctg_small);
		
	}

	public List<ProductDTO> s_list(int ctg_s_no) {
		return sqlSession.selectList("admin.s_list",ctg_s_no);
	}

	public int product_count() {
		return sqlSession.selectOne("admin.product_count");
	}

	public List<Map<String, Object>> product_list(int start, int pageCnt) {
		Map<String, Object> map = new HashMap<>();
		map.put("start", start);
	    map.put("pageCnt", pageCnt);
	    return sqlSession.selectList("admin.product_list", map);
	}
	
	public void insert_p_attach(@Param("filenames") String[] filenames, @Param("p_id") int p_id) {
	    Map<String, Object> map = new HashMap<>();
	    map.put("filenames", filenames);
	    map.put("p_id", p_id);
	    sqlSession.insert("admin.insert_p_attach", map);
	}

}
