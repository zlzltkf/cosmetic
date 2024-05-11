package com.example.cosmetic.model.cart;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class CartDAO {

	@Autowired
	SqlSession sqlSession;

	// 카트 리스트
	public List<CartDTO> list_cart(String userid) {
		List<CartDTO> list = null;
		list = sqlSession.selectList("cart.cart_list", userid);
		return list;
	}

	// 장바구니가 추가
	public void insert(CartDTO dto) {
		sqlSession.insert("cart.cart_insert", dto);
	}

	// 카트 옵션 변경
	public void o_name_update(CartDTO dto) {
		sqlSession.update("cart.o_name_update", dto);
	}
	//카트 수량 변경
	public void amount_update(CartDTO dto) {
		sqlSession.update("cart.amount_update", dto);
	}

	// 장바구니 합계
	public int sum_money(String userid) {
		int total = 0;
		total = sqlSession.selectOne("cart.cart_sum_money", userid);
		return total;
	}

	// 장바구니 상품 한개 삭제
	public void delete(int c_id) {
		sqlSession.delete("cart.cart_delete", c_id);
	}

	// 장바구니 전체 삭제
	public void delete_all(String userid) {
		sqlSession.delete("cart.cart_delete_all", userid);
	}
	//상품의 가격 인데 보류
	/*
	 * public List<CartDTO> cart_money() { return
	 * sqlSession.selectList("cart.cart_product_money"); }
	 */

}
