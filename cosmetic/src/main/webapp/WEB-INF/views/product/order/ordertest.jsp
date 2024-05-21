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

<!-- 환불 라이브러리 -->
<script
  src="https://code.jquery.com/jquery-3.3.1.min.js"
  integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="
  crossorigin="anonymous"></script>

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
				<input id="amount" type="hidden" name="amount" value="${i * 10}">
			</td>
		</tr>
	</c:forEach>
	<div>
		상품 총 금액 <input id="price" name="price" value="1000"><br>
		배송비 <input id="delfee" name="delfee" value="1000"><br>
		총 금액<input id="totalPrice" name="totalPrice" value="2000"><br>
	</div>
	
	<button type="submit">제출</button>
	</form>
</table>

<script src="/resources/assets/js/vendor/jquery-1.11.2.min.js"></script>

<script type="text/javascript">
function refundRequest() {
    console.log('hello'); //이건 작동됨

    //이건 안됨
    jQuery.ajax({
        // 예: http://www.myservice.com/payments/cancel
        "url": "https://api.iamport.kr/payments/cancel",
        "type": "POST",
        "contentType": "application/json",
        "data": JSON.stringify({
            "merchant_uid": "202405205847", // 예: ORD20180131-0000011
            "cancel_request_amount": 2000, // 환불금액
            "reason": "테스트 결제 환불", // 환불사유
            "refund_holder": "홍길동", // [가상계좌 환불시 필수입력] 환불 수령계좌 예금주
            "refund_bank": "88", // [가상계좌 환불시 필수입력] 환불 수령계좌 은행코드(예: KG이니시스의 경우 신한은행은 88번)
            "refund_account": "56211105948400" // [가상계좌 환불시 필수입력] 환불 수령계좌 번호
        }),
        "dataType": "json",
        success: function(response) {
            console.log("환불 성공:", response);
        },
        error: function(xhr, status, error) {
            console.error("환불 실패:", xhr.responseText);
        }
    });

    return false; // 오류 발생 방지를 위해 추가
}
</script>

</body>
</html>