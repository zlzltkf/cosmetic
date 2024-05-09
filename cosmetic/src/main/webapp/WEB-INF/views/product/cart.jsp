<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>장바구니</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Montserrat:ital,wght@0,500;1,500&display=swap" rel="stylesheet">
<link rel="stylesheet" href="/resources/assets/css/fonticons.css">
<link rel="stylesheet" href="/resources/assets/css/slider-pro.css">
<link rel="stylesheet" href="/resources/assets/css/stylesheet.css">
<link rel="stylesheet" href="/resources/assets/css/font-awesome.min.css">
<link rel="stylesheet" href="/resources/assets/css/bootstrap.min.css">
<!--For Plugins external css-->
<link rel="stylesheet" href="/resources/assets/css/plugins.css" />
<!--Theme custom css -->
<link rel="stylesheet" href="/resources/assets/css/style.css">
<!--Theme Responsive css-->
<link rel="stylesheet" href="/resources/assets/css/responsive.css" />
<link rel="stylesheet" href="/resources/assets/fonts/" />
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script>
function zzim_del(c_id) {
    var confirm = confirm("해당 상품을 삭제 하시겠습니까?");
    if (confirm) {
        location.href = "/cart/delete/" + c_id;
    } else {
        // "아니오"를 선택한 경우 아무 작업도 수행하지 않음
    }
}

$(function() {
	   $("#chkAll").click(function() {
	      if ($("#chkAll").prop("checked")) {
	         $("input[name=num]").prop("checked",true);
	      } else {
	         $("input[name=num]").prop("checked",false);
	      }
	   });
	   
	   $("#btnDeleteAll").click(function() {
	      let arr = $("input[name=num]"); //체크박스 배열
	      let cnt = 0; //체크된 태그 카운트
	      for(i=0; i<arr.length; i++) {
	         if (arr[i].checked == true) cnt++;
	      }
	      if(cnt == 0) {
	          alert("삭제할 상품을 선택해주세요");
	          return;
	      }
	      if(confirm("전체 상품을 삭제하시겠습니까?")){
	          location.href = "/cart/deleteAll";
	      }
	   });
	   
	   
	 
	   $(function() {
		    $("#btnDelete").click(function() {
		        let selectedItems = [];
		        $("input[name=num]:checked").each(function() {
		            selectedItems.push($(this).val());
		        });

		        if (selectedItems.length === 0) {
		            alert("삭제할 상품을 선택해주세요");
		            return;
		        }
		        console.log(selectedItems);

		        if (confirm("선택한 상품을 삭제하시겠습니까?")) {
		            $.ajax({
		                url: "/cart/select_delete",
		                type: "POST",
		                data: { nums: selectedItems }, // 여기서 c_id 배열을 보냅니다.
		                success: function(response) {
		                    console.log(response);
		                    location.reload(); // 성공 시 페이지 새로고침
		                },
		                error: function(xhr, status, error) {
		                    alert("오류가 발생했습니다. 다시 시도해주세요.");
		                }
		            });
		        }
		    });
		});


	});

</script>

<style>
.montserrat-<uniquifier> {
  font-family: "Montserrat", sans-serif;
  font-optical-sizing: auto;
  font-weight: 500;
  font-style: normal;
}

body {
	margin: 0;
	 
}

* {
	box-sizing: border-box;
	font-family: 'Montserrat', sans-serif;
}

.cart {
	width: 60%;
	margin: auto;
	padding: 30px;
}

.cart ul {
	padding: 30px;
	margin-bottom: 50px;
	border: whitesmoke solid 1px;
	border-radius: 5px;
	font-size: 13px;
	font-weight: 300;
}

.cart ul :nth-child(3) {
	color: limegreen;
}

table {
	border-top: solid 0.5px lightgrey;
	border-collapse: collapse;
	border-bottom: solid 0.5px lightgrey;
	width: 100%;
	font-size: 14px;
}

thead {
	text-align: center;
	font-weight: bold;
}

td {
	font-weight:bold;
	text-align: center;
	padding: 15px 5px;
	border-bottom: 1px solid lightgrey;
}

.cart__list__option {
	vertical-align: top;
	padding: 20px;
}

.cart__list__option p {
	margin-bottom: 25px;
	position: relative;
}

.cart__list__option p::after {
	content: "";
	width: 90%;
	height: 1px;
	background-color: lightgrey;
	left: 0px;
	top: 25px;
	position: absolute;
}

.cart__list__optionbtn {
	font-size: 10px;
	padding: 7px; 
    border:none; 
    border-radius:10px; 
    min-height:30px; 
    min-width: 120px;
    border: 1px solid #9bce26;
    color: #9bce26;
    background: #fff;
}

