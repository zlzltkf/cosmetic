<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문/결제</title>

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

<!-- 결제 라이브러리 -->
<script src="https://cdn.iamport.kr/v1/iamport.js"></script>

<!-- 카카오주소 -->
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>

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

#deliveryInfo {
	border: 1px solid black;
}

#payBox {
	display: flex;
	flex-direction: column;
}

#priceBox {
	border: 1px solid black;
}
#priceBox div {
	display: flex;
	flex-direction: row;
}

#methodBox {
	border: 1px solid black;
}

#pay {
	border: 1px solid black;
}
</style>

<body>

<%@ include file="../../include/menu/menu.jsp"%>

<div id="pageWrap">
<div id ="infoHeader">
	<h2>주문/결제</h2>
	<div id="process">
		<ul class="step_list">
			<li class="li"style="font-size: 24px;">1 장바구니 ></li>
			<li class="li" style="font-size: 24px;">2 주문/결제 ></li>
			<li class="li" style="font-size: 24px;">3 결제완료</li>
		</ul>
	</div>
</div>

<div id="info">
	<form action="/order/order.do" method="post" id="form_order">

	<!-- 숨기기 -->
	<div id="p_info" style="display: none;">
		<c:forEach var="id" items="${orderItemIds}">
			${id}<input type="hidden" name="id" value="${id}">
		</c:forEach>
	</div>
	
	<!-- 배송정보 -->
	<div id="deliveryInfo">
		<div>
			배송정보
		</div>
		<table border="1">
			<tr>
				<td>수령인</td>
				<td>
					<div id="nameBox">
						<input id="name" name="username">
						<button type="button" onclick="getInfo()">주문자정보와 동일</button>
					</div>
				</td>
			</tr>
			<tr>
				<td>전화번호</td>
				<td><input id="tel" name="tel"></td>
			</tr>
			<tr>
				<td>주소</td>
				<td>
					<div id="delAddrBox">
						<div id="findZip">
							<input id="zipcode" name="zipcode">
							<button type="button" class="btn_check" onclick="showPostcode()">우편번호 찾기</button>
						</div>
						<input id="address1" name="address1">
						<input id="address2" name="address2">
					</div>
				</td>
			</tr>
		</table>
	</div>
	
	<!-- 결제 -->
	<div id="payBox">
	
		<!-- 상품금액 -->
		<div id="priceBox">
			<div id="Pprice">
				<div>총 상품금액</div>
				<div><input id="price" name="price" value="${price}"></div>
			</div>
			<div id="Point">
				<div>포인트</div>
				<div><input id="userPoint" name="userPoint" value="${point}"></div>
			</div>
			<div id="Dprice">
				<div>배송비</div>
				<div><input id="deliverCost"  name="deliverCost" value="${delfee}"></div>
			</div>
			<div id="Tprice">
				<div>총 합계</div>
				<div><input id="totalPrice"  name="totalPrice" value="${totalPrice}"></div>
			</div>
		</div>
		
		<!-- 결제수단 -->
		<div id="methodBox">
			<div>결제수단 선택</div>
			<div id="methodBtn">
				<div id="kakao">
					<input type="radio" id="kakao" class="method" name="method" value="kakaopay">
					<label for="kakao">카카오페이</label>
				</div>
				<div id="toss">
					<input type="radio" id="toss" class="method" name="method" value="tosspay">
					<label for="toss">토스페이</label>
				</div>
				<div id="kg">
					<input type="radio" id="kg" class="method" name="method" value="html5_inicis">
					<label for="kg">KG이니시스</label>
				</div>
			</div>
		</div>
		
		<div id="pay">
				<button type="submit">제출</button>
				<!-- 결제하기 버튼 생성 -->
				<button type="button" id="payment" onclick="kakaoPay()">구매하기</button>
			</div>
	</div>
	
	</form>
</div>
</div>

<script src="/resources/assets/js/vendor/jquery-1.11.2.min.js"></script>
<script src="/resources/assets/js/vendor/bootstrap.min.js"></script>
<script src="/resources/assets/js/jquery.easing.1.3.js"></script>
<script src="/resources/assets/js/plugins.js"></script>
<script src="/resources/assets/js/main.js"></script>

<script>
$(document).ready(function(){
	
	//주문자정보와 동일 클릭 시
	function getInfo() {
		$.ajax({
			type: 'GET',
			url: '/order/memberInfo.do',
			data: { userid: ${sessionScope.userid} },
			success: function(response) {
				console.log(response)
			}
		});
	}

	
});

//주문자 정보 불러오기
function getInfo() {
	$.ajax({
		type: 'GET',
		url: '/order/memberInfo.do',
		data: { userid: "${sessionScope.userid}" },
		success: function(response) {
			document.getElementById('name').value = response.NAME;
            document.getElementById('tel').value = response.phone; 
            document.getElementById('zipcode').value = response.zipcode;
            document.getElementById('address1').value = response.address1;
            document.getElementById('address2').value = response.address2;
            
		}
	});
}

//주소api
function showPostcode() {
    new daum.Postcode(
          {
             oncomplete : function(data) {
                let fullAddr = "";
                let extraAddr = "";
                if (data.userSelectedType === "R") {
                   fullAddr = data.roadAddress;
                } else {
                   fullAddr = data.jibunAddress;
                }
                if (data.userSelectedType === "R") {
                   if (data.bname !== "") {
                      extraAddr += data.bname;
                   }
                   if (data.buildingName !== "") {
                      extraAddr += (extraAddr !== "" ? ", "
                            + data.buildingName : data.buildingName);
                   }
                   fullAddr += (extraAddr !== "" ? " (" + extraAddr
                         + ")" : "");
                }
                document.getElementById("zipcode").value = data.zonecode;
                document.getElementById("address1").value = fullAddr;
                document.getElementById("address2").focus();
             }
          }).open();
 }
 
 

//카카오 페이 결제
var IMP = window.IMP;

function kakaoPay() {
	
	var userid = "${sessionScope.userid}";
	var totalPrice = document.getElementById('totalPrice').value;
	var tel = document.getElementById('tel').value;
	var name = document.getElementById('name').value
	var zipcode = document.getElementById('zipcode').value;
	var address1 = document.getElementById('address1').value;
	
	const methodList = document.getElementsByName("method");
	var method;

	if (confirm("구매 하시겠습니까?")) { // 구매 클릭시 한번 더 확인하기
		
		//구매방식 확인
		methodList.forEach((node) => {
			if(node.checked)  {
				method = node.value;
			}
		})
		
		// 회원만 결제 가능
        if (userid != null) { 
            
            IMP.init("imp42661322"); // 가맹점 식별코드
            IMP.request_pay({
                pg: method, // PG사 코드표에서 선택
                pay_method: 'card', // 결제 방식
                merchant_uid: "IMP" + new Date().getTime(), // 결제 고유 번호
                name: 'EDEN', // 제품명
                amount: totalPrice, // 가격
                
                //구매자 정보 ↓
                buyer_name: name,
                buyer_tel : tel,
                buyer_addr : address1,
                buyer_postcode : zipcode
                
            }, async function (rsp) { // callback
                if (rsp.success) { //결제 성공시
                
					alert('결제가 완료되었습니다.')
                    document.getElementById('form_order').submit();
                    
                } else if (rsp.success == false) { // 결제 실패시
                    alert(rsp.error_msg)
                }
            }); 
            
         } else { // 비회원 결제 불가
            alert('로그인이 필요합니다!')
        } 
	
    } else { // 구매 확인 알림창 취소 클릭시 돌아가기
        return false;
    }
}

</script>
</body>
</html>