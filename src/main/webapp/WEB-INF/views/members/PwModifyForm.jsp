<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="../includes/header.jsp"%>
<style>
#sidebar-wrapper {
	background: #000;
	overflow-x: hidden;
	overflow-y: auto;
}

.sidebar-nav {
	width: 300px;
	margin: 0;
	padding: 0;
	list-style: none;
}

.sidebar-nav li {
	text-indent: 1.5em;
	line-height: 6.5em;
}

.sidebar-nav li a {
	display: block;
	text-decoration: none;
	color: #999;
}

.sidebar-nav li a:hover {
	color: #fff;
	background: rgba(255, 255, 255, 0.2);
}

.sidebar-nav>.sidebar-brand {
	font-size: 1.5em;
	line-height: 3em;
}

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
<body>




	<!-- Page Content -->
	<!-- <div class="page-heading contact-heading header-text">
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<div class="text-content">
						<h4>STOREVIEW</h4>
						<h2>환영합니다!</h2>
					</div>
				</div>
			</div>
		</div>
	</div> -->





	<div class="sidebar2" id="sidebar-wrapper"
		style="float: left; width: 300px; height: 900px;">

		<ul class="sidebar-nav">
			<li class="sidebar-brand"><a href="#">사이드 메뉴</a></li>
			<li><a href="memberView?mid=${sessionScope.loginId}">내정보/수정</a></li>
			<li><a href="PwModifyForm?mid=${sessionScope.loginId}">비밀번호
					변경</a></li>
			<li><a href="DeleteForm?mid=${sessionScope.loginId}">회원 탈퇴</a></li>
			<li><a href="MyListForm?mid=${sessionScope.loginId}">주문 목록</a></li>
		</ul>

	</div>






	<div class="maincontainer2"
		style="width: 1300px; height: 600px; float: left; padding-left: 300px;">
		<div class="col-md-12">
			<div class="section-heading">
				<br>
				<h1 style="text-align: center">비밀번호 변경</h1>
				<br>
			</div>
		</div>


		<div class="contact-form">





			<div style="width: 1200px;">


				<div style="width: 1000px; height: 400px; float: right;">
					<div
						style="width: 300px; height: 400px; float: left; margin-left: 80px;">

						<div id="formContent">
							<form action="PwUpdate" method="post" id="modifyForm">
								<br> <label for="mid">아이디</label> <input type="text"
									class="form-control" id="inputMid" name="mid"
									value="${sessionScope.loginId}" readonly="readonly" style="width: 400px;"> <label
									for="mpassword">현재 비밀번호</label> <input type="password"
									class="form-control" id="inputPw" name="inputPw" style="width: 400px;"> <label
									for="mpassword">변경할 비밀번호</label> <input type="password"
									class="form-control" name="mpassword" id="inputMpassword"
									pattern=".{4,12}" required title="4~12글자" placeholder="비밀번호 입력"
									style="width: 400px;" required> <label for="mpassword">비밀번호 확인</label> <input
									type="password" class="form-control" name="reuserPwd"
									id="checkPw" placeholder="비밀번호 재입력" style="width: 400px;" required>
								<div class="alert alert-success" id="success">비밀번호가 일치합니다.</div>
								<div class="alert alert-danger" id="danger">비밀번호가 일치하지
									않습니다.</div>
								<button class="btn btn-success" type="submit" id="sub"
									style="background-color: #2E2E2E; border-color: gray; width: 300px; height: 44px;">변경</button>
							</form>
							<br>
							<button class="cencle btn btn-danger" type="button"
								style="width: 300px; height: 44px;">취소</button>
							<br> <br>
						</div>

					</div>



				</div>








			</div>


		</div>
	</div>











</body>
<script type="text/javascript">
	$(document).ready(function() {
		// 취소
		$(".cencle").on("click", function() {

			location.href = "/";

		});

		$("#sub").on("click", function() {
			if ($("#inputPw").val() == "") {
				alert("비밀번호를 입력해주세요.");
				$("#inputPw").focus();
				return false;
			}
			var inputMid = $("#inputMid").val();
			var inputPw = $("#inputPw").val();
			var modifyForm = $("#modifyForm");

			$.ajax({
				url : "PwCheck",
				type : "post",
				data : {
					"inputMid" : inputMid,
					"inputPw" : inputPw
				},
				dataType : "text",
				success : function(data) {
					console.log("data:" + data);
					if (data == "NO") {
						alert("패스워드가 일치하지 않습니다.");
						return;
					} else {
						
					}

				}

			});

		});

		/*  비밀번호 확인  */
		$(function() {
			var checkPw = $("#checkPw").val();
			var mpassword = $("#inputMpassword").val();
			$("#success").hide();
			$("#danger").hide();

			$("input").keyup(function() {
				var pwd1 = $("#checkPw").val();
				var pwd2 = $("#inputMpassword").val();
				if (pwd1 != "" || pwd2 != "") {
					if (pwd1 == pwd2) {
						$("#success").show();
						$("#danger").hide();
						$("#form-submit").removeAttr("disabled");
					} else {
						$("#success").hide();
						$("#danger").show();
						$("#form-submit").attr("disabled", "disabled");
					}
				}
			});

		});

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

<%@ include file="../includes/footer.jsp"%>