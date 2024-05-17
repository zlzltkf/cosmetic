package com.example.cosmetic.model.admin;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.example.cosmetic.model.product.ProductDTO;

@Repository
public class AdminDao {
	
	@Autowired
	SqlSession sqlSession;
	
	
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
	
	public int small_no(String ctg_small) {
		return sqlSession.selectOne("admin.small_no",ctg_small);
	}
	
	public void option_insert(ProductDTO dto) {
		sqlSession.insert("admin.option_insert",dto);
	}
	public int p_id() {
		return sqlSession.selectOne("admin.get_id");
		
	}
	
	public void updateProductStock(int p_id, int o_amount) {
	    Map<String, Object> params = new HashMap<>();
	    params.put("p_id", p_id);
	    params.put("o_amount", o_amount);
	    sqlSession.update("admin.update_product_stock", params);
	}
}
