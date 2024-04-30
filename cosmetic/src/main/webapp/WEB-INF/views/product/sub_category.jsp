<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마스카라</title>

<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="apple-touch-icon" href="apple-touch-icon.png">


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

<script
   src="/resources/assets/js/vendor/modernizr-2.8.3-respond-1.4.2.min.js"></script>

</head>

<style>
#page-wrap {
	margin: 155px auto 0 auto;
	width: 65%;
}

#title {
	padding-top: 30px;
}

/* 서브메뉴 */
#sub_menu {
	width: 100%;
	height: 42px;
	margin: 40px 0;
	border: 1px solid grey;
	list-style: none;
	line-height: 40px;
}
#sub_menu ul {
	display: flex;
	align-items: center;
}
#sub_menu ul li {
	flex-grow: 1;
	text-align: center;
	border-right: 1px solid grey;
}
#sub_menu ul li:last-child {
	border: none;
}

/* 서브메뉴 클릭시 */
#sub_menu ul li:hover {
	background-color: green;
	color: white;
	cursor: pointer;
}
#sub_menu .sub.selected {
	background-color: green;
	color: white;
}


/* 테이블 */

#content {
	display: flex;
	flex-direction: column;
	align-items: center;
	justify-content: center;
}

#info {
	width: 90%;
	text-align: left;
	margin: 5px 0;
}

/* 정렬 */
#arrange {
	width:90%;
	height: 50px;
	border-top: 1px solid grey;
	border-bottom: 2px solid grey;
}
#arr_box {
	display: flex;
}
#arr_box li {
	list-style-type: none;
	line-height: 50px;
	padding: 0 10px;
}
#arr_box li:hover {
	cursor: pointer;
}
.order.selected {
	font-weight: bold;
}
 
/* 테이블 */
.grid {
	width:1020px;
	display: grid;
	grid-template-columns: repeat(4, 1fr);
	grid-template-rows: repeat(6, 1fr);
}
.grid .block {
	border-bottom: 1px solid grey;
 	width: 255px;
	height: 400px;
	display: flex;
	flex-direction: column;
	align-content: center;
	justify-content: center;
	padding: 30px 20px;
}

.block .picture {
	position: relative;
	width: 215px;
	height: 215px;
	margin: 0 0 5px 0;
}
.picture .like {
	position: absolute;
	bottom: 0; right: 0;
	width: 40px;
	hight: 40px;
	color: white;
	font-size: 1.5em;
	text-align: center;
}

.like.liked {
	color: red;
}

.desc {
	width: 215px;
	height: 125px;
	display: flex;
	flex-direction: column;
	justify-content: center;
	text-align: left;
}
.desc .p_name {
	width: 215px;
	margin: 5px 0 0 0;
	word-break: break-all; 
}
.p_name a {
	color: black;
}
.p_name a:hover {
	color: #337ab7;
}
.desc .p_price {
 font-size: 1.2em;
	height:30px;
	line-height: 30px;
	margin: 5px 0;
	color: red;
}
.desc .p_delivery {
 	font-size: 0.7em;
 	width: 70px;
	height: 20px;
	margin: 5px 0;
	background-color: green;
	color: white;
	border-radius: 7px;
	text-align: center;
	line-height: 20px;
}

/* 페이지 번호 */

#paging {
	height: 25px;
	margin: 5px 0;
	line-height: 25px;
}

/* 반응형 */

@media (max-width: 1567px) {
	.grid {
	width:765px;
	display: grid;
	grid-template-columns: repeat(3, 1fr);
	}
}
@media (max-width: 1172px) {
	.grid {
	width:510px;
	display: grid;
	grid-template-columns: repeat(2, 1fr);
	}
}
@media (max-width: 786px) {
	.grid {
	width:255px;
	display: grid;
	grid-template-columns: repeat(1, 1fr);
	}
}

</style>

