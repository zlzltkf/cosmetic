package com.example.cosmetic.model.review;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class ReviewService {
	
	@Autowired
	ReviewDAO reviewDao;
	
	public List<ReviewDTO> list() {
		return reviewDao.review_list();
	}
	
	public void delete(int r_f_idx) {
		reviewDao.review_delete(r_f_idx);
	}
	
	@Transactional
	public void insert(ReviewDTO dto) {
		reviewDao.review_insert(dto);
		String[] file = dto.getFile();
		if(file == null) return;
		for(String name : file) {
			reviewDao.insert_file(name);
		}
	}
	
	@Transactional
	public void update(ReviewDTO dto) {
		reviewDao.review_update(dto);
		String[] file = dto.getFile();
		if(file == null) return;
		for(String name : file) {
			reviewDao.update_file(name, dto.getR_idx());
		}
	}
	
	public List<String> list_file(int f_idx) {
		return reviewDao.list_file(f_idx);
	}
	
	public void delete_file(String file) {
		reviewDao.delete_file(file);
	}
}
