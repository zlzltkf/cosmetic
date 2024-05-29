<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="en">

<head>
<script src="http://code.jquery.com/jquery-3.7.1.min.js"></script>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>사용자 목록</title>

<!-- Custom fonts for this template-->
<link href="/resources/admin/vendor/fontawesome-free/css/all.min.css"
	rel="stylesheet" type="text/css">
<link
	href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
	rel="stylesheet">

<!-- Custom styles for this template-->
<link href="/resources/admin/css/sb-admin-2.min.css" rel="stylesheet">
<style type="text/css">
.sorting sorting_asc {
	
}
</style>
</head>



<body id="page-top">

	<!-- Page Wrapper -->
	<div id="wrapper">

		<!-- Sidebar -->
		<ul
			class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion"
			id="accordionSidebar">

			<!-- Sidebar - Brand -->
			<a
				class="sidebar-brand d-flex align-items-center justify-content-center"
				href="/admin/admin">
				<div class="sidebar-brand-icon rotate-n-15"></div>
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

			<!-- Heading -->
			<!--  <div class="sidebar-heading">
                Interface
            </div> -->

			<!-- Nav Item - Pages Collapse Menu -->
			<li class="nav-item active"><a class="nav-link" href="#"
				data-toggle="collapse" data-target="#collapseTwo"
				aria-expanded="true" aria-controls="collapseTwo"> <i></i>
					<span>👤 고객관리</span>
			</a>
				<div id="collapseTwo" class="collapse" aria-labelledby="headingTwo"
					data-parent="#accordionSidebar">
					<div class="bg-white py-2 collapse-inner rounded">
						<a class="collapse-item" href="/admin/user_list">고객목록</a> <a
							class="collapse-item active" href="#">고객</a>
					</div>
				</div></li>


			<li class="nav-item"><a class="nav-link collapsed" href="#"
				data-toggle="collapse" data-target="#collapsePages"
				aria-expanded="true" aria-controls="collapsePages"> <i></i>
					<span>🛍︎ 상품관리</span>
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
			<li class="nav-item"><a class="nav-link"
				href="/admin/order_list"> <i></i> <span>📋 주문목록</span>
			</a></li>

			<li class="nav-item"><a class="nav-link" href="/"> <i></i>
					<span>🖱️ 사이트로 바로가기</span>
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
		<div id="content-wrapper" class="d-flex flex-column">

			<!-- Main Content -->
			<div id="content">

				<!-- Topbar -->
				<nav
					class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">

					<!-- Sidebar Toggle (Topbar) -->
					<button id="sidebarToggleTop"
						class="btn btn-link d-md-none rounded-circle mr-3">
						<i class="fa fa-bars"></i>
					</button>

					<!-- ------------------------------------Tob Bar 시작!------------------------------------ -->
					<ul class="navbar-nav ml-auto">
						<!-- Nav Item - User Information -->
						<li class="nav-item dropdown no-arrow"><a
							class="nav-link dropdown-toggle" href="#" id="userDropdown"
							role="button" data-toggle="dropdown" aria-haspopup="true"
							aria-expanded="false"> <span
								class="mr-2 d-none d-lg-inline text-gray-600 small">EDEN
									관리자</span> <img class="img-profile rounded-circle"
								src="/resources/admin/img/undraw_profile.svg">
						</a></li>
					</ul>
				</nav>
				<!---------------------------------------------Tob Bar 끝! ----------------------------------->

				<!-- ----------------------------------------- 내용 시작 --------------------------------->
				<div class="container-fluid">

					<!-- Page Heading -->
					<h1 class="h3 mb-2 text-gray-800">고객 목록</h1>

					<!-- DataTales Example -->
					<div class="card shadow mb-4">
						<div class="card-header py-3">
							<!-- <h6 class="m-0 font-weight-bold text-primary">DataTables
								Example</h6> -->
						</div>
						<div class="card-body">
							<div class="table-responsive">
								<div id="dataTable_wrapper"
									class="dataTables_wrapper dt-bootstrap4">
									<div class="row">
										<div class="col-sm-12 col-md-6">
											<div class="dataTables_length" id="dataTable_length">
												
											</div>
											<div>고객수 : ${count}명</div>
										</div>
										<form name="dateform" method="get" action="/admin/user_list">
											<div class="col-sm-12 col-md-6">
												<div class="input-group mb-3" style="width: 300px;">
													<input type="search" class="form-control form-control-sm"
														placeholder="이름, 아이디를 검색하세요..." id="search" name="searchKeyword">
													&nbsp;&nbsp;&nbsp;
													<div class="input-group-append">
														<button style="height: 32px;" class="btn btn-facebook"
															type="button" id="keyword">검색</button>
													</div>
												</div>
											</div>
										</form>

									</div>
									<div class="row">
										<div class="col-sm-12">
											<table class="table table-bordered dataTable" id="dataTable"
												width="100%" cellspacing="0" role="grid"
												aria-describedby="dataTable_info" style="width: 100%;">
												<thead>
													<tr role="row">
														<th class="sorting sorting_asc" tabindex="0"
															aria-controls="dataTable" rowspan="1" colspan="1"
															aria-sort="ascending"
															aria-label="Name: activate to sort column descending"
															style="width: 50px; text-align: center;">이름</th>
														<th class="sorting" tabindex="0" aria-controls="dataTable"
															rowspan="1" colspan="1"
															aria-label="Position: activate to sort column ascending"
															style="width: 50px; text-align: center;">아이디</th>
														<th class="sorting" tabindex="0" aria-controls="dataTable"
															rowspan="1" colspan="1"
															aria-label="Office: activate to sort column ascending"
															style="width: 50px; text-align: center;">닉네임</th>
														<th class="sorting" tabindex="0" aria-controls="dataTable"
															rowspan="1" colspan="1"
															aria-label="Age: activate to sort column ascending"
															style="width: 31px; text-align: center;">이메일</th>
														<th class="sorting" tabindex="0" aria-controls="dataTable"
															rowspan="1" colspan="1"
															aria-label="Start date: activate to sort column ascending"
															style="width: 50px; text-align: center;">생년월일</th>
														<th class="sorting" tabindex="0" aria-controls="dataTable"
															rowspan="1" colspan="1"
															aria-label="Start date: activate to sort column ascending"
															style="width: 50px; text-align: center;">휴대폰</th>
														<th class="sorting" tabindex="0" aria-controls="dataTable"
															rowspan="1" colspan="1"
															aria-label="Age: activate to sort column ascending"
															style="width: 31px; text-align: center;">주소</th>
														<th class="sorting" tabindex="0" aria-controls="dataTable"
															rowspan="1" colspan="1"
															aria-label="Salary: activate to sort column ascending"
															style="width: 31px; text-align: center;">Point</th>
														<th class="sorting" tabindex="0" aria-controls="dataTable"
															rowspan="1" colspan="1"
															aria-label="Salary: activate to sort column ascending"
															style="width: 67px; text-align: center;">가입일</th>

													</tr>
												</thead>

												<tbody>
													<c:forEach var="row" items="${list}">
														<tr class="odd">
															<td style="text-align: center;" class="sorting_1"><a
																href="/admin/user_detail?userid=${row.userid}">${row.name}</a><br>
																[${row.level}]</td>
															<td style="text-align: center;">${row.userid}</td>
															<td style="text-align: center;">${row.nickname}</td>
															<td style="text-align: center;">${row.zipcode}</td>
															<td style="text-align: center;">${row.birth}</td>
															<td style="text-align: center;">${row.phone}</td>
															<td style="text-align: center;">${row.address1}&nbsp;${row.address2}</td>
															<td style="text-align: center;">${row.point}</td>
															<td style="text-align: center;"><fmt:formatDate
																	value="${row.date}" pattern="yy.M.d" /></td>
														</tr>
													</c:forEach>
												</tbody>
											</table>
										</div>
									</div>
									<div class="row">
										<div class="col-sm-12 col-md-5">
											<div class="dataTables_info" id="dataTable_info"
												role="status" aria-live="polite"></div>
										</div>
										<div class="col-sm-12 col-md-7">
											<div class="dataTables_paginate paging_simple_numbers"
												id="dataTable_paginate">
												<ul class="pagination">
													<c:if test="${page_info.curPage > 1 }">
														<li class="paginate_button page-item previous"
															id="dataTable_previous"><a href='#'
															onclick="list('${page_info.curPage-1}')"
															aria-controls="dataTable" data-dt-idx="0" tabindex="0"
															class="page-link">Previous</a></li>
													</c:if>
													<!-- 페이지 숫자 -->
													<c:forEach var="num" begin="${page_info.blockStart}"
														end="${page_info.blockEnd}">
														<c:choose>
															<c:when test="${num == page_info.curPage}">
																<li class="paginate_button page-item active"><a
																	href="#" aria-controls="dataTable" data-dt-idx="1"
																	tabindex="0" class="page-link">${num}</a></li>
															</c:when>
															<c:otherwise>
																<li class="paginate_button page-item"><a href="#"
																	onclick="list('${num}')" aria-controls="dataTable"
																	data-dt-idx="1" tabindex="0" class="page-link">${num}</a>
																</li>
															</c:otherwise>
														</c:choose>
													</c:forEach>
													<c:if test="${page_info.curPage  <=  page_info.totPage}">
														<li class="paginate_button page-item next"
															id="dataTable_next"><a href="#"
															aria-controls="dataTable" data-dt-idx="7" tabindex="0"
															onclick="list('${page_info.totPage}')" class="page-link">Next</a></li>
													</c:if>
												</ul>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>

				</div>
				<!-- End of Main Content -->

				<!-- Footer 시작 -->
				<!-- <footer class="sticky-footer bg-white">
					<div class="container my-auto">
						<div class="copyright text-center my-auto">
							<span>Copyright &copy; Your Website 2020</span>
						</div>
					</div>
				</footer> -->
				<!-- Footer 끝 -->

			</div>
			<!-- End of Content Wrapper -->

		</div>
		<!-- End of Page Wrapper -->

		<!-- Scroll to Top Button-->
		<a class="scroll-to-top rounded" href="#page-top"> <i
			class="fas fa-angle-up"></i>
		</a>
		<!-- Bootstrap core JavaScript-->
		<script src="/resources/admin/vendor/jquery/jquery.min.js"></script>
		<script
			src="/resources/admin/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
		<!-- Core plugin JavaScript-->
		<script
			src="/resources/admin/vendor/jquery-easing/jquery.easing.min.js"></script>
		<!-- Custom scripts for all pages-->
		<script src="/resources/admin/js/sb-admin-2.min.js"></script>

		<!--선택 옵션에 따른 리스트-->
		
</body>
<script>
function list(page) {
    var urlS = "curPage=" + page;
    var searchKeyword = document.getElementById("search").value;
    console.log(searchKeyword);
    if (searchKeyword) {
        urlS += "&searchKeyword=" + encodeURIComponent(searchKeyword); // 검색어를 URL 인코딩
    }
    location.href = "/admin/user_list?" + urlS;
}

document.getElementById("keyword").addEventListener("click", function() {
    list(1); // 페이지를 1로 설정하여 검색 실행
});

	
</script>
</html>