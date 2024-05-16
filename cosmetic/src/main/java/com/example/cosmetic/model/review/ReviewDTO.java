package com.example.cosmetic.model.review;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@NoArgsConstructor
@AllArgsConstructor
public class ReviewDTO {
	private int r_idx;
	private String userid;
	private String nickname;
	private String r_subject;
	private String r_contents;
	private Date r_date;
	
	//첨부파일
	private String[] file;
}
