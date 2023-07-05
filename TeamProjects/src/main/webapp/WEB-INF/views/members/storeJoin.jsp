<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ include file="../includes/header.jsp"%>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
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



	
	<div class="sidebar2" id="sidebar-wrapper"
		style="float: left; width: 300px; height: 1150px;">

		
		<ul class="sidebar-nav">
			<li class="sidebar-brand"><a href="#">사업자 메뉴</a></li>
			<li><a  href="storejoinForm">사업장 등록</a></li>
			<li><a href="memberstoreView?loginId=${sessionScope.loginId}">내 사업장
					변경</a></li>
			<li><a href="storeProducts?loginId=${sessionScope.loginId}">사업장 물품관리</a></li>
		</ul>

	</div>



  <div class="maincontainer2"
	style="width: 1300px; height: 1000px; float: left; padding-left: 500px;">
      <div style="width:530px;">
         <div class="section-heading">
            <br>
            <h2>사업자 가게 등록</h2>
         </div>
      </div>


      <div class="contact-form" >




         <div class="row">
            <form id="contact" action="storeJoin" method="post">


               <div class="row">
                  <div class="col-lg-8 col-md-8 col-sm-8">

                     <label for="businessid">아이디</label> <input type="text"
                        class="form-control" name="bid" 
                       value="${sessionScope.loginId}" readonly="readonly">


                  </div>
                  <div class="col-lg-8 col-md-8 col-sm-8">

                     <label for="storename">가게명</label>
                     <input type="text" class="form-control" name="stname"
                       placeholder="가게이름 입력" required>

                  </div>

               
               </div>

            
               <div class="row">
                  <div class="col-lg-4 col-md-4 col-sm-4">

                     <label for="label">Label</label><span></span> <input type="text"
                        class="form-control" name="blabel" id="sample6_postcode"
                        placeholder="우편번호">

                  </div>


                  <div class="col-lg-4 col-md-4 col-sm-4">

                     <label for="findlabel">Find Label</label>
                      <input type="button" class="form-control" onclick="sample6_execDaumPostcode()" value="우편번호 찾기">

                  </div>

                  <div class="col-lg-8 col-md-8 col-sm-8">

                     <label for="inputaddress">Address</label> <input type="text"
                        class="form-control" name="baddr" id="sample6_address"
                        placeholder="주소">
                  </div>

                  <div class="col-lg-5 col-md-5 col-sm-5">

                     <label for="sample6_address">DetailAddress</label> <input
                        type="text" class="form-control" name="bdetailaddr"
                        id="sample6_detailAddress" placeholder="상세주소">

                  </div>
                  <div class="col-lg-3 col-md-3 col-sm-3">

                     <label for="sample6_address">Extra</label> <input type="text"
                        class="form-control" name="bextraAddr"
                        id="sample6_extraAddress" placeholder="참고항목">

                  </div>

               </div>

<div class="row">
		<div class="col-lg-4 col-md-sm-4">

			<label for="category">가게종류</label>
			 <input type="text" class="form-control"  id="inputcategory" name="stcategory">
		</div>
		<div class="col-lg-4 col-md-sm-4">
		<select id="selectcategory" class="form-control" style="margin-top: 35px;" >
		<option value="" selected="selected">--종류선택--</option>
		<option value="음식점">음식점</option>
		<option value="잡화점">잡화점</option>
		<option value="공구점">공구점</option>
		<option value="과일ㆍ야채ㆍ생선">과일ㆍ야채ㆍ생선</option>
		<option value="기타">기타</option>

		</select>
		</div>
		</div>

	<div class="row">
		<div class="col-lg-4 col-md-sm-4">

			<label for="area">지역</label>
			 <input type="text" class="form-control"  id="inputareaname" name="areaname">
		</div>
		<div class="col-lg-4 col-md-sm-4">
		<select id="selectarea" onchange="changeOption()" class="form-control" style="margin-top: 35px;">
		<option value="" selected="selected">--지역선택--</option>
		<option value="동구">동구</option>
		<option value="서구">서구</option>
		<option value="중구">중구</option>
		<option value="계양구">계양구</option>
		<option value="부평구">부평구</option>
		<option value="남동구">남동구</option>
		<option value="미추홀구">미추홀구</option>
		<option value="연수구">연수구</option>
		</select>
		</div>
		</div>
		
		<div class="row">
		<div class="col-lg-4 col-md-sm-4">
			<label for="market">시장</label>
			 <input name="marketname" type="text" class="form-control" id="inputmarket" >
			 </div>
			<div class="col-lg-4 col-md-sm-4">
			
		<select  id="selectmarket" class="form-control" style="margin-top: 35px;" >
	
		<option value="">--시장선택--</option>
		</select>
		</div>
		</div>


              

               <div class="row">
                  <div class="col-lg-2 col-md-2 col-sm-2">
                     <label>가게전화번호</label> 
                     <input type="text" class="form-control" name="pnum1" />
                  </div>

                  <div>
                     <label> </label>
                     <span class="form-control" style="border: none;">-</span>
                  </div>

                  <div class="col-lg-3 col-md-3 col-sm-3">
                     <label> &nbsp;</label> 
                     <input type="text" class="form-control" name="pnum2" />
                  </div>

                  <div>
                     <label>&nbsp;</label>
                     <span class="form-control" style="border: none;">-</span>
                  </div>

                  <div class="col-lg-3 col-md-3 col-sm-3">
                     <label>&nbsp; </label> 
                     <input type="text" class="form-control" name="pnum3" />
                  </div>
               </div>


                  <div class="col-lg-8 col-md-8 col-sm-8">

                     <input type="submit" class="filled-button"
                        value="입력완료">
                  
                  </div>
              
            </form>
         </div>

      </div>
   </div>







  





</body>
<script type="text/javascript">
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



 $(document).ready(function(){

	$("#selectmarket").change(function(){
    var inputmaketname=$("#selectmarket").val();  //selectmarket가 변경되면, 그값을 받음
    $("#inputmarket").val(inputmaketname);    //selectmarket의 값을 inputmarket의 val로 설정
		});

	$("#selectcategory").change(function(){
	    var inputcategory=$("#selectcategory").val();  //selectcategory가 변경되면, 그값을 받음
	    $("#inputcategory").val(inputcategory);    //selectcategory의 값을 inputcategory의 val로 설정
			});


	
 });
 


// % select option 바꾸기  %
function changeOption(){
var market1 = ["--남동구--","창대시장","모레네시장"];
var market2 = ["--미추홀구--","용현시장","신기시장"];
var areaname=$("#selectarea").val();   //지역 이름값 불러오기
var changemarket;                       //바꿀이름 저장소

$("#inputareaname").val(areaname);   //inputareaname에 지역 이름값을 넣어준다.

	if(areaname=="남동구"){
		changemarket=market1;
	}
	else if(areaname=="미추홀구"){
		changemarket=market2;
		}

$("#selectmarket").empty();   //바뀔떄마다 option의 추가된 값을 비워줘야 함으로

for (var i=0; i< changemarket.length; i++){                
	var option=$("<option>"+ changemarket[i]+"</option>");   
	$("#selectmarket").append(option);       //selectmarket에 option들을 append로 추가해준다.
	
}




};


</script>
