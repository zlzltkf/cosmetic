<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">

<head>
<script src="http://code.jquery.com/jquery-3.7.1.min.js"></script>   
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>SB Admin 2 - Cards</title>

    <!-- Custom fonts for this template-->
    <link href="/resources/admin/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link
        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet">

    <!-- Custom styles for this template-->
    <link href="/resources/admin/css/sb-admin-2.min.css" rel="stylesheet">
<style type="text/css">
#td1{

font-weight: bold;
border-top: 1px solid #dddddd; /* 위쪽 테두리를 1픽셀 두께의 실선으로 설정합니다. */
border-bottom: 1px solid #dddddd;
}
.col-md-6 {
 width: 50%; /* 또는 원하는 너비로 조정 */
}
.color-span {
    color: black;
    font-weight: bold;
   /*  border-top: 1px solid gray; */
    /* border-bottom: 1px solid gray; */
    display: inline-block;
    padding: 0.7em 0.5em;
    width: 204px;
}

.amount-span {
    color: black;
    font-weight: bold;
    border-left: 1px solid gray;
   /*  border-top: 1px solid gray; */
    /* border-bottom: 1px solid gray; */
    display: inline-block;
    padding: -1.5em 0.5em;
    width: 204px;
}
</style>

<script>

/*대표 이미지 미리보기*/
function previewImage(event) {
    var reader = new FileReader();
    reader.onload = function () {
        var output = document.getElementById('imagePreview');
        output.innerHTML = '<img src="' + reader.result + '" style="width: 300px; height: 300px;">';
    };
    reader.readAsDataURL(event.target.files[0]);
}

/* 한 개의 체크박스만 선택할 수 있도록 하는 함수 */
function checkOnlyOne(element) {
    const checkboxes = document.getElementsByName("yes_no");
    checkboxes.forEach((cb) => {
        cb.checked = false;
    });
    element.checked = true;
}
function save_form(){
	//document.form1.o_amount[0]='0';
	//document.form1.o_name[0]='0';
	document.form1.submit();
	
}
/* "있음" 체크박스가 선택되었을 때 입력 필드를 활성화하거나 비활성화하는 함수 */
function look() {
    // "yes_no"라는 이름을 갖는 모든 체크박스를 가져옵니다.
    const checkboxes = document.getElementsByName("yes_no");
    const stockInput = document.getElementById("p_stock");
    const amountInput = document.getElementById("o_amount");
    
    const nameInput = document.getElementById("o_name");
	const insertBtn = document.getElementById("insert");
	const deleteBtn = document.getElementById("delete");
	
    let isChecked = false; // "있음" 체크박스가 선택되었는지 여부를 확인하는 변수

    // 모든 체크박스를 반복하여 "있음" 체크박스가 선택되었는지 확인합니다.
    checkboxes.forEach(checkbox => {
        if (checkbox.checked && checkbox.value === "1") {
            isChecked = true; // "있음" 체크박스가 선택되었다면 isChecked 값을 true로 설정
            stockInput.value = null;
            
        }
    });
    // "있음" 체크박스가 선택되었다면 재고 입력 필드를 비활성화하고, 그렇지 않다면 활성화합니다.
    insertBtn.disabled = !isChecked;
    deleteBtn.disabled = !isChecked;
    stockInput.disabled = isChecked;
    amountInput.disabled = !isChecked;
    nameInput.disabled = !isChecked;
}

function save(){
	const savebtn = document.getxElementById("save");
	savebtn.onclick
}



</script>
</head>

