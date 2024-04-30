<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<title>대분류 화면</title>
<meta name="description" content="">
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
<script src="http://code.jquery.com/jquery-3.7.1.min.js"></script>
<script
	src="/resources/assets/js/vendor/modernizr-2.8.3-respond-1.4.2.min.js"></script>
<style>
.left-menu {
    position: absolute; /* 화면에 고정된 위치로 설정 */
    top: 220px; /* 화면 맨 위에서부터의 거리 */
    left: 0px; /* 화면 왼쪽에 위치 */
    height: 90%; /* 화면 높이의 90%만큼 설정 */
    width: 260px; /* 메뉴 너비 설정 */
    padding: 50px; /* 내부 여백 설정 */
    z-index: 1; /* 다른 요소 위에 띄워지도록 설정 */
    overflow-y: auto; /* 세로 스크롤이 필요한 경우 스크롤 표시 */
    background-color: white; /* 배경색을 흰색으로 설정합니다. */
}

.left-menu a {
    display: block;
    font-size: 16px;
    color: #333;
    text-decoration: none;
    margin-bottom: 5px;
    width: 100%; /* 요소를 가로폭의 100%로 설정합니다. */
    text-align: right; /* 텍스트를 오른쪽으로 정렬합니다. */
    padding: 0px 0px; /* 위아래 여백을 추가합니다. */
}

.left-menu a:hover {
    color: #007bff; /* 하이퍼링크에 마우스를 올렸을 때의 색상 */
}

.section-container {
    margin-left: 286px; /* left-menu 너비만큼 section을 이동 */
}

.ct-product {
    display: flex;
    justify-content: center; /* 가운데 정렬 */
    overflow-x: auto;
    margin: 0 auto; /* 가운데 정렬을 위한 margin 설정 */
}

.product-item {
    flex: 0 0 auto;
    margin-right: 10px;
    padding: 7px;
}

.product-item:last-child {
    margin-right: 0;
}

</style>
</head>

<body data-spy="scroll" data-target=".navbar-collapse">

	<div class='preloader'>
		<div class='loaded'>&nbsp;</div>
	</div>
	<div>
		<%@ include file="../include/menu/menu.jsp"%>
	</div>
    <div class="left-menu">
		<a style="font-weight: bold; font-size: 30px">${name}</a><br>
<c:forEach items="${items}" var="var">
        <a href="/product/sub_view.do?no=${var.ctg_s_no}">${var.ctg_small}</a><br> 
</c:forEach>

    </div>

	<!-- Work Section -->
	<section id="work" class="work sections">

		<div class="container">
			<div class="row">
				<div class="main_mix_content text-center margin-top-120">
					<div class="head_title">
					<br>
					</div>
					<img
						src="https://image.oliveyoung.co.kr/uploads/images/display/10000010001/148/2945076113415173315.jpg">
					
				</div>
			</div>
		</div>
		<br>
		<p style="text-align: center; font-weight: bold; font-size: 25px">${name}의 BEST만 모아봤어요</p>
		<div class="ct-product" id="mRnkGoodsSec">
    <table>
    <tr>
        <td class="product-item">
            <a href="#">
                <img class="img goodsList" width="135" height="135" src="https://image.oliveyoung.co.kr/uploads/images/goods/400/10/0000/0020/A00000020290503ko.jpg?l=ko" onerror="common.errorImg(this);">
            </a>
            <a href="#">
                <p class="txt" style="font-size: 15px; white-space: normal;">제목</p>
            </a>
            <p>금액<p>
        </td>
        <td class="product-item">
            <a href="#">
                <img class="img goodsList" width="135" height="135" src="https://image.oliveyoung.co.kr/uploads/images/goods/400/10/0000/0020/A00000020290503ko.jpg?l=ko" onerror="common.errorImg(this);">
            </a>
            <a href="#">
                <p class="txt" style="font-size: 15px; white-space: normal;">제목</p>
            </a>
            <p>금액<p>
        </td>
        <td class="product-item">
            <a href="#">
                <img class="img goodsList" width="135" height="135" src="https://image.oliveyoung.co.kr/uploads/images/goods/400/10/0000/0020/A00000020290503ko.jpg?l=ko" onerror="common.errorImg(this);">
            </a>
            <a href="#">
                <p class="txt" style="font-size: 15px; white-space: normal;">제목</p>
            </a>
            <p>금액<p>
        </td>
        <td class="product-item">
            <a href="#">
                <img class="img goodsList" width="135" height="135" src="https://image.oliveyoung.co.kr/uploads/images/goods/400/10/0000/0020/A00000020290503ko.jpg?l=ko" onerror="common.errorImg(this);">
            </a>
            <a href="#">
                <p class="txt" style="font-size: 15px; white-space: normal;">제목</p>
            </a>
            <p>금액<p>
        </td>
    </tr>
    <tr align="center"><td colspan="4"><input style="background-color: white; border: medium;" type="button" value="${name}베스트 상품 더보기"></td></tr>
