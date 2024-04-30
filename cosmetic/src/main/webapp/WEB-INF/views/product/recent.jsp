<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>최근 본 상품 목록</title>
</head>
<body>
    <h2>최근 본 상품 목록</h2>
    <c:if test="${not empty r_list}">
        <ul>
            <c:forEach var="product" items="${r_list}">
                <li>${product.p_name} - 가격: ${product.p_price}</li>
                <li><img src="${product.p_img1}"></li>
            </c:forEach>
        </ul>
    </c:if>
    <c:if test="${empty r_list}">
        <p>최근 본 상품이 없습니다.</p>
    </c:if>
</body>
</html>
