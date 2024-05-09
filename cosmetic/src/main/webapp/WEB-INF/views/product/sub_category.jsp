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

<!-- 페이지 번호 -->
<!-- 이부분을 뒤로 보내면 페이징 버튼이 작동하지 않음 -->
<script type="text/javascript">
var urlParams = new URLSearchParams(window.location.search);
var no = urlParams.get('no');
var order = urlParams.get('order');

if (urlParams != null) {
   var no = urlParams.get('no'); //상품 카테고리
    var order = urlParams.get('order'); //정렬방식
    
    if (order != null) {
       function list(page) {
          location.href = "/product/sub_view.do?curPage=" + page + "&no=" + no + "&order=" + order;
       }
    } else {
       function list(page) {
          location.href = "/product/sub_view.do?curPage=" + page + "&no=" + no;
       }
    }
}
</script>

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
   margin: 40px 0 30px 0;
   border: 1px solid #e0e0e0;
   list-style: none;
   line-height: 40px;
}
#sub_menu ul {
   display: flex;
   align-items: center;
   justify-content: center;
   
}
#sub_menu ul li {
   flex-grow: 1;
   text-align: center;
   border-right: 1px solid #e0e0e0;
}
#sub_menu ul li:last-child {
   border: none;
}

/* 서브메뉴 클릭시 */
#sub_menu ul li:hover {
   color: #6eb853;
   cursor: pointer;
   outline: 1px solid #6eb853;
}
#sub_menu .sub.selected {
   color: #6eb853;
   padding: 0 1px;
   outline: 1px solid #6eb853;
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
   border-top: 1px solid gray;
   border-bottom: 2px solid gray;
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
   grid-gap: 1px;
   border-bottom: 1px solid #d4d4d4;
   grid-template-columns: repeat(4, 1fr); /* 열개수 */
   /* grid-template-rows: repeat(4, 1fr); */ /* 행개수 */
}
.grid .block {
   border-bottom: inherit;
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


.button-img {
  position: absolute;
  bottom: 0; right: 0;
  width: 40px;
  height: 40px;
  border: none;
  background-color: transparent;
  cursor: pointer;
}

.zzim {
  position: absolute;
  bottom: 0; right: 0;
  top: 50%;
  right: 0;
  width: 40px;
  height: 40px;
  background: url(https://static.oliveyoung.co.kr/pc-static-root/image/comm/ico_zzim.png) 50% 50% no-repeat #fff;

}

.zzimon {
position: absolute;
bottom: 0; right: 0;
  top: 50%;
  right: 0;
  transform: translateY(-50%);
  width: 40px;
  height: 40px;
   background:url(https://static.oliveyoung.co.kr/pc-static-root/image/comm/ico_zzim_on.png) 50% 50% no-repeat #fff;
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
   background-color: #6eb853;
   color: white;
   border-radius: 7px;
   text-align: center;
   line-height: 20px;
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
   #sub_menu {
   width: 50%;
   height: 100%;
   margin: 40px auto 30px auto;
   border-bottom: 1px solid #e0e0e0;
   list-style: none;
   line-height: 40px;
   }
   #sub_menu ul {
   
   display: flex;
   flex-direction: column;
   align-items: center;
   justify-content: center;
   }
   #sub_menu ul li {
   width: 100%;
   text-align: center;
   border: none;
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
         총 ${count} 개의 상품이 있습니다.
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
               <article class="block" data-product-id="${row.p_id}">
                  <div class="picture">
                     <div class="img">
                        <img src="${row.p_img1}" alt="상품 이미지">
                     </div>
                    <c:if test="${sessionScope.userid != null}">
                   <div class="like">    
                          <c:if test="${row.p_like == row.p_id}">
                              <button type="button" class="button-img" id="likeButton">
                                     <i class="zzimon"></i>
                              </button>
                          </c:if>  
                          <c:if test="${row.p_like != row.p_id }">          
                            <button type="button" class="button-img" id="likeButton">
                                    <i class="zzim"></i>
                             </button>
                          </c:if>
                   </div>
               </c:if>
                  </div>
                  <div class="desc">
                     <div class="p_name">
                        <a href="/product/detail_before?p_id=${row.p_id}">${row.p_name}</a>
                     </div>
                     <div class="p_price">
                        <b><fmt:formatNumber type="number" value="${row.p_price}"
                              pattern="#,###" />원</b>
                     </div>
                     <div class="p_delivery">${row.d_info}배송</div>
                  </div>
               </article>
            </c:forEach>
         </div>
      </div>
      
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
$(document).ready(function(){
   
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
   
  /*  var likeList = ${zzim}; // zzim을 JavaScript 리스트로 가져옵니다. */

   /* $(".block").each(function() {
       var product_id = $(this).data('product-id');
       var likeInfo = false; // 좋아요 정보 초기값 설정

       // 좋아요 정보가 있는지 확인
       for (var i = 0; i < likeList.length; i++) {
           if (likeList[i].z_id === product_id) { // 상품 ID와 일치하는 좋아요 정보가 있는지 확인
               likeInfo = true; // 좋아요 정보가 있는 경우 true로 설정
               break; // 반복문 종료
           }
       }

       // 좋아요 정보에 따라 버튼 상태 변경
       if (likeInfo) {
           $(this).find(".zzim").hide(); // 좋아요 버튼 숨김
           $(this).find(".zzimon").show(); // 좋아요 취소 버튼 표시
       } else {
           $(this).find(".zzim").show(); // 좋아요 버튼 표시
           $(this).find(".zzimon").hide(); // 좋아요 취소 버튼 숨김
       }
   }); */
   
    // 찜 누를때
   $(document).on('click', '.button-img', function() {
       var btn_zzim = $(this); // 찜버튼
       console.log(btn_zzim);
       var isLiked = btn_zzim.hasClass('zzimon'); // 현재 좋아요 상태 확인
       console.log(isLiked);
       var product_id = $(this).closest('.block').data('product-id'); // 상품 ID 가져오기
       console.log(product_id);
       
       // AJAX를 사용하여 서버에 좋아요 상태를 전송
       if (isLiked) {
           // 좋아요 상태를 취소한 경우
           $.ajax({
               type: 'POST',
               url: '/zzim/zzim_clear',
               data: { p_id: product_id }, // 상품 ID를 서버로 전송
               success: function(response) {
                  btn_zzim.removeClass('zzimon').addClass('zzim'); // 좋아요 취소 상태에서 좋아요 상태로 변경
                  btn_zzim.parent().find(".zzim").show(); // 좋아요 버튼 표시
                  btn_zzim.parent().find(".zzimon").hide(); // 좋아요 취소 버튼 숨김
                  
               },
               error: function(xhr, status, error) {
                   console.error('AJAX 요청 실패: ', status, error);
               }
           });
       } else if(!isLiked) {
           // 좋아요를 추가한 경우
           $.ajax({
               type: 'POST',
               url: '/zzim/zzim_apply',
               data: { p_id: product_id }, // 상품 ID를 서버로 전송
               success: function(response) {
                  btn_zzim.removeClass('zzim').addClass('zzimon'); // 좋아요 상태에서 좋아요 취소 상태로 변경
                  btn_zzim.parent().find(".zzim").hide(); // 좋아요 버튼 숨김
                  btn_zzim.parent().find(".zzimon").show(); // 좋아요 취소 버튼 표시
               },
               error: function(xhr, status, error) {
                   console.error('AJAX 요청 실패: ', status, error);
               }
           });
       }
   }); 
   
});
</script>



</body>
</html>