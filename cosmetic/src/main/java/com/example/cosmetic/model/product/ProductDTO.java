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
	int p_id;
	String p_name;
	int p_price;
	int p_stock;
	String p_img1;
	String p_img2;
	String p_img3;
	String p_detail;
	Date p_date;
	int p_delivery;
	int p_hit;
	int p_sel;
	int p_cate;
}
