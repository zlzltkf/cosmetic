<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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

<!-- 환불 라이브러리 -->
<script
  src="https://code.jquery.com/jquery-3.3.1.min.js"
  integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="
  crossorigin="anonymous"></script>

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

#process {
	border: 1px solid black;
	display: flex;
	flex-direction: row;
}
#process .count {
	cursor: pointer;
}

#dateBox {
	border: 1px solid black;
	display: flex;
	flex-direction: column;
}

#chooseDate {
	display: flex;
	flex-direction: row;
}

/* 페이지 번호 */

#paging {
   margin: 5px 0;
   width: 100%;
   height: 50px;
   display: flex;
   flex-direction: row;
   align-items: center;
   justify-content: center;
}
#arrowsL, #arrowsR {
   display: flex;
   flex-direction: row;
   width: 65px;
}
#arrowsL {
   justify-content:flex-end;
   margin: 0 10px 0 0;
}
#arrowsR {
justify-content:flex-start;
   margin: 0 0 0 10px;
}
#paging .page {
   color: #656565;
   width: 30px;
   height: 30px;
   line-height: 28px;
   margin: 0 2px;
   border: 1px solid #e0e0e0;
   font-size: 0.8em;
}
#paging .page:hover {
   cursor: pointer;
   border: 1px solid #656565;
   font-weight: bold;
}
#paging .page.selected {
   border: 1px solid #656565;
   font-weight: bold;
   cursor: default;
}

/* 모달창 */
.modal {
  display: none; 
  position: fixed; 
  z-index: 1; 
  padding-top: 300px; 
  left: 0;
  top: 0;
  width: 100%; 
  height: 100%; 
  overflow: auto; 
  background-color: rgb(0,0,0); 
  background-color: rgba(0,0,0,0.4); 
}

/* Modal Content */
.modal-content {
  background-color: #fefefe;
  margin: auto;
  padding: 20px;
  border: 1px solid #888;
  width: 80%;
}

/* The Close Button */
.close {
  color: #aaaaaa;
  float: right;
  font-size: 28px;
  font-weight: bold;
}

.close:hover,
.close:focus {
  color: #000;
  text-decoration: none;
  cursor: pointer;
}
	
</style>

<!-- 페이지 번호 -->
<!-- 이부분을 뒤로 보내면 페이징 버튼이 작동하지 않음 -->
<script type="text/javascript">
var urlParams = new URLSearchParams(window.location.search);

if (urlParams != null) {
	
	if (urlParams.get('f_date') != null) {
		var f_date = urlParams.get('f_date');
	} else {
		var f_date = "";
	}
	if (urlParams.get('l_date') != null) {
		var l_date = urlParams.get('l_date');
	} else {
		var l_date = "";
	}
	if (urlParams.get('status') != null) {
		var status = urlParams.get('status');
	} else {
		var status = "";
	}
    
   function list(page) {
	   
	   var urlS = "curPage=" + page;
	   
	   if (f_date != "" && l_date != "") {
		   urlS += "&f_date=" + f_date + "&l_date=" + l_date;
	   }
	   if (status != "") {
		   urlS += "&status=" + status;
	   }
	   location.href = "/order/orderlist.do?" + urlS;
   }
}

</script>

<body>

<%@ include file="../../include/menu/menu.jsp"%>

<div id="pageWrap">

<%-- 주문목록<br>
${list}
<br><br>
주문 아이템 목록<br>
${order} --%>

<div id="process">
	<div class="p">
		<div class="count">${statusArray[0]}</div>
		<div class="info">주문접수</div>
	</div>
	<div class="p">
		<div class="count">${statusArray[1]}</div>
		<div class="info">결제완료</div>
	</div>
	<div class="p">
		<div class="count">${statusArray[2]}</div>
		<div class="info">배송중</div>
	</div>
	<div class="p">
		<div class="count">${statusArray[3]}</div>
		<div class="info">배송완료</div>
	</div>
	<div class="p">
		<div class="count">${statusArray[4]}</div>
		<div class="info">반품요청</div>
	</div>
	<div class="p">
		<div class="count">${statusArray[5]}</div>
		<div class="info">취소/반품</div>
	</div>
