

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
 <!--   <div class="page-heading contact-heading header-text">
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
			<li class="sidebar-brand"><a href="#">사업자 메뉴</a></li>
			<li><a  href="storejoinForm">사업장 등록</a></li>
			<li><a href="memberstoreView?loginId=${sessionScope.loginId}">내 사업장
					변경</a></li>
			<li><a href="storeProducts?loginId=${sessionScope.loginId}">사업장 물품관리</a></li>
		</ul>

	</div>





  <div class="maincontainer2"
	style="width: 1300px; height: 2500px; float: left; padding-left: 300px;">
      <div class="col-md-12">
         <div class="section-heading">
            <br>
            <h2>사업자 상세보기</h2>
         </div>
      </div>


     <div id="formContent" class="contact-form" style="margin-left: 80px; padding:65px; ">




         <div class="row">
            <div style="width:1200px;">



		<div style="width:835px;height:50px;">
		<div style="width:160px; height:50px; float:left;">
        <select id="selectstore" class="form-control"  onchange="selectStore()" >
	 	<option value="">--가게선택--</option>
	 	<c:forEach var="storeList" items="${storeList}">
		<option value="${storeList.stcode}">${storeList.stname}</option>
	    </c:forEach> 

		</select>
		</div>
		
		<div style="width:200px; height:50px; float:right; margin-left:30px;">
		<button type="button" class="btn btn-primary" style="color: #009688; background-color: transparent; border-color: #ccc;" data-toggle="modal" data-target="#storeDeleteModal">사업자탈퇴</button>
		</div>
		</div>
		




               
               <div style="width:1000px; height:400px; margin-bottom:30px;" >
               <div style="width:300px;height: 400px; float:left; margin-right:20px; "  >
                 

  

                  
            

                     <label for="storename">가게명</label>
                     <input type="text" class="form-control" name="stname" id="stname"
                      readonly="readonly"  >

                       
                     <label>오픈시간</label><span style="float:right;" id="opModify">
                     <button type="button" class="badge badge-style" id="opModifybutton" onclick="opModify()">수정</button></span>
                      <input type="text" class="form-control"
                        name="operatetime" id="operatetime" readonly="readonly">
               
               
                       <label>가게전화번호</label><span style="float:right;" id="phoneModify">
                       <button type="button" id="phoneModifybutton" onclick="phoneModify()" class="badge badge-style">수정</button></span> 
                       <input type="text" class="form-control"
                        name="stphone" id="stphone" readonly="readonly">
                        
                        
                                  <label for="businessid">가게종류</label>
                      <span style="float:right;" id="categoryModify">
                      <button type="button" id="categoryModifybutton" onclick="categoryModify()" class="badge badge-style">수정</button></span> 
		<select disabled id="selectcategory" class="form-control"   >
		<option value="" >----</option>
		<option value="음식점">음식점</option>
		<option value="잡화점">잡화점</option>
		<option value="공구점">공구점</option>
		<option value="과일ㆍ야채ㆍ생선">과일ㆍ야채ㆍ생선</option>
		<option value="기타">기타</option>

		</select>
		
               
                  </div>
                  
  <div style="width:420px;height:180px; float:left; margin-top:30px;">
                  
                    <img src="" id="stimagefile" width="420px" height="350px">
               
                    <form  id="uploadForm" method="post" enctype="multipart/form-data"  ">
                  <div style="float: right; margin-top:3px;">
                  <label class="btn btn-primary btn-file"
                  style="color: #009688; background-color: transparent; border-color: #ccc; height:40px; margin-right:5px;  ">
                      파일 첨부<input type="file"  
                        id="stimage" name="stimagename" style=" display:none; " >
                        </label>
                        
                        <button type="button"  class="btn btn-primary" onclick="stimgUpload()" style="width:60px; height:40px;  float:right; color: #009688; background-color: transparent; border-color: #ccc; " >
                        확인</button>
                        </div>
                     <input type="hidden"  name="stcode" id="setstcode" >
                        </form>
                   
                </div>
                
