<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="../includes/header.jsp"%>
<style>
.modal-header2 {
    width: 500px;
    background-color: #f5f5f5;
    padding: 12px;
   
    
}

.basket-body {
    height: 200px;
}

</style>

<!-- 배민 css -->
<link rel="stylesheet" href="https://unpkg.com/bootstrap-material-design@4.1.1/dist/css/bootstrap-material-design.min.css" integrity="sha384-wXznGJNEXNG1NFsbm0ugrLFMQPWswR3lds2VeinahP8N0zJw9VWSopbjv2x7WCvX" crossorigin="anonymous">
    <script src="https://unpkg.com/popper.js@1.12.6/dist/umd/popper.js" integrity="sha384-fA23ZRQ3G/J53mElWqVJEGJzU0sTs+SvzG8fXVWP+kJQ1lwFAOkcUOysnlKJC33U" crossorigin="anonymous"></script>
    <script src="https://unpkg.com/bootstrap-material-design@4.1.1/dist/js/bootstrap-material-design.js" integrity="sha384-CauSuKpEqAFajSpkdjv3z9t8E7RlpJ1UP0lKM/+NdtSarroVKu069AlsRPKkFBz9" crossorigin="anonymous"></script>
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="/resources/css/item-page.css">
    <link rel="stylesheet" href="/resources/css/item-page-menu.css">
    

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=6f1afcc85dc2f39e1bf0bc6c4cef5802&libraries=services,clusterer,drawing"></script>



<div class="best-features about-features">
   <div class="container">
      <div class="row">
         
         <div class="col-md-6">
            <p class="item-title pblack">
               <strong>${storeView.stname}</strong>
            </p>
            <div class="right-image">
               <img src="/resources/storeimgfile/${storeView.stimage}" alt="" width="600px;"
                  height="458px;">
            </div>
         </div>
         <div class="col-md-6">


            <p class="item-title pblack">
               <strong>주소</strong>
            </p>
            <div class="right-image">
               <!-- 지도 div -->
               <div id="map" style="width: 500px; height: 300px;"></div>
            </div>

            <div class="item-card row">
               <div class="item-card-main">
                  
               </div>
               <div class="item-card-info">
                  <p class="item-title pblack">
                     <strong>${storeView.stname}</strong>
                  </p>
                  <p class="item-score">
                  <img src="/resources/storeimgfile/stars0.png" alt="" style="width:100px; height:20px;"  id="borankImg">
                    
                     <strong id="borank">4.6</strong> 최근리뷰 <span id="reviewcount"></span> |
                  가게 찜하기<img src="/resources/storeimgfile/binheart.png" alt="" style="width:30px; height:20px;" onclick="storeLike()" id="likeCondition">
                  <span id="likeCount"></span>
                  </p>
                 <p> ${storeView.stnote}</p>
               </div>
            </div>

         </div>




      </div>

   </div>
</div>

<hr>







<div  style="width: 1100px; margin:0 auto;">



   <div class="item-content-set01 row">
      <div class="item-main">



         <div class="item-list row">
            <div class="item-menu item-set01" style="width:550px;">메뉴</div>
           
            
         </div>
         
         
         <c:choose>
         <c:when test="${operateCheck eq 'OPEN'}">
         <div class="item-content" style="width:550px; ">
            <!-- 메뉴 리스트출력 -->
            <div class="list-group">
               <c:forEach var="productsView" items="${productsView}">
                  <a 
                     onclick="modalProducts('${productsView.prname}','${productsView.prprice}','${productsView.prcode}','${productsView.prnote}','${productsView.primage}')"
                     class="list-group-item list-group-item-action "
                     data-toggle="modal" data-target="#exampleModal">
                     ${productsView.prname}&nbsp;&nbsp;
                     <span class="pset01" >
                        ${productsView.prprice}원</span> 
                       
                       <span class="food-image-set"><img src="/resources/primgfile/${productsView.primage}" style="width:85px;  ">
                        </span>
                   </a>
               </c:forEach>


            </div>
         </div>
</c:when>

<c:otherwise>
 <div class="item-content" style="width:550px; padding:0px;" >
            <!-- 메뉴 리스트출력 -->
                <img src="/resources/images/product-ready.png" width="547px;">
           
         </div>

</c:otherwise>


