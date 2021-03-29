    <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="../includes/header.jsp"%>

  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
  <script src="https://use.fontawesome.com/fe459689b4.js"></script>
  
 <!--  좋아요 css -->
 <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
 
<style>
* {
  box-sizing: border-box;
}

/* Style inputs */
input[type=text], select, textarea {
  width: 100%;
  padding: 5px;
  border: 1px solid #ccc;
  margin-top: 6px;
  margin-bottom: 16px;
  resize: vertical;
}
#bModifyUpdate {
  background-color: #f33f3f;
  color: white;
  padding: 7px 10px;
  border: none;
  cursor: pointer;

}

button[type=button] {
  background-color: #000000;
  color: white;
  padding: 7px 10px;
  border: none;
  cursor: pointer;
}

input[type=submit]:hover {
 /*  background-color: #45a049; */
}

/* Style the container/contact section */
.container2 {
  border-radius: 5px;
  background-color: #f2f2f2;
  padding: 5px;
}

/* Create two columns that float next to eachother */
.column {
  float: left;
  width: 50%;
  margin-top: 6px;
  padding: 5px;
}

/* Clear floats after the columns */
.row2:after {
  content: "";
  display: table;
  clear: both;
}

/* Responsive layout - when the screen is less than 600px wide, make the two columns stack on top of each other instead of next to each other */
@media screen and (max-width: 600px) {
  .column, input[type=submit] {
    width: 100%;
    margin-top: 0;
  }
}

/* #submit {
text-align: right;
} */

 /* 댓글 */
.comments-details button.btn.dropdown-toggle,
.comments-details .total-comments {
    font-size: 18px;
    font-weight: 500;
    color: #5e5e5e;
}
.comments-details {
    padding: 15px 15px;
}
.comments .comments .dropdown,
.comments .dropup {
    position: relative;
}
.comments button {
    background-color: transparent;
    border: none;
}
.comments .comment-box {
    width: 100%;
    float: left;
    height: 100%;
    background-color: #FAFAFA;
    padding: 10px 10px 10px;
    margin-bottom: 15px;
    border-radius: 5px;
    border: 1px solid #ddd;
}
.comments .add-comment {
    background-color: transparent;
    border: none;
    position: relative;
    margin-bottom: 50px;
}
.comments .commenter-pic {
    width: 50px;
    height: 50px;
    display: inline-block;
    border-radius: 100%;
    border: 2px solid #fff;
    overflow: hidden;
    background-color: #fff;
}
.comments .add-comment .commenter-name {
    width: 100%;
    padding-left: 75px;
    position: absolute;
    top: 20px;
    left: 0px;
}
.comments .add-comment input {
    border-top: 0px;
    border-bottom: 1px solid #ccc;
    border-left: 0px;
    border-right: 0px;
    outline: 0px;
    box-shadow: none;
    border-radius: 0;
    width: 100%;
    padding: 0;
    font-weight: normal;
}
.comments .add-comment input:focus {
    border-color: #03a9f4;
    border-width: 2px;
}
.comments .add-comment button[type=submit] {
    background-color: #03a9f4;
    color: #fff;
    margin-right: 0px;
}
.comments .add-comment button {
  background-color: #f5f5f5; 

    margin: 10px 5px;
    font-size: 14px;
    text-transform: uppercase;
    float: right;
}
.comments .commenter-name .comment-time {
    font-weight: normal;
    margin-left: 8px;
    font-size: 15px;
}
.comments p.comment-txt {
    font-size: 15px;
    border-bottom: 1px solid #ddd;
    padding: 0px 0px 15px;
}
.comments .commenter-name {
    display: inline-block;
    position: relative;
    top: -20px;
    left: 10px;
    font-size: 16px;
    font-weight: bold;
}
.comments .comment-meta {
    font-size: 14px;
    color: #333;
    padding: 2px 5px 0px;
    line-height: 20px;
    float: right;
}
.comments .reply-box {
    display: none;
}
.comments .replied {
    background-color: #fff;
    width: 95%;
    float: right;
    margin-top: 15px;
}

/*======Responsive CSS=======*/
@media (max-width: 767px){
.comments .commenter-name {
    font-size: 13px;
    top: -5px;
}
.comments .commenter-pic {
    width: 40px;
    height: 40px;
}
.comments .commenter-name a{
  display: block;
}
.comments .commenter-name .comment-time{
  display: block;
  margin-left: 0px;
}
}


/* 좋아요버튼 */
label {
  display: flex;
  align-items: center;
}

