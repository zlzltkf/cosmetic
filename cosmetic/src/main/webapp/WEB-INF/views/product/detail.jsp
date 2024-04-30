<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!doctype html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<title>디테일 화면</title>
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

<script
	src="/resources/assets/js/vendor/modernizr-2.8.3-respond-1.4.2.min.js"></script>

<style>
.prd_contents {
	width: 1020px;
	height: 100%;
	margin: 0 auto;
}

.prd_detail_box {
	padding: 35px 0 0;
}

.prd_detail_box .left_area {
	float: left;
	width: 550px;
	margin-top: 5px;
}

.prd_detail_box .right_area {
	float: right;
	width: 425px;
}

.p_img {
	max-width: 510px;
	max-height: 510px;
}

.p_info {
	background: #fff;
}

.prd_detail_box .right_area .p_price {
	padding: 0px 0px 30px;
}

.p_deli {
  padding: 0px 0px 15px;
}

.p_deli_ {
	display: flex;
}

.p_deli_tit {
	position: relative;
	font-size: 16px;
	line-height: 30px;
	margin-bottom: 5px;
	color: #000;
	font-weight: 700;
}

.p_deli_s_tit {
	position: relative;
	width: 100px; /* 수정된 부분 */
	display: inline-block; /* 수정된 부분 */
	margin-right: 10px; /* 수정된 부분 */
	font-weight: 700;
}

.p_price_color {
	font-size: 28px;
	color: #e02020;
	display: flex;
	align-items: center;
	font-weight: 700;
	border-bottom: 1px solid e5e5e5;
}

.p_name {
	margin-top: 10px;
	font-size: 26px;
	line-height: 34px;
	color: #000;
}

.p_path {
	font-size: 16px;
	line-height: 24px;
	color: #000;
}

.prd_detail_box .right_area .p_total_price {
	overflow: hidden;
	height: 60px;
	margin: 24px 0 0;
	border-bottom: 2px solid #f27370;
	color: #e02020;
	font-weight: 700;
	padding: 15px 0 20px;
}

.prd_detail_box .right_area .p_total_price .total_tit {
	float: left;
	font-size: 18px;
}

.prd_detail_box .right_area .p_total_price .total_won {
	float: right;
}


.prd_detail_box .right_area .p_btn {
    display: flex;
    justify-content: space-between;
    width: 450px; /* 수정된 부분: 버튼 전체 너비 조정 */
    margin-top: 20px; /* 수정된 부분: 버튼과 위쪽 간격 조정 */
    padding: 0; /* 수정된 부분: 외부 여백 제거 */
}

.prd_detail_box .right_area .p_btn button {
    flex-grow: 1; /* 수정된 부분: 버튼이 동일한 너비를 가지도록 설정 */
    margin-left: 10px; /* 수정된 부분: 버튼 간격 조정 */
    height: 65px;
    border: 1px solid #ccc; /* 수정된 부분: 테두리 스타일 추가 */
    color: #ff5753;
    font-size: 20px;
    font-weight: 500;
}


/* 드롭다운 메뉴의 기본 스타일 */
.prd_detail_box .right_area .p_dropdown {
	height: 51px;
    line-height: 50px;
    border-color: #ffffff;
    padding: 14px 0 14px 0; /* 좌우 패딩 값 조정 */
    border-top: 1px solid #ccc;
}

.prd_detail_box .right_area .p_dropdown-content {
	display: none;
	position: absolute;
	background-color: #ffffff; /* 드롭다운 배경색 */
	box-shadow: 0 8px 16px 0 rgba(0, 0, 0, 0.2);
	z-index: 1;
}

.prd_detail_box .right_area .p_dropdown-content a {
	color: #000; /* 드롭다운 메뉴 텍스트 색상 */
	padding: 12px 16px;
	text-decoration: none;
	display: block;
}

.prd_detail_box .right_area .p_dropdown-content a:hover {
	background-color: #f9f9f9; /* 마우스 오버 시 배경색 */
}

.prd_detail_box .right_area .p_dropdown:hover .p_dropdown-content {
	display: block; /* 수정된 부분 */
}

</style>
</head>

