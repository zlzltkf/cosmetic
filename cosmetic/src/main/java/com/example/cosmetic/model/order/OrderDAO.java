package com.example.cosmetic.model.order;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class OrderDAO {
	
	@Autowired
	SqlSession sqlSession;
	
	//데이터 입력시 새로 생성된 primary key 가져오기
	public int getId() {
		return sqlSession.selectOne("order.getId");
	}
	
	public Map<String, Object> memberInfo(String userid) {
		return sqlSession.selectOne("order.memberInfo", userid);
	}
	
	//장바구니의 상품 > 주문 아이템 테이블에 저장
	public void orderInsert(OrderDTO dto) {
		sqlSession.insert("order.orderInsert", dto);
	}
	
	//주문한 상품 목록 확인
	public Map<String, Object> orderItems(int itemId) {
		return sqlSession.selectOne("order.orderItems", itemId);
	}
	
	//상품정보 가져오기
	public Map<String, Object> orderedProducts(int itemId) {
		return sqlSession.selectOne("order.orderedProducts", itemId);
	}
	
	//주문테이블 데이터 입력
	public void orderItemInsert(Map<String, Object> map) {
		sqlSession.insert("order.orderItemInsert", map);
	}
	
	//주문결과 확인
	public OrderDTO orderSelect(int orderId) {
		return sqlSession.selectOne("order.orderSelect", orderId);
	}
	
	//포인트 적립
	public void pointUpdate(Map<String, Object> map) {
		sqlSession.update("order.pointUpdate", map);
	}
	
	//포인트 불러오기
	public Integer  showPoint(String userid) {
		int point;
		Integer p = sqlSession.selectOne("order.showPoint", userid);
		if (p != null) {
			point = p.intValue();
		} else {
			point = 0;
		}
		return point;
	}
	
	//주문 목록 출력
	public List<OrderDTO> orderList(String userid) {
		return sqlSession.selectList("order.orderList", userid);
	}
	
}