</div>

<div id="dateBox">
	<form name="dateform">
	<div id="chooseDateBtn">
		<button type="button" id="1month" onclick="setDate(1)">1개월</button>
		<button type="button" id="3month" onclick="setDate(3)">3개월</button>
		<button type="button" id="6month" onclick="setDate(6)">6개월</button>
		<button type="button" id="12month" onclick="setDate(12)">12개월</button>
	</div>
	<div id="chooseDate">
		<div id="f">
			<input type="date" name="f_date" id="date1">
		</div>
		<div id="l">
			<input type="date" name="l_date" id="date2">
		</div>
		<button type="button" onclick="confirmDate()">조회</button>
	</div>
	</form>
</div>


<table border="1">
<tr>
	<th>주문번호</th>
	<th colspan="4">상품정보</th>
	<th>주문수량</th>
	<th>주문금액</th>
	<th>주문상태</th>
	<th>취소/반품</th>
</tr>
<c:forEach var="row" items="${order}">
	<tr>
		<td>${row.map.orderDate}<br>${row.orderid}</td>
		<td>${row.map.idx}</td>
		<td><img src="${row.map.p_img}" width="50px" height="50px"></td>
		<td>${row.map.p_name}</td>
		<td>${row.map.p_price}</td>
		<td>${row.map.amount}</td>
		<td>${row.map.p_price * row.map.amount}</td>
		<td>
			<c:if test="${row.map.orderStatus == '주문접수'}">
				<p>주문접수</p>
			</c:if>
			<c:if test="${row.map.orderStatus == '결제완료'}">
				<p>결제완료</p>
			</c:if>
			<c:if test="${row.map.orderStatus == '배송중'}">
				<p>배송중</p>
			</c:if>
			<c:if test="${row.map.orderStatus == '배송완료'}">
				<p>배송완료</p>
			</c:if>
			<c:if test="${row.map.orderStatus == '반품요청'}">
				<p>반품요청</p>
			</c:if>
			<c:if test="${row.map.orderStatus == '반품완료'}">
				<p>반품완료</p>
			</c:if>
		</td>
		<td>
		<button type="button" onclick="delete_order(${row.orderid}, ${row.map.idx}, ${row.map.p_price}, ${row.map.amount})">주문 취소</button>
		</td>
		
	</tr>
	</c:forEach>
</table>

<!-- 페이지 번호 -->
<div id="paging" align="center">

   <!-- 화살표 -->
   <div id="arrowsL">
      <c:if test="${page_info.curPage > 1 }">
         <div class="page" onclick="list('1')">❮❮</div>
      </c:if>
      <c:if test="${page_info.curBlock > 1}">
         <div class="page" onclick="list('${page_info.prevPage}')">❮</div>
      </c:if>
   </div>
   
   <!-- 페이지 숫자 -->
   <c:forEach  var="num"  begin="${page_info.blockStart}" end="${page_info.blockEnd}">
      <c:choose>
         <c:when  test="${num  ==  page_info.curPage }">
            <div class="page selected">
               <span>${num}</span>
            </div>
         </c:when>
         <c:otherwise>
            <div class="page" onclick="list('${num}')">${num}</div>
         </c:otherwise>
      </c:choose>
   </c:forEach>
   
   <!-- 화살표 -->
   <div id="arrowsR">
      <c:if  test="${page_info.curBlock  <  page_info.totBlock }" >
         <div class="page" onclick="list('${page_info.nextPage}')">❯</div>
      </c:if>
      <c:if  test="${page_info.curPage  <=  page_info.totPage}">
         <div class="page" onclick="list('${page_info.totPage}')">❯❯</div>
      </c:if>
   </div>
</div>

<!-- 모달창 -->

<div id="myModal" class="modal">

  <!-- Modal content -->
  <div class="modal-content">
    <span class="close">&times;</span>
    <p>취소 사유를 입력하세요</p>
    <input name="refundReason" id="reason">
    <button type="button" id="sendRefund">주문취소</button>
  </div>

