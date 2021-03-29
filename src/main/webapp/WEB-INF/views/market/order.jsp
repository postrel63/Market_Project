<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="../includes/header.jsp"%>


<style>
.section-heading {
	text-align: left;
	margin-bottom: 0px;
	border-bottom: 1px solid #eee;
}

.contact-form {
	margin-top: 50px !important;
	width: 100%;
	padding-right: 15px;
	padding-left: 15px;
	margin-right: auto;
	margin-left: auto;
}
.contact-form input{
margin-bottom: 0px;
}

div#accordionExample {
    margin-left: 0px;
}

button.btn.btn-link.btn-block.text-left {
    color: gray;
}

a.selecttag{
	padding-left: 0px;
}

/* label, span {
	padding: 11px;
}

.contact-form input {
	margin-bottom: 10px;
} */

/* .contact-form input[type=radio], input[type=checkbox] {
	margin-bottom: 10px;
	height: 20px;
} */
</style>
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
	


		<div class="contact-form">

			<div class="row">



				<!-- 에이젝스 장바구니 시작 -->
				<div class="col-md-4 order-md-2 mb-4">
					<h4 class="d-flex justify-content-between align-items-center mb-3">
						<span class="text-muted">구매 목록</span> <span
							class="badge badge-secondary badge-pill">3</span>
					</h4>
					<ul class="list-group mb-3">
						<li id="cartArea"></li>


						<li class="list-group-item d-flex justify-content-between"><h6
								class='my-0'>결제금액</h6> <span class='my-0'>${cartallprice}원</span></li>
					</ul>

					<form class="card p-2">
						<div class="input-group">
							<input type="text" class="form-control" placeholder="Promo code">
							<div class="input-group-append">
								<button type="submit" class="btn btn-secondary">쿠폰조회</button>
							</div>
						</div>
					</form>
				</div>
				<!-- 에이젝스 장바구니 끝 -->

 <div class="col-md-8 order-md-1">
          <h4 class="mb-3">Recipient Info</h4>
             <hr class="mb-4">
         <form id="paymentform" action="payment" method="post">
            <div class="row">
              <div class="col-md-6 mb-3">
           <!--     <label for="firstName">배송지선택</label> -->
           <ul class="nav">
			  <li class="nav-item">
			   <a class="nav-link  selecttag" href="javascript:void(0);"> <label for="defaultaddr" id="defaultaddrLabel" style="color:#007bff">기본배송지</label></a>
			     <input type="radio" class=" input-group" style="display: none;"
										name="selectaddr" id="defaultaddr" value="defaultaddr"
										placeholder="" checked> 
			  </li>
			  <li class="nav-item">
			    <a class="nav-link selecttag" href="javascript:void(0);"><label for="newaddr" id="newaddrLabel"  style="color:grey">새로운배송지</label></a>
			 <input type="radio" class="input-group" style="display: none"
										name="selectaddr" id="newaddr" 
										value="newaddr">
			  </li>
			</ul>
			<input type="text" style="display: none" name="stcode" value="${storeView.stcode}" />
              </div>
            </div>
           <div class="row">
              <div class="col-md-6 mb-3">
                <label for="firstName">수령인</label>
                <input type="hidden" class="form-control" name="receivename" id="newreceiveName" placeholder="" required>
                <input type="text" style="display: block" class="form-control" readonly="readonly" id="receiveName" placeholder="" value="${memberinfo.mname}" required>
                <div class="invalid-feedback">
                  Valid first name is required.
                </div>
              </div>
              
              <div class="col-md-6 mb-3">
                <label for="lastName">전화번호</label>
                <input type="hidden" class="form-control" name="receivepn" id="newreceivePn" placeholder="-를 제외하고 입력하세요" required> 
                <input type="text" style="display: block" readonly="readonly" class="form-control" id="receivePn" placeholder="" value="${memberinfo.mphone}" required>
                <div class="invalid-feedback">
                  Valid last name is required.
                </div>
              </div>
            </div>

            <div class="mb-3">
              <label for="address">주소</label>
              <input type="text" class="form-control" style="display: block" id="addressdiv" readonly="readonly" value="${memberinfo.maddress}" placeholder="1234 Main St" required>
              <div class="invalid-feedback">
                Please enter your shipping address.
              </div>
            </div>


            
              <div class="row" style="display: none" id="newaddressdiv">
            <div class="row">
              <div class="col-md-6 mb-3">
                <input type="hidden" class="form-control" name="receivepostcode" id="sample6_postcode" placeholder="" required>
                <div class="invalid-feedback">
                  Please select a valid country.
                </div>
              </div>
              
              <div class="col-md-6 mb-3">
                <input type="hidden" class="form-control" id="postcodebtn"
								onclick="sample6_execDaumPostcode()" value="우편번호 찾기">
                
                <div class="invalid-feedback">
                  Zip code required.
                </div>
              </div>
            </div>
            
            <div class="row">
              <div class="col-md-5 mb-3">
               <input type="hidden"
								class="form-control"
								name="receiveaddr" id="sample6_address" placeholder="" required> 
                <div class="invalid-feedback">
                  Please select a valid country.
                </div>
              </div>
              <div class="col-md-3 mb-3">
               <input type="hidden"
								class="form-control"
								name="mextraAddress" id="sample6_extraAddress"
								placeholder="참고항목">
                <div class="invalid-feedback">
                  Please provide a valid state.
                </div>
              </div>
              <div class="col-md-4 mb-3">
                <input type="hidden"
								class="form-control"
								name="receivedetailaddr" id="sample6_detailAddress"
								placeholder="상세 주소를 입력하세요" required>
                <div class="invalid-feedback">
                  Zip code required.
                </div>
              </div>
            </div>
              </div>
            
             <div class="mb-3">
              <label for="receivePn" >배송메모</label>
              <select class="form-control custom-select" name="ordermemo" id="ordermemo">
										<option value="안전배송 부탁드립니다.">부재 시 문 앞에 맡겨주세요</option>
										<option value="문 앞에 두고 노크해주세요">문 앞에 두고 노크해주세요</option>
										<option value="배송 전 연락 바랍니다">배송 전 연락 바랍니다</option>
										<option value="etc" class="etc">직접입력</option>
				</select>
             <input class="form-control" style="display: none"
										onkeyup="textarea(this)" name="ordermemo" id="etc_textarea"
										placeholder="최대 50자까지 입력 가능합니다.">
             
            </div>
            
            <script type="text/javascript">
							/* 배송 메모 창 보여줌 */
							$("#ordermemo").change(function() {
								var ordermemo = $("#ordermemo").val();
								if (ordermemo == 'etc') {
									$("#etc_textarea").css("display", "block");
								} else {
									$("#etc_textarea").css("display", "none");

								}
							});

							function textarea() {
								var memo = $("#etc_textarea").val();
								console.log(memo);

							}
						</script>
            
            
            
            
            
          
         
         <br>
            <h4 class="mb-3">Payment</h4>
   <hr class="mb-4">
             <div class="col-md-6 mb-3">
            <ul class="nav">
			  <li class="nav-item">
			   <a class="nav-link  selecttag" href="javascript:void(0);"> <label for="deli" id="delilabel" style="color:#007bff">배달</label></a>
			     <input type="radio" class=" input-group" style="display: none"
										value="deli" name="deliway"
										placeholder="" checked
										id="deli" placeholder="" checked> 
			  </li>
			  <li class="nav-item">
			    <a class="nav-link selecttag" href="javascript:void(0);"><label for="wrap" id="wraplabel" style="color:grey">현금수령(포장)</label></a>
			 <input type="radio" class="input-group" style="display: none"
										 value="packing" id="wrap"
										name="deliway" id="paymentmoney">
			  </li>
			  
			</ul>
			</div>
			 <div class="col-md-6 mb-3">
            <ul class="nav">
			  <li class="nav-item">
			   <a class="nav-link active selecttag" href="javascript:void(0);"> <label for="paymentcard" id="cardlabel" style="color:#007bff">카드결제</label></a>
			     <input type="radio" class=" input-group" style="display: none"
										 value="card" name="chway"
										id="paymentcard" placeholder="" checked> 
			  </li>
			  <li class="nav-item">
			    <a class="nav-link active selecttag" href="javascript:void(0);"><label for="paymentmoney" id="moneylabel" style="color:grey">현금결제</label></a>
			 <input type="radio" class="input-group" style="display: none"
										value="money" name="chway" id="paymentmoney">
			  </li>
			</ul>
			</div>
            
            
            
            
            
            <div class="row">
              <div class="col-md-6 mb-3">
              <label for="paymentinfo">카드 선택</label>
               <select class="form-control custom-select"
									name="selectcard" id="paymentinfo">
									<option value="하나BC">하나 BC</option>
									<option value="하나카드">하나카드</option>
									<option value="현대카드">현대카드</option>
									<option value="카카오뱅크">카카오뱅크</option>
									<option value="케이뱅크">케이뱅크</option>
									<option value="신한카드">신한카드</option>
									<option value="KB국민">KB 국민</option>
									<option value="전북카드">전북카드</option>
						</select>
              </div>
              <div class="col-md-6 mb-3">
                <label for="cc-number">카드 번호</label>
                <input type="text" class="form-control" id="cc-number" placeholder="" required>
                <div class="invalid-feedback">
                  필수 항목!
                </div>
              </div>
            </div>
            <div class="row">
              <div class="col-md-3 mb-3">
                <label for="cc-expiration">만료기간</label>
                <input type="text" class="form-control" id="cc-expiration" placeholder="" required>
                <div class="invalid-feedback">
                  Expiration date required
                </div>
              </div>
              <div class="col-md-3 mb-3">
                <label for="cc-cvv">CVV</label>
                <input type="text" class="form-control" id="cc-cvv" placeholder="" required>
                <div class="invalid-feedback">
                  Security code required
                </div>
              </div>
            </div>
            
            
               <!-- 사용약관 -->
            <div class="accordion" id="accordionExample">
			  <div class="card">
			    <div class="card-header" id="headingOne">
			      <h2 class="mb-0">
			        <button class="btn btn-link btn-block text-left" type="button" data-toggle="collapse" data-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
			          이용약관
			        </button>
			      </h2>
			    </div>
			
			    <div id="collapseOne" class="collapse" aria-labelledby="headingOne" overflow:scroll; data-parent="#accordionExample">
			      <div class="card-body">
			      <strong>제 1조 (목적)</strong><br>
			      이 약관은 시장가장이 제공하는 배달 서비스와 관련하여, 회사와 이용 고객간에 서비스의 이용조건 및 절차, 회사와 회원간의 권리,의무 및 기타 필요한 사항을 규정함을 목적으로 합니다,
			      본 약관은 PC통신, 스마트폰(안드로이드폰,아이폰 등) 앱 등을 이용하는 전자상거래에 대해서도 그 성질에 반하지 않는 한 준용됩니다. 
			     
			      </div>
			    </div>
			  </div>
			  <div class="card">
			    <div class="card-header" id="headingTwo">
			      <h2 class="mb-0">
			        <button class="btn btn-link btn-block text-left collapsed" type="button" data-toggle="collapse" data-target="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
			         배달상품 주의사항
			        </button>
			      </h2>
			    </div>
			    <div id="collapseTwo" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionExample">
			      <div class="card-body">
			      1. 고객님의 주문에 따라 개별적으로 생산 또는 조리된 배달음식은 업주에게 회복할 수 없는  손해가 발생하므로 단순 변심에 의한 청약철회는 할 수 없습니다.<br>
			      2. 고객님과 수 차례 연락을 시도한 후 연락이 되지 않는 경우 배달음식이 변질되거나 부패될 우려로 식품위생법상 위반될 여지가 있어 별도로 보관하지 않으며, 재배달 또는 환불처리가 어려울 수 있습니다.
			      </div>
			    </div>
			  </div>
			  <div class="card">
			    <div class="card-header" id="headingThree">
			      <h2 class="mb-0">
			        <button class="btn btn-link btn-block text-left collapsed" type="button" data-toggle="collapse" data-target="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
			          개인정보 제 3자 제공
			        </button>
			      </h2>
			    </div>
			    <div id="collapseThree" class="collapse" aria-labelledby="headingThree" data-parent="#accordionExample">
			      <div class="card-body">
			     <strong>개인정보 제 3자 제공</strong><br>
			     시장가장은 원활한 서비스 제공을 위해 최소한의 범위 내에서 아래와 같이 제 3자에게 개인정보를 제공합니다. <br><br>
			     1. 제공받는 자: <strong>${storeView.stname}</strong> <br>
			     2. 제공받는 자의 개인정보 이용 목적: 주문 음식 제공 서비스 및 배달 서비스 제공<br>
			     3. 제공하는 개인정보 항목: 수령인 정보(주소,휴대전화번호)<br>
			     4. 제공받는 자의 보유기간 : 서비스 제공 완료 후 파기
			      </div>
			    </div>
			  </div>
			</div>
				<br>
            
            <div class="custom-control custom-checkbox">
              <input type="checkbox" class="custom-control-input" id="terms" >
              <label class="custom-control-label" for="terms" id="termslabel">위 내용에 모두 동의합니다.</label>
            </div>
           
            
            
            
            <hr class="mb-4">
            <button class="btn btn-primary btn-lg btn-block" type="submit" onclick="payment();return false;">주문하기</button>
          </form>
        </div>
      </div>

    </div>



	<!-- Additional Scripts -->
	<script src="/resources/js/custom.js"></script>
	<script src="/resources/js/owl.js"></script>
	<script src="/resources/js/slick.js"></script>
	<script src="/resources/js/isotope.js"></script>

	<script
		src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>