<body  data-spy="scroll" data-target=".navbar-collapse">
	<div class='preloader'>
	      <div class='loaded'>&nbsp;</div>
	</div>
	
	<!-- 상단 메뉴 -->
	<%@ include file="../include/menu/menu.jsp"%>
	
	
	<section id="page-wrap">
	
		<!-- 소분류 제목 -->
		<div id="title">
			<h3>${ctg.ctg_small}</h3>
			<hr>
		</div>
		
		<!-- 서브메뉴 -->
		<div id="sub_menu">
			<ul>
			<c:forEach var="ctg" items="${ctg_items}">
				<li class="sub selected"  id="sub_${ctg.ctg_s_no}" onclick="location.href='/product/sub_view.do?no=${ctg.ctg_s_no}';" >${ctg.ctg_small}</li>
			</c:forEach>
			</ul>
		</div>
		
		<div id="content">
		
		<div id="info">
			총 ${fn:length(list)} 개의 상품이 있습니다.
		</div>
		
		<div id="arrange">
			<div id="arr_box">
				<li class="order" onclick="location.href='/product/sub_view.do?no=${ctg.ctg_s_no}';">인기순</li>
				<li class="order" onclick="location.href='/product/sub_view.do?no=${ctg.ctg_s_no}&order=new';">신상품순</li>
				<li class="order" onclick="location.href='/product/sub_view.do?no=${ctg.ctg_s_no}&order=sell';">판매순</li>
				<li class="order" onclick="location.href='/product/sub_view.do?no=${ctg.ctg_s_no}&order=price';">낮은가격순</li>
			</div>
		</div>
		<div class="grid">
		
		<c:forEach var="row" items="${list}">
		
			<!-- 데이터가 들어갈 부분 -->
			<div class="block">
			
				<!-- 상품사진 -->
				<div class="picture">
					<div class="img">
						<img src="${row.p_img1}" alt="상품 이미지">
					</div>
					<div class="like">
						<i class="fa fa-heart"></i>
					</div>
				</div>
				
				<!-- 상품설명 -->
				<div class="desc">
					<div class="p_name"><a href="/product/detail_before?p_id=${row.p_id}">${row.p_name}</a></div>
					<div class="p_price"><b><fmt:formatNumber type="number" value="${row.p_price}" pattern="#,###"/>원</b></div>
					<div class="p_delivery">${row.d_info}배송</div>
				</div>
				
			</div>
		</c:forEach>
		
		</div>
		</div>
		
		<!-- 페이지 번호(나중에 추가) -->
		
		<div id="paging" align="center">
			<c:if test="${map.page_info.curPage > 1 }">
				<a href="javasript:list('1')">[처음]</a>
			</c:if>
			<c:if test="${map.page_info.curBlock > 1}">
				<a  href="javascript:list('${map.page_info.prevPage}')">[이전]</a>
			</c:if>
			<c:forEach  var="num"  begin="${map.page_info.blockBegin}" end="${map.page_info.blockEnd}">
				<c:choose>
					<c:when  test="${num  ==  map.page_info.curPage }">
						<span  style="color:red">${num}</span>&nbsp;
					</c:when>
					<c:otherwise>
						<a  href="javascript:list('${num}')">${num}</a>&nbsp;
					</c:otherwise>
				</c:choose>
			</c:forEach>
			<c:if  test="${map.page_info.curBlock  <=  map.page_info.totBlock }">
				<a  href="javascript:list('${map.page_info.nextPage}')">[다음]</a>
			</c:if>
			<c:if  test="${map.page_info.curPage  <=  map.page_info.totPage}">
				<a  href="javascript:list('${map.page_info.totPage}')">[끝]</a>
			</c:if>
		</div>
	</section>
	

<div class="scrollup">
   <a href="#"><i class="fa fa-chevron-up"></i></a>
</div>

<script src="/resources/assets/js/vendor/jquery-1.11.2.min.js"></script>
<script src="/resources/assets/js/vendor/bootstrap.min.js"></script>
<script src="/resources/assets/js/jquery.easing.1.3.js"></script>


<script src="/resources/assets/js/plugins.js"></script>
<script src="/resources/assets/js/main.js"></script>

<script type="text/javascript">
$(function(){
	
	//하트 아이콘 동작
    $(".like").click(function(){
    	$(".like").css("cursor", "pointer");
    	$(this).toggleClass("liked");
    });
	
  //url에서 변수 가져오기
    var urlParams = new URLSearchParams(window.location.search);
    var no = urlParams.get('no');
    var order = urlParams.get('order');
	
	if (urlParams != null) {
		var no = urlParams.get('no');
	    var order = urlParams.get('order');
	    
		//url에 전달된 카테고리 코드에 맞춰 서브메뉴 색깔 바꾸기
		$(".sub").removeClass('selected');
		
		$(".sub").each(function() {
			var id_no = $(this).attr("id").split("_")[1];
			if (id_no === no) {
	            $(this).addClass("selected");
	        }
		});
		
		//url에 전달된 정렬방식에 맞춰 화면의 정렬방식을 진한 글자로 표시
		$(".order").removeClass("selected");
		
		if (order === "new") {
            $(".order").eq(1).addClass("selected"); 
        } else if (order === "sell") {
            $(".order").eq(2).addClass("selected"); 
        } else if (order === "price") {
            $(".order").eq(3).addClass("selected"); 
        } else {
            $(".order").eq(0).addClass("selected"); 
        }
		
	}
	
});
</script>

</body>
</html>