</div>

      
            
               <div class="row">
            

                  <div class="col-lg-9 col-md-9 col-sm-9">

                     <label for="sample6_address">가게주소</label><span style="float:right;" id="addressModify">
                     <button class="badge badge-style" type="button" id="addressModifybutton" onclick="addressModify()">수정</button></span> <input
                        type="text" class="form-control" name="bdetailaddr"
                        id="staddress" readonly="readonly">

                  </div>

               </div>
  
                        <div class="row">
                  <div class="col-lg-9 col-md-9 col-sm-9">
                     <label>가게소개란</label> <span style="float:right;" id="noteModify">
                     <button type="button" id="noteModifybutton" onclick="noteModify()" class="badge badge-style">수정</button></span>
                        <textarea class="form-control" readonly="readonly"  name="stnote" id="stnote"></textarea>
                  </div>
                
               </div>
      
       
              
            </div>
         </div>

      </div>
   </div>


<!-- 사업자 탈퇴 모달 -->
<form >
	<div class="modal" tabindex="-1" role="dialog" id="storeDeleteModal">
  <div class="modal-dialog" role="document" style="margin-top:400px;" >
    <div class="modal-content" style="width:500px;height:400px;">
      <div class="modal-header">
        <h5 class="modal-title">사업자 탈퇴</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body" style="height:250px;">
      		<div style="width:400px; height:50px; margin:0 auto; margin-bottom:20px;" >
      <label>가게명</label>
         <select id="selectstore" class="form-control"  onchange="selectStore()" >
	 	 <option value="">--가게선택--</option>
	 	 <c:forEach var="storeList" items="${storeList}">
		<option value="${storeList.stcode}">${storeList.stname}</option>
 </c:forEach> 
	 </select>
		
		</div>
		<div style="width:400px; height:200px;  margin:0 auto;">
       <label for="businessid">아이디</label> <input type="text"
                        class="form-control" name="mid" 
                       value="${sessionScope.loginId}" >
       <label for="businessid">비밀번호</label> <input type="text"
                        class="form-control" name="mpassword" id="mpassword">
      </div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
        <button type="button" class="btn btn-primary" onclick="storeDeleteModal()">탈퇴</button>
      </div>
    </div>
  </div>
</div>
</form>







</body>
<script type="text/javascript">

function storeDeleteModal(){
    var mid='${sessionScope.loginId}';
    var mpassword=$("#mpassword").val();
    $.ajax({
        type:"post",
        url:"selectminfo",
        data:{
            "mid":mid,
            "mpassword":mpassword
            },
        dataType:"text",
        success: function(result){
           if(result=="NO"){
               alert("비밀번호가 틀렸습니다.");
               $("#mpassword").val("");
               }
           else if(result=="OK"){
              
               confirm("정말 탈퇴하시겠습니까?");
        	   DeleteStore();
               }
           
            },
            error:function(e){
             alert(e);
                }
            
          
          });
    

       }

function DeleteStore(){
	 var mid='${sessionScope.loginId}';
	 var stcode=$("#selectstore").val();
    $.ajax({
        type:"post",
        url:"deleteStoreList",
        data:{
            "bid":mid,
            "stcode":stcode
            },
        dataType:"text",
        success: function(result){
            alert("삭제되었습니다.");
             window.location.reload();
           
            },
            error:function(e){
             alert(e);
                }
            
          
          });
      
	
}

function addressModify(){  //오픈시간 수정
	
	var output="<div style='float:right;'>";
	output+="<button type='button' class='badge badge-style updateaddress' onclick='updateaddress(true)'>확인</button>";
	output+="<button type='button' class='badge badge-style updateaddress' onclick='updateaddress(false)'>취소</button>";
	output+="</div>"
	$("#staddress").removeAttr("readonly");
	$("#addressModifybutton").remove();
	$("#addressModify").after(output);
	};

