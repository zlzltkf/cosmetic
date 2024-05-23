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
	font-size: 0.9em;
	min-width: 610px;
}

/* 주문상태 */
#process {
	border: 1px solid #c9c9c7;
	display: flex;
	flex-direction: row;
	background-color: #fafafa;
	justify-content: space-around;
	padding: 20px;
}
#process .p {
	display: flex;
	flex-direction: column;
	align-items: center;
	justify-content: center;
	font-size: 0.9em;
}
#process .count {
	cursor: pointer;
	font-size: 2em;
	font-weight: bold;
}

/* 날짜 선택 */
#dateBox {
	border: none;
	
}
#dateInfo {
	padding: 40px 0 10px 0 ;
	font-weight: bold;
}
#dateChooseBox {
	display: flex;
	flex-direction: row;
	width: 100%;
	padding: 5px;
	border-top: 2px solid #999; 
	border-bottom: 1px solid #c9c9c7; 
	font-size: 0.9em;
}

#dateChooseBox button {
	padding: 0 10px;
	height: 30px;
	background-color: white;
	border: 1px solid #999;
}
#dateChooseBox input {
	height: 30px;
}

#chooseDateBtn {
	display: flex;
	flex-direction: row;
	min-width: 240px;
}
#dateChooseBox button {
	margin: 5px 2px;
}
#dateChooseBox button:active,
#dateChooseBox button:hover,
#dateChooseBox button:focus {
	background-color: #555;
	color: white;
}

#chooseDate {
	margin: 0 0 0 10px;
	display: flex;
	flex-direction: row;
	min-width: 325px;
}
#chooseDate #inputD {
	display: flex;
	flex-direction: row;
	align-items: center;
}
#inputD input[type="date"]::-webkit-datetime-edit {
	padding: 0 0 2px 5px;
}

#chooseDate #inputD div, #chooseDate button {
	margin: 5px 2px;
}

/* 주문목록 */
#orderWrap {
	margin: 30px 0 0 0;
}

#orderWrap #info {
	margin: 5px 0;
}

/* 주문목록 테이블 */
#orderTable {
	width: 100%;
}
#orderTable .p_info {
	display: flex;
	flex-direction: row;
	width: 100%;
	align-items: center;
	justify-content: flex-start;
}
#orderTable .imgBox {
 	width: 100px;
	height: 100px;
}
#orderTable .Pname {
	width: 100%;
	padding: 5px;
}
#orderTable .imgBox img {
	width: 100%;
	height: 100%;
}

#orderTable th {
	border-top: 2px solid gray;
	padding: 10px;
	border-bottom: 1px solid gray; 
}

#orderTable td {
	border-bottom: 1px solid gray;
	padding: 10px;
}

#orderTable th {
	background-color: #fafafa;
	text-align: center;
}

#orderTable td:nth-child(1) p {
	margin: 0;
	padding: 0;
}
#orderTable td:nth-child(1) .i {
	font-weight: bold;
}
#orderTable td:not(:nth-child(2)) {
	text-align: center;
}
#orderTable td:nth-child(2) {
	min-width: 250px;
}
#orderTable td:nth-child(2) a {
	color: #656565;
}
#orderTable td:nth-child(2) a:hover {
	color: #337ab7;
}
#orderTable td:nth-child(3) {
	min-width: 140px;
}
#orderTable td:nth-child(3) .p {
	color: red;
	padding: 0;
	margin: 0;
	font-size: 1.1em;
	display: inline-block;
}
#orderTable td:nth-child(3) .a {
	color: gray;
	padding: 0;
	margin: 0;
	font-size: 0.9em;
	display: inline-block;
}
#orderTable td:nth-child(4) {
	min-width: 110px;
}
#orderTable td:nth-child(4) p {
	margin: 5px;
}
#orderTable td:nth-child(4) button {
	border: 1px solid #999;
	background-color: white;
	padding: 5px 10px;
	width: 95px;
}
#orderTable td:nth-child(4) button:active,
#orderTable td:nth-child(4) button:hover,
#orderTable td:nth-child(4) button:focus {
	background-color: #555;
	color: white;
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
	position: absolute;
	left: 20%;
	top: 30%;
	background-color: #fefefe;
	margin: auto;
	padding: 10px;
	border: 1px solid #888;
	width: 60%;
	min-width: 415px;
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

#modal-wrap {
	display: flex;
	flex-direction: column;
	align-items: center;
	 width: 100%;
	 justify-content: center;
}

#modal-wrap .m:nth-child(1) {
	display: flex;
	flex-direction: row;
	justify-content: space-between;
	border-bottom: 2px solid black;
}

#modal-wrap .m:nth-child(1) h3 {
	font-size: 1.2em;
	font-weight: bold;
}

#modal-wrap .m {
	width: 100%;
}

