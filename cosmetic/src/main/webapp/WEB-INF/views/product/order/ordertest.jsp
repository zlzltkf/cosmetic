<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%-- <table border="1">
	<tr>
		<th>p_id</th>
		<th>amount</th>
	</tr>
	<form action="/order/orderform.do" method="post">
	<c:forEach var="i" begin="1" end="10">
		<tr>
			<td>
				${i}
				<input type="hidden" name="p_id" value="${i}">
			</td>
			<td>
				${i * 10}
				<input type="hidden" name="amount" value="${i * 10}">
			</td>
		</tr>
	</c:forEach>
	<button type="submit">제출</button>
	</form>
</table> --%>

<table border="1">
	<tr>
		<th>p_id</th>
		<th>amount</th>
	</tr>
	<form action="/order/orderform.do" method="post">
	
	<c:forEach var="i" begin="1" end="3">
		<tr>
			<td>
				${i}
				<input type="hidden" name="p_id" value="${i}">
			</td>
			<td>
				${i * 10}
				<input type="hidden" name="amount" value="${i * 10}">
			</td>
		</tr>
	</c:forEach>
	<div>
		상품 총 금액 <input id="price" name="price" value="1000"><br>
		배송비 <input id="delfee" name="delfee" value="1000"><br>
		포인트 <input id="point" name="point" value="1000"><br>
		총 금액<input id="totalPrice" name="totalPrice" value="1"><br>
	</div>
	
	<button type="submit">제출</button>
	</form>
</table>

</body>
</html>