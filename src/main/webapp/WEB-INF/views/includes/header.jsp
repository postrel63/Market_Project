<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<link
	href="https://fonts.googleapis.com/css?family=Poppins:100,200,300,400,500,600,700,800,900&display=swap"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.3.0/font/bootstrap-icons.css">


<title>Sixteen Clothing HTML Template</title>

<!-- Bootstrap core CSS -->
<link href="/resources/vendor/bootstrap/css/bootstrap.css"
	rel="stylesheet">
<link href="/resources/vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">
<!--
TemplateMo 546 Sixteen Clothing
https://templatemo.com/tm-546-sixteen-clothing
-->
<!-- Additional CSS Files -->
<link rel="stylesheet" href="/resources/css/fontawesome.css">
<link rel="stylesheet" href="/resources/css/templatemo-sixteen.css">
<link rel="stylesheet" href="/resources/css/owl.css">

<!-- $ is not defined 오류때문에 추가함 -->
<script type="text/javascript" src="/resources/vendor/jquery/jquery.js"></script>



<!-- 카카오 map API -->
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=e7830b4153524de86c208543f2183a4c&libraries=services"></script>
<!-- websocket -->

<!-- <script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.1.5/sockjs.min.js"></script>
-->
<!-- <script src="https://cdn.jsdelivr.net/npm/sockjs-client@1/dist/sockjs.min.js"></script>-->
 <script src="resources/js/sockjs.min.js"></script>

<style type="text/css">
@font-face {
      src : url("/resources/fonts/BMJUA_ttf.ttf"); 
      font-family: "jua" 
}
.font1 {   
    font-family: "jua";
    color: red;
}
</style>

</head>

<body>
<!-- 알림창 -->
<div id="socketAlert" style="display:none; position: fixed; right: 0px; bottom: 0px; z-index:1" class="alert alert-success " role="alert" ></div>

	<!-- Header -->
	<header class="">
		<nav class="navbar navbar-expand-lg">
			<div class="container">
				<a class="navbar-brand" href="/"><h2>
						시장 <em>가장</em>
					</h2></a>
				<button class="navbar-toggler" type="button" data-toggle="collapse"
					data-target="#navbarResponsive" aria-controls="navbarResponsive"
					aria-expanded="false" aria-label="Toggle navigation">
					<span class="navbar-toggler-icon"></span>
				</button>
				<div class="collapse navbar-collapse" id="navbarResponsive">
					<ul class="navbar-nav ml-auto">
					
					
							<li class="nav-item active"><a class="nav-link"
							href="/">메인페이지 <span class="sr-only">(current)</span>
						</a></li>
						<li class="nav-item"><a class="nav-link"
							href="cartView?mid=${sessionScope.loginId}"> 장바구니 </a></li>
						<li class="nav-item"><a class="nav-link" href="orderCheck">주문확인</a></li>
						<li class="nav-item"><a class="nav-link" href="boardList">게시글</a></li>
						

				

						<li class="nav-item"><c:choose>
								<c:when test="${sessionScope.loginId eq null }">
									<a class="nav-link" href="loginForm">로그인 <span
										class="sr-only">session: ${sessionScope.loginId}, 가게세션 : ${sessionScope.stcode}</span></a>
								</c:when>
								<c:otherwise>
									<ul class="navbar-nav mr-auto">
										<li class="nav-item dropdown"><a
											class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
											role="button" data-toggle="dropdown" aria-haspopup="true"
											aria-expanded="false"> 마이페이지 </a>
										
										
											<div class="dropdown-menu" aria-labelledby="navbarDropdown" id="changedrop">
												<a class="dropdown-item"
													href="memberView?mid=${sessionScope.loginId}">내정보/수정</a> <a
													class="dropdown-item"
													href="PwModifyForm?mid=${sessionScope.loginId}">비밀번호 변경</a>
												<a class="dropdown-item"
													href="DeleteForm?mid=${sessionScope.loginId}">회원 탈퇴</a> <a
													class="dropdown-item"
													href="MyListForm?mid=${sessionScope.loginId}">주문 목록</a>
												</div>
											</li>
											
											<li class="nav-item"><a class="nav-link"
											href="memberLogout">${sessionScope.loginId }님 로그아웃</a></li>
									</ul>
									
								</c:otherwise>
							</c:choose></li>

					</ul>
				</div>
			</div>
		</nav>
	</header>
	
	<div class="banner header-text">
      <div class="owl-banner owl-carousel">
        
        
        <div class="banner-item-03">
          <div class="text-content">
          <h2 class=font1 style="color: yellow;">역사, 전통, 문화가</h2>
           <h2 class=font1>공존하는 전통시장</h2>
          </div>
        </div>
        </div>
      </div>
    </div>
		
	
		

	