.modal-content .modal_info {
	display: flex;
	flex-direction: column;
	align-items: center;
	padding: 15px;
}

#modal-wrap .m h2 {
	font-weight: bold;
	font-size: 1.4em;
	display: inline-block;
} 

.confirm {
	margin: 5px 0 0 0;
	width: 70%;
}

.reasonB {
	width: 100%;
	border: 1px solid #999; 
	padding: 15px;
	margin: 10px 0;
	display: flex;
	flex-direction: row;
	align-items: center;
	border-radius: 10px;
} 

.reasonB input[type="radio"], label {
	margin: 0;
}
.reasonB input[type="radio"] {
    display: none;
}
.reasonB .fakeRadio {
	border: 5px solid #c4c4c4;
	border-radius: 50%;
	width: 15px;
	height: 15px;
}

.reasonB label {
	padding: 0 0 0 5px;
}
.reasonB:hover {
	border: 1px solid #ff7878;
	color: #ff7878;
}
#etcB {
	display: flex;
	flex-direction: column;
	align-items: flex-start;
}

#etcB #etc1 {
	display: flex;
	flex-direction: row;
	align-items: center;
}
#etcB #etc2 {
	width: 100%;
}
#etc {
	width: 100%;
	padding: 10px 10px 0 10px;
	border: none;
	border-bottom: 1px solid #999;
}
#etc:focus {
	border: none;
	outline: none;
}

#sendRefund {
	width: 100%;
	height: 50px;
	margin: 0 0 10px 0;
	font-weight: bold;
	font-size: 1.3em;
	border-radius: 0.5em;
	border: 1px solid #ff7878;
	background: #ff7878;
	color: #fff;
}
#sendRefund:hover {
	background: #fc9292;
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
${order}  --%>

<div id="process">
	<div class="p">
		<div class="count">${statusArray[0]}</div>
		<div class="info">결제완료</div>
	</div>
	<div class="p">
		<div class="count">${statusArray[1]}</div>
		<div class="info">배송중</div>
	</div>
	<div class="p">
		<div class="count">${statusArray[2]}</div>
		<div class="info">배송완료</div>
	</div>
	<div class="p">
		<div class="count">${statusArray[3]}</div>
		<div class="info">반품요청</div>
	</div>
	<div class="p">
		<div class="count">${statusArray[4]}</div>
		<div class="info">취소/반품</div>
	</div>
</div>

<form name="dateform">
	<div id="dateBox">
	<div id="dateInfo"><p>주문목록/배송조회</p></div>
		<div id="dateChooseBox">
		<div id="chooseDateBtn">
			<button type="button" id="1month" onclick="setDate(1)">1개월</button>
			<button type="button" id="3month" onclick="setDate(3)">3개월</button>
			<button type="button" id="6month" onclick="setDate(6)">6개월</button>
			<button type="button" id="12month" onclick="setDate(12)">12개월</button>
		</div>
		<div id="chooseDate">
			<div id="inputD">
				<div id="f">
					<input type="date" name="f_date" id="date1">
				</div>
				<div>~</div>
				<div id="l">
					<input type="date" name="l_date" id="date2">
				</div>
			</div>
			<button type="button" onclick="confirmDate()">조회</button>
		</div>
	</div>
	</div>
</form>

<div id="orderWrap">
	<div id="info">
	<p>조회내역 총 ${count} 건</p>
	</div>
	
	<table id="orderTable">
	<tr>
		<th>주문번호</th>
		<th>상품정보</th>
		<th>주문금액</th>
		<th>진행현황</th>
	</tr>
	
	<c:forEach var="row" items="${order}">
	<tr>
		<td>
			<p class="i">
				${row.orderid}
			</p>
			<p class="d">
				<fmt:formatDate value="${row.map.orderDate}" dateStyle="medium"/>
			</p>
		</td>
		<td>
			<div class="p_info">
				<div class="imgBox">
					<img src="${row.map.p_img}">
				</div>
				<div class="Pname">
				<a href="/product/detail_before?p_id=${row.map.p_id}">${row.map.p_name}</a>
				</div>
			</div>
		</td>
		<td>
			<div class="p"><fmt:formatNumber value="${row.map.p_price * row.map.amount}" pattern="#,###"/>원</div>
			/
			<div class="a">${row.map.amount}개</div>
		</td>
		
		<td>
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
	
</div>




<!-- 모달창 -->