</div>
</body>
<script>
	var storeMap = '${storeView.staddress}'; // 지도 주소
	var marketMap = '${storeView.marketname}'; // 지도 출력 주소이름
	var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
	mapOption = {
		center : new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
		level : 3
	// 지도의 확대 레벨
	};

	//지도를 생성합니다    
	var map = new kakao.maps.Map(mapContainer, mapOption);

	//주소-좌표 변환 객체를 생성합니다
	var geocoder = new kakao.maps.services.Geocoder();

	//주소로 좌표를 검색합니다
	geocoder
			.addressSearch(
					storeMap,
					function(result, status) {

						// 정상적으로 검색이 완료됐으면 
						if (status === kakao.maps.services.Status.OK) {

							var coords = new kakao.maps.LatLng(result[0].y,
									result[0].x);

							// 결과값으로 받은 위치를 마커로 표시합니다
							var marker = new kakao.maps.Marker({
								map : map,
								position : coords
							});

							// 인포윈도우로 장소에 대한 설명을 표시합니다
							var infowindow = new kakao.maps.InfoWindow(
									{
										content : '<div style="width:150px;text-align:center;padding:6px 0;">'
												+ marketMap + '</div>'
									});
							infowindow.open(map, marker);

							// 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
							map.setCenter(coords);
						}
					});
