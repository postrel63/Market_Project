<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../includes/header.jsp"%>

<body>





	<!-- Page Content -->
	<!-- <div class="page-heading contact-heading header-text">
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<div class="text-content">
						<h4>join us</h4>
						<h2>환영합니다!</h2>
					</div>
				</div>
			</div>
		</div>
	</div> -->




	<div class="container">
		<div class="col-md-12">
			<div class="section-heading" style="text-align: center">
				<br>
				<h2>회원가입</h2>
			</div>
		</div>


		<div class="contact-form" style="margin-left: 300px;">




			<div class="row">
				<form id="contact" action="memberJoin" method="post">


					<div class="row">
						<div class="col-lg-8 col-md-8 col-sm-8">

							<label for="inputMid">ID</label> <input type="text"
								class="form-control" name="mid" id="inputMid"
								placeholder="아이디 입력" pattern=".{4,8}" required title="4~8글자"><span
								id="idCheckMsg"></span>


						</div>
						<div class="col-lg-8 col-md-8 col-sm-8">

							<label for="inputMpassword">PW</label><span id="pwCheckMsg"></span>
							<input type="password" class="form-control" name="mpassword"
								id="inputMpassword" pattern=".{4,8}" required title="4~8글자"
								placeholder="비밀번호 입력" required>

						</div>

						<div class="col-lg-8 col-md-8 col-sm-8">

							<label for="checkPw">Check PW</label><span id="pwConfirmMsg"></span>
							<input type="password" class="form-control" name="reuserPwd"
								id="checkPw" placeholder="비밀번호 재입력" required>
							<div class="alert alert-success" id="success">비밀번호가 일치합니다.</div>
							<div class="alert alert-danger" id="danger">비밀번호가 일치하지
								않습니다.</div>

						</div>
					</div>

					<div class="row">
						<div class="col-lg-3 col-md-3 col-sm-3">

							<label>Name</label> <input name="mname" type="text" id="mname"
								class="form-control" placeholder="이름 입력" required>

						</div>

						<div class="col-lg-3 col-md-3 col-sm-3">

							<label>Birth</label> <input type="date" name="mbirth"
								class="form-control" required>

						</div>


						<div class="col-lg-2 col-md-2 col-sm-2">

							<label>성별</label> <select name="mgender" class="form-control">
								<option value="">--선택--</option>
								<option value="남자">남자</option>
								<option value="여자">여자</option>
							</select>

						</div>
					</div>
					<div class="row">
						<div class="col-lg-4 col-md-4 col-sm-4">

							<label for="name">Label</label><span></span> <input type="text"
								class="form-control" name="mlabel" id="sample6_postcode"
								placeholder="우편번호">

						</div>


						<div class="col-lg-4 col-md-4 col-sm-4">

							<label for="inputFirstName">Find Label</label> <input
								type="button" class="form-control"
								onclick="sample6_execDaumPostcode()" value="우편번호 찾기">

						</div>

						<div class="col-lg-8 col-md-8 col-sm-8">

							<label for="sample6_address">Address</label> <input type="text"
								class="form-control" name="maddr" id="sample6_address"
								placeholder="주소">
						</div>

						<div class="col-lg-5 col-md-5 col-sm-5">

							<label for="sample6_address">DetailAddress</label> <input
								type="text" class="form-control" name="medetailAddress"
								id="sample6_detailAddress" placeholder="상세주소">

						</div>
						<div class="col-lg-3 col-md-3 col-sm-3">

							<label for="sample6_address">Extra</label> <input type="text"
								class="form-control" name="mextraAddress"
								id="sample6_extraAddress" placeholder="참고항목">

						</div>

					</div>




					<div class="row">
						<div class="col-lg-3 col-md-3 col-sm-3">

							<label for="name">EMail</label><span id="inputM"></span> <input
								type="text" class="form-control form-control-user"
								name="memailId" placeholder="이메일 입력">
						</div>

						<div>

							<label for=""></label> <span class="form-control"
								style="border: none;">@</span>

						</div>

						<div class="col-lg-3 col-md-3 col-sm-3">

							<label for="inputMemailDomain">Domain</label> <input type="text"
								class="form-control form-control-user" name="memailDomain"
								id="inputMemailDomain" placeholder="도메인 입력">

						</div>

						<div class="col-lg-2 col-md-2 col-sm-2">

							<label for="domainSel"></label> <select id="domainSel"
								class="form-control">
								<option value="">직접 입력</option>
								<option value="naver.com">naver.com</option>
								<option value="daum.net">daum.net</option>
								<option value="gmail.com">gmail.com</option>
							</select>

						</div>
					</div>

					<div class="row">
						<div class="col-lg-2 col-md-2 col-sm-2">
							<label>Phone</label> <input type="text" class="form-control"
								name="pnum1" />
						</div>

						<div>
							<label> </label><span class="form-control" style="border: none;">-</span>
						</div>

						<div class="col-lg-3 col-md-3 col-sm-3">
							<label> </label> <input type="text" class="form-control"
								name="pnum2" />
						</div>

						<div>
							<label></label><span class="form-control" style="border: none;">-</span>
						</div>

						<div class="col-lg-3 col-md-3 col-sm-3">
							<label> </label> <input type="text" class="form-control"
								name="pnum3" />
						</div>
					</div>

					<div class="row">
						<div class="col-lg-4 col-md-4 col-sm-4">
							<label>일반회원</label><input name="mclass" type="checkbox"
								value="00" onclick="doOpenCheck(this);">
						</div>

						<div class="col-lg-4 col-md-4 col-sm-4">
							<label>사업자회원</label><input name="mclass" type="checkbox"
								value="11" onclick="doOpenCheck(this);">
						</div>
					</div>





					<div class="row">
						<div class="col-lg-4 col-md-4 col-sm-4">
							<button type="submit" class="filled-button" id="inputBtn" style="width: 250px;">입력완료</button>
						</div>
						<div class="col-lg-4 col-md-4 col-sm-4">
							<input type="reset" value="취소">
						</div>
					</div>
				</form>




			</div>

		</div>
	</div>







	<!-- Additional Scripts -->
	<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
	<script src="/resources/js/custom.js"></script>
	<script src="/resources/js/owl.js"></script>
	<script src="/resources/js/slick.js"></script>
	<script src="/resources/js/isotope.js"></script>
	<script
		src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>





