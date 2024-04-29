<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script>
$(document).ready(function() {
	
 	/* 카테고리에 마우스 가져다댈시 메인카테고리 나오게 */
    $("#ctg_btn").mouseenter(function() {
        $("#ctg").addClass("show-grid");
        
        //스크롤 여부에 따라 메뉴 높이 조정
        if ($('.navbar-fixed-top').hasClass('menu-scroll')) {
            $(".main_menu_bg").css("height", "130px");
            $("#ctg").addClass("menu-scroll");
            $("#ctg-content").addClass("menu-scroll");
        } else {
            $(".main_menu_bg").css("height", "170px");
            $("#ctg").removeClass("menu-scroll");
            $("#ctg-content").removeClass("menu-scroll");
        }
    });
	
    /* 메인카테고리에 마우스 가져다댈시 세부카테고리 나오게 */
    $("#ctg").mouseenter(function() {
    	$("#ctg-content").addClass("show-content");
    });
    
    /* 세부카테고리에서 마우스 떼면 카테고리 사라지게 */
    $("#ctg-content").mouseleave(function() {
        $("#ctg").removeClass("show-grid");
        
        $("#ctg-content").removeClass("show-content");
        $(".main_menu_bg").css("height", "155px");
        
      	//스크롤 여부에 따라 메뉴 높이 조정
        if ($('.navbar-fixed-top').hasClass('menu-scroll')) {
            $(".main_menu_bg").css("height", "130px");
            $("#ctg").addClass("menu-scroll");
            $("#ctg-content").addClass("menu-scroll");
        } else {
            $(".main_menu_bg").css("height", "155px");
            $("#ctg").removeClass("menu-scroll");
            $("#ctg-content").removeClass("menu-scroll");
        }
    });
});
</script>
    
<style>

#ctg {
	margin: 0 5% 12px 5%;
	display: none;
	height: 25px;
	position: relative;
}
#ctg.show-grid {
	display: grid;
	grid-template-columns: repeat(10, 1fr);
	text-align: center;
}
#ctg a:hover { /* 메인 카테고리 영역에 마우스 가져다댈시 링크 색깔 바꾸기 */
	color:red;
}
#ctg-content {
	margin: 0;
	background-color: white;
	width: 100%;
	height: 300px;
	border: 1px solid grey;
	display: none;
	position: relative;
}
#ctg-content.show-content{
	display: flex;
	align-content: center;
}

#ctg-grid {
	margin: 0 5%;
	display: grid;
	grid-template-columns: repeat(10, 1fr);
	align-items: center;
	text-align: center;
}

.b-ctg-content {
	height: 90%;
	padding: 0 10px;
	border-left: 1px solid grey;
	display: flex;
	flex-direction: column;
}
.b-ctg-content:nth-child(1) {
	border: none;
}
.b-ctg-content ul {
	padding: 2px 0;
	font-size: 0.8em;
}

/* 스크롤 */
#ctg.menu-scroll {
margin: 0 5% 12px 5%;
 	top: 95px;
	box-shadow: none; 
	position: fixed;
}
#ctg-content.menu-scroll{
margin: 0 5% 12px 5%;
	top: 130px;
	box-shadow: none; 
	position: fixed;
}

</style>

<!-- 메인카테고리 -->
<div id="ctg">
	<a href="/product/list.do?no=50">스킨케어</a>
	<a href="/product/list.do?no=60">마스크</a>
	<a href="/product/list.do?no=70">클렌저</a>
	<a href="/product/list.do?no=80">바디</a>
	<a href="/product/list.do?no=90">헤어</a>
	<a href="/product/list.do?no=30">페이스</a>
	<a href="/product/list.do?no=20">아이</a>
	<a href="/product/list.do?no=10">립</a>
	<a href="/product/list.do?no=40">네일</a>
	<a href="/product/list.do?no=100">툴</a>
</div>

