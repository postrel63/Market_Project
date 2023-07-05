<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../includes/header.jsp"%>


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

<title>Sixteen Clothing - Contact Page</title>

<!-- Bootstrap core CSS -->
<link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<!--

TemplateMo 546 Sixteen Clothing

https://templatemo.com/tm-546-sixteen-clothing

-->

<!-- Additional CSS Files -->
<link rel="stylesheet" href="/resources/css/fontawesome.css">
<link rel="stylesheet" href="/resources/css/templatemo-sixteen.css">
<link rel="stylesheet" href="/resources/css/owl.css">
<style type="text/css">
#formContent {
	-webkit-border-radius: 10px 10px 10px 10px;
	border-radius: 10px 10px 10px 10px;
	background: #fff;
	padding: 30px;
	width: 200%;
	max-width: 450px;
	position: relative;
	padding: 0px;
	-webkit-box-shadow: 0 30px 60px 0 rgba(0, 0, 0, 0.3);
	box-shadow: 0 30px 60px 0 rgba(0, 0, 0, 0.3);
	text-align: center;
}

em {
	font-style: normal;
	color: #f33f3f;
}

.logo {
	color: black;
	text-transform: uppercase;
	font-size: 32px;
	font-weight: 700;
}
.contact-form input {
    font-size: 14px;
    width: 100%;
    height: 44px;
    display: inline-block;
    line-height: 42px;
    border: 1px solid #A4A4A4;
    border-radius: 0px;
    margin-bottom: 30px;
}
</style>
</head>

<body>

	<!-- Page Content -->
	<!-- <div class="page-heading contact-heading header-text">
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<div class="text-content">
						<h4>contact us</h4>
						<h2>let’s get in touch</h2>
					</div>
				</div>
			</div>
		</div>
	</div> -->




	<div class="container">
		<div class="col-md-12" style="margin-top: 30px">
			<div class="section-heading" style="text-align: center">
				<h2>로그인</h2>
			</div>
		</div>


		<div class="contact-form" style="margin-left: 350px;">

			<div class="row">
				<form id="contact" action="memberLogin" method="post">
					<div id="formContent">
						<div class="col-lg-12 col-md-12 col-sm-12">
							<a class="navbar-brand logo" href="/" style="font-weight: 600; margin: 30px;">
									시장 <em>가장</em>
								</a> <br> <span id="checkId"></span> <input type="text"
								class="form-control" name="mid" id="userId" placeholder="아이디 입력"
								required />
						</div>
						<div class="col-lg-12 col-md-12 col-sm-12">
							<span id="checkPwResult"></span> <input type="password"
								class="form-control" name="mpassword" placeholder="비밀번호 입력"
								required /> 
						</div>
						<div>
							<label>아이디 기억</label><input type="checkbox" id="idSaveCheck"
								style="height: 30px;">
						</div>

						<button style="height: 49px; width: 300px;" type="submit"
							class="filled-button">로그인</button>
						<br> <br> <a id="kakao-login-btn"></a>
						<hr>
						<a href="joginForm">회원가입</a> <br> <br>
					</div>
				</form>



			</div>



		</div>
	</div>




	<footer>
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<div class="inner-content">
						<p>
							Copyright &copy; 2020 Sixteen Clothing Co., Ltd. - Design: <a
								rel="nofollow noopener" href="https://templatemo.com"
								target="_blank">TemplateMo</a>
						</p>
					</div>
				</div>
			</div>
		</div>
	</footer>


	<!-- Bootstrap core JavaScript -->
	<script src="/resources/vendor/jquery/jquery.min.js"></script>
	<script src="/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>


	<!-- Additional Scripts -->
	<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
	<!-- 카카오 아이디 -->
	<script src="/resources/js/custom.js"></script>
	<script src="/resources/js/owl.js"></script>
	<script src="/resources/js/slick.js"></script>
	<script src="/resources/js/isotope.js"></script>
	<script src="/resources/js/accordions.js"></script>
	<script src="https://developers.kakao.com/sdk/js/kakao.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/js-cookie@rc/dist/js.cookie.min.js"></script>
	<!-- 아이디 기억 -->
</body>



<script>
	//카카오 로그인
	// SDK를 초기화 합니다. 사용할 앱의 JavaScript 키를 설정해 주세요.
	console.log("스크립트")
	Kakao.init('16e03ac6bf0832089a11af63a97c9604');
	// SDK 초기화 여부를 판단합니다.
	console.log(Kakao.isInitialized());
</script>

<script type="text/javascript">
	//아이디 기억
	$("#userId").val(Cookies.get('key'));
	if ($("#userId").val() != "") {
		$("#idSaveCheck").attr("checked", true);
	}

	$("#idSaveCheck").change(function() {
		if ($("#idSaveCheck").is(":checked")) {
			Cookies.set('key', $("#userId").val(), {
				expires : 7
			});
		} else {
			Cookies.remove('key');
		}
	});

	$("#userId").keyup(function() {
		if ($("#idSaveCheck").is(":checked")) {
			Cookies.set('key', $("#userId").val(), {
				expires : 7
			});
		}
	});
</script>

<script type="text/javascript">
	Kakao.Auth
			.createLoginButton({
				container : '#kakao-login-btn',
				size : "large",
				success : function(authObj) {
					Kakao.API
							.request({
								url : '/v2/user/me',
								success : function(res) {
									/* alert(JSON.stringify(res)); *///정보 메세지
									kakaoLogin(res);

								},
								fail : function(error) {
									alert('login success, but failed to request user information: '
											+ JSON.stringify(error))
								},
							})
				},
				fail : function(err) {
					alert('failed to login: ' + JSON.stringify(err))
				},
			})

	function kakaoLogin(info) {
		var kakaoInfo = {/* "mid" : info.id, */
			"memail" : info.kakao_account.email,
			"mid" : info.properties.nickname,
			"mfilename" : info.properties.profile_image
		};
		$.ajax({
			type : "get",
			async : false,
			contentType : "application/json; charset=UTF-8",
			url : "kakaoLogin",
			data : kakaoInfo,
			dataType : "text",
			success : function(result) {
				console.log("result:" + result);
				location.href = result;
			},
			error : function() {
				alert("연결실패");
			}
		});
	}

	Kakao.Auth.logout(function() {
		console.log(Kakao.Auth.getAccessToken());
	});
</script>

<script type="text/javascript">
	$(document).ready(function() { //가게 등록시 이름과함께 alert창 출력

		var msg = '${msg}';
		checkmsg(msg);

		function checkmsg(msg) {
			if (msg === '') {
				return;
			}else{
               alert(msg);
				}

		

		}
	});
</script>
</html>