<body style="height: 750px;" id="page-top">
    
    <div id="wrapper">

        <!-- Sidebar -->
        <ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">

            <!-- Sidebar - Brand -->
            <a class="sidebar-brand d-flex align-items-center justify-content-center" href="index.html">
                <div class="sidebar-brand-icon rotate-n-15">
                </div>
                <div class="sidebar-brand-text mx-3">EDEN 뷰티</div>
            </a>

            <!-- Divider -->
            <hr class="sidebar-divider my-0">

            <!-- Nav Item - Dashboard -->
            <li class="nav-item"><a class="nav-link" href="index.html">
					<i></i> <span>📈 대쉬보드</span>
			</a></li>

            <!-- Divider -->
            <hr class="sidebar-divider">

       

            <!-- Nav Item - Pages Collapse Menu -->
           <li class="nav-item active"><a class="nav-link" href="#"
				data-toggle="collapse" data-target="#collapseTwo"
				aria-expanded="true" aria-controls="collapseTwo"> <i 
					></i> <span>👤 고객관리</span>
			</a>
				<div id="collapseTwo" class="collapse"
					aria-labelledby="headingTwo" data-parent="#accordionSidebar">
					<div class="bg-white py-2 collapse-inner rounded">
						<a class="collapse-item" href="/admin/user_list">고객목록</a> <a
							class="collapse-item active" href="#">고객</a>
					</div>
				</div></li>


			<li class="nav-item"><a class="nav-link collapsed" href="#"
				data-toggle="collapse" data-target="#collapsePages"
				aria-expanded="true" aria-controls="collapsePages"> <i
				></i> <span>🛍︎ 상품관리</span>
			</a>
				<div id="collapsePages" class="collapse"
					aria-labelledby="headingPages" data-parent="#accordionSidebar">
					<div class="bg-white py-2 collapse-inner rounded">
						<a class="collapse-item" href="/admin/write_product">상품등록</a> <a
							class="collapse-item" href="/admin/list_product">상품목록</a>
						<div class="collapse-divider"></div>

					</div>
				</div></li>

			<!-- Nav Item - Charts -->
			<li class="nav-item"><a class="nav-link" href="/admin/order_list">
					<i ></i> <span>📋 주문목록</span>
			</a></li>
			
			<li class="nav-item"><a class="nav-link" href="/">
					<i ></i> <span>🖱️ 사이트로 바로가기</span>
			</a></li>

            <!-- Divider -->
            <hr class="sidebar-divider d-none d-md-block">

            <!-- Sidebar Toggler (Sidebar) -->
            <div class="text-center d-none d-md-inline">
                <button class="rounded-circle border-0" id="sidebarToggle"></button>
            </div>

        </ul>
        <!-- End of Sidebar -->

        <!-- Content Wrapper -->
        <!-- <div id="content-wrapper" class="d-flex flex-column"> -->

            <!-- Main Content -->
            <div id="content">

                <!-- Topbar -->
                <nav class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">

                    <!-- Sidebar Toggle (Topbar) -->
                   <!--  <button id="sidebarToggleTop" class="btn btn-link d-md-none rounded-circle mr-3">
                        <i class="fa fa-bars"></i>
                    </button> -->

                    
                    

                    <!-- ------------------------------------Tob Bar 시작!------------------------------------ -->
                    <ul class="navbar-nav ml-auto">
                        <!-- Nav Item - User Information -->
                        <li class="nav-item dropdown no-arrow">
                            <a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button"
                                data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <span class="mr-2 d-none d-lg-inline text-gray-600 small">EDEN 관리자</span>
                                <img class="img-profile rounded-circle"
                                    src="/resources/admin/img/undraw_profile.svg">
                            </a>
                        </li>
                    </ul>
                </nav>
                <!---------------------------------------------Tob Bar 끝! ----------------------------------->

                <!-- ----------------------------------------- 내용 시작 --------------------------------->
                <div class="container-fluid" style="height: 750px;">
  					  <h1 class="h3 mb-4 text-gray-800">상품 등록</h1>
    					<div class="row">
        <!-- 이미지 -->
        <form method="post" name="form1" action="/admin/insert" >
        <div style="text-align: center;">
            <div  style="width: 100%; height: 50%;">
                <div style="width: 300px;" class="form_section">
                    <label style="margin-bottom:0.5rem; font-weight: bold;">대표 이미지 &nbsp;</label>
                    <input type="file" id="p_img1" name="p_img1" onchange="previewImage(event)" > <!-- 파일 선택 시 미리보기 호출 -->
                    <div style="width: 300px; height:300px; background-image:url('/resources/admin/img/no_img.jpg');" class="form-section-title" id="imagePreview">
                        <!-- 파일 업로드 미리보기가 여기에 표시됩니다. -->
                    </div>
                    <div class="form-section-content">
                        <div id="uploadResult" style="width: 100%; height: auto; text-align: center;">
                            <!-- 이미지 업로드 후 이 영역에 이미지가 표시됩니다. -->
                        </div>
                    </div>
                </div>
            </div>
        </div>
        
        <!-- 테이블 -->
        <div  class="col-md-8" style="padding-left: 7.75rem;"> 
            <table class="row" cellspacing="10" cellpadding="12" style="border-collapse: collapse;">
                <tr>
                    <td id="td1">상품 코드</td>
                    <td style="color: gray;" id="td1">자동생성</td>
                </tr>
                <tr>
                    <td id="td1"><label for="product-name">상품명</label></td>
                    <td id="td1"><input type="text" id="p_name" name="p_name" style="width: 100%;"></td>
                </tr>
                <tr>
                    <td id="td1"><label for="price">판매가</label></td>
                    <td style="font-weight: bold;" id="td1"> <input type="number" id="p_price" name="p_price">&nbsp;&nbsp;&nbsp;
                        <label for="amount">수량</label>&nbsp;&nbsp;&nbsp;
                        <input type="number" id="p_stock" name="p_stock"></td>
                </tr>
                <!-- <tr>
                    <td id="td1" style="font-weight: bold;">상세 이미지</td>
                    <td id="td1"><input type="file" id="p_detail" name="p_detail" ></td>
                </tr> -->
                
                
                <tr>
                    <td id="td1"><label>상품 분류</label></td>
                    <td colspan="3" id="td1"> 
                    
                  	<select id="category" name="ctg_big" >
                  	<option value="" selected disabled hidden>대분류</option>
   					<c:forEach var="row" items="${list}">
       				 <option value="${row}">${row}</option>
    				</c:forEach>
						</select>

                        <select id="subcategory" name="ctg_small">
                           <option value="" selected disabled hidden>소분류</option>
                           <option value="small"></option>
                        </select>
                        <input type="checkbox" value="0" name="yes_no" id="yes_no" onclick='checkOnlyOne(this); look();' checked >없음
                <input type="checkbox" value="1" name="yes_no" id="yes_no" onclick='checkOnlyOne(this); look();'>있음
                    </td>
                </tr>
                
                <tr>
                <td>옵션</td>
                <td>
                <input type="text" placeholder="색상" name="O_name" id="O_name">
                <input type="number" placeholder="수량" name="O_amount" id="O_amount">
              <!--   <input type="hidden" id="o_id" name="o_id"> -->
              <button type="button" onclick="Preview()"  id="insert" disabled="disabled">추가</button>
              <button type="button" onclick="Delete()" id="delete" disabled="disabled">삭제</button>
              
                </td>
                
                </tr>
                <tr style="border-top: solid 1px gray;">
                    <br>
                    <td colspan="4" align="center">
                        <div id="preview" class="preview">
                            
                        </div>
                    </td>
                        
                </tr>
            </table>
        </div>
    </div>
    <br>
    <div style="text-align: center;">
        <button type="button" id="save" name="save" onclick="save_form()">확인</button>
        <button type="button">취소</button>
    </div>
    </form>
