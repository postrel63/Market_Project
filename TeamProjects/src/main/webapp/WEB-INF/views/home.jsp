<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<%@ include file="includes/header.jsp" %>

  <link href='https://fonts.googleapis.com/css?family=Quicksand:400,700' rel='stylesheet' type='text/css' />
    <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.3/css/font-awesome.min.css" rel="stylesheet" />
<style>
ul.form {
    position:relative;
    background:#fff;
    width:210px;
    height:300px;
    margin:auto;
    padding:0;
    list-style: none;
    overflow:hidden;
 
    -webkit-border-radius: 5px;
    -moz-border-radius: 5px;
    border-radius: 5px;
 
    -webkit-box-shadow: 1px 1px 10px rgba(0, 0, 0, 0.1);
    -moz-box-shadow: 1px 1px 10px rgba(0, 0, 0, 0.1);
    box-shadow:  1px 1px 10px rgba(0, 0, 0, 0.1);
}


.form li a {
    width:210px;
    padding-left:20px;
    height:60px;
    line-height:50px;
    display:block;
    overflow:hidden;
    position:relative;
    text-decoration:none;
    text-transform:uppercase;
    font-size:20px;
    color:#686868;
 
    -webkit-transition:all 0.2s linear;
    -moz-transition:all 0.2s linear;
    -o-transition:all 0.2s linear;
    transition:all 0.2s linear;
}
 
.form li a:hover {
    background:#efefef;
}
 
.form li.selected a {
    background:#efefef;
}
.form li a.profile {
    border-left:5px solid #008747;
}

.form li a.listall {
    border-left:5px solid #1a6692;;
}
.form li a.messages {
        border-left:5px solid #fecf54;
    }
 
.form li a.settings {
        border-left:5px solid #cf2130;
    }
.form li a.logout {
        border-left:5px solid #dde2d5;
    }
    .form li:first-child a:hover, .form li:first-child a {
    -webkit-border-radius: 5px 5px 0 0;
    -moz-border-radius: 5px 5px 0 0;
    border-radius: 5px 5px 0 0;
}
 
.form li:last-child a:hover, .form li:last-child a {
    -webkit-border-radius: 0 0 5px 5px;
    -moz-border-radius: 0 0 5px 5px;
    border-radius: 0 0 5px 5px;
}


</style>
   
    <!-- Page Content -->
  <!--  <div class="page-heading contact-heading header-text">
      <div class="container">
         <div class="row">
            <div class="col-md-12">
               <div class="text-content">
                  <h4>HOME</h4>
                  <h2>환영합니다!</h2>
               </div>
            </div>
         </div>
      </div>
   </div> -->
   
    	<div class="sidebar2" 
		style="float: left; width: 270px; height: 900px;">
		


<ul class="form" style="margin:50px; margin-top:250px; ">
     <li><a class="listall" href="javascript:void(0);" onclick="categoryAll()"><i class="icon-user"></i>전체</a></li>
    <li><a class="profile" href="javascript:void(0);" onclick="changemarket('음식점')"><i class="icon-user"></i>음식점</a></li>
    <li><a class="messages" href="javascript:void(0);" onclick="changemarket('잡화점')">잡화점</a></li>
    <li><a class="settings" href="javascript:void(0);" onclick="changemarket('과일ㆍ야채ㆍ생선')"><i class="icon-cog"></i>과일ㆍ야채ㆍ생선</a></li>
     
    <li><a class="logout" href="#" onclick="changemarket('기타')"><i class="icon-signout"></i>기타</a></li>
</ul>

	
    <input type="hidden" id="stcategoryselect" >
	</div>
      
    <div class="products">
    
      
            
       <div class="mainfooter1" style="margin-left:370px; width:1300px; height:100px; " >
            <div style="float:left;width:120px;">
           <select id="selectarea" onchange="selectArea()" class="form-control" style="width:120px;">
		<option value="전체" selected="selected">전체</option>
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
       
       
            <div class="filters" style="float:right;">
              <ul>
                  <li onclick="selectArea()">전체 보기</li>
                  <li onclick="selectLike()">좋아요 순</li>
                  <li onclick="selectRank()">평점 순</li>
                  <li  onclick="selectmarketopen()">배달가능 가게</li>
              </ul>
           </div>
            
      
            
          </div>
            <div class="maincontainer2" style="
    width: 1400px;
    height:2450px;
    float:left;
     padding-left:100px; "       >
     
            <div class="filters-content">
                <div class="row grid"  id="List">
                    <div class="col-lg-4 col-md-4 all des">
                    
                   
                    </div>
    
                      </div>
                      </div>
                      

   </div>
                    
         
          
  
    </div>
    
    
    <!-- modal 영역 -->
