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

.col-md-6 {
    width: 50%; /* 또는 원하는 너비로 조정 */
}
}
</style>

<script>
function previewImage(event) {
    var reader = new FileReader();
    reader.onload = function () {
        var output = document.getElementById('imagePreview');
        output.innerHTML = '<img src="' + reader.result + '" style="width: 300px; height: 300px;">';
    };
    reader.readAsDataURL(event.target.files[0]);
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
                    <i class="fas fa-laugh-wink"></i>
                </div>
                <div class="sidebar-brand-text mx-3">SB Admin <sup>2</sup></div>
            </a>

            <!-- Divider -->
            <hr class="sidebar-divider my-0">

            <!-- Nav Item - Dashboard -->
            <li class="nav-item">
                <a class="nav-link" href="index.html">
                    <i class="fas fa-fw fa-tachometer-alt"></i>
                    <span>Dashboard</span></a>
            </li>

            <!-- Divider -->
            <hr class="sidebar-divider">

       

            <!-- Nav Item - Pages Collapse Menu -->
            <li class="nav-item active">
                <a class="nav-link" href="#" data-toggle="collapse" data-target="#collapseTwo" aria-expanded="true"
                    aria-controls="collapseTwo">
                    <i class="fas fa-fw fa-cog"></i>
                    <span>고객관리</span>
                </a>
                <div id="collapseTwo" class="collapse show" aria-labelledby="headingTwo"
                    data-parent="#accordionSidebar">
                    <div class="bg-white py-2 collapse-inner rounded">
                        <a class="collapse-item" href="buttons.html">고객목록</a>
                        <a class="collapse-item active" href="cards.html">고객</a>
                    </div>
                </div>
            </li>

          
            <li class="nav-item">
                <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapsePages"
                    aria-expanded="true" aria-controls="collapsePages">
                    <i class="fas fa-fw fa-folder"></i>
                    <span>상품관리</span>
                </a>
                <div id="collapsePages" class="collapse" aria-labelledby="headingPages" data-parent="#accordionSidebar">
                    <div class="bg-white py-2 collapse-inner rounded">
                        <a class="collapse-item" href="/admin/write_product">상품등록</a>
                        <a class="collapse-item" href="register.html">상품목록</a>
                        <div class="collapse-divider"></div>
                       
                    </div>
                </div>
            </li>

            <!-- Nav Item - Charts -->
            <li class="nav-item">
                <a class="nav-link" href="charts.html">
                    <i class="fas fa-fw fa-chart-area"></i>
                    <span>Charts</span></a>
            </li>

            <!-- Nav Item - Tables -->
            <li class="nav-item">
                <a class="nav-link" href="tables.html">
                    <i class="fas fa-fw fa-table"></i>
                    <span>Tables</span></a>
            </li>

            <!-- Divider -->
            <hr class="sidebar-divider d-none d-md-block">

            <!-- Sidebar Toggler (Sidebar) -->
            <div class="text-center d-none d-md-inline">
                <button class="rounded-circle border-0" id="sidebarToggle"></button>
            </div>

        </ul>
        <!-- End of Sidebar -->

        <!-- Content Wrapper -->
        <div id="content-wrapper" class="d-flex flex-column">

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
                <tr>
                    <td id="td1" style="font-weight: bold;">상세 이미지</td>
                    <td id="td1"><input type="file" id="p_detail" name="p_detail" ></td>
                </tr>
                
                
                <tr>
                    <td id="td1"><label for="category">상품 분류</label></td>
                    <td colspan="3" id="td1">
                    
                  	<select id="category">
   					<c:forEach var="row" items="${list}">
       				 <option value="${row}">${row}</option>
    				</c:forEach>
						</select>

                        <select id="subcategory">
                            <option value="의류">소분류</option>
                            <option value="전자제품">전자제품</option>
                        </select>
                        <input type="checkbox" value="0" name="checkbox1">없음
                <input type="checkbox" value="1" name="checkbox2">있음
                    </td>
                </tr>
                
                <tr>
                <td>옵션</td>
                <td>
                <input type="text" placeholder="색상">
              <button type="button">추가</button>
                </td>
                
                </tr>
                <tr style="border-top: solid 1px gray;">
                    <br>
                    <td colspan="4" align="center">
                        <div id="preview-area">
                            미리보기
                        </div>
                    </td>
                        
                </tr>
            </table>
        </div>
    </div>
    <br>
    <div style="text-align: center;">
        <button type="button">확인</button>
        <button type="button">취소</button>
    </div>
</div>
                </div> 
                <!----------------------------------------------내용 끝------------------------ -->


            <!-- Footer 시작 -->
            <footer class="sticky-footer bg-white">
                <div class="container my-auto">
                    <div class="copyright text-center my-auto">
                        <span>Copyright &copy; Your Website 2020</span>
                    </div>
                </div>
            </footer>
            <!-- Footer 끝 -->

            </div>
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

</html>