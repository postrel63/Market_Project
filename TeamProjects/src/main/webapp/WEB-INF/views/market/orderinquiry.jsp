<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
   <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="../includes/header.jsp"%>


<style>

body,html{
height:100%;
}
.page-heading {
    padding: 120px 0px 60px 0px;
    
.section-heading {
    text-align: left;
    margin-bottom: 0px;
    border-bottom: 1px solid #eee;
}
.contact-form {
    margin-top: 50px!important;
    width: 100%;
    padding-right: 15px;
    padding-left: 15px;
    margin-right: auto;
    margin-left: auto;
}
label, span{
padding: 11px;
}
.contact-form input{
margin-bottom:10px;
}

.contact-form input[type=radio],input[type=checkbox]{
margin-bottom:10px;
height: 20px;
}




</style>
<body>

   <!-- Page Content -->
  <!--  <div class="page-heading contact-heading header-text">
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
      <div class="contact-form" >
        성공
      </div>
   </div>







   <!-- Additional Scripts -->
   <script src="/resources/js/custom.js"></script>
   <script src="/resources/js/owl.js"></script>
   <script src="/resources/js/slick.js"></script>
   <script src="/resources/js/isotope.js"></script>

   <script
      src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>





</body>
<script>
var storeMap='${storeView.staddress}';  // 지도 주소
var marketMap='${storeView.marketname}'; // 지도 출력 주소이름
var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
mapOption = {
    center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
    level: 3 // 지도의 확대 레벨
};  

//지도를 생성합니다    
var map = new kakao.maps.Map(mapContainer, mapOption); 

//주소-좌표 변환 객체를 생성합니다
var geocoder = new kakao.maps.services.Geocoder();

//주소로 좌표를 검색합니다
geocoder.addressSearch(storeMap, function(result, status) {

// 정상적으로 검색이 완료됐으면 
 if (status === kakao.maps.services.Status.OK) {

    var coords = new kakao.maps.LatLng(result[0].y, result[0].x);

    // 결과값으로 받은 위치를 마커로 표시합니다
    var marker = new kakao.maps.Marker({
        map: map,
        position: coords
    });

    // 인포윈도우로 장소에 대한 설명을 표시합니다
    var infowindow = new kakao.maps.InfoWindow({
        content: '<div style="width:150px;text-align:center;padding:6px 0;">'+marketMap+'</div>'
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
   function submitbutton(){

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
			console.log(prname+"::"+prcount+"::"+prprice);
			console.log("prcode" + prcode);


			output += "<li class='list-group-item d-flex justify-content-between lh-condensed'>";
			output += "<div>";
			output += "<h6 class='my-0'>"+prname+"</h6>";
			output += "<small class='text-muted'>"+prname+"</small>";
			output += "</div>";
			output += "<span class='text-muted'>"+sum+"원</span>";
			output +="</li>";
			
		}
		$("#cartArea").html(output);

	};

	/* 새로운 배송지 radio 버튼 */
        $("#newaddr").click(function(){
        console.log("newaddr()btn");
			$("#newreceiveName").prop("type","text");
			$("#newreceivePn").prop("type","text");
			$("#newaddressdiv").css("display","block");
			$("#sample6_postcode").prop("type","text");
			$("#postcodebtn").prop("type","button");
			$("#sample6_address").prop("type","text");
			$("#sample6_detailAddress").prop("type","text");
			$("#receiveName").css("display","none");
			$("#receivePn").css("display","none");
			$("#addressdiv").css("display","none");
            });

        /* 기존 배송지 radio 버튼 */
        $("#defaultaddr").click(function(){
        console.log("defaultaddr()btn");
			$("#newreceiveName").prop("type","hidden");
			$("#newreceivePn").prop("type","hidden");
			$("#newaddressdiv").css("display","none");
			$("#sample6_postcode").prop("type","hidden");
			$("#postcodebtn").prop("type","hidden");
			$("#sample6_address").prop("type","hidden");
			$("#sample6_detailAddress").prop("type","hidden");
			$("#receiveName").css("display","block");
			$("#receivePn").css("display","block");
			$("#addressdiv").css("display","block");
            });


	
   
</script>
</html>

<%@ include file="../includes/footer.jsp"%>