</table>
</div>
<hr style="width: 50%; ">
		<p style="text-align: center; font-weight: bold; font-size: 25px">${name}에서 많이 본 상품이에요</p>
		<div class="ct-product" id="mRnkGoodsSec">
    <table>
    <tr>
        <td class="product-item">
            <a href="#">
                <img class="img goodsList" width="135" height="135" src="https://image.oliveyoung.co.kr/uploads/images/goods/400/10/0000/0020/A00000020290503ko.jpg?l=ko" onerror="common.errorImg(this);">
            </a>
            <a href="#">
                <p class="txt" style="font-size: 15px; white-space: normal;">제목</p>
            </a>
            <p>금액<p>
        </td>
        <td class="product-item">
            <a href="#">
                <img class="img goodsList" width="135" height="135" src="https://image.oliveyoung.co.kr/uploads/images/goods/400/10/0000/0020/A00000020290503ko.jpg?l=ko" onerror="common.errorImg(this);">
            </a>
            <a href="#">
                <p class="txt" style="font-size: 15px; white-space: normal;">제목</p>
            </a>
            <p>금액<p>
        </td>
        <td class="product-item">
            <a href="#">
                <img class="img goodsList" width="135" height="135" src="https://image.oliveyoung.co.kr/uploads/images/goods/400/10/0000/0020/A00000020290503ko.jpg?l=ko" onerror="common.errorImg(this);">
            </a>
            <a href="#">
                <p class="txt" style="font-size: 15px; white-space: normal;">제목</p>
            </a>
            <p>금액<p>
        </td>
        <td class="product-item">
            <a href="#">
                <img class="img goodsList" width="135" height="135" src="https://image.oliveyoung.co.kr/uploads/images/goods/400/10/0000/0020/A00000020290503ko.jpg?l=ko" onerror="common.errorImg(this);">
            </a>
            <a href="#">
                <p class="txt" style="font-size: 15px; white-space: normal;">제목</p>
            </a>
            <p>금액<p>
        </td>
        
    </tr>
</table>
</div>
	</section>
	<!-- footer Section -->
	<footer id="footer" class="footer">
		<div class="container">
			<div class="main_footer">
				<div class="row">
					<div class="col-sm-12">
						<div class="copyright_text text-center">
							<p class=" wow fadeInRight" data-wow-duration="1s">
								Made with <i class="fa fa-heart"></i> by <a target="_blank"
									href="http://bootstrapthemes.co">Bootstrap Themes</a>2016. All
								Rights Reserved
							</p>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- End of container -->
	</footer>
	<!-- End of footer -->



	<!-- START SCROLL TO TOP  -->

	<div class="scrollup">
		<a href="#"><i class="fa fa-chevron-up"></i></a>
	</div>


	<!-- jQuery -->
	<script src="/resources/assets/js/vendor/jquery-1.11.2.min.js"></script>

	<!-- jQuery Bootstrap js  -->
	<script src="/resources/assets/js/vendor/bootstrap.min.js"></script>

	<!-- jQuery easing js  -->
	<script src="/resources/assets/js/jquery.easing.1.3.js"></script>

	<!-- jQuery masonry js  -->
	<script src="/resources/assets/js/masonry/masonry.min.js"></script>
	<script type="text/javascript">
		$('.mixcontent').masonry();
	</script>

	<!-- jQuery Mixitup  -->
	<script src="/resources/assets/js/jquery.mixitup.min.js"></script>
	<script type="text/javascript">
		
	</script>



	<!-- jQuery plugins  -->
	<script src="/resources/assets/js/plugins.js"></script>

	<!-- jQuery Main js  -->
	<script src="/resources/assets/js/main.js"></script>
</body>
</html>