</script>
<script type="text/javascript">
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

	/* 버튼 submit */
	function submitbutton() {

	}

	/* 페이지 실행 시 장바구니를 불러와 출력해주도록 만듬 */
	$(document).ready(function() {
		console.log("printcartList");
		printcartList();
	});

	// 카트 리스트 보여주기
	function printcartList() {
		console.log("printcartList");

		$.ajax({
			type : "post",
			url : "cartList",
			data : {},
			dataType : "json",
			success : function(result) {
				console.log("cartList result ::" + result);
				cartList(result);
			},
			error : function() {
				alert("연결실패");
			}
		});

	}
	// 카트 리스트 불러오는 함수  .html(output)이용
	function cartList(result) {
		console.log("cartList");
		var output = '';
		var loginId = '${sessionScope.loginId}';

		for ( var i in result) {
			var prname = result[i].prname;
			var prcount = result[i].prcount;
			var prcode = result[i].prcode;
			var prprice = result[i].prprice;
			var sum = prprice * prcount;
			console.log(prname + "::" + prcount + "::" + prprice);
			console.log("prcode" + prcode);

			output += "<li class='list-group-item d-flex justify-content-between lh-condensed'>";
			output += "<div>";
			output += "<h6 class='my-0'>" + prname + "</h6>";
			output += "<small class='text-muted'>" + prname + "</small>";
			output += "</div>";
			output += "<span class='text-muted'>" + sum + "원</span>";
			output += "</li>";

		}
		$("#cartArea").html(output);

	};

	/* 새로운 배송지 radio 버튼 */
	$("#newaddr").click(function() {
		console.log("newaddr()btn");
		$("#newreceiveName").prop("type", "text");
		$("#newreceivePn").prop("type", "text");
		$("#newaddressdiv").css("display", "block");
		$("#sample6_postcode").prop("type", "text");
		$("#postcodebtn").prop("type", "button");
		$("#sample6_address").prop("type", "text");
		$("#sample6_extraAddress").prop("type", "text");
		$("#sample6_detailAddress").prop("type", "text");
		$("#receiveName").css("display", "none");
		$("#receivePn").css("display", "none");
		$("#addressdiv").css("display", "none");
		$("#newaddrLabel").css("color","#007bff")
	//	$("#newaddr").prop('checked', true);
		$("#defaultaddrLabel").css("color","grey")
	//	$("#defaultaddr").prop('checked', false);
	
	});

	/* 기존 배송지 radio 버튼 */
	$("#defaultaddr").click(function() {
		console.log("defaultaddr()btn");
		$("#newreceiveName").prop("type", "hidden");
		$("#newreceivePn").prop("type", "hidden");
		$("#newaddressdiv").css("display", "none");
		$("#sample6_postcode").prop("type", "hidden");
		$("#postcodebtn").prop("type", "hidden");
		$("#sample6_address").prop("type", "hidden");
		$("#sample6_extraAddress").prop("type", "hidden");
		$("#sample6_detailAddress").prop("type", "hidden");
		$("#receiveName").css("display", "block");
		$("#receivePn").css("display", "block");
		$("#addressdiv").css("display", "block");
		$("#newreceiveName").val("");
		$("#newreceivePn").val("");
		$("#sample6_postcode").val("");
		$("#sample6_address").val("");
		$("#sample6_detailAddress").val("");
		$("#newaddrLabel").css("color","grey")
		//$("#newaddr").prop('checked', false);
		$("#defaultaddrLabel").css("color","#007bff")
		//$("#defaultaddr").prop('checked', true);
	});

	$("#deli").click(function() {
		console.log("delibtn")
		$("#delilabel").css("color","#007bff");
		$("#wraplabel").css("color","grey");

		});
		
	$("#wrap").click(function() {
		$("#delilabel").css("color","grey");
		$("#wraplabel").css("color","#007bff");
		});
	
	$("#paymentcard").click(function() {
		console.log("cardlabel")
		$("#cardlabel").css("color","#007bff");
		$("#moneylabel").css("color","grey");

		});
		
	$("#paymentmoney").click(function() {
		$("#cardlabel").css("color","grey");
		$("#moneylabel").css("color","#007bff");
			
			

		});
		
		
		



	
</script>
<script>
	/* 주문하기 버튼 누르면 주문할수있도록 주문 완료되면 주문완료 가져오기 */

	
	function payment(){
	
		if($("#terms").is(":checked") == false){
			alert("약관 동의가 필요합니다!")
			$("#termslabel").focus();
			return;
			}

					
		console.log("결제버튼1")
		var formData = $("#paymentform").serialize(); 
		console.log("결제버튼2")
		console.log(formData);
		
	$.ajax({
		cache : false,
		type : "post",
		url : "payment",
		data : 	formData,
		dataType : "json",
		success : function(result) {
			
			console.log(result);
			alert("주문 완료"+result);
		//주문 완료 후 소켓을 통해 주문정보를 전달해준다. (order(cmd),주문자,주문번호,주문 개수,가게코드, (order(cmd),mid,chcode,prallcount,stcode))
		for ( var i in result) {
		let socketMsg = "order"+","+result[i].mid+","+result[i].chcode+","+result[i].prallcount+","+result[i].stcode;
			console.log(socketMsg);
			socket.send(socketMsg)
			}
			 location.href='/'; 
			
		},
		error : function() {
			alert("연결실패");
		}
	});

	}
</script>

</html>

<%@ include file="../includes/footer.jsp"%>