<!-- 세부카테고리 -->
<div id="ctg-content">
<div id="ctg-grid">

	<!-- 스킨케어 -->
	<div class="b-ctg-content">
		<ul class="s-ctg-content">
			<a href="/product/list.do?no=51">토너-패드</a>
		</ul>
		<ul class="s-ctg-content">
			<a href="/product/list.do?no=52">에멀전</a>
		</ul>
		<ul class="s-ctg-content">
			<a href="/product/list.do?no=53">에센스-세럼</a>
		</ul>
		<ul class="s-ctg-content">
			<a href="/product/list.do?no=54">크림-밤</a>
		</ul>
		<ul class="s-ctg-content">
			<a href="/product/list.do?no=55">미스트</a>
		</ul>
		<ul class="s-ctg-content">
			<a href="/product/list.do?no=56">선케어</a>
		</ul>
		<ul class="s-ctg-content">
			<a href="/product/list.do?no=57">세트</a>
		</ul>
	</div>
	
	<!-- 마스크 -->
	<div class="b-ctg-content">
		<ul class="s-ctg-content">
			<a href="/product/list.do?no=61">시트마스크</a>
		</ul>
		<ul class="s-ctg-content">
			<a href="/product/list.do?no=62">페이셜팩</a>
		</ul>
		<ul class="s-ctg-content">
			<a href="/product/list.do?no=63">패치</a>
		</ul>
	</div>
	
	<!-- 클렌저 -->
	<div class="b-ctg-content">
		<ul class="s-ctg-content">
			<a href="/product/list.do?no=71">페이셜 클렌징</a>
		</ul>
		<ul class="s-ctg-content">
			<a href="/product/list.do?no=72">메이크업 클렌징</a>
		</ul>
		<ul class="s-ctg-content">
			<a href="/product/list.do?no=73">필링-스크럽</a>
		</ul>
	</div>
	
	<!-- 바디 -->
	<div class="b-ctg-content">
		<ul class="s-ctg-content">
			<a href="/product/list.do?no=81">워시</a>
		</ul>
		<ul class="s-ctg-content">
			<a href="/product/list.do?no=82">보습</a>
		</ul>
		<ul class="s-ctg-content">
			<a href="/product/list.do?no=83">핸드-풋</a>
		</ul>
	</div>
	
	<!-- 헤어 -->
	<div class="b-ctg-content">
		<ul class="s-ctg-content">
			<a href="/product/list.do?no=91">컬러-스타일링</a>
		</ul>
		<ul class="s-ctg-content">
			<a href="/product/list.do?no=92">헤어케어</a>
		</ul>
	</div>
	
	<!-- 페이스 -->
	<div class="b-ctg-content">
		<ul class="s-ctg-content">
			<a href="/product/list.do?no=31">베이스-프라이머</a>
		</ul>
		<ul class="s-ctg-content">
			<a href="/product/list.do?no=32">쿠션-파운데이션</a>
		</ul>
		<ul class="s-ctg-content">
			<a href="/product/list.do?no=33">BB컨실러</a>
		</ul>
		<ul class="s-ctg-content">
			<a href="/product/list.do?no=34">팩트-파우더</a>
		</ul>
		<ul class="s-ctg-content">
			<a href="/product/list.do?no=35">컨투어링-하이라이터</a>
		</ul>
		<ul class="s-ctg-content">
			<a href="/product/list.do?no=36">블러셔</a>
		</ul>
	</div>
	
	<!-- 아이 -->
	<div class="b-ctg-content">
		<ul class="s-ctg-content">
			<a href="/product/list.do?no=21">싱글섀도우</a>
		</ul>
		<ul class="s-ctg-content">
			<a href="/product/list.do?no=22">아이팔레트</a>
		</ul>
		<ul class="s-ctg-content">
			<a href="/product/list.do?no=23">마스카라</a>
		</ul>
		<ul class="s-ctg-content">
			<a href="/product/list.do?no=24">아이라이너</a>
		</ul>
		<ul class="s-ctg-content">
			<a href="/product/list.do?no=25">아이브로우</a>
		</ul>
	</div>
	
	<!-- 립 -->
	<div class="b-ctg-content">
		<ul class="s-ctg-content">
			<a href="/product/list.do?no=11">립스틱</a>
		</ul>
		<ul class="s-ctg-content">
			<a href="/product/list.do?no=12">틴트</a>
		</ul>
		<ul class="s-ctg-content">
			<a href="/product/list.do?no=13">글로스</a>
		</ul>
		<ul class="s-ctg-content">
			<a href="/product/list.do?no=14">립펜슬</a>
		</ul>
		<ul class="s-ctg-content">
			<a href="/product/list.do?no=15">립케어</a>
		</ul>
	</div>
	
	<!-- 네일 -->
	<div class="b-ctg-content">
		<ul class="s-ctg-content">
			<a href="/product/list.do?no=41">네일컬러</a>
		</ul>
		<ul class="s-ctg-content">
			<a href="/product/list.do?no=42">네일케어</a>
		</ul>
		<ul class="s-ctg-content">
			<a href="/product/list.do?no=43">네일리무버</a>
		</ul>
	</div>
	
	<!-- 툴 -->
	<div class="b-ctg-content">
		<ul class="s-ctg-content">
			<a href="/product/list.do?no=101">브러쉬</a>
		</ul>
		<ul class="s-ctg-content">
			<a href="/product/list.do?no=102">퍼프</a>
		</ul>
		<ul class="s-ctg-content">
			<a href="/product/list.do?no=103">화장솜-면봉</a>
		</ul>
		<ul class="s-ctg-content">
			<a href="/product/list.do?no=104">속눈썹</a>
		</ul>
		<ul class="s-ctg-content">
			<a href="/product/list.do?no=105">헤어도구</a>
		</ul>
		<ul class="s-ctg-content">
			<a href="/product/list.do?no=106">기타</a>
		</ul>
	</div>
</div>
</div>