</c:choose>


      </div>
     	<div class="item-side">
			<div class="basket">
				<div class="basket-header">
					<strong>장바구니</strong>
				</div>
				<div class="basket-body">
					<c:forEach var="cartView" items="${cartView}">
						<div class="list01">
							<div class="item-list-section item-list-section02" style="display:flex; flex-direction:row; align-items: center; ">
							<div class="col-lg-4">
							<p style="margin-bottom:0rem;">${cartView.prname }</p>
							</div>
							<div class="col-lg-7">
								<div class="btn-group item-count" role="group" style="left:0;"
									aria-label="Basic example">
									<button class="bt bt01 up" value="${cartView.prcode}" onclick="downcart(this.value)">-</button>
									<button class="bt bt-count" value="${cartView.prcode}" >${cartView.prcount }</button>
									<button class="bt bt02 down" value="${cartView.prcode}" onclick="upcart(this.value)">+</button>
								</div>
							</div>
							
							<div class="col-lg-1">
							<button type="button" class="close cartdel_${cartView.prcode}_btn" data-prnum="${cartView.prcode}" aria-label="Close" >
  									<span aria-hidden="true">&times;</span>
								</button>
							</div>
							
							</div>
						</div>
						<script>
						$(".cartdel_${cartView.prcode}_btn").click(function(){
							console.log("cartdel btn");

							   var delpr = $(".cartdel_${cartView.prcode}_btn").data("prnum");
							   console.log(delpr);
							    
							   $.ajax({
							    url : "cartdel",
							    type : "post",
							    data : { "prcode" : delpr },
							    
							    success : function(){
								    alert("삭제되었습니다.")
								    location.reload();
							    }
							   
							   });
							
							});

						function downcart(val){
						var prcode = val;
						console.log(prcode);

						   $.ajax({
							    url : "downcart",
							    type : "post",
							    data : { "prcode" : prcode },
							    datatype : "json",
							    success : function(){
								    location.reload();
							    }
							   
							   });

							}
						function upcart(val){
						var prcode = val;
						console.log(prcode);

						   $.ajax({
							    url : "upcart",
							    type : "post",
							    data : { "prcode" : prcode },
							    datatype : "json",
							    success : function(){
								    location.reload();
							    }
							   
							   });

							}



						
						</script>
					</c:forEach>
				</div>
				<div class="basket-sum">
					<p>
						<strong>합계 : ${cartallprice}원</strong>
					</p>
				</div>
				<div class="pay-btn">
					
						 <button type="button" class="badge badge-warning " onclick="payment()" style="width: 300px; height:50px; border:0px;background-color: #a2a2a2;"><span style="font-size:15px;">결제하기</span>
						</button>
				</div>
			</div>


		
		
		</div>







         <!-- Modal -->
         <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog"
            aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
               <div class="modal-content">
                  <div class="modal-header2" style="padding-bottom:7px;"  >
                    <strong class="modal-title" style="font-size:20px; "id="exampleModalLabel">${storeView.stname}</strong>
 <button type="button" class="close "
                        data-dismiss="modal" id="cancleModal" style="margin-left: 300px;">X</button>
                    </div>
                     <div class="modal-header2" style="padding-top:0px;">
                    <span class="badge badge badge-warning">#최소 주문 금액:10000원 </span>
                    <span class="badge badge badge-warning" style="margin-right:220px; background-color:rgb(58, 87, 173);">#배달 요금:무료 </span>
                </div>
                  <div class="modal-body" style="text-align: center;">

                     <img src="#" id="productModalimage" alt="" width="300px;"
                        height="250px;">
                     <div class="input-group input-group-sm mb-3" style="margin-top:50px;">
                     
                     <!-- 상품이름 출력-->   
               <div style="width: 450px; height:80px; " >
              <strong><span id="productsModalname" style="float:left; font-size:25px;" ></span>
              <span style="float:left; font-size:25px;"> - &#8361; </span><span  id="productsModalprice" style="float:left; font-size:25px;"></span>
              <span style="float:left; font-size:25px;">원</span></strong>

                     <!-- 상품가격 출력 -->      
                     <div class="input-group mb-3" >
                     <span id="productsModalnote" style="margin-top:10px;"></span>
                     </div>
                     </div>
                    
                           <input type="hidden" id="productsModalcode">
                        
                    
                  </div>
                     <div class="modal-body2" style="height:40px; margin-left: 68px; " >
                     
                   
                        <div class="btn-group item-count" role="group"
                           aria-label="Basic example" style="margin:0 auto;">
                           <button class="bt bt01 up" id="downbutton"><span style="font-size:20px;">-</span></button>
                            <input type="text" class="bt bt-count" value="0" id="countnum" style="width:30px;">
                           <button class="bt bt02 down"  id="upbutton">+</button>
                        </div>
