<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<style>
.navbar-brand-logo {
	position: absolute;
	bottom: 1px;
	left: 1px;
}

.dropdown-menu_recent {
	position: absolute;
	top: 100%;
	left: 0;
	z-index: 1000;
	display: none;
	float: left;
	width: 470px; /* 가로로 확장 */
	height: 300px;
	max-height: 400px; /* 세로로 길게 늘림 */
	overflow-y: auto; /* 세로 스크롤 적용 */
	padding: 10px 0; /* 패딩 조정 */
	margin: 2px 0 0;
	font-size: 14px;
	text-align: left;
	list-style: none;
	background-color: #fff;
	-webkit-background-clip: padding-box;
	background-clip: padding-box;
	border: 1px solid #ccc;
	border-radius: 4px;
	-webkit-box-shadow: 0 6px 12px rgba(0, 0, 0, .175);
	box-shadow: 0 6px 12px rgba(0, 0, 0, .175);
	max-height: 400px;
}

@media ( min-width : 768px) {
	.navbar-right .dropdown-menu_recent {
		right: 0;
		left: auto;
	}
}
</style>
<script src="http://code.jquery.com/jquery-3.7.1.min.js"></script>
<script>
$(document).ready(function() {
    $('.dropdown-toggle1').click(function() {
        var dropdownMenu = $(this).closest('.dropdown1').find('.dropdown-menu_recent');
        $.ajax({
            url: '/product/recent_cookie', // 최근 본 상품을 조회하는 엔드포인트
            method: 'GET',
            success: function(data) {
                var htmlContent = '';
                data.forEach(function(product) {
                	// 이미지를 작게 하고, 상품 이름과 가격을 세로로 표시하며, 삭제 버튼을 한 줄에 3개씩 나열
                	htmlContent += '<hr>';

                	// 상품 요소들을 가로로 나열할 div 시작
                	htmlContent += '<div style="display: flex; flex-wrap: wrap;">';

                	// 각 상품 요소 시작
                	htmlContent += '<div style="width: 33.33%; padding: 10px;">'; // 가로로 세 개씩 표시하기 위해 33.33%로 폭을 조절
                	htmlContent += '<div style="margin-bottom: 10px;"><img src="' + product.p_img1 + '" style="width: 100px;"></div>';
                	htmlContent += '<div>' + product.p_name + '</div>';
                	htmlContent += '<div>' + product.p_price + '</div>';
                	htmlContent += '<div>';
                	htmlContent += '<button type="button" onclick="cookie_delete(' + product.p_id + ')">하나 삭제</button>';
                	htmlContent += '</div>';
                	htmlContent += '</div>';
                	htmlContent += '<button type="button" onclick="cookie_all_delete()">전체 삭제</button>';
                	// 각 상품 요소 종료

                	// 이런 식으로 나머지 상품들도 추가해주면 됩니다.

                	// 상품 요소들을 가로로 나열할 div 종료
                	htmlContent += '</div>';
                });
                dropdownMenu.html(htmlContent); // 변환된 HTML을 dropdown-menu_recent에 삽입
            },
        });
    });
});
</script>

<header id="main_menu" class="header navbar-fixed-top">
	

	<div class="main_menu_bg">
		<div class="container">
			<br>
			<div class="row">
				<div>
					<c:choose>
						<c:when test="${sessionScope.userid != null}">
							<a href="#" style="float: right; font-size: small; color: gray;">&nbsp;고객센터
								&nbsp;</a>
							<a href="#" style="float: right; font-size: small; color: gray;">&nbsp;주문배송
								|&nbsp;</a>
							<a href="#" style="float: right; font-size: small; color: gray;">&nbsp;장바구니
								|&nbsp;</a>
							<a href="#" style="float: right; font-size: small; color: gray;">&nbsp;마이페이지
								|&nbsp;</a>
							<a href="/member/logout"
								style="float: right; font-size: small; color: gray;">&nbsp;로그아웃
								|&nbsp;</a>
							<!--여기가 첫번째  -->
							<span style="float: right; font-size: small; color: black;">${sessionScope.userid}님
								환영합니다&nbsp;</span>
						</c:when>
						<c:otherwise>
							<a href="#" style="float: right; font-size: small; color: gray;">&nbsp;고객센터&nbsp;</a>
							<a href="#" style="float: right; font-size: small; color: gray;">&nbsp;주문배송
								|&nbsp;</a>
							<a href="#" style="float: right; font-size: small; color: gray;">&nbsp;장바구니
								|&nbsp;</a>
							<a href="/member/page_join"
								style="float: right; font-size: small; color: gray;">&nbsp;회원가입
								|&nbsp;</a>
							<a href="/member/page_login"
								style="float: right; font-size: small; color: gray;">&nbsp;로그인
								|&nbsp;</a>
						</c:otherwise>
					</c:choose>

				</div>
				<div class="nave_menu">
					<nav class="navbar navbar-default" id="navmenu">
						<div class="container-fluid">
							<!-- Brand and toggle get grouped for better mobile display -->
							<div class="navbar-header">
								<button type="button" class="navbar-toggle collapsed"
									data-toggle="collapse"
									data-target="#bs-example-navbar-collapse-1"
									aria-expanded="false">
									<span class="sr-only">Toggle navigation</span> <span
										class="icon-bar"></span> <span class="icon-bar"></span> <span
										class="icon-bar"></span>
								</button>
								<a class="navbar-brand-logo" href="/"> <img
									src="/resources/assets/images/logo_eden.png"
									style="max-width: 150px; max-height: 150px;" />
								</a>
							</div>

							<!-- Collect the nav links, forms, and other content for toggling -->



							<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
    <ul class="nav navbar-nav navbar-right">
        <li><a href="#" id="ctg_btn">카테고리</a></li>
        <li><a href="aboutus.html">about us</a></li>
        <li class="dropdown">
            <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true">services</a>
            <ul class="dropdown-menu">
                <li><a href="/product/detail">service page</a></li>
                <li><a href="service1.html">service page two</a></li>
            </ul>
        </li>
        <li class="dropdown">
            <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true">works</a>
            <ul class="dropdown-menu">
                <li><a href="work.html">work page</a></li>
                <li><a href="work1.html">work page Two</a></li>
            </ul>
        </li>
        <c:choose>
            <c:when test="${sessionScope.userid != null}">
                <li class="dropdown1">
                    <a href="#" class="dropdown-toggle1" data-toggle="dropdown1" role="button" aria-haspopup="true">최근 본 상품</a>
                    <ul class="dropdown-menu_recent">
                        <c:if test="${not empty r_list}">
                            <c:forEach var="product" items="${r_list}">
                                <li>${product.p_name}- 가격: ${product.p_price}</li>
                                <li><img src="${product.p_img1}"></li>
                                <button type="button" onclick="cookie_delete(${product.p_id})">하나 삭제</button>
                                <button type="button" onclick="cookie_all_delete()">전체 삭제</button>
                            </c:forEach>
                        </c:if>
                    </ul>
                </li>
            </c:when>
            <c:otherwise>
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" style="display: none;" data-toggle="dropdown" role="button" aria-haspopup="true">최근 본 상품</a>
                </li>
            </c:otherwise>
        </c:choose>
    </ul>
</div>


						</div>
					</nav>
				</div>
			</div>
			<%@ include file="category.jsp"%>
		</div>

	</div>

</header>
<!--End of header -->