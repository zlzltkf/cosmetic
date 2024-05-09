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



<c:forEach var="id" items="${itemIds}">
    <li>${id}</li> <!-- 각각의 p_id를 출력 -->
</c:forEach>

<%-- <c:forEach var="p_id" items="${P_ids}">
    <li>${p_id}</li> <!-- 각각의 p_id를 출력 -->
</c:forEach>

<c:forEach var="amount" items="${Amounts}">
    <li>${amount}</li> <!-- 각각의 amount를 출력 -->
</c:forEach> --%>

</body>
</html>