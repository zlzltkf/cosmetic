package com.example.cosmetic.model.product;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


@Repository
public class Admin_ProductDAO {
	
	@Autowired
	SqlSession sqlSession;
	
	public void insert(ProductDTO dto) {
		sqlSession.insert("admin_product.product_insert", dto);
	   }
	
	public List<String> getBig() {
        return sqlSession.selectList("admin_product.big");
    }
}