</div>

               

                  <div class="modal-footer" style="padding-left:8px;">
                    
                     <button type="button" class="badge badge-warning " id="orderModal" style="width: 470px; height:50px; border:0px;"><span style="font-size:20px;"><i class="bi bi-cart"></i>장바구니 담기</span>
                        </button>
                  </div>
               </div>
             <div class="modal-header2" style="height:50px; ">
              <span class="badge badge-pill badge-warning" style="background-color:black;">#인천시장맛집 </span>
                    <span class="badge-pill badge badge-warning" style="margin-right:220px; background-color:black;">#우수가게 </span>
             </div>
            </div>
         </div>
         <!-- Modal End -->


   </div>
</div>
























<script>
var storeMap='${storeView.staddress}';  // 지도 주소
console.log("지도주소"+storeMap);
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

$(document).ready(function(){
	storeLikeCheck(); //좋아요 상태 확인
	storeLikeCount(); //좋아요 숫자 출력
	getborank();//평점 출력
	getreviewcount();//가게리뷰 카운팅
});


function getborank(){ //평점불러오기  소수점첫쨰자리
	var stcode='${storeView.stcode}';
	console.log("@@@@평점불러오기"+stcode);
	$.ajax({
	     type:"post",
	     url: "getborank",
	     data: {
	            "stcode":stcode
	         },
	     dataType:"text",
	     success:function(result){
	        
	            console.log("평점"+result);
	            inputborank(result);
	            $("#borank").text(result);
	         },
	     error:function(e){
	        
	         alert(e);
	         }   
	     

		
	});

	}
	
function inputborank(result){ //별점별 사진 변경
	console.log("borank"+inputborank);
	if(result>=4.5){
		 $("#borankImg").attr("src","/resources/storeimgfile/stars0.png");	
	}else if(result>=4){
		$("#borankImg").attr("src","/resources/storeimgfile/stars4.png");	
	}else if(result>=3){
		$("#borankImg").attr("src","/resources/storeimgfile/stars3.png");	
	}else if(result>=2){
		$("#borankImg").attr("src","/resources/storeimgfile/stars2.png");	
	}else if(result>=1){
		$("#borankImg").attr("src","/resources/storeimgfile/stars1.png");	
	}else if(result=0) {
		 $("#borankImg").attr("src","/resources/storeimgfile/stars0.png");	
		}

	}



function getreviewcount(){  //가게 리뷰 카운팅
	var stcode='${storeView.stcode}';
	console.log("@@@@리뷰불러오기"+stcode);
	$.ajax({
	     type:"post",
	     url: "getreviewcount",
	     data: {
	            "stcode":stcode
	         },
	     dataType:"text",
	     success:function(result){
	            $("#reviewcount").text(result);
	            console.log("리뷰갯수"+result);
	          
	         },
	     error:function(e){
	        
	         alert(e);
	         } 
	});  
	
}


/*상품 정보 모달 출력 */
function modalProducts(prname,prprice,prcode,prnote,primage){
console.log(prname+"::"+prprice+"::"+prcode);
$("#productsModalname").text(prname);
$("#productsModalprice").text(prprice);
$("#productsModalcode").val(prcode);
$("#productsModalnote").text(prnote);
$("#productModalimage").attr("src","/resources/primgfile/"+primage);
}

/*  수량 출력            */
var count= $("#countnum").val();

//숫자 + 버튼
$("#upbutton").click(function(){
if(count<=9){
   count++;}
else if(count=10){
   alert("10개이상의 주문은 전화주문만 가능합니다.");
}
 $("#countnum").val(count);
});

// 숫자 - 버튼
$("#downbutton").click(function(){
if(count>0){
   count--;
}else{
   alert("0보다 작을순 없습니다.");
}
 $("#countnum").val(count);
}); 


//취소버튼 하면 수량 0개
$("#cancleModal").click(function(){
   $("#countnum").val(0);
   count=0;
});

//주문하면 보내기

