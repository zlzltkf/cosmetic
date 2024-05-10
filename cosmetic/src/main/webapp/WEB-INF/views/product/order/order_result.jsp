<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>결제완료</title>

<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="apple-touch-icon" href="apple-touch-icon.png">
<link rel="stylesheet" href="/resources/assets/css/fonticons.css">
<link rel="stylesheet" href="/resources/assets/css/slider-pro.css">
<link rel="stylesheet" href="/resources/assets/css/stylesheet.css">
<link rel="stylesheet" href="/resources/assets/css/font-awesome.min.css">
<link rel="stylesheet" href="/resources/assets/css/bootstrap.min.css">
<link rel="stylesheet" href="/resources/assets/css/plugins.css" />
<link rel="stylesheet" href="/resources/assets/css/style.css">
<link rel="stylesheet" href="/resources/assets/css/responsive.css" />
<script
   src="/resources/assets/js/vendor/modernizr-2.8.3-respond-1.4.2.min.js"></script>

</head>

<style>
#pageWrap {
	margin: 155px auto 0 auto;
	width: 65%;
	border: 1px solid black;
}
#infoHeader {
	display: flex;
	flex-direction: row;
	justify-content: space-between;
}
#process ul {
	display: flex;
	flex-direction: row;
}

#resultBox {
	display: flex;
	flex-direction: row;
}

#orderInfo {
	border: 1px solid black;
	flex-grow: 1;
}
#itemInfo {
	border: 1px solid black;
	width: 200px;
}

.rowBox {
	display: flex;
	flex-direction: row;
	border: 1px solid black;
}
.img {
	width: 100px;
	height: 100px;
}
.rowInfo {
	display: flex;
	flex-direction: column;
	border: 1px solid black;
}
</style>

<body>
<%@ include file="../../include/menu/menu.jsp"%>

<div id="pageWrap">

<div id ="infoHeader">
	<h2>결제완료</h2>
	<div id="process">
		<ul class="step_list">
			<li class="li"style="font-size: 24px;">1 장바구니 ></li>
			<li class="li" style="font-size: 24px;">2 주문/결제 ></li>
			<li class="li" style="font-size: 24px;">3 결제완료</li>
		</ul>
	</div>
</div>

<div id="resultBox">

<div id ="orderInfo">
<table border="1">
	<tr>
		<td>주문번호</td>
		<td>${order.orderid}</td>
	</tr>
	<tr>
		<td>상품금액</td>
		<td>${order.price}</td>
	</tr>
	<tr>
		<td>배송비</td>
		<td>${order.deliverCost}</td>
	</tr>
	<tr>
		<td>총합계</td>
		<td>${order.totalPrice}</td>
	</tr>
	<tr>
		<td>포인트</td>
		<td>${totalPoint}</td>
	</tr>
	<tr>
		<td>배송정보</td>
		<td>
			<div id="delInfo">
				<div>${order.username}</div>
				<div>${order.zipcode}</div>
				<div>${order.address1}</div>
				<div>${order.address2}</div>
			</div>
		</td>
	</tr>
</table>
</div>

<div id ="itemInfo">

<c:forEach var="row" items="${orderitems}">
<div class="rowBox">
	<div class="img">
		<div>
			<img src="${row.p_img}">
		</div>
	</div>
	<div class="rowInfo">
		<div>
			${row.p_name}
		</div>
		<div>
			${row.p_price}원
		</div>
		<div>
			${row.amount}개
		</div>
		<div>
			${row.orderStatus}
		</div>
	</div>
</div>
</c:forEach>
</div>
</div>

<div id="footer">
	<button id="toList" onclick="
		location.href = '/order/orderlist.do';
	">주문배송목록</button>
	<button id="toReview" onclick="
		location.href = '/review/??'; 
	">리뷰작성</button>
</div>

</div>

</body>
</html>