function updateaddress(check){ //주소 수정
	var stcode=$("#setstcode").val();
	console.log("@@@"+stcode);
	if(check==true){

	$.ajax({
		type:"post",
		url:"updateaddress",
		data:{
			 "stcode":stcode,
			 "staddress":$("#staddress").val()
			},
			dataType:"text",
			success:function(result){
	             alert("수정되었습니다.");
				},
				error:function(){
					alert("연결실패");
	                
					}
			
	});	
	}
	var output="<div style='float:right;'>";
	output+="<button type='button' class='badge badge-style' id='addressModifybutton' onclick='addressModify()'>수정</button>";
	output+="</div>";

		$("#staddress").attr("readonly","readonly");
	    $(".updateaddress").remove();
	     $("#addressModify").after(output);
		
	}





function opModify(){  //오픈시간 수정
	
var output="<div style='float:right;'>";
output+="<button type='button' class='badge badge-style updateOp' onclick='updateOp(true)'>확인</button>";
output+="<button type='button' class='badge badge-style updateOp' onclick='updateOp(false)'>취소</button>";
output+="</div>"
$("#operatetime").removeAttr("readonly");
$("#opModifybutton").remove();
$("#opModify").after(output);
};

function updateOp(check){
var stcode=$("#setstcode").val();
console.log("@@@"+stcode);
if(check==true){

$.ajax({
	type:"post",
	url:"updateOp",
	data:{
		 "stcode":stcode,
		 "operatetime":$("#operatetime").val()
		},
		dataType:"text",
		success:function(result){
             alert("수정되었습니다.");
			},
			error:function(){
				alert("연결실패");
                
				}
		
});	
}
var output="<div style='float:right;'>";
output+="<button type='button'class='badge badge-style' id='opModifybutton' onclick='opModify()'>수정</button>";
output+="</div>";

	$("#operatetime").attr("readonly","readonly");
    $(".updateOp").remove();
     $("#opModify").after(output);
	
}





function phoneModify(){  //가게 전화번호 수정
	
	var output="<div style='float:right;'>";
	output+="<button type='button' class='badge badge-style updatephone' onclick='updatephone(true)'>확인</button>";
	output+="<button type='button' class='badge badge-style updatephone' onclick='updatephone(false)'>취소</button>";
	output+="</div>"
	$("#stphone").removeAttr("readonly");
	$("#phoneModifybutton").remove();
	$("#phoneModify").after(output);
	};

function updatephone(check){ //가게 전화번호 수정
	var stcode=$("#setstcode").val();
	console.log("@@@"+stcode);
	if(check==true){

	$.ajax({
		type:"post",
		url:"updatephone",
		data:{
			 "stcode":stcode,
			 "stphone":$("#stphone").val()
			},
			dataType:"text",
			success:function(result){
	             alert("수정되었습니다.");
				},
				error:function(){
					alert("연결실패");
	                
					}
			
	});	
	}
	var output="<div style='float:right;'>";
	output+="<button type='button' class='badge badge-style' id='phoneModifybutton' onclick='phoneModify()'>수정</button>";
	output+="</div>";

		$("#stphone").attr("readonly","readonly");
	    $(".updatephone").remove();
	     $("#phoneModify").after(output);
		
	}

function phoneModify(){  //가게 전화번호 수정
	
	var output="<div style='float:right;'>";
	output+="<button type='button' class='badge badge-style updatephone' onclick='updatephone(true)'>확인</button>";
	output+="<button type='button' class='badge badge-style updatephone' onclick='updatephone(false)'>취소</button>";
	output+="</div>"
	$("#stphone").removeAttr("readonly");
	$("#phoneModifybutton").remove();
	$("#phoneModify").after(output);
	};


function noteModify(){  //가게 소개 수정
	
	var output="<div style='float:right;'>";
	output+="<button type='button' class='badge badge-style updatenote' onclick='updatenote(true)'>확인</button>";
	output+="<button type='button' class='badge badge-style updatenote' onclick='updatenote(false)'>취소</button>";
	output+="</div>"
	$("#stnote").removeAttr("readonly");
	$("#noteModifybutton").remove();
	$("#noteModify").after(output);
	};


	