</div>

</div>

<script src="/resources/assets/js/vendor/jquery-1.11.2.min.js"></script>
<script src="/resources/assets/js/vendor/bootstrap.min.js"></script>
<script src="/resources/assets/js/jquery.easing.1.3.js"></script>
<script src="/resources/assets/js/plugins.js"></script>
<script src="/resources/assets/js/main.js"></script>

<script type="text/javascript">
$(document).ready(function() {
	
 	//현재날짜 불러오기
    var today = new Date();

    var f_yyyy = today.getFullYear()-3;
    var l_yyyy = today.getFullYear();
    var mm = String(today.getMonth() + 1).padStart(2, '0');
    var dd = String(today.getDate()).padStart(2, '0'); 
    var f_dateString = f_yyyy + '-' + mm + '-' + dd;
    var l_dateString = l_yyyy + '-' + mm + '-' + dd;

    // 날짜 설정
    var date1 = "${f_date}";
    var date2 = "${l_date}";
    
     if ("${f_date}" !== "" && "${l_date}" !== "") {
    	document.getElementById("date1").value = date1.split(' ')[0];
        document.getElementById("date2").value = date2.split(' ')[0];
    } else {
    	document.getElementById("date1").value = f_dateString;
        document.getElementById("date2").value = l_dateString;
    } 
     
     
    //모달창
    var modal = document.getElementById("myModal");
	var btn = document.getElementById("myBtn");
	var span = document.getElementsByClassName("close")[0];
	
	//모달창 닫기
	
	span.onclick = function() {
	  modal.style.display = "none";
	}
	
	window.onclick = function(event) {
	  if (event.target == modal) {
	    modal.style.display = "none";
	  }
	}
	
	//.count 클래스 클릭 시
	$('#process .count').on('click', function() {
		var status = $(this).siblings('.info').text().trim();
		console.log(status);
		window.location.href = "/order/orderlist.do?status=" + status;
	});
});

function setDate(month) {
	
	//현재날짜 불러오기
    var today = new Date();

    var f_yyyy = today.getFullYear();
    
   	if (today.getMonth() + 1 <= month) {
   		f_yyyy -= 1;
   		f_mm = 12 - month + (today.getMonth() + 1);
   	} else {
   		var f_mm = today.getMonth() + 1 - month;
   	}
    
   	var f_month = String(f_mm).padStart(2, '0');
    
   	var l_yyyy = today.getFullYear();
    var l_mm = String(today.getMonth() + 1).padStart(2, '0');
    var dd = String(today.getDate()).padStart(2, '0'); 
    
    var f_dateString = f_yyyy + '-' + f_month + '-' + dd;
    var l_dateString = l_yyyy + '-' + l_mm + '-' + dd;

    // 날짜 설정
    document.getElementById("date1").value = f_dateString;
    document.getElementById("date2").value = l_dateString;
    
    confirmDate();
}

function confirmDate() {
	var formElement = document.forms["dateform"];
	
	formElement.action = '/order/orderlist.do';
	formElement.submit();
}

function delete_order(orderid, itemid, price, amount) {
	
	//모달창 열기
	//환불사유 입력
	var modal = document.getElementById("myModal");
	var btn = document.getElementById("myBtn");
	var span = document.getElementsByClassName("close")[0];
	
	modal.style.display = "block";
	
	var sendRefund = document.getElementById("sendRefund");
	
	//환불
 	sendRefund.onclick = function() {
		var reason = document.getElementById("reason").value;
		
 		var delPrice = parseInt(price) * parseInt(amount);
 		
 		$.ajax({
			"url": "/order/delete_order.do",
	        "type": "POST",
	        "contentType": "application/json",
	        "data": JSON.stringify({
	        	"orderid": orderid,
	        	"itemid": itemid,
	        	"delPrice": delPrice,
	        	"reason" : reason
	        }),
	        success: function(response) {
	        	if (response == "success") {
	        		window.location.href = "/order/orderlist.do";
	        	}
	        }
			
		});  
	} 
} 



</script>

</body>
</html>