package com.example.cosmetic.model.product;

import java.util.Date;

import org.springframework.stereotype.Service;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@AllArgsConstructor
@NoArgsConstructor
public class ProductDTO {
	private int p_id;
	private String p_name;
	private int p_price;
	private int p_stock;
	private String p_img1;
	private String p_img2;
	private String p_img3;
	private String p_detail;
	private Date p_date;
	private int p_delivery;
	private int p_hit;
	private int p_sel;
	private int p_cate;
	
	//조인한 목록
	private String ctg_big;
	private int ctg_b_no;
	private String ctg_small;
	private int ctg_s_no;
}
