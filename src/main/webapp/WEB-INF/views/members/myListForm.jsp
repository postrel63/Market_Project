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

#sub {
	color: black;
	background-color: white;
	border-color: #1a73e8;
}

#sub:hover {
	color: #fff;
	background-color: #1a73e8;
	border-color: ##1a73e8;
}

#cancle {
	color: black;
	background-color: white;
	border-color: #bd2130;
}

#cancle:hover {
	color: #fff;
	background-color: #c82333;
	border-color: #bd2130;
}

#formContent {
	-webkit-border-radius: 10px 10px 10px 10px;
	border-radius: 10px 10px 10px 10px;
	background: #fff;
	padding: 30px;
	width: 400%;
	max-width: 2000px;
	position: relative;
	padding: 0px;
	-webkit-box-shadow: 0 30px 60px 0 rgba(0, 0, 0, 0.3);
	box-shadow: 0 30px 60px 0 rgba(0, 0, 0, 0.3);
	text-align: center;
}

.final-payment {
	padding: 5px 0 5px;
	text-align: center;
}

.final-payment-ment {
	margin-right: 12px;
	font-size: 12px;
	color: #777;
}

.final-payment p {
	display: inline-block;
	margin-bottom: 0px;
}

.final-payment li {
	display: inline-block;
	margin: 0 14px;
	line-height: 30px;
}
</style>
<body>




	<!-- Page Content -->
	<!-- <div class="page-heading contact-heading header-text">
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<div class="text-content">
						<h4>MEMBER VIEW</h4>
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
		style="width: 1300px; height: 600px; float: left; ">
		<div class="col-md-12">
			<div class="section-heading" style="margin-left: 300px;">
				<br>
				<h1 style="text-align: center">${sessionScope.loginId}님주문목록</h1>
				<br>
			</div>
		</div>


		<div>





			<div style="width: 1200px;">


				<div style="width: 1000px; height: 400px; float: right;">
					<div style="width: 300px; height: 400px; float: left;">

						<div id="formContent">
							<div class="col-md-12">
								<div class="left-content">
									<table class="table">
										<thead>
											<tr>
												<th scope="col">주문코드</th>
												<th scope="col">결제 날짜</th>
												<th scope="col">상품 정보</th>
												<th scope="col">결제 가격</th>
												<th scope="col">수령인 이름</th>
												<th scope="col">주문 상태</th>
											</tr>
										</thead>
										 <tbody>
						<%-- 	<c:forEach items="${list}" var="list">
							<tr>
							<td>${list.chcode}</td>
							<td>${list.chdate}</td>
							<td>${list.}</td>
							<td>${list.allprcount}</td>
							<td>${list.allprprice}</td>
							<td>${list.receivepn}</td>
							<td>${list.chway}</td>
							<td>${list.delistate}</td>
							</tr>
							</c:forEach> --%>
						</tbody> 
										<tbody id="orderlist">

											<tr>
												<td>s014</td>
												<td>2020/02/04</td>
												<td>족발</td>
												<td>2</td>
												<td>35000원</td>
												<td>곽우진</td>
												<td>카드</td>
												<td>배달완료</td>
											</tr>

										</tbody>
									</table>


									<hr>

									<div>
										<ul class="final-payment">
										</ul>
									</div>






								</div>
							</div>
						</div>
					</div>

				</div>


			</div>


		</div>
	</div>











</body>
<script type="text/javascript">

	   $(document).ready(function() {
		      console.log("printcartList");
		      myorderlist();
		   });
			
function myorderlist(){

	$.ajax({
		type : "post",
		url : "myorderlist",
		data : {
		},
		dataType : "json",
		success : function(result) {
			console.log("myorderlist"+result)
			//location.reload();
		console.log(result[0].prname);
		console.log(result[1].chcode);
			printorderlist(result);
		
		},
		error : function() {
		}
	});
}

function printorderlist(result){
	var output ="";

	for ( var i in result) {
	var count =result[i].allprcount;
	
	output+="<tr>"
	output+="<td>"+result[i].chcode+"</td>"
	output+="<td>"+result[i].chdate+"</td>"
	output+="<td>"+result[i].prname+" 외 "+count+"개</td>"
	output+="<td>"+result[i].allprprice+"</td>"
	output+="<td>곽우진</td>"
	output+="<td>"+result[i].delistate+"</td>"
	output+="</tr>"
	}
$("#orderlist").html(output);
	
}


</script>
<%@ include file="../includes/footer.jsp"%>