<div class="modal fade" id="ChoiceStore" tabindex="-1" role="dialog"
	aria-labelledby="exampleModalCenterTitle" aria-hidden="true" data-backdrop="static" data-keyboard="false">
	<div class="modal-dialog modal-dialog-centered" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="exampleModalCenterTitle">내 사업장</h5>
		
			</div>
			<div class="modal-body">
				<div class="container-fluid">
					<strong>가게를 선택하세요 </strong><small><span style="color: red;">(필수선택항목입니다.)</span></small><br>
					<br>
					<div class="list-group" id="divChoiceStore">
						<a href="#"
							class="list-group-item list-group-item-action flex-column align-items-start">
							<div class="d-flex w-100 justify-content-between">
								<h5 class="mb-1">List group item heading</h5>
							</div> <small>Donec id elit non mi porta.</small>
						</a>
					</div>
					<br>

				</div>
			</div>
		</div>
	</div>
</div>

<!-- modal end -->


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

  	 getAreaname(); //회원의 지역 가져오기
  	 
  	 var areaname=$("#selectarea").val(); //처음값은 전체로 표기
  	 console.log("@@"+areaname);
  	 selectArea();  //처음값의 전체에대한 값 출력



  	
   
	});

	
	
	
	  function getAreaname(){  //회원의 지역 가져오기
	      var mid='${sessionScope.loginId}';
	      $.ajax({
              type:"post",
              url:"getAreaname",
              data:{
                   "mid":mid
                  },
              dataType:"text",
              success : function(result){
                  if(result==''){
                      console.log("주소가없다.");}
                  else{
                       console.log("주소가있다.");
                      }
                  },
              error:function(){
                     alert("연결실패");
                  }  
                    
                  
		      });      

	     }
        
      
	    function selectArea(){  //선택한 지역에 대한 시장들을 가져온다.
             var areaname=$("#selectarea").val();
             var stcategory=$("#stcategoryselect").val();
             
             if((areaname=="전체")&&(stcategory=="")){  //전체리스트출력
            	 $("#stcategoryselect").val("");
            	  $.ajax({
                      type:"post",
                      url:"getmarketListAll",
                      data:{
                          
                          },
                      dataType:"json",
                      success : function(result){
                     	
                     	 storeList(result);
                          },
                      error:function(){
                             alert("연결실패");
                          }            
        		      });     
                 }
             else if((areaname=="전체")&&(stcategory!="")){

            	 $.ajax({
                     type:"post",
                     url:"getmarketListcategoryAll",
                     data:{
                    	 "stcategory":stcategory
                         },
                     dataType:"json",
                     async : false,
                     success : function(result){
                    	 
                    	 storeList(result);
                         },
                     error:function(){
                            alert("연결실패");
                         }  
                           
                         
        		      });
            	 
                 }   
   	 else if(stcategory!=""){// 카테고리별 전체보기
       	 
       	 $.ajax({
                type:"post",
                url:"getmarketListcategory",
                data:{
               	 "areaname":areaname,
               	 "stcategory":stcategory
                    },
                dataType:"json",
                async : false,
                success : function(result){
               	 
               	 storeList(result);
                    },
                error:function(){
                       alert("연결실패");
                    }  
                      
                    
   		      });
       	 
             }
            else{
             $.ajax({
                 type:"post",
                 url:"getmarketList",
                 data:{
                      "areaname":areaname
                     },
                 dataType:"json",
                 success : function(result){
                	 storeList(result);
                     },
                 error:function(){
                        alert("연결실패");
                     }  
                       
                     
   		      });      
             }
             
		    }

	    
       function storeList(result){ // 가져온 시장들을 출력한다.
            var output='';

            for(var i in result){
                var marketname=result[i]["marketname"];
                var stname=result[i]["stname"];
                var staddress=result[i]["staddress"];
                var stimage=result[i]["stimage"];
                var strank=result[i]["strank"];
                var stcode=result[i]["stcode"];
                var storelike=result[i]["storelike"];
                output+="<div class='col-lg-4 col-md-4 all des'>";
                output+="<div class='product-item'>";
                output+="<a href='storeView?stcode="+stcode+"'>";
                output+="<img src='/resources/storeimgfile/"+stimage+"' style='width:412px; height:250px;'></a>";
                output+="<div class='down-content' >";
                output+="<a href='#'><h4>"+stname+"</h4></a>";
                output+="<h6>"+marketname+"</h6>";
                output+="<p>"+staddress+"</p>";
                output+="<img src='/resources/storeimgfile/heart.png' style='width:16px; height:12px;>"
                output+="<span style='float:right;'>즐겨찾는가게("+storelike+")</span>";
                output+="<span style='float:left'>평점"+strank+"</span>"
                output+="</div></div></div>"
                 
             
                }
            
              $("#List").html(output);
            
           }
	    
    function changemarket(select){  //검색할 상품의 종류를 가져와서 상점들을 출력한다.
    	 var areaname=$("#selectarea").val();
    	 var stcategory=select;
    	 $("#stcategoryselect").val(stcategory);// stcategory를 저장
    	 console.log(areaname+"+"+select); 
        if((areaname=="전체")&&(stcategory!="")){
            console.log("전체에서 카테고리 선택");

        	$.ajax({
                type:"post",
                url:"changemarketAll",
                data:{
                     "stcategory":stcategory
                    },
                dataType:"json",
                async : false,
                success : function(result){
               	
               	 storeList(result);
               	
                    },
                error:function(){
                       alert("연결실패");
                    }  
            
                });
            
              
                }else{
            $.ajax({
              type:"post",
              url:"changemarket",
              data:{
                   "areaname":areaname,
                   "stcategory":stcategory
                  },
              dataType:"json",
              async : false,
              success : function(result){
             	 storeList(result);
             	
                  },
              error:function(){
                     alert("연결실패");
                  }  
                    
                  
		      });      

              }
        }
	    

    function selectmarketopen(){  //현재 오픈된 가게출력
    	 var areaname=$("#selectarea").val();
    	 var stcategory=$("#stcategoryselect").val();
    	 if((areaname=="전체")&&(stcategory=="")){ //전체에 대한 가게들을 출력
    	 $.ajax({
             type:"post",
             url:"marketopenAll",
             data:{
                  
                 },
             dataType:"json",
             async : false,
             success : function(result){
            	 $("#stcategoryselect").val("");
            	 storeList(result);
                 },
             error:function(){
                    alert("연결실패");
                 }  
                   
                 
		      });

    	 }else if((areaname=="전체")&&(stcategory!="")){
    		 
        	 $.ajax({
                 type:"post",
                 url:"marketopencategoryAll",
                 data:{
                	 "stcategory":stcategory
                     },
                 dataType:"json",
                 async : false,
                 success : function(result){
                	 
                	 storeList(result);
                     },
                 error:function(){
                        alert("연결실패");
                     }  
        	 });
        	 }
        	 
    	 else if(stcategory!=""){// 지역과 카테고리별 오픈된가게 출력
        	 
        	 $.ajax({
                 type:"post",
                 url:"marketopencategory",
                 data:{
                	 "areaname":areaname,
                	 "stcategory":stcategory
                     },
                 dataType:"json",
                 async : false,
                 success : function(result){
                	 
                	 storeList(result);
                     },
                 error:function(){
                        alert("연결실패");
                     }  
                       
                     
    		      });
        	 
    }else{
    		 $.ajax({               //지역에서 전체에 대한 가게별 출력
                 type:"post",
                 url:"marketopen",
                 data:{
                	 "areaname":areaname
                     },
                 dataType:"json",
                 async : false,
                 success : function(result){
                	 storeList(result);
                     },
                 error:function(){
                        alert("연결실패");
                     }  
                       
                     
    		      });

        	 }      
        }

    function selectLike(){               
    	var areaname=$("#selectarea").val();
    	 var stcategory=$("#stcategoryselect").val();
    	 if((areaname=="전체")&&(stcategory=="")){     // 전체에대한 좋아요 수 별로 출력
        	 $.ajax({
                 type:"post",
                 url:"selectLikeAll",
                 data:{
                      
                     },
                 dataType:"json",
                 async : false,
                 success : function(result){
                	 $("#stcategoryselect").val("");
                	 storeList(result);
                     },
                 error:function(){
                        alert("연결실패");
                     }  
                       
                     
    		      });
    	 }else if((areaname=="전체")&&(stcategory!="")){
        	 
    		 $.ajax({
                 type:"post",
                 url:"selectLikecategoryAll",
                 data:{
                      "stcategory":stcategory
                     },
                 dataType:"json",
                 async : false,
                 success : function(result){
                	
                	 storeList(result);
                     },
                 error:function(){
                        alert("연결실패");
                     }  
    		 });
    }else if(stcategory!=""){    //지역과 카테고리에 대한 좋아요 수 별 출력 
            	 
            	 $.ajax({
                     type:"post",
                     url:"selectLikecategory",
                     data:{
                          "areaname":areaname,
                          "stcategory":stcategory
                         },
                     dataType:"json",
                     async : false,
                     success : function(result){
                    	
                    	 storeList(result);
                         },
                     error:function(){
                            alert("연결실패");
                         }  
                           
                         
        		      });
            	   
    	 }else{
    	 $.ajax({                   //지역에 대한 좋아요 수 출력
             type:"post",
             url:"selectLike",
             data:{
                  "areaname":areaname
                 },
             dataType:"json",
             async : false,
             success : function(result){
            	 storeList(result);
                 },
             error:function(){
                    alert("연결실패");
                 }  
                   
                 
		      });
    	 }
        }

    function categoryAll(){
       
          	 $("#stcategoryselect").val("");
    	   var areaname=$("#selectarea").val();
           var stcategory=$("#stcategoryselect").val();
           
           if((areaname=="전체")&&(stcategory=="")){  //전체리스트출력
          	  $.ajax({
                    type:"post",
                    url:"getmarketListAll",
                    data:{
                        
                        },
                    dataType:"json",
                    success : function(result){
                   	
                   	 storeList(result);
                        },
                    error:function(){
                           alert("연결실패");
                        }            
      		      });     
               }
           else{

        	   $.ajax({
                   type:"post",
                   url:"getmarketList",
                   data:{
                        "areaname":areaname
                       },
                   dataType:"json",
                   success : function(result){
                  	 storeList(result);
                       },
                   error:function(){
                          alert("연결실패");
                       }  
                         
                       
     		        
                       
      		      });
          	 
               }   
        }

    
         function selectRank(){
        	 var areaname=$("#selectarea").val();
        	 var stcategory=$("#stcategoryselect").val();
        	 if((areaname=="전체")&&(stcategory=="")){     // 전체에대한 평점별 로 출력
            	 $.ajax({
                     type:"post",
                     url:"selectstrank",
                     data:{
                          
                         },
                     dataType:"json",
                     async : false,
                     success : function(result){
                    	 $("#stcategoryselect").val("");
                    	 storeList(result);
                         },
                     error:function(){
                            alert("연결실패");
                         }  
                           
                         
        		      });
        	 }else if((areaname=="전체")&&(stcategory!="")){ //카테고리에 대한 전체출력
            	 
        		 $.ajax({
                     type:"post",
                     url:"selectstrankAll",
                     data:{
                          "stcategory":stcategory
                         },
                     dataType:"json",
                     async : false,
                     success : function(result){
                    	
                    	 storeList(result);
                         },
                     error:function(){
                            alert("연결실패");
                         }  
        		 });
        }else if(stcategory!=""){    //지역과 카테고리에 대한 좋아요 수 별 출력 
                	 
                	 $.ajax({
                         type:"post",
                         url:"selectstrankcategory",
                         data:{
                              "areaname":areaname,
                              "stcategory":stcategory
                             },
                         dataType:"json",
                         async : false,
                         success : function(result){
                        	
                        	 storeList(result);
                             },
                         error:function(){
                                alert("연결실패");
                             }  
                               
                             
            		      });
                	   
        	 }else{
        	 $.ajax({                   //지역에 대한 좋아요 수 출력
                 type:"post",
                 url:"selectstrankarea",
                 data:{
                      "areaname":areaname
                     },
                 dataType:"json",
                 async : false,
                 success : function(result){
                	 storeList(result);
                     },
                 error:function(){
                        alert("연결실패");
                     }  
    		      });
        	 }
        	 
         
            }
        
         

         
        
	
</script>



<%@ include file="includes/footer.jsp" %>
   