<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-3.7.1.min.js"></script> 

<script type="text/javascript">
function formatDate(dateString) {
    let date = new Date(dateString);
    let formattedDate = date.getFullYear() + '-' + ('0' + (date.getMonth() + 1)).slice(-2) + '-' + ('0' + date.getDate()).slice(-2)
        + ' ' + ('0' + date.getHours()).slice(-2) + ':' + ('0' + date.getMinutes()).slice(-2) + ':' + ('0' + date.getSeconds()).slice(-2);
    return formattedDate;
}

$(document).ready(function() {
    var p_id = '${dto.p_id}';
    console.log("p_id: " + p_id);

    $.ajax({
        url: '/review/list',
        method: 'GET',
        data: { p_id: p_id },
        success: function(data) {
            var reviewList = ''; 

            data.forEach(function(review) {
                reviewList += 
                    '<div class="review_list">' +
                    '<ul class="inner_list">' +
                    '<li>' +
                    '<div class="info">' +
                    '<div class="user">' +
                    '<a href="#">' +
                    '<div class="thum">' +
                    '<span class="bg"></span>' +
                    '<img src="https://static.oliveyoung.co.kr/pc-static-root/image/comm/my_picture_base.jpg">' + 
                    '</div>' +
                    '</a>' +
                    '<p class="info_user"><a>' + review.nickname + '</a></p>' +
                    '<p class="tag">' +
                    '<span>지성</span>' +
                    '<span>쿨톤</span>' +
                    '<span>여드름</span>' +
                    '<span>탄력</span>' +
                    '</p>' +
                    '</div>' +
                    '</div>' +
                    '<div class="review_contents">' +
                    '<div class="score_area">' +
                    '<span class="review_point">' +
                    '<span class="point" style="width: 100%"></span>' +
                    '</span>' +
                    '<span class="date">' + formatDate(review.r_date) + '</span>' +
                    '</div>' +
                    '<div class="txt_inner">' +
                    '<div class="contents">' + review.r_contents +
                    '</div>' +
                    '</div>' +
                    '<div class="review_thum">' +
                    '<ul id="review_thum_' + review.r_id + '">' +  // ID를 추가하여 각 리뷰의 썸네일 리스트에 고유 ID 부여
                    '</ul>' +
                    '</div>' +
                    '<p class="txt_beauty">※ 해당 리뷰는 원칙적으로 기본 상품이 동일한 단품 사용 후 작성된 것이며, 개별 상품에 따라 용량 내지 일부 구성(1+1, 기획상품 등)이 상이할 수 있음을 안내드립니다.</p>' +
                    '<div class="like_area">이 리뷰가 도움이 돼요!' +
                    '<button type="button" class="btn_like">' +
                    '<span></span>' +
                    '</button>' +
                    '</div>' +
                    '</div>' +
                    '</li>' +
                    '</ul>' +
                    '</div>';

                // 각 리뷰에 대한 사진 데이터를 가져오기 위한 AJAX 요청
                $.ajax({
                    url: '/review/list_attach/' + review.r_id,
                    method: 'GET',
                    success: function(images) {
                        var thumList = '';
                        images.forEach(function(image) {
                        	image=image.replace("src/main/webapp","");
                        	console.log('image:'+image);
                            thumList += '<li><img src="' + image + '" alt="Review Image"></li>'; // 이미지 경로 수정 필요
                        });
                        $('#review_thum_' + review.r_id).append(thumList);
                    },
                    error: function(xhr, status, error) {
                        console.error('이미지를 불러오는 중 오류 발생:', error);
                    }
                });
            });

            $('#review_list').append(reviewList); 
        },
        error: function(xhr, status, error) {
            console.error('리뷰를 불러오는 중 오류 발생:', error);
        }
    });


    
    /* // 사진 업로드 버튼
    $('.upload-box.add').on('click', function() {
        const box = $(this);
        const input = $('<input type="file" accept="image/*">');
        input.on('change', function() {
            readURL(this, box);
        });
        input.click();
    });

    function readURL(input, box) {
        if (input.files && input.files[0]) {
            let file = input.files[0];
            let check_file_type = ['jpg', 'gif', 'png', 'jpeg', 'bmp'];
            let typeName = file.type.split('/');
            let fileType = typeName[1].toLowerCase();

            if (check_file_type.includes(fileType)) {
                let reader = new FileReader();

                reader.onload = function(e) {
                    let img = $('<img src="' + e.target.result + '" alt="your image" />');
                    const input = $('<input type="file" name="files" accept="image/*">');
                    box.empty().append(img).append(input).removeClass('add');
                }
                reader.readAsDataURL(file);
                const fileInput = document.querySeletor('input[type="file"]');
                const myFile = new File(fileInput);
            } else {
                alert('이미지 파일만 선택할 수 있습니다.');
                return;
            }
        }
    } */


    // 모달 창 열기
    function openModal() {
        var modal = document.getElementById("myModal");
        if (modal) {
            modal.style.display = "block";
        } else {
            console.error('모달 요소를 찾을 수 없습니다.');
        }
    }

    // 모달 창 닫기
    function closeModal() {
        var modal = document.getElementById("myModal");
        if (modal) {
            modal.style.display = "none";
        } else {
            console.error('모달 요소를 찾을 수 없습니다.');
        }
    }

    // 등록 버튼에 클릭 이벤트 리스너 추가
    var openModalButton = document.getElementById("btnOpenModal");
    if (openModalButton) {
        openModalButton.addEventListener("click", function() {
            openModal();
        });
    } else {
        console.error('모달 열기 버튼을 찾을 수 없습니다.');
    }

    var closeButton = document.querySelector(".close");
    if (closeButton) {
        closeButton.addEventListener("click", function() {
            closeModal();
        });
    } else {
        console.error('닫기 버튼을 찾을 수 없습니다.');
    }

    window.addEventListener("click", function(event) {
        var modal = document.getElementById("myModal");
        if (modal && event.target == modal) {
            closeModal();
        }
    });
    
    var outButton = document.querySelector(".out");
    if (outButton) {
    	outButton.addEventListener("click", function() {
            closeModal();
        });
    }
    
    $("#fileInput").on("change", function(e) {
        e.preventDefault();
        const files = e.target.files;
        console.log(files);
        const form_data = new FormData();
        
        for (let i = 0; i < files.length; i++) {
            form_data.append("file", files[i]);
         // 이미지 파일인 경우 미리보기 생성
            if (files[i].type.startsWith("image/")) {
                const reader = new FileReader();
                reader.onload = function(event) {
                    const img = $("<img>").attr("src", event.target.result).css("max-width", "70px"); // 이미지 미리보기 크기 조정
                    $("#file_box").append(img);
                };
                reader.readAsDataURL(files[i]);
            }
        }
        console.log(form_data);

        $.ajax({
            url: "/upload/ajax_upload",
            data: form_data,
            processData: false,
            contentType: false,
            type: "post",
            success: function(data) {
                if (Array.isArray(data)) {
                    data.forEach(file_name => {
                        const fileInfo = getFileInfo(file_name);
                       // let html = "<a href='" + fileInfo.get_link + "'>" + fileInfo.original_name + "</a>";
                        html = "<input type='hidden' name='file' style='margin: 5px;' value='" + fileInfo.file_name + "'>";
                        $("#file_box").append(html);
                    });
                } else {
                    console.error('Expected an array but got:', data);
                }
            },
            error: function(jqXHR, textStatus, errorThrown) {
                console.error('Error:', textStatus, errorThrown);
            }
        });
    });
});