svg {
  cursor: pointer;
  overflow: visible;
  width: 60px;
  border-radius: 50%;
  padding: 2px;
  transition: .2s ease;
}
svg:hover {
  background: rgba(224, 36, 94, 0.1);
}
svg:hover #heart {
  stroke: #e0245e;
}
svg:active {
  background: rgba(224, 36, 94, 0.2);
}
svg #heart {
  transform-origin: center;
  fill: transparent;
  stroke: #5b7083;
  stroke-width: 2px;
  transition: .2s ease;
}
svg .circle {
  transform-origin: 29.5px 29.5px;
}

#checkbox {
  display: none;
}

#checkbox:checked + label svg #heart {
  transform: scale(0);
  fill: #e0245e;
  stroke: #e0245e;
  animation: heart 0.25s 0.2s cubic-bezier(0.175, 0.885, 0.32, 1.275) forwards;
}
#checkbox:checked + label svg .circle {
  animation: circle .25s forwards;
}
#checkbox:checked + label svg #grp1 {
  opacity: 1;
  transition: 0.1s 0.2s;
}
#checkbox:checked + label svg #grp1 #oval1 {
  transform: scale(0) translate(0, -30px);
  transform-origin: 0 0 0;
  transition: 0.2s transform 0.2s;
}
#checkbox:checked + label svg #grp1 #oval2 {
  transform: scale(0) translate(10px, -50px);
  transform-origin: 0 0 0;
  transition: 1.2s transform 0.2s;
}
#checkbox:checked + label svg #grp2 {
  opacity: 1;
  transition: 0.1s 0.2s;
}
#checkbox:checked + label svg #grp2 #oval1 {
  transform: scale(0) translate(30px, -15px);
  transform-origin: 0 0 0;
  transition: 0.2s transform 0.2s;
}
#checkbox:checked + label svg #grp2 #oval2 {
  transform: scale(0) translate(60px, -15px);
  transform-origin: 0 0 0;
  transition: 1.2s transform 0.2s;
}
#checkbox:checked + label svg #grp3 {
  opacity: 1;
  transition: 0.1s 0.2s;
}
#checkbox:checked + label svg #grp3 #oval1 {
  transform: scale(0) translate(30px, 0px);
  transform-origin: 0 0 0;
  transition: 0.2s transform 0.2s;
}
#checkbox:checked + label svg #grp3 #oval2 {
  transform: scale(0) translate(60px, 10px);
  transform-origin: 0 0 0;
  transition: 1.2s transform 0.2s;
}
#checkbox:checked + label svg #grp4 {
  opacity: 1;
  transition: 0.1s 0.2s;
}
#checkbox:checked + label svg #grp4 #oval1 {
  transform: scale(0) translate(30px, 15px);
  transform-origin: 0 0 0;
  transition: 0.2s transform 0.2s;
}
#checkbox:checked + label svg #grp4 #oval2 {
  transform: scale(0) translate(40px, 50px);
  transform-origin: 0 0 0;
  transition: 1.2s transform 0.2s;
}
#checkbox:checked + label svg #grp5 {
  opacity: 1;
  transition: 0.2s all 0.2s;
}
#checkbox:checked + label svg #grp5 #oval1 {
  transform: scale(0) translate(-10px, 20px);
  transform-origin: 0 0 0;
  transition: 0.2s transform 0.2s;
}
#checkbox:checked + label svg #grp5 #oval2 {
  transform: scale(0) translate(-60px, 30px);
  transform-origin: 0 0 0;
  transition: 1.2s transform 0.2s;
}
#checkbox:checked + label svg #grp6 {
  opacity: 1;
  transition: 0.2s 0.2s;
}
#checkbox:checked + label svg #grp6 #oval1 {
  transform: scale(0) translate(-30px, 0px);
  transform-origin: 0 0 0;
  transition: 0.2s transform 0.2s;
}
#checkbox:checked + label svg #grp6 #oval2 {
  transform: scale(0) translate(-60px, -5px);
  transform-origin: 0 0 0;
  transition: 1.2s transform 0.2s;
}
#checkbox:checked + label svg #grp7 {
  opacity: 1;
  transition: 0.2s 0.2s;
}
#checkbox:checked + label svg #grp7 #oval1 {
  transform: scale(0) translate(-30px, -15px);
  transform-origin: 0 0 0;
  transition: 0.2s transform 0.2s;
}
#checkbox:checked + label svg #grp7 #oval2 {
  transform: scale(0) translate(-55px, -30px);
  transform-origin: 0 0 0;
  transition: 1.2s transform 0.2s;
}
#checkbox:checked + label svg #grp2 {
  opacity: 1;
  transition: 0.2s opacity 0.2s;
}
#checkbox:checked + label svg #grp3 {
  opacity: 1;
  transition: 0.2s opacity 0.2s;
}
#checkbox:checked + label svg #grp4 {
  opacity: 1;
  transition: 0.2s opacity 0.2s;
}
#checkbox:checked + label svg #grp5 {
  opacity: 1;
  transition: 0.2s opacity 0.2s;
}
#checkbox:checked + label svg #grp6 {
  opacity: 1;
  transition: 0.2s opacity 0.2s;
}
#checkbox:checked + label svg #grp7 {
  opacity: 1;
  transition: 0.2s opacity 0.2s;
}