</body>
<script type="text/javascript">
	$(function() {
		$("#inputBtn").click(function() {
			var mid = $("#inputMid").val();
			var mpw = $("#inputMpassword").val();
			var mname = $("#mname").val();
			alert("id:" + mid + "pw:" + mpw + "name:" + mname);
		});
	});
</script>

<script type="text/javascript">
	$(document).ready(
			function() {
				/* 이메일 도메인선택 */
				$("#domainSel").change(function() {
					var domain = $("#domainSel").val();

					$("#inputMemailDomain").val(domain);

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

				/* 일반 아이디 중복 확인*/

				$("#inputMid").keyup(
						function() {
							var inputMid = $("#inputMid").val();
							$.ajax({
								type : "post",
								url : "idCheck",
								data : {
									"inputMid" : inputMid
								},
								dataType : "text",
								success : function(result) {
									console.log("result@@" + result);
									if (result == "OK") {
										$("#idCheckMsg").css("color", "green")
												.text("사용가능한 아이디");
									} else {
										$("#idCheckMsg").css("color", "red")
												.text("사용 불가능한 아이디");
									}

								},
								error : function() {
									alert("idcheck 연결 실패")
								}

							});

						});

			});
	/* 우편번호 */

	function sample6_execDaumPostcode() {
		new daum.Postcode(
				{
					oncomplete : function(data) {
						// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

						// 각 주소의 노출 규칙에 따라 주소를 조합한다.
						// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
						var addr = ''; // 주소 변수
						var extraAddr = ''; // 참고항목 변수

						//사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
						if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
							addr = data.roadAddress;
						} else { // 사용자가 지번 주소를 선택했을 경우(J)
							addr = data.jibunAddress;
						}

						// 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
						if (data.userSelectedType === 'R') {
							// 법정동명이 있을 경우 추가한다. (법정리는 제외)
							// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
							if (data.bname !== ''
									&& /[동|로|가]$/g.test(data.bname)) {
								extraAddr += data.bname;
							}
							// 건물명이 있고, 공동주택일 경우 추가한다.
							if (data.buildingName !== ''
									&& data.apartment === 'Y') {
								extraAddr += (extraAddr !== '' ? ', '
										+ data.buildingName : data.buildingName);
							}
							// 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
							if (extraAddr !== '') {
								extraAddr = ' (' + extraAddr + ')';
							}
							// 조합된 참고항목을 해당 필드에 넣는다.
							document.getElementById("sample6_extraAddress").value = extraAddr;

						} else {
							document.getElementById("sample6_extraAddress").value = '';
						}

						// 우편번호와 주소 정보를 해당 필드에 넣는다.
						document.getElementById('sample6_postcode').value = data.zonecode;
						document.getElementById("sample6_address").value = addr;
						// 커서를 상세주소 필드로 이동한다.
						document.getElementById("sample6_detailAddress")
								.focus();
					}
				}).open();
	}
</script>

</html>