<div id="myModal" class="modal">

  <!-- Modal content -->
  <div class="modal-content">
	<div id="modal-wrap">
		<div class="m">
			<h3>취소/반품</h3>
			<span class="close"><i class="fa fa-remove"></i></span>
		</div>
		<div class="m">
	    <div class="modal_info">
	    	<div class="header">
	    		<h2>취소 및 반품 사유를 입력하세요</h2>
	    	</div>
	    	<div class="confirm">
	    		<div class="reasonB">
	    			<input type="radio" id="r1" class="rinput" name = "r_reason">	
	    			<div class="fakeRadio"></div>
	    			<label for="r1" class="rlabel">구매의사 취소</label>
	    		</div>
	    		<div class="reasonB">
	    			<input type="radio" id="r2" class="rinput" name = "r_reason">
	    			<div class="fakeRadio"></div>
	    			<label for="r2" class="rlabel">다른상품 잘못주문</label>
	    		</div>
	    		<div class="reasonB">
	    			<input type="radio" id="r3" class="rinput" name = "r_reason">
	    			<div class="fakeRadio"></div>
	    			<label for="r3" class="rlabel">배송지연</label>
	    		</div>
	    		<div class="reasonB" id="etcB">
	    			<div id="etc1">
	    				<input type="radio" id="r4" class="rinput" name = "r_reason">
	    				<div class="fakeRadio"></div>
	    				<label for="r4" class="rlabel">기타</label>
	    			</div>
	    			<div id="etc2">
	    				<input id="etc">
	    			</div>
	    		</div>
	    		<input type="hidden" name="refundReason" id="reason">
		    	<div class="confirm_btn">
		    		<button type="button" id="sendRefund">주문취소</button>
		    	</div>
	    	</div>
	    </div>
	    </div>
	</div>
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
	var btn = document.getElementById("sendRefund");
	var span = document.getElementsByClassName("close")[0];
	
	//디자인
	$('.reasonB').hover(
        function() {
            if (!$(this).hasClass('selected')) {
                $(this).css('border', '1px solid #ff7878');
                $(this).find(".fakeRadio").css('border', '5px solid #ff7878');
                $(this).find("#etc").css('border-bottom', '1px solid #ff7878');
            }
        }, 
        function() {
            if (!$(this).hasClass('selected')) {
                $(this).css('border', '1px solid #999');
                $(this).find(".fakeRadio").css('border', '5px solid #c4c4c4');$(this).find("#etc").css('border-bottom', '1px solid #999');
            }
        }
    );
    $('.reasonB').click(function() {
    	
    	$(this).find(".rinput").prop('checked', true);
    	
        $('.reasonB').removeClass('selected').css({
            'border': '1px solid #999',
            'color': '#656565'
        });
        $(this).addClass('selected').css({
            'border': '1px solid #ff7878',
            'color': '#ff7878'
        });
        
        $('.fakeRadio').removeClass('selectFRadio').css({
        	'border': '5px solid #c4c4c4'
        });
        $(this).find('.fakeRadio').addClass('selectFRadio').css({
        	'border': '5px solid #ff7878'
        });
        
        $('#etc').removeClass('selectInput').css({
        	'border-bottom': '1px solid #999'
        });
        $(this).find('#etc').addClass('selectInput').css({
        	'border-bottom': '1px solid #ff7878'
        });
    });
	
	//라디오버튼 초기화
	$(".rinput").prop('checked', false);
	
	/* modal.style.display = "block"; */
	
	span.onclick = function() {
	  modal.style.display = "none";
	}
	
	window.onclick = function(event) {
	  if (event.target == modal) {
	    modal.style.display = "none";
	  }
	}
	
	//.count 에 색 적용
	var urlParams = new URLSearchParams(window.location.search);

	if (urlParams != null) {
	
		if (urlParams.get('status') != null) {
			var status = urlParams.get('status');
			$('#process .count').each(function() {
	            if ($(this).siblings('.info').text().trim() === status) {
	                $(this).css('color', 'limegreen');
	                $(this).siblings('.info').css('color', 'limegreen');
	            }
	        });
		}
	}
	
	//.count 클래스 클릭 시
	$('#process .count').on('click', function() {
		var status = $(this).siblings('.info').text().trim();
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
	var btn = document.getElementById("sendRefund");
	var span = document.getElementsByClassName("close")[0];
	var sendRefund = document.getElementById("sendRefund");
	
	modal.style.display = "block";
	
	//라디오버튼 초기화
	$(".rinput").prop('checked', false);

	//환불
 	sendRefund.onclick = function() {
 		var valid = true;
 		
		//사유 입력값 가져오기
 		$('.rinput:checked').each(function() {
 			var labelText;
 	 		
			if (this.id === 'r4') {
				
				labelText = $('#etc').val();
                
                if (labelText == '') {
                	alert('취소 및 반품 사유를 입력하세요');
                	$("#etc").focus();
                	valid = false;
                    return false; // 루프를 종료합니다.
                }
                
            } else {
                labelText = $('label[for="' + this.id + '"]').text();
            }
            $('#reason').val(labelText);
		});
	  
 		if (valid) {
 			var reason = $('#reason').val();
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
		        		alert('주문이 취소되었습니다.');
		         		modal.style.display = "none"; 
		        	}
		        }
				
			}); 
		}
	} 
} 



</script>

</body>
</html>