.cart__list__optionbtn1 {
    font-size: 10px;
    padding: 7px; 
    border-radius: 10px; 
    min-height: 30px; 
    min-width: 120px;
    border: 1px solid #aaa;
    color: #666;
    background: #fff;
    display: inline-block;
    vertical-align: middle;
}

.cart__list__detail :nth-child(4), 
.cart__list__detail :nth-child(6) {
	border-left: 2px solid whitesmoke;
	text-align: center;
}
.cart__mainbtns {
	width: 420px;
	height: 130px;
	padding-top: 40px;
	display: block;
	margin: auto;
}

.cart__bigorderbtn {
	width: 200px;
	height: 50px;
	font-size: 16px;
	margin: auto;
	border-radius: 5px;
}

.cart__bigorderbtn.left {
	background-color: white;
	border: 1px lightgray solid;
}

.cart__bigorderbtn.right {
	background-color: #9bce26;;
	color: white;
	border: none;
}

.icon_flag {
    display: inline-block;
    width: 40px;
    height: 18px;
    border-radius: 9px;
    line-height: 17px !important;
    color: #fff !important;
    font-size: 12px !important;
    text-align: center;
    vertical-align: middle;
    text-decoration: none !important;
    margin: 0 !important;
    background-color: #f65c60;
}

.prd_delivery .ex{
    display: block;
    color: #666;
    font-size: 12px;
    font-weight: 400;
}

h5 {
    font-size: 1.125rem;
    text-align: left;
}

p {
    line-height: 1.375rem;
    margin-bottom: 2px;
    
}
select {
    padding: 7px 8px; /* 내부 여백 */
    border: 1px solid #ccc; /* 테두리 스타일 */
    border-radius: 4px; /* 테두리 둥글게 만들기 */
    background-color: #f8f8f8; /* 배경색 */
    font-size: 14px; /* 폰트 크기 */
    appearance: none; /* 기본 UI 제거 */
    text-align: center;
}

/* 선택된 항목 스타일 */
select:focus {
    outline: none; /* 포커스 효과 제거 */
    border-color: #9bce26; /* 포커스시 테두리 색상 변경 */
    box-shadow: 0 0 5px #9bce26; /* 포커스시 그림자 효과 */
}
.total_price_info {
    margin: 60px 0 0;
    border-top: 2px solid #9bce26;
    border-bottom: 1px solid #e6e6e6;
}
.total_price_info .detail_price {
    position: relative;
    overflow: hidden;
    width: 100%;
    height: 110px;
    font-weight: 700;
}
.p1{
  margin-top:20px;
  margin-right:15px;
  margin-bottom:10px;
  margin-left:15px;
  height: 50px;
}

}
.tx_sign2 {
    display: inline-block;
    width: 30px;
    height: 30px;
    text-indent: -9999px;
    overflow: hidden;
}
.sum_price {
    height: 80px;
    padding: 30px 30px 0;
    text-align: right;
    background: #f6f6f6;
    border-top: 2px solid #d6d6d6;
    font-size: 22px;
    font-weight: 700;
    position: relative;
}
.sum_place{
	font-weight: 500;
	border: solid;
	border-left: none;
	border-right: none;
	background-color: #f6f6f6;
	padding: 0px 20px 0;
	border-top-color: #d3d3d3;
}
.tx_sign2 {
    display: contents;
    width: 50px; /* 너비 조정 */
    height: 50px; /* 높이 조정 */
    background-size: cover; /* 배경 이미지 크기 조정 */
    text-indent: -9999px;
    overflow: hidden;
   /* 위아래 패딩 추가 */
}
.title_box h1 {
    float: left;
    padding: 37px 0 0;
    margin-right: 20px; /* 변경된 부분 */
    font-size: 40px;
    color: #000;
    line-height: 40px;
}

.li1, .li2, .li3 {
    float: right;
    height: 120px;
    padding: 0;
    line-height: 120px;
    text-align: center;
    font-size: 24px;
    color: #8b8176;
    white-space: nowrap;
    margin-right: 20px; /* 변경된 부분 */
}

.li1 {
    margin-left: 1px; /* .li1에 대해서만 왼쪽 여백을 설정합니다. */
}

