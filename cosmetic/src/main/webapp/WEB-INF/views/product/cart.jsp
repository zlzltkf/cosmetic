<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>장바구니</title>
<link rel="stylesheet" href="/resources/assets/css/fonticons.css">
<link rel="stylesheet" href="/resources/assets/css/slider-pro.css">
<link rel="stylesheet" href="/resources/assets/css/stylesheet.css">
<link rel="stylesheet" href="/resources/assets/css/font-awesome.min.css">
<link rel="stylesheet" href="/resources/assets/css/bootstrap.min.css">
<!--For Plugins external css-->
<link rel="stylesheet" href="/resources/assets/css/plugins.css" />
<!--Theme custom css -->
<link rel="stylesheet" href="/resources/assets/css/style.css">
<!--Theme Responsive css-->
<link rel="stylesheet" href="/resources/assets/css/responsive.css" />
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<style>
body {
	margin: 0;
}

* {
	box-sizing: border-box;
}

.cart {
	width: 80%;
	margin: auto;
	padding: 30px;
}

.cart ul {
	background-color: whitesmoke;
	padding: 30px;
	margin-bottom: 50px;
	border: whitesmoke solid 1px;
	border-radius: 5px;
	font-size: 13px;
	font-weight: 300;
}

.cart ul :first-child {
	color: limegreen;
}

table {
	border-top: solid 0.5px lightgrey;
	border-collapse: collapse;
	border-bottom: solid 0.5px lightgrey;
	width: 100%;
	font-size: 14px;
}

thead {
	text-align: center;
	font-weight: bold;
}

td {
	padding: 15px 5px;
	border-bottom: 1px solid lightgrey;
}

.cart__list__option {
	vertical-align: top;
	padding: 20px;
}

.cart__list__option p {
	margin-bottom: 25px;
	position: relative;
}

.cart__list__option p::after {
	content: "";
	width: 90%;
	height: 1px;
	background-color: lightgrey;
	left: 0px;
	top: 25px;
	position: absolute;
}

.cart__list__optionbtn {
	font-size: 10px;
	padding: 7px; 
    border:none; 
    border-radius:10px; 
    min-height:30px; 
    min-width: 120px;
    border: 1px solid #9bce26;
    color: #9bce26;
    background: #fff;
}

.cart__list__optionbtn1 {
    font-size: 10px;
    padding: 7px; 
    border-radius: 10px; 
    min-height: 30px; 
    min-width: 120px;
    border: 1px solid #aaa;
    color: #666;
    background: #fff;
    display: inline-block;
    vertical-align: middle;
}

.cart__list__detail :nth-child(4), 
.cart__list__detail :nth-child(5),
.cart__list__detail :nth-child(6) {
	border-left: 2px solid whitesmoke;
	text-align: center;
}

.cart__list__detail :nth-child(5) button {
	color: white;
	border: none;
	border-radius: 5px;
	padding: 4px 8px;
	font-size: 12px;
	margin-top: 5px;
}

.cart__mainbtns {
	width: 420px;
	height: 130px;
	padding-top: 40px;
	display: block;
	margin: auto;
}

.cart__bigorderbtn {
	width: 200px;
	height: 50px;
	font-size: 16px;
	margin: auto;
	border-radius: 5px;
}

.cart__bigorderbtn.left {
	background-color: white;
	border: 1px lightgray solid;
}

.cart__bigorderbtn.right {
	background-color: #9bce26;;
	color: white;
	border: none;
}

.icon_flag {
    display: inline-block;
    width: 40px;
    height: 18px;
    border-radius: 9px;
    line-height: 17px !important;
    color: #fff !important;
    font-size: 12px !important;
    text-align: center;
    vertical-align: middle;
    text-decoration: none !important;
    margin: 0 !important;
    background-color: #f65c60;
}

.prd_delivery .ex{
    display: block;
    color: #666;
    font-size: 12px;
    font-weight: 400;
}

h5 {
    font-size: 1.125rem;
    text-align: left;
}

p {
    line-height: 1.375rem;
    margin-bottom: 2px;
    
}
select {
    padding: 7px 8px; /* 내부 여백 */
    border: 1px solid #ccc; /* 테두리 스타일 */
    border-radius: 4px; /* 테두리 둥글게 만들기 */
    background-color: #f8f8f8; /* 배경색 */
    font-size: 14px; /* 폰트 크기 */
    appearance: none; /* 기본 UI 제거 */
    text-align: center;
}