function updatenote(check){ //가게 소개 수정
	var stcode=$("#setstcode").val();
	console.log("@@@"+stcode);
	if(check==true){

	$.ajax({
		type:"post",
		url:"updatenote",
		data:{
			 "stcode":stcode,
			 "stnote":$("#stnote").val()
			},
			dataType:"text",
			success:function(result){
	             alert("수정되었습니다.");
				},
				error:function(){
					alert("연결실패");
	                
					}
			
	});	
	}
	var output="<div style='float:right;'>";
	output+="<button type='button' class='badge badge-style updatenote' id='noteModifybutton' onclick='noteModify()'>수정</button>";
	output+="</div>";

		$("#stnote").attr("readonly","readonly");
	    $(".updatenote").remove();
	     $("#noteModify").after(output);
		
	}


	
function categoryModify(){  //가게 종류 수정
	
	var output="<div style='float:right;'>";
	output+="<button type='button' class='badge badge-style updatecategory' onclick='updatecategory(true)'>확인</button>";
	output+="<button type='button' class='badge badge-style updatecategory' onclick='updatecategory(false)'>취소</button>";
	output+="</div>"
	$("#selectcategory").removeAttr("disabled"); // 수정버튼을 누르지않으면 수정불가능
	
	$("#categoryModifybutton").remove();
	$("#categoryModify").after(output);
	};

	
function updatecategory(check){ //가게 종류 수정
	var stcode=$("#setstcode").val();
	console.log("@@@"+stcode);
	if(check==true){

	$.ajax({
		type:"post",
		url:"updatecategory",
		data:{
			 "stcode":stcode,
			 "stcategory":$("#selectcategory").val()
			},
			dataType:"text",
			success:function(result){
	             alert("수정되었습니다.");
				},
				error:function(){
					alert("연결실패");
	                
					}
			
	});	
	}
	var output="<div style='float:right;'>";
	output+="<button type='button' class='badge badge-style' id='categoryModifybutton' onclick='categoryModify()'>수정</button>";
	output+="</div>";

	$("#selectcategory").attr('disabled', true); 
	    $(".updatecategory").remove();
	     $("#categoryModify").after(output);
		
	}







function stimgUpload(){ //파일 수정
var form = $("#uploadForm")[0];  
var formData = new FormData(form); //formdata 가져오기
console.log(form);


$.ajax({
    type:"post",
    url:"stimgUpload",
    processData:false,
    contentType:false,
    data:formData,	
    dataType:"text",
    success:function(result){
        console.log(result);
    	 $("#stimagefile").attr("src","resources/storeimgfile/"+result);//파일이름 추출해서 변경
    	alert("사진이 변경되었습니다");
    	 
        },
        error:function(e){
          console.log(e);
          }   
});
	
}

function selectStore(){
var stcode=$("#selectstore").val();  //선택한 옵션의 값 
console.log(stcode);

$.ajax({
	type: "post",
	url:"getstoreView",
	data:{
        "stcode":stcode
		},
	dataType : "json",
	success : function(result){
	viewStore(result);
      
		},
		error : function(){
			alert("가게를 선택해주세요");
			}
		
});
}


function viewStore(result){  //selectStore()에서 가져온 ArrayList의 값으로 선택될떄마다 데이터를 변경시켜준다.
$("#stname").val(result.stname);
 $("#staddress").val(result.staddress);
 $("#stphone").val(result.stphone);
 $("#stnote").val(result.stnote);	
 $("#operatetime").val(result.operatetime);
 $("#selectcategory").val(result.stcategory).prop("selected", true);//받아온 value 값을 option의 val값과 매칭시켜 값출력
 $("#selectcategory").attr('disabled', true); // 수정버튼을 누르지않으면 수정불가능
 $("#setstcode").val(result.stcode); //해당사진 등록하기 위한 데이터(hidden에 들어감)
 $("#stimagefile").attr("src","resources/storeimgfile/"+result.stimage);
		
		 
 }




 


</script>
<%@ include file="../includes/footer.jsp"%>