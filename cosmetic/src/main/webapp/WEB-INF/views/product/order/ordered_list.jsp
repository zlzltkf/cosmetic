<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문/배송 목록</title>

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
}
	
</style>

<body>

<%@ include file="../../include/menu/menu.jsp"%>

<div id="pageWrap">

주문목록<br>
<%-- ${list} --%>
<br><br>
주문 아이템 목록<br>
<%-- ${order} --%>
<table border="1">
<tr>
	<th>주문번호</th>
	<th colspan="4">상품정보</th>
	<th>주문수량</th>
	<th>주문상태</th>
</tr>
<c:forEach var="row" items="${order}">
	<tr>
		<td>${row.orderid}</td>
		<td>${row.map.idx}</td>
		<td><img src="${row.map.p_img}" width="50px" height="50px"></td>
		<td>${row.map.p_name}</td>
		<td>${row.map.p_price}</td>
		<td>${row.map.amount}</td>
		<td>${row.map.orderStatus}</td>
		<td><button type="button" onclick="delete_order(${row.orderid}, ${row.map.idx})">주문 취소</button></td>
	</tr>
	</c:forEach>
</table>

</div>

<script src="/resources/assets/js/vendor/jquery-1.11.2.min.js"></script>
<script src="/resources/assets/js/vendor/bootstrap.min.js"></script>
<script src="/resources/assets/js/jquery.easing.1.3.js"></script>
<script src="/resources/assets/js/plugins.js"></script>
<script src="/resources/assets/js/main.js"></script>

<script type="text/javascript">
$(document).ready(function() {
	
});
function delete_order(orderid, itemid) {
    location.href = '/order/delete_order.do?orderid=' + orderid + "&itemid=" + itemid;
}
</script>

</body>
</html>