function getFileInfo(file_name) {
    const get_link = "/upload/display_file?file_name=" + file_name;
    const original_name = file_name.substr(file_name.indexOf("_") + 1);
    return { original_name: original_name, get_link: get_link, file_name: file_name };
}
</script>





<style>
body {
	margin: 0;
	 
}

a {
    color: #666;
    text-decoration: none;
}

a, address, blockquote, body, dd, div, dl, dt, em, fieldset, form, h1, h2, h3, h4, h5, h6, img, input, label, li, ol, p, pre, select, span, strong, textarea, ul {
    margin: 0;
    padding: 0;
    border: 0;
}

* {
	box-sizing: border-box;
	font-family: 'Montserrat', sans-serif;
}

.review_list {
	margin: 0;
    padding: 0;
    border: 0;
}

ol, ul{
	list-style: none;
}

.review_list .inner_list>li {
    border-bottom: 1px solid #e5e5e5;
}

/* 리뷰 유저쪽 */
.review_list .inner_list>li.info{
	float: left;
    width: 255px;
    padding: 30px 0;
}

.info{
	padding: 30px 0;
}

.inner_list .info .user .thum{
	float: left;
    position: relative;
    width: 60px;
    height: 60px;
    margin: 0;
}

.inner_list .info .user .thum img {
    width: 60px;
    height: 60px;
}

