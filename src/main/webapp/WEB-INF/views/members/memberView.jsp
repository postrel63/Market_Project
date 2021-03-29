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
	max-width: 850px;
	position: relative;
	padding: 0px;
	-webkit-box-shadow: 0 30px 60px 0 rgba(0, 0, 0, 0.3);
	box-shadow: 0 30px 60px 0 rgba(0, 0, 0, 0.3);
	padding-left: 30px;
}
.badge-style{
	color: #fff;
    background-color: #009688;
}
</style>
<body>




	<!-- Page Content -->
	<!-- <div class="page-heading contact-heading header-text">
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<div class="text-content ">
						<h4>MEMBERVIEW</h4>
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
			<div class="section-heading" style="height: 50px;">
				<br>
				<h1 style="text-align: center">${memberDTO.mid}님의회원정보</h1>
			</div>
		</div>


		<div id="formContent" class="contact-form" style="margin-left: 80px">





			<div style="width: 1200px;">

				<div style="width: 1000px; height: 400px;">
					<div
						style="width: 300px; height: 400px; float: left; margin-right: 50px;">
						<br> <label for="mid">아이디</label> <input type="text"
							class="form-control" id="inputMid" value="${memberDTO.mid }"
							readonly="readonly"> <label for="mpassword">비밀번호</label>
						<input type="password" class="form-control" id="checkPw"
							value="${memberDTO.mpassword }" readonly="readonly"> <label
							for="mrank">회원등급</label> <input type="text" class="form-control"
							id="mrank" value="${memberDTO.mrank }" readonly="readonly">
						<label id="mbirthLabel" for="inputMbirth">생년월일</label> <a href="#"
							class="badge badge-style mr-3" id="mbirthUpdateBtn"
							onclick="mbirthUpdate()" style="background-color: #009688;">수정</a><input
							type="date" class="form-control" id="inputMbirth"
							value="${memberDTO.mbirth }" readonly="readonly">
					</div>

					<div style="width: 420px; height: 180px; float: left">

						<img alt="" src="${memberDTO.mfilename }"
							style="margin-top: 30px; width: 420px; height: 350px;">

						<form action="memberProfileUpload" method="post"
							enctype="multipart/form-data" id="profileUploadForm">
							<input type="hidden" name="mid" value="${memberDTO.mid }">

							<div style="float: right;">
								<label class="btn btn-primary btn-file"
									style="color: #009688; background-color: transparent; border-color: #ccc; margin-top: 7px;">파일추가<input
									type="file" name="mfile" id="mfile" style="display: none;">
								</label>
								<button class="btn btn-primary" type="submit"
									style="color: #009688; background-color: transparent; border-color: #ccc;"
									style="display: none;">확인</button>
							</div>
						</form>
					</div>
				</div>

				<div class="row">
					<div class="col-lg-8 col-md-8 col-sm-8">
						<br>
						<br> <label for="inputMemail" id="memailLabel">이메일</label> <a
							href="#" class="badge badge-style mr-3" id="memailUpdateBtn"
							onclick="memailUpdate()" style="background-color: #009688;">수정</a>
						<input type="text" class="form-control" id="inputMemail"
							value="${memberDTO.memail }" readonly="readonly">
					</div>
				</div>

				<div class="row">
					<div class="col-lg-8 col-md-8 col-sm-8">
						<label for="inputMaddress" id="maddressLabel">주소</label> <a
							href="#" class="badge badge-style mr-3" id="maddressUpdateBtn"
							onclick="maddressUpdate()" style="background-color: #009688;">수정</a>
						<input type="text" class="form-control" id="inputMaddress"
							value="${memberDTO.maddress }" readonly="readonly">
					</div>
				</div>


				<div class="row">
					<div class="col-lg-4 col-md-sm-4">
						<label for="inputMname" id="mnameLabel">이름</label> <a href="#"
							class="badge badge-style mr-3" id="mnameUpdateBtn"
							onclick="mnameUpdate()" style="background-color: #009688;">수정</a>
						<input type="text" class="form-control" id="inputMname"
							value="${memberDTO.mname }" readonly="readonly">
					</div>



					<div class="col-lg-4 col-md-sm-4">
						<label for="inputMphone" id="mphoneLabel">전화번호</label> <a href="#"
							class="badge badge-style mr-3" id="mphoneUpdateBtn"
							onclick="mphoneUpdate()" style="background-color: #009688;">수정</a>
						<input type="text" class="form-control" id="inputMphone"
							value="${memberDTO.mphone }" readonly="readonly">
					</div>
				</div>




			</div>


		</div>
	</div>











