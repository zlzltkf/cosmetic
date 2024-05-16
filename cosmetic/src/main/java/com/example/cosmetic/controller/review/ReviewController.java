package com.example.cosmetic.controller.review;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.example.cosmetic.model.review.ReviewService;

@Controller
@RequestMapping("/review/")
public class ReviewController {

	@Autowired
	ReviewService reviewService;
	
}
