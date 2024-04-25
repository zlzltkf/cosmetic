<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<title>로그인 화면</title>
<script src="http://code.jquery.com/jquery-3.7.1.min.js"></script>
<script src="resources/assets/js/vendor/modernizr-2.8.3-respond-1.4.2.min.js"></script>
<meta name="description" content="">
<meta name="viewport" content="width=device-width, initial-scale=1">

<link rel="apple-touch-icon" href="apple-touch-icon.png">
<link rel="stylesheet" href="resources/assets/css/fonticons.css">
<link rel="stylesheet" href="resources/assets/css/slider-pro.css">
<link rel="stylesheet" href="resources/assets/css/stylesheet.css">
<link rel="stylesheet" href="resources/assets/css/font-awesome.min.css">
<link rel="stylesheet" href="resources/assets/css/bootstrap.min.css">


<!--For Plugins external css-->
<link rel="stylesheet" href="resources/assets/css/plugins.css" />
<!--Theme custom css -->
<link rel="stylesheet" href="resources/assets/css/style.css">
<!--Theme Responsive css-->
<link rel="stylesheet" href="resources/assets/css/responsive.css" />

<script>

    $(document).ready(function() {
        $("#loginBtn").click(function() {
            var userid = $("#userid").val();
            var passwd = $("#passwd").val();
            
            if (!userid || !passwd) {
            	$("#result").css("color","#EF8B47");
            	$("#result").text("아이디와 비밀번호를 입력하세요.");
                return; // 함수 종료
            }
			
            var data = {
                userid: userid,
                passwd: passwd
            };

            $.ajax({
                type: "POST",
                url: "/login",
                contentType: "application/json",
                data: JSON.stringify(data),
                success: function(response) {
                    // 서버에서 성공 응답을 받았을 때
                    if (response.success) {
                        // 로그인 성공 시 처리
                        window.location.href = "/";
                    } else {
                        // 로그인 실패 시 처리
                        $("#result").css("color","#F07878");
                    	 $("#result").text(response.message);
                    }
                }
            });
        });
    });
</script>
</head>
<body data-spy="scroll" data-target=".navbar-collapse">
	<!--[if lt IE 8]>
            <p class="browserupgrade">You are using an <strong>outdated</strong> browser. Please <a href="http://browsehappy.com/">upgrade your browser</a> to improve your experience.</p>
        <![endif]-->
	<div class='preloader'>
		<div class='loaded'>&nbsp;</div>
	</div>
	<header id="main_menu" class="header navbar-fixed-top">
		<div class="main_menu_bg">
			<div class="container">
				<div class="row">
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
									<a class="navbar-brand" href="/"> <img
										src="resources/assets/images/logo.png" />
									</a>
								</div>

								<!-- Collect the nav links, forms, and other content for toggling -->



								<div class="collapse navbar-collapse"
									id="bs-example-navbar-collapse-1">
									<ul class="nav navbar-nav navbar-right">
										<li><a href="aboutus.html">about us</a></li>
										<li class="dropdown"><a href="#" class="dropdown-toggle"
											data-toggle="dropdown" role="button" aria-haspopup="true">services</a>
											<ul class="dropdown-menu">
												<li><a href="service.html">service page</a></li>
												<li><a href="service1.html">service page two</a></li>
											</ul></li>
										<li class="dropdown"><a href="#" class="dropdown-toggle"
											data-toggle="dropdown" role="button" aria-haspopup="true">works</a>
											<ul class="dropdown-menu">
												<li><a href="work.html">work page</a></li>
												<li><a href="work1.html">work page Two</a></li>
											</ul></li>
										<li class="dropdown"><a href="#" class="dropdown-toggle"
											data-toggle="dropdown" role="button" aria-haspopup="true">blog</a>
											<ul class="dropdown-menu">
												<li><a href="blog.html">blog page</a></li>
												<li><a href="bloginner.html">singleblog page</a></li>
											</ul></li>
										<li><a href="login">로그인</a></li>
									</ul>
								</div>

							</div>
						</nav>
					</div>
				</div>

			</div>

		</div>
	</header>
	<!--End of header -->




	<!-- Contact Section -->
	<section id="contact" class="contactus margin-top-120">
		<div class="container">
			<div class="row">
				<div class="col-sm-12">
					<div class="main_contact sections">
						<div class="head_title text-center">
							<h1 style="line-height: 2.1;">로그인</h1>
						</div>
						<a href="page_join">회원가입</a>
						<div class="col-sm-6" style="float: left;">
							<img src="resources/assets/images/hh.jpg">
						</div>

						<div class="col-sm-6 col-xs-12" style="width: 33%; float: left;">
							<div class="single_contant_left margin-top-60">

								<form>

									<div class="form-group">
										<label style="text-align: left;">아이디</label> <input
											type="text" class="form-control" id="userid" name="userid"
											required="" placeholder="아이디를 입력해주세요.">
									</div>

									<div class="form-group">
										<label>비밀번호</label> <input type="password"
											class="form-control" id="passwd" name="passwd" required=""
											placeholder="비밀번호를 입력해주세요.">
									</div>
									<div></div>
									<div style="font-size:15px; font-weight: bold;" id="result"></div>
									&nbsp;
									<div class="">
										<input type="button" value="로그인" class="btn" id="loginBtn"
											style="min-width: 342px; height: 74px;">
									</div>
									
								</form>
							</div>
						</div>

					</div>
					<!-- End of messsage contant-->
				</div>
			</div>
		</div>
		<!-- End of row -->
		<!-- End of container -->

	</section>
	<!-- End of contact Section -->



	<!-- footer section -->
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
	</footer>



	<div class="scrollup">
		<a href="#"><i class="fa fa-chevron-up"></i></a>
	</div>

	<script src="resources/assets/js/vendor/jquery-1.11.2.min.js"></script>
	<script src="resources/assets/js/vendor/bootstrap.min.js"></script>
	<script src="resources/assets/js/jquery.easing.1.3.js"></script>
	<script src="resources/assets/js/plugins.js"></script>
	<script src="resources/assets/js/main.js"></script>

</body>
</html>