</body>
<script type="text/javascript">
	function memailUpdate() {
		console.log("memailUpdate() 실행");
		var output = "<a href='#' class='badge badge-style mr-3 memailUpdateCheck' onclick='memailUpdateCheck(true)'>확인</a>";
		output += "<a href='#' class='badge badge-style mr-3 memailUpdateCheck' onclick='memailUpdateCheck(false)'>취소</a>";

		$("#inputMemail").removeAttr("readonly");
		$("#memailLabel").after(output);
		$("#memailUpdateBtn").remove();
	}

	function memailUpdateCheck(check) {
		console.log("memailUpdateCheck() ::" + check);

		if (check) {
			var mid = '${memberDTO.mid }';
			var newMemail = $("#inputMemail").val();

			var memail = '${memberDTO.memail }';

			console.log(mid + ":::" + newMemail);
			/* ajax를 통한 update 수행 */
			$.ajax({
				type : "post",
				url : "memailUpdate",
				data : {
					"mid" : mid,
					"memail" : newMemail,
				},
				dataType : "text",
				success : function(updateResult) {
					if (updateResult == "OK") {
						alert("이메일 변경 성공");
					} else {
						alert("변경 실패");
						$("#inputMemail").val(memail);
					}

				},
				error : function() {
					alert("mphoneUpdate 연결 실패");
					$("#inputMemail").val(memail);
				}
			});
		}

		var output = " <a href='#' class='badge badge-style mr-3' id='memailUpdateBtn' onclick='memailUpdate()'>수정</a>";
		$("#inputMemail").attr("readonly", "readonly");
		$("#memailLabel").after(output);
		$(".memailUpdateCheck").remove();

	}

	function mphoneUpdate() {
		console.log("mphoneUpdate() 실행")
		var output = "<a href='#' class='badge badge-style mr-3 mphoneUpdateCheck' onclick='mphoneUpdateCheck(true)'>확인</a>";
		output += "<a href='#' class='badge badge-style mr-3 mphoneUpdateCheck' onclick='mphoneUpdateCheck(false)'>취소</a> <br>";

		$("#inputMphone").removeAttr("readonly");
		$("#mphoneLabel").after(output);
		$("#mphoneUpdateBtn").remove();
	}

	function mphoneUpdateCheck(check) {
		console.log("mphoneUpdateCheck() 실행::" + check);

		if (check) {
			var mid = '${memberDTO.mid }';
			var newMphone = $("#inputMphone").val();

			var mphone = '${memberDTO.mphone }';

			console.log(mid + ":::" + newMphone);
			/* ajax를 통한 update 수행 */
			$.ajax({
				type : "post",
				url : "mphoneUpdate",
				data : {
					"mid" : mid,
					"mphone" : newMphone,
				},
				dataType : "text",
				success : function(updateResult) {
					if (updateResult == "OK") {
						alert("전화번호 변경 성공");
					} else {
						alert("변경 실패");
						$("#inputMphone").val(mphone);
					}

				},
				error : function() {
					alert("mphoneUpdate 연결 실패");
					$("#inputMphone").val(mphone);
				}
			});
		}

		var output = " <a href='#' class='badge badge-style mr-3' id='mphoneUpdateBtn' onclick='mphoneUpdate()'>수정</a>";
		$("#inputMphone").attr("readonly", "readonly");
		$("#mphoneLabel").after(output);
		$(".mphoneUpdateCheck").remove();
	}

	function mnameUpdate() {
		console.log("mnameUpdate() 실행");
		var output = "<a href='#' class='badge badge-style mr-3 mnameUpdateCheck' onclick='mnameUpdateCheck(true)'>확인</a>";
		output += "<a href='#' class='badge badge-style mr-3 mnameUpdateCheck' onclick='mnameUpdateCheck(false)'>취소</a>";

		$("#inputMname").removeAttr("readonly");
		$("#mnameLabel").after(output);
		$("#mnameUpdateBtn").remove();
	}

	function mnameUpdateCheck(check) {
		console.log("mnameUpdateCheck() ::" + check);

		if (check) {
			var mid = '${memberDTO.mid }';
			var newMname = $("#inputMname").val();

			var memname = '${memberDTO.mname }';

			console.log(mid + ":::" + newMname);
			/* ajax를 통한 update 수행 */
			$.ajax({
				type : "post",
				url : "mnameUpdate",
				data : {
					"mid" : mid,
					"mname" : newMname,
				},
				dataType : "text",
				success : function(updateResult) {
					if (updateResult == "OK") {
						alert("이름 변경 성공");
					} else {
						alert("변경 실패");
						$("#inputMname").val(mname);
					}

				},
				error : function() {
					alert("mnameUpdate 연결 실패");
					$("#inputMname").val(mname);
				}
			});
		}

		var output = " <a href='#' class='badge badge-style mr-3' id='mnameUpdateBtn' onclick='mnameUpdate()'>수정</a>";
		$("#inputMname").attr("readonly", "readonly");
		$("#mnameLabel").after(output);
		$(".mnameUpdateCheck").remove();

	}

	function maddressUpdate() {
		console.log("maddressUpdate() 실행");
		var output = "<a href='#' class='badge badge-style mr-3 maddressUpdateCheck' onclick='maddressUpdateCheck(true)'>확인</a>";
		output += "<a href='#' class='badge badge-style mr-3 maddressUpdateCheck' onclick='maddressUpdateCheck(false)'>취소</a>";

		$("#inputMaddress").removeAttr("readonly");
		$("#maddressLabel").after(output);
		$("#maddressUpdateBtn").remove();
	}

	function maddressUpdateCheck(check) {
		console.log("maddressUpdateCheck() ::" + check);

		if (check) {
			var mid = '${memberDTO.mid }';
			var newMaddress = $("#inputMaddress").val();

			var maddress = '${memberDTO.maddress }';

			console.log(mid + ":::" + newMaddress);
			/* ajax를 통한 update 수행 */
			$.ajax({
				type : "post",
				url : "maddressUpdate",
				data : {
					"mid" : mid,
					"maddress" : newMaddress,
				},
				dataType : "text",
				success : function(updateResult) {
					if (updateResult == "OK") {
						alert("주소 변경 성공");
					} else {
						alert("변경 실패");
						$("#inputMaddress").val(maddress);
					}

				},
				error : function() {
					alert("maddressUpdate 연결 실패");
					$("#inputMaddress").val(maddress);
				}
			});
		}

		var output = " <a href='#' class='badge badge-style mr-3' id='maddressUpdateBtn' onclick='maddressUpdate()'>수정</a>";
		$("#inputMaddress").attr("readonly", "readonly");
		$("#maddressLabel").after(output);
		$(".maddressUpdateCheck").remove();

	}

	function mbirthUpdate() {
		console.log("mbirthUpdate() 실행");
		var output = "<a href='#' class='badge badge-style mr-3 mbirthUpdateCheck' onclick='mbirthUpdateCheck(true)'>확인</a>";
		output += "<a href='#' class='badge badge-style mr-3 mbirthUpdateCheck' onclick='mbirthUpdateCheck(false)'>취소</a>";

		$("#inputMbirth").removeAttr("readonly");
		$("#mbirthLabel").after(output);
		$("#mbirthUpdateBtn").remove();
	}

	function mbirthUpdateCheck(check) {
		console.log("mbirthUpdateCheck() ::" + check);

		if (check) {
			var mid = '${memberDTO.mid }';
			var newMbirth = $("#inputMbirth").val();

			var mbirth = '${memberDTO.mbirth }';

			console.log(mid + ":::" + newMbirth);
			/* ajax를 통한 update 수행 */
			$.ajax({
				type : "post",
				url : "mbirthUpdate",
				data : {
					"mid" : mid,
					"mbirth" : newMbirth,
				},
				dataType : "text",
				success : function(updateResult) {
					if (updateResult == "OK") {
						alert("생일 변경 성공");
					} else {
						alert("변경 실패");
						$("#inputMbirth").val(mbirth);
					}

				},
				error : function() {
					alert("mbirthUpdate 연결 실패");
					$("#inputMbirth").val(mbirth);
				}
			});
		}

		var output = " <a href='#' class='badge badge-style mr-3' id='mbirthUpdateBtn' onclick='mbirthUpdate()'>수정</a>";
		$("#inputMbirth").attr("readonly", "readonly");
		$("#mbirthLabel").after(output);
		$(".mbirthUpdateCheck").remove();

	}
</script>
<%@ include file="../includes/footer.jsp"%>