$("#orderModal").click(function(){
//count = 0으로 초기화 시켜줄것
console.log("cartAdd_btn 누름")
var prcode = $("#productsModalcode").val();   //상품코드
var sessionId = '<%=(String) session.getAttribute("loginId")%>';
      console.log(prcode + "::" + count + "::" + sessionId)
      if (sessionId == 'null') {
         alert("로그인 후 사용 가능합니다.");
         location.href = 'loginForm';

      } else if (sessionId != 'null') {

         cartAdd(prcode, count);
      }
      ;
   });

/* 장바구니 담기 */
   function cartAdd(prcode, count) {
      $.ajax({
         type : "post",
         url : "cartadd",
         data : {
            "prcode" : prcode,
            "prcount" : count
         },
         datatype : "text",
         success : function(result) {
            console.log(result);
            if (result == "add") {
               alert("장바구니에 담았습니다.")
               $("#count").val("1");
            } else if (result == "dupli") {
               alert("장바구니에 존재합니다.")
               location.href = 'cartView';
            }
            location.reload();
         },
         error : function() {
            alert("장바구니 오류");
         }
      });
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
            alert("CART연결실패");
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
         

         
         output += "<div class='list01'>";
         output += "<p class='item-list-section item-list-section01'>"+ prname + "</p>";
         output += "<div class='item-list-section item-list-section02'>";
         output += "<button type='button' class='cartdel_btn' >삭제</button>";
         output += "<span>"+ sum+"<span>";
         output += "<div class='btn-group item-count' role='group' aria-label='Basic example'>";
         output += "<button class='bt bt01 up'>-</button>";
         output += "<button class='bt bt-count'>" + prcount + "</button>";
         output += "<button class='bt bt02 down'>+</button>";
         output += "</div>";
         output += "</div>";
         output += "</div>";
      }
      $("#cartArea").html(output);

   };

   //장바구니에 담긴 상품이 없으면 결제 못하도록
   
   function payment(){
      console.log("payment")
      var count =cartcount();
      console.log(cartcount);
      

         
      }


   //장바구니 상품 개수 파악 ajax
   function cartcount(){
   console.log("cartcount()")
   
      $.ajax({
         type : "post",
         url : "cartcount",
         data : {},
         dataType : "json",
         success : function(result) {
            console.log("cartcount ::" + result);
            if(result==0){
            alert("물품을 추가하세요");
               }else{
            location.href="cartorder?stcode=${storeView.stcode}"
                  }
         },
         error : function() {
            alert("연결실패");
         }
      });
      }

   function storeLike(){ //가게 좋아요
       var mid='${sessionScope.loginId}';
       var stcode='${storeView.stcode}';
       console.log(mid+stcode);
       if(mid==''){
          alert("로그인이 필요한 서비스입니다.");
           }else{
       $.ajax({
             type:"post",
             url : "storeLike",
             data:{
                  "mid":mid,
                  "stcode":stcode
                 },
                 dataType : "text",
                 success : function(result) {
                	 storeLikeCheck();
                	 storeLikeCount();
 
                 },
                 error : function() {
                    alert("연결실패");
                 }
              });
           }
             
	   }

   function storeLikeCheck(){ //로그인한 사람에 대하여 Like표시의 유무 확인
	   var mid='${sessionScope.loginId}';
       var stcode='${storeView.stcode}';
       console.log(mid+stcode);
       $.ajax({
             type:"post",
             url : "storeLikeCheck",
             data:{
                  "mid":mid,
                  "stcode":stcode
                 },
                 dataType : "text",
                 success : function(result) {
                    if(result=="OK"){
                    	 $("#likeCondition").attr("src","/resources/storeimgfile/heart.png");
                        }else{
                        	$("#likeCondition").attr("src","/resources/storeimgfile/binheart.png");
                            }
 
                 },
                 error : function(ERROR) {
                    alert("like연결실패");
                 }
              });
             
	  
	   }

   function storeLikeCount(){ // 좋아요 갯수 출력
	  
       var stcode='${storeView.stcode}';
    
       $.ajax({
             type:"post",
             url : "storeLikeCount",
             data:{
                  
                  "stcode":stcode
                 },
                 dataType : "text",
                 success : function(result) {
                 $("#likeCount").text(result);
 
                 },
                 error : function() {
                    alert("연결실패");
                 }
              });
             
	  
	   }
   
   
</script>
<%@ include file="../includes/footer.jsp"%>

