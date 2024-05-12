<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
body {
	margin: 0;
	 
}

a {
    color: #666;
    text-decoration: none;
}

a, address, blockquote, body, dd, div, dl, dt, em, fieldset, form, h1, h2, h3, h4, h5, h6, img, input, label, li, ol, p, pre, select, span, strong, textarea, ul {
    margin: 0;
    padding: 0;
    border: 0;
}

* {
	box-sizing: border-box;
	font-family: 'Montserrat', sans-serif;
}

.review_list {
	margin: 0;
    padding: 0;
    border: 0;
}

ol, ul{
	list-style: none;
}

.review_list .inner_list>li {
    border-bottom: 1px solid #e5e5e5;
}

/* 리뷰 유저쪽 */
.review_list .inner_list>li.info{
	float: left;
    width: 255px;
    padding: 30px 0;
}

.inner_list .info .user .thum{
	float: left;
    position: relative;
    width: 60px;
    height: 60px;
    margin: 0;
}

.inner_list .info .user .thum img {
    width: 60px;
    height: 60px;
}

.inner_list .info .user .thum .bg {
    position: absolute;
    top: 0;
    left: 0;
    display: block;
    overflow: hidden;
    width: 60px;
    height: 60px;
    background: url(https://static.oliveyoung.co.kr/pc-static-root/image/comm/bg_my_picture.png) no-repeat;
}

.review_list .inner_list .info .user .tag{
	margin-top: 12px;
    font-weight: 400;
    font-size: 12px;
    line-height: 14px;
    color: #757d86;
}

.review_list .inner_list .info .user .info_user {
    overflow: hidden;
    width: 168px;
    margin-left: 11px !important;
}

.review_list .inner_list .info .user .tag span, .review_list .inner_list .info .user .topreview_N2 span {
    display: inline-block;
    vertical-align: top;
    font-weight: 400;
    font-size: 12px;
    line-height: 14px;
    color: #757d86;
}

/* 리뷰 컨텐츠쪽 */
.review_list .inner_list>li>.review_contents{
	position: relative;
    margin-left: 255px;
    padding: 30px 0;
    bottom: 80px;
}

.review_list .inner_list>li>.review_contents .txt_inner {
    color: #555;
    line-height: 24px;
}

.score_area {
    min-height: 20px;
    margin-bottom: 14px;
}

.inner_list .review_point {
    float: left;
    width: 112px;
    height: 20px;
    background: url(https://static.oliveyoung.co.kr/pc-static-root/image/comm/ico_review_point_new_off.png) 0 0 / 112px auto no-repeat;
}

.score_area .date {
    margin-left: 15px;
    font-size: 16px;
    line-height: 24px;
    letter-spacing: 0;
}

.inner_list .review_thum {
    padding: 0;
    margin-bottom: 15px;
    border-bottom: 0;
}

.like_area {
    margin-top: 20px;
}

.like_area .btn_like {
    padding-left: 0;
    background: 0 0;
    color: #333;
    font-size: 15px;
    line-height: 28px;
    letter-spacing: 0;
    font-weight: 700;
}

.like_area .btn_like {
    height: 32px;
    padding-left: 39px;
    border: none;
    font-size: 14px;
    color: #333;
}

.like_area .btn_like span {
    position: relative;
    display: inline-block;
    margin-left: -34px;
    height: 28px;
    line-height: 26px;
    padding: 0 36px 0 24px;
    color: #888;
    border: 1px solid #ddd;
    border-radius: 14px;
    vertical-align: top;
    font-weight: 400;
     background: url("https://static.oliveyoung.co.kr/pc-static-root/image/product/icon_recom_new.png") 0 1px/17px auto no-repeat;
}

.inner_list .review_point {
    float: left;
    width: 112px;
    height: 20px;
    background: url(https://static.oliveyoung.co.kr/pc-static-root/image/comm/ico_review_point_new_off.png) 0 0 / 112px auto no-repeat;
}

.inner_list .review_point .point {
    height: 20px;
    background: url(https://static.oliveyoung.co.kr/pc-static-root/image/comm/ico_review_point_new_on.png) 0 0 / 112px auto no-repeat;
}
</style>
</head>
<body data-spy="scroll" data-target=".navbar-collapse">
	
	<div class="head_title text-center">
		<h2>상품리뷰</h2>
    </div>
    <div class="review_list">
    <ul class="inner_list">
        <li>
            <div class="info">
    			<div class="user">
        			<a href="#" >
            			<div class="thum">
                			<span class="bg"></span>
                			<img src="https://static.oliveyoung.co.kr/pc-static-root/image/comm/my_picture_base.jpg">
            			</div>
        			</a>
					<p class="info_user"><a>닉네임</a></p>
					<p class="tag">
						<span>지성</span>
						<span>쿨톤</span>
						<span>여드름</span>
						<span>탄력</span>
					</p>
				</div>
			</div>
            <div class="review_contents">
            	<div class="score_area">
            		<span class="review_point">
            			<span class="point" style="width: 100%"></span> <!-- 스타일 가로길이로 별점개수 -->
            			<!-- 100%: 5점, 80%: 4점, 60%: 3점, 40%: 2점, 20%: 1점 어케하는지는 모름 --> 
            		</span><!-- 별점 -->
            		<span class="date">날짜</span>
            	</div>
            	
            	<div class="txt_inner">리뷰내용</div>
            	
            	<div class="review_thum">
            		<ul>
            			<li>
            				<a href="#">
            					<span>
            						<img src="https://image.oliveyoung.co.kr/uploads/images/gdas…aoTalk_20240429_215441790.jpg?RS=165x0&CS=165x165">
            					</span>	
            				</a>
            			</li>
            		</ul>
            	</div>
            	<p class="txt_beauty">※ 해당 리뷰는 원칙적으로 기본 상품이 동일한 단품 사용 후 작성된 것이며,개별 상품에 따라 용량 내지 일부 구성(1+1, 기획상품 등)이 상이할 수 있음을 안내드립니다.</p>
            	
            	<div class="like_area">이 리뷰가 도움이 돼요!
            		<button type="button" class="btn_like">
            			<span></span>
            		</button>
            	</div>
            </div>
        </li>
    </ul>
</div>

</body>
</html>