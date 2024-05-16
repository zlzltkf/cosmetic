package com.example.cosmetic.model.review;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ReviewDAO {

	@Autowired
	SqlSession sqlSession;
	
	public List<ReviewDTO> review_list() {
		return sqlSession.selectList("review.review_list");
	}
	
	public void review_insert(ReviewDTO dto) {
		sqlSession.insert("review.review_insert", dto);
	}
	
	public void review_delete(int r_idx) {
		sqlSession.delete("review.review_delete", r_idx);
	}
	
	public void review_update(ReviewDTO dto){
		sqlSession.update("review.review_update",dto);
	}
	
	// 파일 관련
	public List<String> list_file(int r_f_idx) {
		return sqlSession.selectList("review.list_file",r_f_idx);
	}
	
	public void insert_file(String file) {
		sqlSession.insert("review.insert_file", file);
	}
	
	public void update_file(String file, int r_f_idx) {
		Map<String, Object> map = new HashMap<>();
		map.put("file", file);
		map.put("r_f_idx", r_f_idx);
		sqlSession.insert("review.update_file", map);
	}
	
	public void delete_file(String file) {
		sqlSession.delete("review.delete_file", file);
	}
}
