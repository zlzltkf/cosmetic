<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지</title>

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
* {
	font-family: "Montserrat", sans-serif;
	font-optical-sizing: auto;
	font-weight: <weight>;
	font-style: normal;
}

/* 전체 */
#pageWrap {
	margin: 230px auto 200px auto;
	width: 60%;
	height: 100%;
	font-size: 0.9em;
	min-width: 610px;
}

#p_wrap {
	display: flex;
	flex-direction: row;
	border: 1px solid black;
	width: 100%;
}

#sub_menu {
	border: 1px solid black;
	width: 250px;
}

#content_wrap {
	border: 1px solid black;
	width: 100%;
}
</style>

<body>

<%@ include file="../include/menu/menu.jsp"%>

<div id="pageWrap">


마이페이지
<br></br>
<a href="/order/orderlist.do">주문/배송조회</a><br>
취소/반품/교환 내역<br>
<a href="/cart/list?${sessionScope.userid}">장바구니</a><br>
<a>좋아요</a><br>
쿠폰<br>
<a>리뷰</a><br>
<a>회원정보수정</a><br>
<a>회원탈퇴</a><br>



</div>



<script src="/resources/assets/js/vendor/jquery-1.11.2.min.js"></script>
<script src="/resources/assets/js/vendor/bootstrap.min.js"></script>
<script src="/resources/assets/js/jquery.easing.1.3.js"></script>
<script src="/resources/assets/js/plugins.js"></script>
<script src="/resources/assets/js/main.js"></script>

</body>
</html>