/* 선택된 항목 스타일 */
select:focus {
    outline: none; /* 포커스 효과 제거 */
    border-color: #9bce26; /* 포커스시 테두리 색상 변경 */
    box-shadow: 0 0 5px #9bce26; /* 포커스시 그림자 효과 */
}
.total_price_info {
    margin: 60px 0 0;
    border-top: 2px solid #9bce26;
    border-bottom: 1px solid #e6e6e6;
}
.total_price_info .detail_price {
    position: relative;
    overflow: hidden;
    width: 100%;
    height: 110px;
    font-weight: 700;
}
.p1{
  margin-top:20px;
  margin-right:15px;
  margin-bottom:10px;
  margin-left:15px;
  height: 50px;
}

}
.tx_sign2 {
    display: inline-block;
    width: 30px;
    height: 30px;
    background: url(https://static.oliveyoung.co.kr/pc-static-root/image/comm/ico_sign_cal2.png) no-repeat;
    text-indent: -9999px;
    overflow: hidden;
}
.sum_price {
    height: 80px;
    padding: 30px 30px 0;
    text-align: right;
    background: #f6f6f6;
    border-top: 2px solid #d6d6d6;
    font-size: 22px;
    font-weight: 700;
    position: relative;
}
.sum_place{
	font-weight: 500;
	border: solid;
	border-left: none;
	border-right: none;
	background-color: #f6f6f6;
	padding: 0px 20px 0;
	border-top-color: #d3d3d3;
}
.tx_sign2 {
    display: contents;
    width: 50px; /* 너비 조정 */
    height: 50px; /* 높이 조정 */
    background-size: cover; /* 배경 이미지 크기 조정 */
    text-indent: -9999px;
    overflow: hidden;
   /* 위아래 패딩 추가 */
}
.title_box h1 {
    float: left;
    padding: 37px 0 0;
    margin-right: 20px; /* 변경된 부분 */
    font-size: 40px;
    color: #000;
    line-height: 40px;
}

.li1, .li2, .li3 {
    float: left;
    height: 120px;
    padding: 0;
    line-height: 120px;
    text-align: center;
    font-size: 24px;
    color: #8b8176;
    white-space: nowrap;
    margin-right: 20px; /* 변경된 부분 */
}

.li1 {
    margin-left: 20px; /* .li1에 대해서만 왼쪽 여백을 설정합니다. */
}

.li3 {
    float: right;
    margin-right: 20px; /* .li3에 대해서만 오른쪽 여백을 설정합니다. */
    margin-left: 20px; /* .li3에 대해서만 왼쪽 여백을 설정합니다. */
}



.title_box{
    overflow: hidden;
    height: 140px;
    border-radius: 5px;
    z-index: 0;
}



</style>
</head>
<body>
	 <%@ include file="../include/menu/menu.jsp"%>
	 
	<section class="service sections margin-top-120">
	<section class="cart">
	<div>
	<div class="title_box">
				
			<h1>장바구니 
			<span class="tx_num">4</span>
				</h1>
	
				<ul class="step_list">
					<li class="li1" style="font-size: 24px;">1 장바구니</li><!-- 현재단계 li에 클래스 on과 <span class="hide">현재단계</span> 넣어주세요 -->
					<li class="li2" style="font-size: 24px;">2 주문/결제</li>
					<li class="li3"style="font-size: 24px;">3 주문완료</li>
				</ul>
			
			</div>
			</div>
		<div style="color: black; width: 150px; height: 50px;"><p> EDEN 배송상품</p></div>



		<table class="cart__list">
			<form>
				<thead>
					<tr>
						<td style="background-color:#fafafa; "><input type="checkbox"></td>
						<td style="background-color:#fafafa; " colspan="2">상품정보</td>
						<td style="background-color:#fafafa; ">판매가</td>
						<td style="background-color:#fafafa; ">수량</td>
						<td style="background-color:#fafafa; ">배송정보</td>
						<td style="background-color:#fafafa; ">선택</td>

					</tr>
				</thead>
				<tbody>
					<tr class="cart__list__detail">
						<td><input type="checkbox"></td>
						<td><img style="width: 85px;height: 85px; margin: auto;" src="https://image.oliveyoung.co.kr/uploads/images/goods/220/10/0000/0012/A00000012595560ko.jpg?l=ko"></td>
			<!--상품명--><td><p>롬앤 쥬시 래스팅 틴트</p> 
						<span>옵션| 색상 </span>	<br>		
						<span class="icon_flag sale">세일</span>
						</td>
						<td style="text-align: center; font-weight:bolder;"><span>15,000</span></td>
						<br>
						<td>
						<select>
  							<option selected>선택된 수량</option>
  							<option value="1">1</option>
 							<option value="2">2</option>
 							<option value="3">3</option>
 							<option value="4">4</option>
 							<option value="5">5</option>
 							<option value="6">6</option>
 							<option value="7">7</option>
 							<option value="8">8</option>
 							<option value="9">9</option>
 							<option value="10">10</option>
 							
						</select>
						</td>
						<!--배송정보-->
						<td><p class="prd_delivery">
							<strong id="deliStrongText">2,500 <br>
						<span class="ex">도서·산간 제외</span></strong>
						</p> </td>

						<!--선택-->
						<td align="center" style="border-left: 2px solid whitesmoke;">
   							<input type="button" value="옵션변경" onclick="" class="cart__list__optionbtn" style="margin-bottom: 5px;"><br> 
    						<input type="button" value="바로구매" onclick="" class="cart__list__optionbtn1" style="margin-bottom: 5px;"><br>
    						<input style="width: 56px" type="button" value="✖️삭제" onclick="" class="cart__list__optionbtn1" style="margin-bottom: 5px;"><br>
						</td>
					</tr>
				</tbody>
				<tfoot>

					<tr>
						<td colspan="3"><input type="checkbox">
							<button class="cart__list__optionbtn1" onclick="">선택상품 삭제</button>
							<button class="cart__list__optionbtn1" onclick="">전체삭제</button></td>
					</tr>
					
					
				</tfoot>
			</form>
		</table>
		<br>
		<br>
		
	<div style="border-top: 2px solid #9bce26; display: flex; justify-content: space-between; border-bottom: 2px solid #d6d6d6; padding: 30px 0; border-right: 2px solid whitesmoke;border-left: 2px solid whitesmoke; ">
    <div style="width: 50%; text-align: center;">
        <p class="p1" style="margin: 0; color: #666; font-weight: bold; font-size: 20px;">
            총 판매가 <br><span style="color: black;">149,600</span>원
        </p>
    </div>
   <div style="text-align: center;">
    <div style="display: inline-block;">
        <p style="padding: 15px 0; font-size: 30px; margin: 0;" class="tx_sign2">➕</p>
    </div>
</div>




    <div style="width: 50%; text-align: center; ">
        <p class="p1" style="margin: 0; color: #666; font-weight: bold; font-size: 20px;">
            배송비 <br><span style="color: black;">0</span>원
        </p>
    </div>
</div>


<div style="display: flex; justify-content: space-between; align-items: center; border-bottom: 1.5px solid whitesmoke; padding: 30px 10px; background-color: #F5F5F5;">
    <div style="color: gray; font-size: 15px;">
       &nbsp;&nbsp;❗ 배송비는 결제금액에 따라 변경될 수 있습니다.
    </div>
    <div>
        총 결제예상금액&nbsp; <span style="color: red; font-size: 24px; font-weight: bold;">146,300 원</span>
    </div>
</div>


	
		<div class="cart__mainbtns">
			<button class="cart__bigorderbtn left">쇼핑 계속하기</button>
			<button class="cart__bigorderbtn right">주문하기</button>
		</div>

			<div class="cart__information">
			<ul>
				<li>장바구니 상품은 최대 30일간 저장됩니다.</li>
				<li>가격, 옵션 등 정보가 변경된 경우 주문이 불가할 수 있습니다.</li>
				<li>오늘출발 상품은 판매자 설정 시점에 따라 오늘출발 여부가 변경될 수 있으니 주문 시 꼭 다시 확인해 주시기바랍니다.</li>
			</ul>
		</div>
	</section>
	</section>
</body>
</html>