.numbers {
  font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, Helvetica, Arial, sans-serif;
  font-size: 19px;
  color: #5b7083;
  height: 25.5px;
  overflow: hidden;
  padding-left: 3px;
  display: flex;
  flex-flow: column;
  transition: .2s ease;
  user-select: none;
}

svg:hover + .numbers, #checkbox:checked + label .numbers {
  color: #e0245e;
}

.num1, .num2 {
  display: block;
  transition: .3s margin;
}

#checkbox:checked + label .numbers .num1 {
  margin-top: -25.5px;
}

@keyframes circle {
  from {
    transform: scale(0) translateY(-0.05px);
    stroke-width: 3px;
  }
  50% {
    transform: scale(6) translateY(-0.05px);
    stroke-width: 3px;
  }
  to {
    transform: scale(15) translateY(-0.05px);
    stroke-width: 0;
  }
}
@keyframes heart {
  from {
    transform: scale(0.2);
  }
  to {
    transform: scale(1);
  }
}

/* sidebar */
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

<script>

	function replyToggle(){
		$(".reply-box").toggle();
	}

$(document).ready(function(){

  $(".reply-popup").click(function(){
    $(".reply-box").toggle();
  });
  
});

 function like(){
	 	$("#green").css("color","red");
	   
 }
</script>

<body>



	<div class="container">
		<div class="col-md-12" style="margin-top: 30px">
			<div class="section-heading" style="text-align: center">
				<h2>게시글보기</h2>
			</div>
		</div>
	
	
	
		
    <div id="formContent" class="contact-form" style="margin-left: 180px">
    
      <div id="boardUpdateArea">
      <div id="boardUpdate">
    
		<div style="width: 1200px;">
		<div style="width: 1000px; height: 400px;">
		
        <!-- 상세페이지 왼쪽 부분 -->
		<div style="width: 300px; height: 400px; float: left; margin-right: 50px;">
		 <input type="text" id="bnum" value="${bView.bonum}" hidden>
         <input type="text" id="bwriter" value="${bView.bowriter}" hidden>

         <!-- 좋아요 -->    
         <c:if test="${sessionScope.loginId != bView.bowriter}"> 
         <input type="checkbox" id="checkbox" value="1" />
         <label for="checkbox">
         <svg   id="heart-svg" viewBox="467 392 58 57" xmlns="http://www.w3.org/2000/svg" stroke-linecap="round" stroke-linejoin="round">
         <g id="Group" fill="none" fill-rule="evenodd" transform="translate(467 392)">
         <path d="M29.144 20.773c-.063-.13-4.227-8.67-11.44-2.59C7.63 28.795 28.94 43.256 29.143 43.394c.204-.138 21.513-14.6 11.44-25.213-7.214-6.08-11.377 2.46-11.44 2.59z" id="heart" />
         <circle class="circle" cx="29.5" cy="29.5" r="1.5" stroke="#CD85E7" stroke-width="0 "/>
         <g id="grp7" opacity="0" transform="translate(7 6)">
         <circle id="oval1" fill="#9CD8C3" cx="2" cy="6" r="2" />
         <circle id="oval2" fill="#8CE8C3" cx="5" cy="2" r="2" />
         </g>
        <g id="grp6" opacity="0" transform="translate(0 28)">
        <circle id="oval1" fill="#CC8EF5" cx="2" cy="7" r="2" />
        <circle id="oval2" fill="#91D2FA" cx="3" cy="2" r="2" />
        </g>
        <g id="grp3" opacity="0" transform="translate(52 28)">
        <circle id="oval2" fill="#9CD8C3" cx="2" cy="7" r="2" />
        <circle id="oval1" fill="#8CE8C3" cx="4" cy="2" r="2" />
        </g>
        <g id="grp2" opacity="0" transform="translate(44 6)">
        <circle id="oval2" fill="#CC8EF5" cx="5" cy="6" r="2" />
        <circle id="oval1" fill="#CC8EF5" cx="2" cy="2" r="2" />
        </g>
        <g id="grp5" opacity="0" transform="translate(14 50)">
        <circle id="oval1" fill="#91D2FA" cx="6" cy="5" r="2" />
        <circle id="oval2" fill="#91D2FA" cx="2" cy="2" r="2" />
        </g>
        <g id="grp4" opacity="0" transform="translate(35 50)">
        <circle id="oval1" fill="#F48EA7" cx="6" cy="5" r="2" />
        <circle id="oval2" fill="#F48EA7" cx="2" cy="2" r="2" />
        </g>
        <g id="grp1" opacity="0" transform="translate(24)">
        <circle id="oval1" fill="#9FC7FA" cx="2.5" cy="3" r="2" />
        <circle id="oval2" fill="#9FC7FA" cx="7.5" cy="2" r="2" />
        </g>
        </g>
        </svg>
        <div class="numbers">
        <a id = updateBorecommend2 class="num1">${bView.borecommend}</a>
        <a id = updateBorecommend class="num2">15</a>
        </div>
        </label>
        </c:if>
        
        <c:if test="${sessionScope.loginId == bView.bowriter}"> 
        <div style="padding-left: 150px; padding-top: 15px;">
        <button style="margin-left: 40px; margin-right: 0rem!important;; font-weight: bold;" 
        class="badge badge-style mr-3" type="button" onclick="boardUpdate('${bView.bonum}','${bView.bofilename}')">수정</button>
        <button style="background-color: #D3D3D3; color: #000000; font-weight: bold;" class="badge badge-style mr-3" type="button" 
        onclick="location.href='boardDel?bonum=${bView.bonum}'">삭제</button>
        </div>
        </c:if>
        
        
	 <label for="btitle">제목</label> 
	 <input type="text" class="form-control" id="btitle" value="${bView.botitle }" readonly="readonly"> 
	 <label for="bcontent">내용</label>
	 <textarea type="text" style="height:170px" class="form-control" id="bcontent" 
	           value="${bView.bocontent }" readonly="readonly">${bView.bocontent }</textarea>
		</div>
		<!-- 상세페이지 오른쪽 부분 -->
		<div style="width: 420px; height: 180px; float: left">
		<img src="/resources/boardfile/${bView.bofilename}"  style="margin-top: 30px; width: 420px; height: 350px;" id="bfilename">
		</div>