<body data-spy="scroll" data-target=".navbar-collapse">
	<div class='preloader'>
		<div class='loaded'>&nbsp;</div>
	</div>
	<!-- 상단 메뉴 -->
	<%@ include file="../include/menu/menu.jsp"%>

	<section class="service sections margin-top-120">
		<div class="container">
			<div class="prd_contents">
					<!-- 상품정보 -->
				<div class="prd_detail_box">
					
					<!-- 왼쪽에 들어갈 사진 -->
					<div class="left_area">
						<div class="p_img">
							<img id="main_img"
								src="https://image.oliveyoung.co.kr/uploads/images/goods/550/10/0000/0020/A00000020209421ko.jpg?l=ko">
						</div>
					</div>
					
					<!-- 오른쪽에 들어갈 정보 -->
					<div class="right_area"> 
						<div class="p_info">
						
							<p class="p_path">상품 경로</p> <!-- ex) 립 > 립스틱 -->
							
							<p class="p_name">판매할 상품의 제목</p> <!-- 제목 -->
							
							<div class="p_price">
								<span class="p_price_color"> <strong>가격 (숫자) 원</strong>  <!-- 가격 -->
								</span>
							</div>
					
					<!-- 배송 -->
					<div class="p_deli">
								<p class="p_deli_tit">배송정보</p>
							<div class="p_deli_row"> <!-- 설명란 -->
									<span style="font-size: 14px;" class="p_deli_s_tit">일반배송 |</span>
									<ul style="list-style: none;">
										<li>
									<span style="font-size: 14px;">2,500원 ( 20,000 원 이상 무료배송 )</span>
									</li>								
									<span style="font-size: 14px;">배송 평균 3일 이내 배송</span>
									</ul>
							</div>
							</div>
							
							<!-- 상품 종류 선택 -->
							<div class="p_dropdown">
								<button class="p_dropbtn">상품을 선택해주세요</button>
								<div class="p_dropdown-content">
									<a href="#">1</a> 
									<a href="#">2</a> 
									<a href="#">3</a>
								</div>
							</div>
						
							<!-- 상품 금액 -->
							<div class="p_total_price">
								<span class="total_tit">상품금액 합계</span> <span class="total_won">
									<span>가격(숫자)</span> 원
								</span>
							</div>
							
							<!-- 장바구니, 바로구매, 찜 버튼 -->
							<div class="p_btn">
								<button class="btn_Cart" id="btn_Cart">장바구니</button>
								<button class="btn_Buy" id="btn_Buy">바로구매</button>
								<button class="btn_Zzim" id="btn_Zzim">찜</button>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>

	<!-- <ul class="">
		<li class=""><a href="#">상품설명</a></li>
		<li class=""><a href="#">상품리뷰</a></li>
		<li class=""><a href="#">Q & A</a></li>
	</ul> -->



	<style>
	/* 탭 메뉴 스타일 */
	.ec-base-tab { position:relative; }
	.ec-base-tab .menu {
    	margin:0 0 20px; border:1px solid #cbcdce; border-bottom-color:#202020; border-left:0; background:#f2f2f2;
    	box-sizing:border-box; -webkit-box-sizing:border-box; -moz-box-sizing:border-box;}
	.ec-base-tab .menu:after { content:""; display:block; clear:both; }
	.ec-base-tab .menu li { float:left; border-left:1px solid #cbcdce; background:#f2f2f2; }
	.ec-base-tab .menu li a { display:block; min-width:187px; margin:0 0 0 -1px; padding:12px 5px 11px; border-right:1px solid #cbcdce; color:#707070; text-decoration:none; outline:0; text-align:center; background:#f2f2f2; }
	.ec-base-tab .menu li:first-child a { margin-left:0; }
	.ec-base-tab .menu li.selected a { position:relative; top:-1px; left:-2px; margin:0 0 -1px; border:1px solid #202020; border-bottom:0; color:#1d1e1f; font-weight:bold; background:#fff; }
	.ec-base-tab .menu li.selected:first-child a { left:-1px; }
	.ec-base-tab > .right { position:absolute; top:8px; right:10px; line-height:24px; color:#909090; }
	/* typeLight */
	.ec-base-tab.typeLight .menu li.selected a { margin:0 0 -2px; border-bottom:1px solid #fff; color:#404040; background:#fff; }
	/* grid (2~7) */
	.ec-base-tab[class*="grid"] .menu { display:table; table-layout:fixed; width:100%; }
	.ec-base-tab[class*="grid"] .menu li { float:none; display:table-cell; vertical-align:middle; }
	.ec-base-tab[class*="grid"] .menu li a { display:inline-block; width:100%; min-width:0; margin:0; padding:11px 0; border:0; }
	.ec-base-tab[class*="grid"] .menu li.selected { position:relative; top:0; right:-1px; border:1px solid #fff; border-bottom:0; background:#fff; }
	.ec-base-tab[class*="grid"] .menu li:first-child.selected { right:0; }
	.ec-base-tab[class*="grid"] .menu li.selected a { position:static; background:none; }
	.ec-base-tab.grid2 .menu li { width:50.5%; }
	.ec-base-tab.grid3 .menu li { width:34%; }
	.ec-base-tab.grid4 .menu li { width:25.5%; }
	.ec-base-tab.grid5 .menu li { width:20.5%; }
	.ec-base-tab.grid6 .menu li { width:17%; }
	.ec-base-tab.grid7 .menu li { width:14.8%; width:15% \0/; }
	.ec-base-tab.grid7 .menu li:first-child { width:13% \0/; }
  </style>
	
	<!-- 상품설명, 상품리뷰, Q&A 탭 메뉴 -->
	<div class="ec-base-tab grid3">
    <ul class="menu">
    					<!-- 밑 컨텐츠 칸의 id와 일치해야함 -->
        <li class="selected"><a href="#description" data-bs-toggle="tab" aria-selected="true">상품 설명</a></li>
        <li><a href="#review" data-bs-toggle="tab">상품 리뷰</a></li>
        <li><a href="#qna" data-bs-toggle="tab">Q&A</a></li>
    </ul>
</div>

<!-- 표시될 컨텐츠 -->
<div class="tab-content" id="myTabContent">
    <div class="tab-pane active" id="description" role="tabpanel"> <!-- 위의 id와 일치해야함 -->
    
        <!-- 상품설명 섹션 -->
        <section id="product_infomation" class="service sections margin-top-120">
            <div class="container">
                <div class="row">
                    <div class="col-sm-12">
                        <div class="head_title text-center">
                            <h2>상품설명</h2>
                        </div>
                        <!-- End of head title -->
                        <div class="main_service_area">
                            <div>
                                <img src="https://cf-images.oliveyoung.co.kr/product/html/crop/A000000202094/202404080946/crop0/etude.speedgabia.com/webcatalogue/2024/03/OverGlowy/images/img1.jpg?created=202404080947" class="s-lazy s-lazy-s s-loaded" style="width: 100%;">
                                <img src="https://cf-images.oliveyoung.co.kr/product/html/crop/A000000202094/202404080946/crop1/etude.speedgabia.com/webcatalogue/2024/03/OverGlowy/images/img1.jpg?created=202404080947" class="s-lazy s-lazy-s s-loaded" style="width: 100%;">
                                <img src="https://cf-images.oliveyoung.co.kr/product/html/crop/A000000202094/202404080946/crop2/etude.speedgabia.com/webcatalogue/2024/03/OverGlowy/images/img1.jpg?created=202404080947" class="s-lazy s-lazy-s s-loaded" style="width: 100%;">
                                <img src="https://cf-images.oliveyoung.co.kr/product/html/crop/A000000202094/202404080946/crop3/etude.speedgabia.com/webcatalogue/2024/03/OverGlowy/images/img1.jpg?created=202404080947" class="s-lazy s-lazy-s s-loaded" style="width: 100%;">
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </div>
    
    <!-- 상품리뷰 섹션 -->
    <div class="tab-pane" id="review" role="tabpanel">
    <section id="product_infomation" class="service sections margin-top-120">
    	<div class="container">
                <div class="row">
                    <div class="col-sm-12">
                        <div class="head_title text-center">
                            <h2>상품설명</h2>
                        </div>
        				<div class="main_service_area">
        					<p>이곳에 상품 리뷰 내용을 입력하세요.</p>
        				</div>
        		</div>
        	</div>
       	</div>
   	</section>
    </div>
    
    <!-- Q&A 섹션 -->
    <div class="tab-pane" id="qna" role="tabpanel">
    <section id="product_infomation" class="service sections margin-top-120">
    	<div class="container">
                <div class="row">
                    <div class="col-sm-12">
                        <div class="head_title text-center">
                            <h2>Q&A</h2>
                        </div>
        				<div class="main_service_area">
        					<p>이곳에 Q&A 내용을 입력하세요.</p>
        				</div>
        		</div>
        	</div>
       	</div>
   	</section>
    </div>
    
</div>


<!-- 탭메뉴에 대한 JS -->
<script>
  document.addEventListener("DOMContentLoaded", function() {
    const tabButtons = document.querySelectorAll('.ec-base-tab.grid3 .menu li');

    tabButtons.forEach(function(button) {
      button.addEventListener("click", function(event) {
        // 기본 이벤트 제거
        event.preventDefault();

        // 탭 버튼 활성화 처리
        tabButtons.forEach(function(btn) {
          btn.classList.remove('selected');
        });
        this.classList.add('selected');

        // 탭 패널 활성화 처리
        const targetPaneId = this.querySelector('a').getAttribute("href").replace('#', '');
        document.querySelectorAll('.tab-pane').forEach(function(pane) {
          pane.classList.remove('active');
        });
        document.getElementById(targetPaneId).classList.add('active');
      });
    });
  });
</script>

	

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

	<script src="/resources/assets/js/vendor/jquery-1.11.2.min.js"></script>
	<script src="/resources/assets/js/vendor/bootstrap.min.js"></script>

	<script src="/resources/assets/js/jquery.easing.1.3.js"></script>

	<script src="/resources/assets/js/plugins.js"></script>
	<script src="/resources/assets/js/main.js"></script>

</body>
</html>