</div>
                </div> 
                <!----------------------------------------------내용 끝------------------------ -->


            <!-- Footer 시작 -->
            <!-- <footer class="sticky-footer bg-white">
                <div class="container my-auto">
                    <div class="copyright text-center my-auto">
                        <span>Copyright &copy; Your Website 2020</span>
                    </div>
                </div>
            </footer> -->
            <!-- Footer 끝 -->

           <!--  </div> -->
        </div>


    <a class="scroll-to-top rounded" href="#page-top">
        <i class="fas fa-angle-up"></i>
    </a>

    <!-- Bootstrap core JavaScript-->
    <script src="/resources/admin/vendor/jquery/jquery.min.js"></script>
    <script src="/resources/admin/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
    <!-- Core plugin JavaScript-->
    <script src="/resources/admin/vendor/jquery-easing/jquery.easing.min.js"></script>
    <!-- Custom scripts for all pages-->
    <script src="/resources/admin/js/sb-admin-2.min.js"></script>
</body>
<script>

document.getElementById('category').addEventListener('change', function() {
	 var Big = this.value;
	    // 선택된 대분류 값이 콘솔에 로그로 출력됩니다.
	     // 대분류 선택 값 로그 확인
	    // 만약 선택된 대분류 값이 비어 있지 않다면 아래 코드를 실행합니다.
	    if (Big !== '') {
        fetch('/admin/Small?ctg_big=' + Big) // 대분류 값 전달
            .then(response => response.json())
            .then(data => {//서버에서 받은 소분류 데이터 처리
            	 console.log('서버에서 받은 소분류 데이터:', data); // 소분류 데이터 확인
                const Dropdown = document.getElementById('subcategory');
                Dropdown.innerHTML = ''; // 기존 옵션을 모두 지움
                const Option = document.createElement('option');
                Option.value = '';
                Option.text = '소분류';
                Dropdown.add(Option);
                data.forEach(subcategory => {
                    const option = document.createElement('option');
                    option.value = subcategory;
                    option.text = subcategory;
                    Dropdown.add(option);
                });
            })
            .catch(error => console.error('Error:', error));
    } else {
        // 대분류가 선택되지 않은 경우 소분류를 초기화
        document.getElementById('subcategory').innerHTML = '<option value="" selected disabled hidden>소분류</option>';
    }
});