.inner_list .info .user .thum .bg {
    position: absolute;
    top: 0;
    left: 0;
    display: block;
    overflow: hidden;
    width: 60px;
    height: 60px;
    background: url(https://static.oliveyoung.co.kr/pc-static-root/image/comm/bg_my_picture.png) no-repeat;
}

.review_list .inner_list .info .user .tag{
	margin-top: 12px;
    font-weight: 400;
    font-size: 12px;
    line-height: 14px;
    color: #757d86;
}

.review_list .inner_list .info .user .info_user {
    overflow: hidden;
    width: 80px;
    margin-left: 11px !important;
}

.review_list .inner_list .info .user .tag span, .review_list .inner_list .info .user .topreview_N2 span {
    display: inline-block;
    vertical-align: top;
    font-weight: 400;
    font-size: 12px;
    line-height: 14px;
    color: #757d86;
    float: left;
}

/* 리뷰 컨텐츠쪽 */
.review_list .inner_list>li>.review_contents{
	position: relative;
    margin-left: 255px;
    padding: 30px 0;
    bottom: 23px;
}

.review_list .inner_list>li>.review_contents .txt_inner {
    color: #555;
    line-height: px;
    margin: 30px;
}
.review_list .inner_list>li>.review_contents .txt_inner .subject {
    color: #555;
    line-height: px;
    margin: 30px;
    font-weight: 600;
}
.review_list .inner_list>li>.review_contents .txt_inner .contents {
    color: #555;
    line-height: px;
    margin: 30px;
}

.score_area {
    min-height: 20px;
    margin-bottom: 50px;
}

.inner_list .review_point {
    float: left;
    width: 112px;
    height: 20px;
    background: url(https://static.oliveyoung.co.kr/pc-static-root/image/comm/ico_review_point_new_off.png) 0 0 / 112px auto no-repeat;
}

.score_area .date {
    margin-left: 15px;
    font-size: 16px;
    line-height: 24px;
    letter-spacing: 0;
}

.inner_list .review_thum {
    padding: 0;
    margin-bottom: 15px;
    border-bottom: 0;
}

.like_area {
    margin-top: 20px;
}

.like_area .btn_like {
    padding-left: 0;
    background: 0 0;
    color: #333;
    font-size: 15px;
    line-height: 28px;
    letter-spacing: 0;
    font-weight: 700;
}

.like_area .btn_like {
    height: 32px;
    padding-left: 39px;
    border: none;
    font-size: 14px;
    color: #333;
}

.like_area .btn_like span {
    position: relative;
    display: inline-block;
    margin-left: -34px;
    height: 28px;
    line-height: 26px;
    padding: 0 36px 0 24px;
    color: #888;
    border: 1px solid #ddd;
    border-radius: 14px;
    vertical-align: top;
    font-weight: 400;
     background: url("https://static.oliveyoung.co.kr/pc-static-root/image/product/icon_recom_new.png") 0 1px/17px auto no-repeat;
}

.inner_list .review_point {
    float: left;
    width: 112px;
    height: 20px;
    background: url(https://static.oliveyoung.co.kr/pc-static-root/image/comm/ico_review_point_new_off.png) 0 0 / 112px auto no-repeat;
}

.inner_list .review_point .point {
    height: 20px;
    background: url(https://static.oliveyoung.co.kr/pc-static-root/image/comm/ico_review_point_new_on.png) 0 0 / 112px auto no-repeat;
}
</style>

</head>
<body data-spy="scroll" data-target=".navbar-collapse">
	
	<div class="head_title text-center">
		<h2>상품리뷰</h2> 
		
		<button type="button" id="btnOpenModal">리뷰 등록</button>
		
		<!-- 리뷰 리스트 -->
		<div id="review_list"></div>
		
		<!-- 모달 -->
  <div id="myModal" class="modal">
  <div class="modal-content">
    <span class="close">&times;</span>
    <h3 style="text-align: left;">리뷰 작성</h3>
    <hr style="border: 1.5px solid black;">
    p_id: ${dto.p_id}
    
   
    <!--  -->
    <form id="reviewForm" name="reviewForm" method="post" enctype="multipart/form-data">
     <input type="hidden" name="p_id" value="${dto.p_id}"> 
      <h5 style="font-weight: bold; text-align: left;">솔직한 리뷰를 남기세요!</h5>
      <div style="width: 900px; border: 1px solid gray; text-align: left;">
        <textarea rows="5" cols="80" id="r_contents" name="r_contents" placeholder="꿀팁 가득, 상세한 리뷰를 작성해보세요!"></textarea>
      </div>
    
      
      
    
        <input type="file" name="files" multiple="multiple" id="fileInput">
      	<div id="file_box"></div>
      
       <button type="button" class="out">닫기</button>
      <button type="button" onclick="submit_good()">등록</button>
    </form>
   
    
    <script type="text/javascript">
    function submit_good() {
    	let reviewForm = $("#reviewForm");
    	let r_subject = $("#r_subject").val();
    	let r_contents = $("#r_contents").val();
    	let p_id = '${dto.p_id}';
    	
    	if(r_subject == "" ) {
    		alert("제목을 입력해주세요.");
    		$("#r_subject").focus();
    		return;
    	} else if(r_contents == "") {
    		alert("내용을 입력해주세요.");
    		$("#r_contents").focus();
    		return;
    	}  
    	alert("리뷰 작성이 완료되었습니다.");
    	document.reviewForm.action="/review/insert";
    	document.reviewForm.submit();
    	
    }
    </script>
    
    
  </div>
</div>
   </div>


	<style>
	.close:hover,
  .close:focus {
    color: black;
    text-decoration: none;
    cursor: pointer;
  }
  /* 모달 스타일 수정 */
.modal-content {
    background-color: #fefefe;
    margin: 10% auto; /* 상단 여백을 조정하여 중앙에 정렬 */
    padding: 20px;
    border: 1px solid #888;
    width: 50%; /* 너비를 줄임 */
    min-height: 300px; /* 최소 높이 지정 */
    overflow: auto; /* 컨텐츠가 넘칠 경우 스크롤 표시 */
}

.close {
    color: #aaa;
    float: right;
    font-size: 28px;
    font-weight: bold;
    margin-top: -10px; /* 닫기 버튼을 위쪽으로 이동 */
}

/* 모달 바깥 영역 클릭 시 모달 닫기 */
.modal {
    display: none;
    position: fixed;
    z-index: 1;
    left: 0;
    top: 0;
    width: 100%;
    height: 100%;
    overflow: auto;
    background-color: rgba(0,0,0,0.4);
    padding-top: 60px;
}

.gallery {
    display: flex;
    flex-wrap: wrap;
    justify-content: center; /* 가운데 정렬 */
}

.upload-box {
    width: 100px;
    height: 100px;
    border: 2px dashed #ccc;
    display: flex;
    align-items: center;
    justify-content: center;
    cursor: pointer;
    position: relative;
    margin: 5px; /* 업로드 상자 사이의 간격 조정 */
}
.upload-box input[type="file"] {
    display: none;
}
.upload-box img {
    max-width: 100%;
    max-height: 100%;
}
.upload-box.add {
    background-color: #f5f5f5;
    color: #aaa;
    font-size: 24px;
}
    #file_box {
        margin: 10px; /* 파일 이름 표시 영역과 상단 간격 조정 */
    }

    #file_box a {
        display: inline-block;
        margin-right: 10px; /* 파일 이름과 다음 파일 이름 사이의 간격 조정 */
        color: #333; /* 파일 이름 색상 설정 */
        text-decoration: none; /* 밑줄 제거 */
         width: 100px;
    background-color: #f5f5f5;
    color: #aaa;
    font-size: 24px;
    }

    #file_box a:hover {
        color: #555; /* 마우스를 올렸을 때 파일 이름 색상 변경 */
    }

    /* 파일 이름이 표시되는 영역 안의 input 태그 스타일링 */
    #file_box input[type="hidden"] {
        display: none; /* 숨김 처리 */
        background-color: #f5f5f5;
    color: #aaa;
    font-size: 24px;
    }
    
    #file_box img{
    width: 100px;
    height: 100px;
    border: 2px dashed #ccc;
    display: inline-block;
    align-items: center;
    justify-content: center;
    cursor: pointer;
    position: relative;
    margin: 5px; /* 업로드 상자 사이의 간격 조정 */
    }
  </style>
  
		
		
		
		
 
    
    
    <!-- <div class="review_list">
    <ul class="inner_list">
        <li>
            <div class="info">
    			<div class="user">
        			<a href="#" >
            			<div class="thum">
                			<span class="bg"></span>
                			<img src="https://static.oliveyoung.co.kr/pc-static-root/image/comm/my_picture_base.jpg">
            			</div>
        			</a>
					<p class="info_user"><a>닉네임</a></p>
					<p class="tag">
						<span>지성</span>
						<span>쿨톤</span>
						<span>여드름</span>
						<span>탄력</span>
					</p>
				</div>
			</div>
            <div class="review_contents">
            	<div class="score_area">
            		<span class="review_point">
            			<span class="point" style="width: 100%"></span> 스타일 가로길이로 별점개수
            			100%: 5점, 80%: 4점, 60%: 3점, 40%: 2점, 20%: 1점 어케하는지는 모름 
            		</span>별점
            		<span class="date">날짜</span>
            	</div>
            	
            	<div class="txt_inner">리뷰내용</div>
            	
            	<div class="review_thum">
            		<ul>
            			<li>
            				<a href="#">
            					<span>
            						<img src="https://image.oliveyoung.co.kr/uploads/images/gdas…aoTalk_20240429_215441790.jpg?RS=165x0&CS=165x165">
            					</span>	
            				</a>
            			</li>
            		</ul>
            	</div>
            	<p class="txt_beauty">※ 해당 리뷰는 원칙적으로 기본 상품이 동일한 단품 사용 후 작성된 것이며,개별 상품에 따라 용량 내지 일부 구성(1+1, 기획상품 등)이 상이할 수 있음을 안내드립니다.</p>
            	
            	<div class="like_area">이 리뷰가 도움이 돼요!
            		<button type="button" class="btn_like">
            			<span></span>
            		</button>
            	</div>
            </div>
        </li>
    </ul>
</div> -->

</body>
</html>