</div>
</div>
</div>
</div>
  </div>
</div>



<!-- 댓글 부분 -->
<div class="maincontainer2" style="width: 1300px; height: 600px; float: left; margin-top: 20px; margin-left: 615px;">
  <div class="row">
    <div class="col-13" style="width: 900px; padding-left: 125px; padding-top: 30px;">
      <div class="comments" >
            
        <c:if test="${sessionScope.loginId !=null }"> 
        <div class="comment-box add-comment">
             <c:if test="${mFilename != null }">
             <span class="commenter-pic"> 
            <img src="/resources/profileImg/${mFilename}" class="img-fluid"> 
          </span>
          </c:if>
          
          
             <c:if test="${mFilename == null }">
             <span class="commenter-pic"> 
            <img src="/resources/profileImg/noimg1.gif" class="img-fluid"> 
          </span>
          </c:if> 
          
          
          <span class="commenter-name" style="margin-bottom: 40px;">
            <input type ="text" name="cowriter" id="cowriter" value="${sessionScope.loginId }" hidden>
            <input type="text" name="cocontent" id="cocontent" placeholder="댓글을 입력해주세요" name="Add Comment">
            <button type="button" id="commentsWriterBtn" class="btn btn-default" style="background-color: #D3D3D3; color: #000000; font-weight: bold; ">Comment</button>
          </span>
        </div>
         </c:if> 
        <div id="commentArea">
          
          <!-- reply입력되면 실행되게  -->
           <div class="comment-box replied">
           <!-- <span class="commenter-pic">
              <img src="/images/user-icon.jpg" class="img-fluid">
            </span> -->
            <span class="commenter-name">
              <a style="color:#1a6692" href="#">Happy markuptag3</a> <span class="comment-time">2 hours ago</span>
            </span>       
            <p class="comment-txt more">Suspendisse massa enim, condimentum sit amet maximus quis, pulvinar sit amet ante. Fusce eleifend dui mi, blandit vehicula orci iaculis ac.</p>
            <div class="comment-meta">
              <button class="comment-like"><i class="fa fa-thumbs-o-up" aria-hidden="true"></i> 99</button>
              <button class="comment-dislike"><i class="fa fa-thumbs-o-down" aria-hidden="true"></i> 149</button> 
              <button class="comment-reply"><i class="fa fa-reply-all" aria-hidden="true"></i> 확인</button>         
            </div>
            </div>
        </div>
        
      </div>
    </div>
  </div>