//let optionCounter = 1;
function Preview() {
    // 입력된 색상과 수량을 가져옵니다.
    const colorInput = document.getElementById("O_name");
    const amountInput = document.getElementById("O_amount");
    // 색상과 수량을 가져옵니다.
    const color = colorInput.value.trim();
    const amount = amountInput.value.trim(); // 공백만 제거하고 쉼표는 그대로 유지
	console.log('amount:'+amount);
    if(color==="" || amount ===""){
        alert("색상과 수량을 모두 입력해주세요.")
        return;
    }
    
    // 미리보기에 색상과 수량을 추가합니다.
    const previewDiv = document.getElementById("preview");
    const newItem = document.createElement("div");
    newItem.classList.add("preview-item");
    
    const colorSpan = document.createElement("span");
    colorSpan.textContent = color;
    console.log(color);
    colorSpan.classList.add("color-span");
    
    const amountSpan = document.createElement("span");
    amountSpan.textContent = amount + '개';
    console.log(amount);
    amountSpan.classList.add("amount-span");
    // 색상과 수량을 하나의 div 안에 추가합니다.
    newItem.appendChild(colorSpan);
    newItem.appendChild(amountSpan);

    const hiddenColor = document.createElement("input");
    hiddenColor.type="hidden";
    hiddenColor.name="o_name";
    hiddenColor.value=color;
    
    const hiddenAmount = document.createElement("input");
    hiddenAmount.type="hidden";
    hiddenAmount.name="o_amount";
    hiddenAmount.value=amount;
    
    newItem.appendChild(hiddenColor);
    newItem.appendChild(hiddenAmount);
    console.log('hiddenAmount:'+JSON.stringify(hiddenAmount));
    
    // 미리보기에 새로운 항목을 추가합니다.
    previewDiv.appendChild(newItem);

    // 입력 필드를 비웁니다.
    colorInput.value = "0";
    amountInput.value = "0";
}


function Delete() {
    // 삭제할 대상인 프리뷰 아이템을 선택합니다.
    const previewItem = document.querySelector(".preview-item");
    // 선택된 아이템이 있다면 삭제합니다.
    if (previewItem) {
        previewItem.remove();
    }
}

document.getElementById('save').addEventListener('click', function() {
    var small = document.getElementById('subcategory').value;
    
    // 선택된 소분류 값을 서버로 전송
    fetch('/admin/insert'+small, {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json'
        },
        body: JSON.stringify({ ctg_small: small }) // 'small' 대신 'ctg_small'로 변경
    })
    .then(response => {
        // 서버 응답에 대한 처리
        if (response.ok) {
            return response.text(); // 텍스트 형태로 반환
        } else {
            throw new Error('서버 응답이 실패했습니다.');
        }
    })
    .then(data => {
        // 서버 응답을 받아 처리
        console.log('서버 응답:', data);
        // 여기서 추가적인 클라이언트 측 처리를 수행할 수 있습니다.
    })
    .catch(error => {
        // 오류 처리
        console.error('Error:', error);
    });
});


</script>

</html>