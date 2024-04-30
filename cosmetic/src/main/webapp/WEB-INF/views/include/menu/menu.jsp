<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<header id="main_menu" class="header navbar-fixed-top">            
<script src="http://code.jquery.com/jquery-3.7.1.min.js"></script>
            <div class="main_menu_bg">
                <div class="container">
                <br>
                    <div class="row">
                    <div>
                    	<c:choose>
                    		<c:when test="${sessionScope.userid != null}">
                    				<a href="#" style="float: right; font-size: small; color: gray;">&nbsp;고객센터 &nbsp;</a>
                    				<a href="#" style="float: right; font-size: small; color: gray;">&nbsp;주문배송 |&nbsp;</a>
                    				<a href="#" style="float: right; font-size: small; color: gray;">&nbsp;장바구니 |&nbsp;</a>
                    				<a href="#" style="float: right; font-size: small; color: gray;">&nbsp;마이페이지 |&nbsp;</a>
                    			 	<a href="/member/logout" style="float: right; font-size: small; color: gray;">&nbsp;로그아웃 |&nbsp;</a><!--여기가 첫번째  -->
                    				<span style="float: right; font-size: small; color: black;">${sessionScope.userid}님 환영합니다&nbsp;</span>
                    	</c:when>
                    			<c:otherwise>
                    				<a href="#" style="float: right; font-size: small; color: gray;">&nbsp;고객센터&nbsp;</a>
                    				<a href="#" style="float: right; font-size: small; color: gray;">&nbsp;주문배송 |&nbsp;</a>
                    				<a href="#" style="float: right; font-size: small; color: gray;">&nbsp;장바구니 |&nbsp;</a>
                    				<a href="/member/page_join" style="float: right; font-size: small; color: gray;">&nbsp;회원가입 |&nbsp;</a>
                    				<a href="/member/page_login" style="float: right; font-size: small; color: gray;">&nbsp;로그인 |&nbsp;</a>
                    			</c:otherwise>
                    	</c:choose>
                    
                    </div>
                        <div class="nave_menu">
                            <nav class="navbar navbar-default" id="navmenu">
                                <div class="container-fluid">
                                    <!-- Brand and toggle get grouped for better mobile display -->
                                    <div class="navbar-header">
                                        <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
                                            <span class="sr-only">Toggle navigation</span>
                                            <span class="icon-bar"></span>
                                            <span class="icon-bar"></span>
                                            <span class="icon-bar"></span>
                                        </button>
                                        <a class="navbar-brand-logo" href="/">
                                            <img src="/resources/assets/images/logo_eden.png" style="max-width: 150px; max-height: 150px;"/>
                                        </a>
                                    </div>
<style>
.navbar-brand-logo {
position: absolute;
bottom: 1px;
left: 1px;
}
</style>
                                    <!-- Collect the nav links, forms, and other content for toggling -->



                                    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                                        <ul class="nav navbar-nav navbar-right">
                                        	<li><a href="#" id="ctg_btn">카테고리</a></li>
                                            <li><a href="aboutus.html">about us</a></li>
                                            <li class="dropdown"><a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true">services</a>
                                                <ul class="dropdown-menu">
                                                    <li><a href="/product/detail">service page</a></li>
                                                    <li><a href="service1.html">service page two</a></li>
                                                </ul>
                                            </li>
                                            <li class="dropdown"><a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true">works</a>
                                                <ul class="dropdown-menu">
                                                    <li><a href="work.html">work page</a></li>
                                                    <li><a href="work1.html">work page Two</a></li>
                                                </ul>
                                            </li>
                                            <li class="dropdown"><a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true">blog</a>
                                                <ul class="dropdown-menu">
                                                    <li><a href="blog.html">blog page</a></li>
                                                    <li><a href="bloginner.html">singleblog page</a></li>
                                                </ul>
                                            </li>
                                        </ul>    
                                    </div>

                                </div>
                            </nav>
                        </div>	
                    </div>
					<%@ include file="category.jsp" %>
                </div>

            </div>
        </header> <!--End of header -->