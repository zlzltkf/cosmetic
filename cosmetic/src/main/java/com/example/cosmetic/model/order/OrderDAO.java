package com.example.cosmetic.model.order;

import java.security.PublicKey;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import lombok.val;

@Repository
public class OrderDAO {
	
	@Autowired
	SqlSession sqlSession;
	
	//데이터 입력시 새로 생성된 primary key 가져오기
	public int getId() {
		return sqlSession.selectOne("order.getId");
	}
	public long getOrderId() {
		return sqlSession.selectOne("order.getOrderId");
	}
	
	public Map<String, Object> memberInfo(String userid) {
		return sqlSession.selectOne("order.memberInfo", userid);
	}
	
	//장바구니의 상품 > 주문 아이템 테이블에 저장
	public void orderInsert(OrderDTO dto) {
		sqlSession.insert("order.orderInsert", dto);
	}
	
	//주문 수 세기
	public int orderCount(Map<String, Object> map) {
		return sqlSession.selectOne("order.orderCount", map);
	}
	
	//주문한 상품 목록 확인
	public List<Map<String, Object>> orderItemsIdx(long orderid) {
		return sqlSession.selectList("order.orderItemsIdx", orderid);
	}
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
	public OrderDTO orderSelect(long orderId) {
		return sqlSession.selectOne("order.orderSelect", orderId);
	}
	
	//포인트 적립
	public void pointUpdate(Map<String, Object> map) {
		sqlSession.update("order.pointUpdate", map);
	}
	
	//포인트 불러오기
	public Integer showPoint(String userid) {
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
//	public List<OrderDTO> orderList(String userid) {
//		return sqlSession.selectList("order.orderList", userid);
//	}
	public List<OrderDTO> orderList(Map<String, Object> map) {
		return sqlSession.selectList("order.orderList", map);
	}
	
	//주문 상태 세기
	public int countStatus(Map<String, Object> map) {
		return sqlSession.selectOne("order.countStatus", map);
	}
	
	//주문된 상품 카트에서 지우기
	public void cartDelete(int c_id) {
		sqlSession.delete("order.cartDelete", c_id);
	}
	
	//상품리스트에서 주문 아이템 삭제
	public void orderItemDelete(int orderItemId) {
		sqlSession.delete("order.orderItemDelete", orderItemId);
	}
	
	//주문 리스트에서 주문 아이템 id 선택
	public String orderItemIdSelect(long orderid) {
		return sqlSession.selectOne("order.orderItemIdSelect", orderid);
	}
	
	//주문 리스트 업데이트
	public void orderlistUpdate(Map<String, Object> map) {
		sqlSession.update("order.orderlistUpdate", map);
	}
	
	//주문 리스트에서 특정 주문 삭제
	public void orderDelete(long orderid) {
		sqlSession.delete("order.orderDelete", orderid);
	}
	
	//환불시 금액 차감
	public void deletePrice(Map<String, Object> map) {
		sqlSession.update("order.deletePrice", map);
	}
	
	//주문목록에서 환불에 필요한 정보 불러오기
	public Map<String, Object> chooseCosts(long orderid) {
		return sqlSession.selectOne("order.chooseCosts", orderid);
	}
}