</div>


<footer>
      <div class="container">
        <div class="row">
          <div class="col-md-12">
            <div class="inner-content">
            </div>
          </div>
        </div>
      </div>
    </footer>
</body>
 <script type="text/javascript">
        $(document).ready(function(){
        	 printCommentList();
        	$("#commentsWriterBtn").click(function(){
        		var cowriter = $("#cowriter").val();
        		var cocontent = $("#cocontent").val();
        		if(cocontent =='') {
        			alert("댓글내용을 입력해주세요");
        			$("#cocontent").focus();
        			return;
        		}
        		
        		var co_bonum = '${bView.bonum }';
        		
        		$.ajax({
        			type : "post",
        			url : "commentWrite",
        			data : { 
        				"cowriter" : cowriter,
        				"cocontent" : cocontent,
        				"co_bonum" : co_bonum
        			},
        			dataType : "json",
        			success : function(result){
        				commentList(result);
        				$("#cocontent").val("");
        			},error : function(){
        				alert("fail to insert commentList");
        			}
        		});
        	}); 
        });
        
        function commentList(result) {
        	var output ='';
        	var loginId = '${sessionScope.loginId}';
        	for(var i in result) {
        		var cowriter = result[i].cowriter;
        		var cocontent = result[i].cocontent;
        		var conum = result[i].conum;
        		output +="<div class='comment-box' style='padding-top: 38px;'>";
        		/* output +="<span class='commenter-pic'>";
        		output +="<img src='/images/user-icon.jpg' class='img-fluid'>";
        		output +="</span>"; */
        		output +="<span class='commenter-name'>";
        		output +="<a style='color:#1a6692' href='#'>"+cowriter+"</a><span class='comment-time'></span>";
        		if(loginId == cowriter) {
               /*  output +=" <button type='button' class='badge badge-primary mr-3' id='maddressUpdateBtn' style='margin-right: 0px; background-color: #D3D3D3; color: #000000; font-weight: bold;'>수정</button> " */
        		output +=" <button type='button' onclick='commentDelete("+conum+")' class='badge badge-primary mr-3' style='background-color: #000000; color: #D3D3D3; font-weight: bold;'>삭제</button> "
        		}  
        		output +="</span>";

        		output +="<p class='comment-txt more'>"+cocontent+"</p>";
        		
        		
        		/* output +="<div class='comment-meta'>";
        		output +="<button class='comment-like'><i class='fa fa-thumbs-o-up' aria-hidden='true'></i> 99</button>";
        		output +="<button class='comment-dislike'><i class='fa fa-thumbs-o-down' aria-hidden='true'></i> 149</button>"; 
        		output +=" <button style='cursor: pointer; outline: 0; color: #AAA;' class='btn' id='green' onclick='like();' ><i class='fa fa-thumbs-up fa-lg' aria-hidden='true'></i></button>"; 
        	    output +=" <button style='cursor: pointer; outline: 0; color: #AAA;' class='btn' id='red'><i class='fa fa-thumbs-down fa-lg' aria-hidden='true'></i></button>"; 
        		output +="<button class='comment-reply reply-popup' onclick='replyToggle()'><i class='fa fa-reply-all' aria-hidden='true' ></i> Reply</button>"; 
        		output +="</div>"; */
        		
        		/* 대댓글 */
        		output +="<form action='reReply' method='post'>";
        		output +="<input type='hidden' name='co_bonum'  value='<c:out value='${bView.bonum}'/>'>";
        		output +="<input type='hidden' name='conum' value="+conum+">";
        		output +="<input type='hidden' name='reparent' value='"+conum+"' >";
        		output +="<div class='comment-box add-comment reply-box'>";
        		output +="<span class='commenter-pic'>";
        		output +="<img src='/images/user-icon.jpg' class='img-fluid'>";
        		output +="</span>";
        		output +="<span class='commenter-name'>";
        		output +="<input type='text' placeholder='Add a public reply' name='Add Comment'>";
        	 	output +="<button type='submit' class='btn btn-default>확인</button>"; 
        		output +="<button type='cancel' class='btn btn-default reply-popup'>Cancel</button>";
        		output +="</form>";
        		output +="</span>";
        		output +="</div>";
        		output +="</div>"; 
        	  }
        	$("#commentArea").html(output);
        }
        
        function printCommentList(){
        	$.ajax({
        		type : "post",
        		url : "commentList",
        		data : {
        			"co_bonum" : '${bView.bonum}'
        		},
        		dataType : "json",
        		success : function(result){
        			commentList(result);
        		},
        		error : function(){
        			alert("fail to download printCommentList");
        		}
        	});
        	
        }
        
            
        function commentDelete(conum) {
        	console.log("commentDelete" + conum);
        	var co_bonum = '${bView.bonum}';
        	$.ajax({
        	   type : "post",
        	   url : "commentDelete",
        	   data : {
        		   "conum" : conum,
        		   "co_bonum" : co_bonum
        	   },
        	   dataType : "json",
        	   success : function(result) {
        		   commentList(result);
        	   },
        	   error : function(){
        		   alert("fail to delete the comment")
        	   }
        	 
        	});
        	
        }
        
        /* 좋아요버튼 */
        $("#checkbox").click(function(){
        	var checkbox = $("#checkbox").val();
        	var bonum =$("#bnum").val();
        if($("#checkbox").is(":checked")){
        	$.ajax({
        		type : "post",
        		url : "insertBorecommend",
        		data : {
        			"borecommend" : checkbox,
        			"bonum" : bonum
        		},
        		dataType: "text",
        	    success : function(borecommend) {
                     updateBorecommend(borecommend);       	    	
        	    },
        	});
        	
        }
    });
        
        /* 좋아요 숫자 업데이트 */
        function updateBorecommend(borecommend) {
        	console.log("updateBorecommend" + borecommend);
        	output = "<a id = updateBorecommend class='num2'>"+borecommend+"</a>";
        	output +="</div>";
        	output +=" </label>";
        	
        	$("#updateBorecommend").remove();
        	$("#updateBorecommend2").after(output);
        }
        
       
       
        
        
        
        
        
        /* 게시글 수정 */
        function boardUpdate(bonum,bofilename) {
        	var bowriter = $("#bwriter").val();
        	var botitle = $("#btitle").val();
        	var bocontent = $("#bcontent").val();
        	// var bonum =$("#bnum").val();  //
        	var loginId = '${sessionScope.loginId}';
        	
        	console.log(bofilename);
        
        	
        	
        	
           output = "<div id='boardUpdateArea'>";
           output += "<div id='boardUpdate'>"; 
           output += "<div style='width: 1200px;'>";
      	   output += "<div style='width: 1000px; height: 400px;'>";
      	   output += "<div style='width: 300px; height: 400px; float: left; margin-right: 50px;'>";
      	   output += " <input type='text' id='bnum' value='"+bonum+"' hidden>";
      	   output += " <input type='text' id='bwriter' value='"+bowriter+"' hidden>";
      	   
      	  
      	 if(loginId != bowriter){
      	   output += "<input type='checkbox' id='checkbox' />";
      	   output += " <label for='checkbox'>";
      	   output += "<svg  id='heart-svg' viewBox='467 392 58 57' xmlns='http://www.w3.org/2000/svg' stroke-linecap='round' stroke-linejoin='round'>";
      	   output += "<g id='Group' fill='none' fill-rule='evenodd' transform='translate(467 392)'>";
      	   output += "<path d='M29.144 20.773c-.063-.13-4.227-8.67-11.44-2.59C7.63 28.795 28.94 43.256 29.143 43.394c.204-.138 21.513-14.6 11.44-25.213-7.214-6.08-11.377 2.46-11.44 2.59z' id='heart' />";
      	   output += "<circle class='circle' cx='29.5' cy='29.5' r='1.5' stroke='#CD85E7' stroke-width='0 '/>";
      	   output += " <g id='grp7' opacity='0' transform='translate(7 6)'>";
      	   output += "<circle id='oval1' fill='#9CD8C3' cx='2' cy='6' r='2' />";
      	   output += " <circle id='oval2' fill='#8CE8C3' cx='5' cy='2' r='2' />";
      	   output += "</g>";
      	   output += "<g id='grp6' opacity='0' transform='translate(0 28)'>";
      	   output += "<circle id='oval1' fill='#CC8EF5' cx='2' cy='7' r='2' />";
      	   output += "<circle id='oval2' fill='#91D2FA' cx='3' cy='2' r='2' />";
      	   output += "</g>";
      	   output += "<g id='grp3' opacity='0' transform='translate(52 28)'>";
      	   output += "<circle id='oval2' fill='#9CD8C3' cx='2' cy='7' r='2' />";
      	   output += " <circle id='oval1' fill='#8CE8C3' cx='4' cy='2' r='2' />";
      	   output += " </g>";
      	   output += "<g id='grp2' opacity='0' transform='translate(44 6)'>";
      	   output += "<circle id='oval2' fill='#CC8EF5' cx='5' cy='6' r='2' />";
      	   output += "<circle id='oval1' fill='#CC8EF5' cx='2' cy='2' r='2' />";
      	   output += "</g>";
      	   output += "<g id='grp5' opacity='0' transform='translate(14 50)'>";
      	   output += " <circle id='oval1' fill='#91D2FA' cx='6' cy='5' r='2' />";
      	   output += "<circle id='oval2' fill='#91D2FA' cx='2' cy='2' r='2' />";
      	   output += "</g>";
      	   output += " <g id='grp4' opacity='0' transform='translate(35 50)'>";
      	   output += "<circle id='oval1' fill='#F48EA7' cx='6' cy='5' r='2' />";
      	   output += " <circle id='oval2' fill='#F48EA7' cx='2' cy='2' r='2' />";
      	   output += " </g>";
      	   output += " <g id='grp1' opacity='0' transform='translate(24)'>";
      	   output +="<circle id='oval1' fill='#9FC7FA' cx='2.5' cy='3' r='2' />";
      	   output +="<circle id='oval2' fill='#9FC7FA' cx='7.5' cy='2' r='2' />";
      	   output +="</g>";
      	   output +=" </g>";
      	   output +="</svg>";
      	   output +="<div class='numbers'>";
      	   output +="<a class='num1'>14</a>";
      	   output +="<a class='num2'>15</a>";
      	   output +=" </div>";
      	   output +=" </label>";
        }else if(loginId = bowriter) {
      	   output +="<div style='padding-left: 150px; padding-top: 15px;'>";
      	   output +="<button style='background-color: #D3D3D3; color: #000000; font-weight: bold; margin-left: 80px; margin-top: 10px;' class='badge badge-style mr-3' type='button' onclick='boardUpdateCheck("+bonum+")'>확인</button>";
        	output +="</div>";
        }
        	output += "<label for='btitle'>제목</label> ";
        	output +="<input type='text' class='form-control' id='btitle' value=' "+botitle+"' > ";
        	output += " <label for='bcontent'>내용</label>";
        	output += "<textarea type='text' style='height:170px' class='form-control' id='bcontent' value=' "+bocontent+"' >"+bocontent+"</textarea>	";
        	output += "	</div>";
        	output += "<div style='width: 420px; height: 180px; float: left'>"
        	output += "<img src='/resources/boardfile/"+bofilename+"' style='margin-top: 30px; width: 420px; height: 350px;' id='bfilename'>";
        	output += "</div>"
            output += "</div>"
            output += "</div>"
            output += "</div>"
            output += "</div>"
        	$("#boardUpdate").remove();
        	$("#boardUpdateArea").after(output);
        }  
        
        
        function boardUpdateCheck(bonum){
        	var bowriter = '${sessionScope.loginId}';
     	    var botitle = $("#btitle").val();
     	    var bocontent = $("#bcontent").val();
     	   var borecommend =$("#checkbox").val();
     	   
     	   var bofilename ='${bView.bofilename}';
     	  
     	  var loginId = '${sessionScope.loginId}';
     	    $.ajax({
     		   type : "post",
     		   url : "boardUpdate",
     		   data : {
     			       "bonum" : bonum,
     			       "bowriter" : bowriter, 
     			       "botitle" : botitle,
     			       "bocontent" : bocontent,
     			       "bofilename" : bofilename,
     			       "borecommend" :borecommend
     			   },
     		   dataType : "text", 
     		   success: function(result){
     	          if(result =="OK") {
     	              alert("게시글이 수정되었습니다.");
     	             /* else {
 	             	  alert("게시글 수정 실패");
 	                   $("#eUpdate").val(memail);
 	                  } */ 
     		   }
     			   }
     		   });
     	    
     	   var output = "<div style='width: 1200px;'>";
         	   output += "<div style='width: 1000px; height: 400px;'>";
         	   output += "<div style='width: 300px; height: 400px; float: left; margin-right: 50px;'>";
         	   output += " <input type='text' id='bnum' value='"+bonum+"' hidden>";
         	   output += " <input type='text' id='bwriter' value='"+bowriter+"' hidden>";
         	  
         	 if(loginId != bowriter){
         	   output += "<input type='checkbox' id='checkbox' />";
         	   output += " <label for='checkbox'>";
         	   output += "<svg  id='heart-svg' viewBox='467 392 58 57' xmlns='http://www.w3.org/2000/svg' stroke-linecap='round' stroke-linejoin='round'>";
         	   output += "<g id='Group' fill='none' fill-rule='evenodd' transform='translate(467 392)'>";
         	   output += "<path d='M29.144 20.773c-.063-.13-4.227-8.67-11.44-2.59C7.63 28.795 28.94 43.256 29.143 43.394c.204-.138 21.513-14.6 11.44-25.213-7.214-6.08-11.377 2.46-11.44 2.59z' id='heart' />";
         	   output += "<circle class='circle' cx='29.5' cy='29.5' r='1.5' stroke='#CD85E7' stroke-width='0 '/>";
         	   output += " <g id='grp7' opacity='0' transform='translate(7 6)'>";
         	   output += "<circle id='oval1' fill='#9CD8C3' cx='2' cy='6' r='2' />";
         	   output += " <circle id='oval2' fill='#8CE8C3' cx='5' cy='2' r='2' />";
         	   output += "</g>";
         	   output += "<g id='grp6' opacity='0' transform='translate(0 28)'>";
         	   output += "<circle id='oval1' fill='#CC8EF5' cx='2' cy='7' r='2' />";
         	   output += "<circle id='oval2' fill='#91D2FA' cx='3' cy='2' r='2' />";
         	   output += "</g>";
         	   output += "<g id='grp3' opacity='0' transform='translate(52 28)'>";
         	   output += "<circle id='oval2' fill='#9CD8C3' cx='2' cy='7' r='2' />";
         	   output += " <circle id='oval1' fill='#8CE8C3' cx='4' cy='2' r='2' />";
         	   output += " </g>";
         	   output += "<g id='grp2' opacity='0' transform='translate(44 6)'>";
         	   output += "<circle id='oval2' fill='#CC8EF5' cx='5' cy='6' r='2' />";
         	   output += "<circle id='oval1' fill='#CC8EF5' cx='2' cy='2' r='2' />";
         	   output += "</g>";
         	   output += "<g id='grp5' opacity='0' transform='translate(14 50)'>";
         	   output += " <circle id='oval1' fill='#91D2FA' cx='6' cy='5' r='2' />";
         	   output += "<circle id='oval2' fill='#91D2FA' cx='2' cy='2' r='2' />";
         	   output += "</g>";
         	   output += " <g id='grp4' opacity='0' transform='translate(35 50)'>";
         	   output += "<circle id='oval1' fill='#F48EA7' cx='6' cy='5' r='2' />";
         	   output += " <circle id='oval2' fill='#F48EA7' cx='2' cy='2' r='2' />";
         	   output += " </g>";
         	   output += " <g id='grp1' opacity='0' transform='translate(24)'>";
         	   output +="<circle id='oval1' fill='#9FC7FA' cx='2.5' cy='3' r='2' />";
         	   output +="<circle id='oval2' fill='#9FC7FA' cx='7.5' cy='2' r='2' />";
         	   output +="</g>";
         	   output +=" </g>";
         	   output +="</svg>";
         	   output +="<div class='numbers'>";
         	   output +="<a class='num1'>14</a>";
         	   output +="<a class='num2'>15</a>";
         	   output +=" </div>";
         	   output +=" </label>";
           }else if(loginId = bowriter) {
         	   output +="<div style='padding-left: 150px; padding-top: 15px;'>";
         	   output +="<button style='margin-left: 40px; margin-right: 0rem!important;; font-weight: bold;' class='badge badge-style mr-3' type='button' onclick='boardUpdate("+bonum+")'>수정</button>";
         	   output +=" <button style='background-color: #D3D3D3; color: #000000; font-weight: bold;' class='badge badge-style mr-3' type='button' onclick='location.href=\"boardDel?bonum="+bonum+"\"'>삭제</button>";
           	output +="</div>";
           }
           	output += "<label for='btitle'>제목</label> ";
           	output +="<input type='text' class='form-control' id='btitle' value=' "+botitle+"' readonly='readonly'> ";
           	output += " <label for='bcontent'>내용</label>";
           	output += "<textarea readonly='readonly' type='text' style='height:170px' class='form-control' id='bcontent' value=' "+bocontent+"' >"+bocontent+"</textarea> 	";
           	output += "	</div>";
           	
           	output += "<div style='width: 420px; height: 180px; float: left'>"
           	output += "<img src='/resources/boardfile/"+bofilename+"' value='"+bofilename+"' style='margin-top: 30px; width: 420px; height: 350px;' id='bfilename'>";
           	output += "</div>"
            output += "</div>"
            output += "</div>"
          	$("#boardUpdate").remove();
          	$("#boardUpdateArea").html(output);
        }
        </script>
        
</html>