.li3 {
    float: right;
    margin-right: 20px; /* .li3에 대해서만 오른쪽 여백을 설정합니다. */
    margin-left: 20px; /* .li3에 대해서만 왼쪽 여백을 설정합니다. */
}
.title_box{
    overflow: hidden;
    height: 140px;
    border-radius: 5px;
    z-index: 0;
    background-color:whitesmoke;
}
 tbody td.no_data {
    height: 295px;
    padding: 130px 0 0;
    border-right: 0;
    color: #888;
    font-size: 16px;
    background: url(https://static.oliveyoung.co.kr/pc-static-root/image/comm/ico_nodata104x104.png) 50% 80px no-repeat;
}
/* 모달 전체 스타일 */
.modal {
  display: none;
  position: fixed;
  z-index: 1;
  left: 0;
  top: 0;
  width: 100%;
  height: 100%;
  overflow: auto;
  background-color: rgb(0,0,0);
  background-color: rgba(0,0,0,0.4);
}

/* 모달 콘텐츠 스타일 */
.modal-content {
  background-color: #fefefe;
  margin: 15% auto;
  padding: 20px;
  border: 1px solid #888;
  width: 30%;
  height: 25%;
}

/* 닫기 버튼 스타일 */
.close {
  color: #aaa;
  float: right;
  font-size: 28px;
  font-weight: bold;
}

.close:hover,
.close:focus {
  color: black;
  text-decoration: none;
  cursor: pointer;
}
</style>
</head>
<body>
	 <%@ include file="../include/menu/menu.jsp"%>
	 
	<section class="service sections margin-top-120">
	<section class="cart">
	<div>
	<div class="title_box">
				
			<h1>&nbsp;장바구니 
			<span class="tx_num">${map.count}</span>
				</h1>
	
				<ul class="step_list">
					<li class="li1" style="font-size: 24px;">3 결제완료 ></li><!-- 현재단계 li에 클래스 on과 <span class="hide">현재단계</span> 넣어주세요 -->
					<li class="li2" style="font-size: 24px;">2 주문/결제 ></li>
					<li class="li3"style="font-size: 24px;">1 장바구니 ></li>
				</ul>
			
			</div>
			</div>
		<div style="color: black; width: 150px; height: 50px; padding-top: 27px;"><p style="line-height: 0.375rem; margin: -10px 0 15p;"> EDEN 배송상품</p></div>
		<c:choose>
		<c:when test="${map.count == 0}">
				<table class="cart__list">
					<tr>
						<td style="background-color:#fafafa; "><input type="checkbox"></td>
						<td style="background-color:#fafafa; " colspan="2">상품정보</td>
						<td style="background-color:#fafafa; ">판매가</td>
						<td style="background-color:#fafafa; ">수량</td>
						<td style="background-color:#fafafa; ">배송정보</td>
						<td style="background-color:#fafafa; ">선택</td>
					</tr>
					<tr><td colspan="7" class="no_data" style="text-align: center;">장바구니에 저장된 상품이 없습니다.</td></tr>
					</table>
				</c:when>
				<c:otherwise>
		<table class="cart__list">
					<tr>
						<td style="background-color:#fafafa; "><input type="checkbox" id="chkAll" name="num"></td>
						<td style="background-color:#fafafa; " colspan="2">상품정보</td>
						<td style="background-color:#fafafa; ">판매가</td>
						<td style="background-color:#fafafa; ">수량</td>
						<td style="background-color:#fafafa; ">배송정보</td>
						<td style="background-color:#fafafa; ">선택</td>
					</tr>
			
					
				<c:forEach var="row" items="${map.list}">
				<tbody>
				
					<tr class="cart__list__detail">
						<td><input  type="checkbox" name="num" value="${row.c_id}"  ></td>
						<td><img style="width: 85px;height: 85px; margin: auto;" src="${row.p_img1}"></td>
			<!--상품명--><td style="font-weight: normal; text-align: left;" > <p style="cursor: pointer;" onclick="window.location.href='/product/detail_before?p_id=${row.p_id}'">${row.p_name}</p>
						<c:if test="${not empty row.o_name}">
    						<span>옵션| ${row.o_name}</span>
						</c:if>
						<c:if test="${not empty row.o_name}">
						<button style="border: none;font-weight:bold; border-bottom:1px solid #9bce26;; color: #9bce26; background-color: white; font-size: 12px;" id="openModal">모달 열기</button>
						<div id="myModal" class="modal">
  							<div class="modal-content">
    							<span class="close">&times;</span>
    							<p>옵션 변경</p>
    							<hr>
    							
    							<select>
  								<option selected>${row.o_name}</option>
  								<option value="1">1</option>
 								<option value="2">2</option>
 								<option value="3">3</option>
 								<option value="4">4</option>
 								<option value="5">5</option>
 								<option value="6">6</option>
 								<option value="7">7</option>
 								<option value="8">8</option>
 								<option value="9">9</option>
 								<option value="10">10</option>
								</select><br>
								
								<input type="button" value="취소" onclick="close()">
								<input type="button" value="선택완료" onclick="update()">
  								</div>
						</div>
						
						
						</c:if>
						<br>

						<span class="icon_flag sale">세일</span>
						</td>
						<td style="text-align: center; font-weight:bolder;"><span><fmt:formatNumber type="number" value="${row.p_price}" pattern="#,###"></fmt:formatNumber>원</span></td>
						<br>
						<td style="border-left: 2px solid whitesmoke; text-align: center; ">
						<select>
  							<option selected>${row.amount}</option>
  							<option value="1">1</option>
 							<option value="2">2</option>
 							<option value="3">3</option>
 							<option value="4">4</option>
 							<option value="5">5</option>
 							<option value="6">6</option>
 							<option value="7">7</option>
 							<option value="8">8</option>
 							<option value="9">9</option>
 							<option value="10">10</option>
 							
						</select>
						</td>
					
						<!--배송정보-->
						<td>
						<p class="prd_delivery">
						<strong id="deliStrongText">${map.fee} <br>
						<span class="ex">도서·산간 제외</span></strong>
						</p> 
						</td>
						


						<!--선택-->
						<td align="center" style="border-left: 2px solid whitesmoke;">
    						<input type="button" value="바로구매" onclick="" class="cart__list__optionbtn1" style="margin-bottom: 5px;"><br>
    						<button type="button" style="width: 56px" class="cart__list__optionbtn1" style="margin-bottom: 5px;" onclick="zzim_del('${row.c_id}')">✖️삭제</button><br>
						</td>
					</tr>
				</tbody>
				</c:forEach>
				<tfoot>

					<tr>
						<td colspan="3">
							<button id="btnDelete" class="cart__list__optionbtn1">선택상품 삭제</button>
							<button id="btnDeleteAll" class="cart__list__optionbtn1" >전체삭제</button></td>
					</tr>
					
					
				</tfoot>
		</table>
		
		<br>
		<br>
		
	<div style="border-top: 2px solid #9bce26; display: flex; justify-content: space-between; border-bottom: 2px solid #d6d6d6; padding: 30px 0; border-right: 2px solid whitesmoke;border-left: 2px solid whitesmoke; ">
    <div style="width: 50%; text-align: center;">
        <p class="p1" style="margin: 0; color: #666; font-weight: bold; font-size: 20px;">
    총 판매가 <br><span style="color: black;"><fmt:formatNumber type="number" value="${map.sumMoney}" pattern="#,###"></fmt:formatNumber></span>원
</p>

    </div>
   <div style="text-align: center;">
    <div style="display: inline-block;">
        <p style="padding: 15px 0; font-size: 30px; margin: 0;" class="tx_sign2">➕</p>
    </div>
</div>




    <div style="width: 50%; text-align: center; ">
        <p class="p1" style="margin: 0; color: #666; font-weight: bold; font-size: 20px;">
            배송비 <br><span style="color: black;">${map.fee}</span>원
        </p>
    </div>
</div>


<div style="display: flex; justify-content: space-between; align-items: center; border-bottom: 1.5px solid whitesmoke; padding: 30px 10px; background-color: #F5F5F5;">
    <div style="color: gray; font-size: 15px;">
       &nbsp;&nbsp;❗ 배송비는 결제금액에 따라 변경될 수 있습니다.
    </div>
    <div>
    총 결제예상금액&nbsp; <span style="color: red; font-size: 24px; font-weight: bold;"><fmt:formatNumber type="number" value="${map.sum}" pattern="#,###"></fmt:formatNumber>원</span>
</div>

</div>
</c:otherwise>	
		</c:choose>

	
		<div class="cart__mainbtns">
			<button class="cart__bigorderbtn left">쇼핑 계속하기</button>
			<button class="cart__bigorderbtn right">주문하기</button>
		</div>

			<div class="cart__information">
			<ul>
				<li>장바구니 상품은 최대 30일간 저장됩니다.</li>
				<li>가격, 옵션 등 정보가 변경된 경우 주문이 불가할 수 있습니다.</li>
				<li style="color: #656565;">오늘출발 상품은 판매자 설정 시점에 따라 오늘출발 여부가 변경될 수 있으니 주문 시 꼭 다시 확인해 주시기바랍니다.</li>
			</ul>
		</div>
	</section>
	</section>
</body>
<script>
//모달 열기
document.getElementById('openModal').onclick = function() {
    document.getElementById('myModal').style.display = "block";
}

// 모달 닫기
document.getElementsByClassName('close')[0].onclick = function() {
    document.getElementById('myModal').style.display = "none";
}
</script>
</html>