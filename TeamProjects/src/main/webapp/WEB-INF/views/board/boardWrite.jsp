<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../includes/header.jsp"%>
<!-- 게시판 css -->
<link rel="stylesheet" href="/resources/css/boardWrite.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<!-- 별점 css -->
<link href="/resources/star/dist/star-rating.css" rel="stylesheet" />
<script src="/resources/star/dist/star-rating.min.js"></script>

<script>
$(document).ready(function() {
	var starRatingControl = new StarRating('.star-rating',{
		showText: false
	});
});
</script>

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

	<div class="sidebar2" id="sidebar-wrapper"
		style="float: left; width: 300px; height: 900px; background-color: #ffffff;">

		<ul class="sidebar-nav">
			<li class="sidebar-brand"><a href="#"></a></li>
			<li><a href=#></a></li>
			<li><a href=#></a></li>
			<li><a href=#></a></li>
		</ul>

	</div>

 
  <div class="maincontainer2"
	style="width: 1300px; height: 1000px; float: left; padding-left: 500px;">
      <div style="width:530px;">
         <div class="section-heading" style="margin-bottom:20px;">
            <br>
            <h2>게시글 쓰기</h2>
         </div>
      </div>


    <div class="contact-form" >
			<div class="row">
				<form action="boardWrite" method="post" enctype="multipart/form-data" >
			
					<div class="row" >
							<input type="text" class="form-control" name="bowriter"
							     value="${sessionScope.loginId}" readonly="readonly" style="text-align:center;" hidden>
					   
					    <div class="col-lg-4 col-md-4 col-sm-4"   padding-bottom: 40px; style="margin-bottom: 5px;">
						<label style="padding:9px;"></label> <select name="botype"
							class="form-control" style="margin-top: 5px;" id ="botype" >
							<option value="" selected="selected">-글타입선택-</option>
							
							<c:if test="${sessionScope.loginId == 'KHH'}"> 
							<option value="공지">공지글</option>
							</c:if>
							<option value="후기">후기글</option>
							<option value="자유">자유글</option>
						    </select>
					        </div> 
					        
					     
					   
					   
					  <div id ="botypeArea" class="col-lg-3 col-md-3 col-sm-3" style="padding-bottom: 40px;">
					 <%--  <div class="col-lg-3 col-md-3 col-sm-3" style="padding-bottom: 40px;">
						<label style="padding:9px;" id="botypeArea"></label> 
						
						
						 <select name="stcode"
							class="form-control" style="margin-top: 5px;"  >
							<option value="" selected="selected" >--구입상품선택--</option>
								<option value="0">구입상품없음</option>
								
							<c:out value="${prList}">
							 <c:if test="${prList.stcode != null}"> 
							<c:forEach var="prList" items="${prList}">
							<option value="${prList.stcode}">${prList.prname}</option>
							</c:forEach>
							</c:if>
								  </c:out>
						</select>--%>
					</div>  
					
					
					
					
					
					              
					<div class="col-lg-7 col-md-7 col-sm-7"  >
						<label >제목</label> <input type="text"
							class="form-control" name="botitle" placeholder="제목입력" required >
					</div>
					

					<div class="col-lg-7 col-md-7 col-sm-7" >
						<label style="margin-top: 15px;">내용</label> <input style="padding: 0px; height: 400px;" type="text"
							class="form-control" name="bocontent" placeholder="내용입력" required>
					</div>
					</div>
					
					<div class="row">
                    <div class="col-lg-4 col-md-4 col-sm-4" >
						<label>파일선택</label> <input type="file"
							class="form-control" name="bofile" id="sample6_address"
							 placeholder="파일첨부" style="width:250px;">
				     </div>
					
					 <div class="col-lg-3 col-md-3 col-sm-3" >
						 별점<select class="star-rating" name="borank"
							id="selectarea" class="form-control" >
							<option value="" selected="selected">--별점--</option>
							<option value="5">Excellent</option>
							<option value="4">Very Good</option>
							<option value="3">Average</option>
							<option value="2">Poor</option>
							<option value="1">Terrible</option>
						</select>
					</div>
						
				<div class="col-lg-7 col-md-7 col-sm-7"  >
				<input type="submit" class="filled-button" value="입력완료">
			</div>
					</div>
	</form>
</div>
</div>
</div>

<script type ="text/javascript">


$(document).ready(function(){
	$("#botype").change(function(){
		var mid = '${sessionScope.loginId}';
		var botype = $("#botype").val();
		console.log(mid);
		console.log(botype);
		if(botype =='후기'){
			  $.ajax({
				  type :  "post",
				  url : "getWriteInfo",
				  data : {
					  "mid" : mid,
					  "botype" : botype
				  },
				  dataType: "json",
				  success : function(result){
					  console.log(result);
					  showWriteInfo(result);
				  }, error : function(){
					  alert("fail to get WriteInfo")
				  }
			  }) 
		} else{
			$("#botypeArea").html("");
		}
	});
	
	
	
	
})




function showWriteInfo(result){
	console.log("showWriteInfo");
	var output = '';
	var stcode1 = result[0].stcode;
	console.log("stcode1=="+stcode1);
	
	if(stcode1 != null) {
	
		output +="<label style='padding:9px;' ></label> ";
		output +="<select name='stcode' class='form-control'  >";
		output +="<option value='' selected='selected' >--구입상품선택--</option>";
		for (var i in result) {
			var stcode = result[i].stcode;
			var stname = result[i].prname;
		output +="<option value='"+stcode+"'>"+stname+"</option>";
		}
		console.log("sendingStcode" + stcode);
		output +="</select>";
	} 
	$("#botypeArea").html(output);
}
















</script>


<!-- Additional Scripts -->
   <script src="/resources/js/custom.js"></script>
   <script src="/resources/js/owl.js"></script>
   <script src="/resources/js/slick.js"></script>
   <script src="/resources/js/isotope.js"></script>


<%@ include file="../includes/footer.jsp"%>