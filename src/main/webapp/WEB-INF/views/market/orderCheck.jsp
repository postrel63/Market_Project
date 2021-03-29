<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="../includes/header.jsp"%>
<link rel="stylesheet" href="/resources/custom.css">
<link rel="preconnect" href="https://fonts.gstatic.com">
<link
	href="https://fonts.googleapis.com/css2?family=Nanum+Gothic+Coding&family=Noto+Sans+KR&display=swap"
	rel="stylesheet">
<style>
body, html {
	height: 100%;
}

.page-heading {
	/*     padding: 120px 0px 60px 0px; */
	padding: 0px;
}

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

.contact-form input {
	margin-bottom: 10px;
}

.contact-form input[type=radio], input[type=checkbox] {
	margin-bottom: 10px;
	height: 20px;
}
</style>

<!-- Page Content -->
<div style="height: 80px;">
	<div class="row"></div>
</div>

<%-- <div>
	<c:forEach items="${myStorelist}" var="mylist">
		<input type="button" value="${mylist}"
			onclick="location.href='orderlist?stcode=${mylist}'">

	</c:forEach>
</div> --%>


<div class="container orderPage">
	<section class="top-menu">
		<div class="openClose">
			<i class="bi bi-square-fill"></i><span id="StoreName">${stname}</span>
		</div>
		<div id="clock"></div>
	</section>
	<!-- Main 구역 -->
	<section class="Main">
		<section class=sidebar>
			<ul class="side-leftbar">
				<li style="background-color: var(--black--color);"><button
						onclick="location.href='orderCheck'">
						<i class="bi bi-calendar-minus"></i><span>처리중</span>
					</button></li>
				<li><button onclick="location.href='orderFinish'">
						<i class="bi bi-calendar-check"></i><span>완료됨</span>
					</button></li>

				<li><button class="dropdown-toggle" data-toggle="dropdown"
						aria-haspopup="true" aria-expanded="false">
						<div class="btn-group dropright">
							<i class="bi bi-building" aria-expanded="false"></i><span>점포변경</span>
						</div>
					</button>
					<div class="dropdown-menu dropdown-menu-right">
						<c:forEach items="${myStorelist}" var="mylist">
						<button class="dropdown-item list-group-item-action" onclick="changeStore(this.value)" value="${mylist.stcode}" type="button">${mylist.stname}</button>
						</c:forEach>
						
					</div></li>
			</ul>
			<div class="side-rightbar">
				<ol class="orderDivision" id="divorderDivision">
					<li><input type="radio" name="selectone" checked value="포장"><span>포장</span></li>
					<li><input type="radio" name="selecttwo" checked value="배달"><span>배달</span></li>
				</ol>
				<div class="orderList">
					<p>신규 주문</p>

					<ol id="printorderlist">
					</ol>

					<ol>
						<!-- <label for="orderlisttab"><li class="neworder"><input
								type="radio" id="orderlisttab" name="orderlisttab">
								<p class="newordercode">배달04</p> <span class="newordercount">메뉴2개</span></li></label>
						<li class="neworder"><input type="radio" name="orderlisttab">
							<p class="newordercode">배달05</p> <span class="newordercount">메뉴2개</span></li> -->
					</ol>

					<p>진행 주문</p>

					<ol id="afootorder">

					</ol>
				</div>
			</div>
		</section>
		<!-- sidebar 제외한 content 구역 -->
		<section class="content">
			<div class="content-header">
				<div class="orderState" id="divorderState">
					<p>배달 01</p>
					<span>메뉴 2개</span> <span>총 19400원</span> <span>(결제완료)</span>
				</div>
				<div class="orderChoice" id="divorderChoice">
					<!-- <input type="button" data-toggle="modal" data-target="#exampleModalCenter" value="거부"> 
						<span><a href="#" id="increaseQuantity">▲</a> 
						<span id="numberUpDown">60</span>분
						<a href="#" id="decreaseQuantity">▼</a></span>
						<input type="button" value="접수" onclick="orderReceipt()"> -->
				</div>
			</div>
			<div class="content-body">
				<div class="content-left">
					<div class="requestMemo">
						<strong>요청사항</strong>
						<ol id="divmemo">
							<li class="divtable-title">가게</li>
							<li class="divtable-content" id="chmemo">##</li>
						</ol>
						<ol>
							<li class="divtable-title">배달</li>
							<li class="divtable-content">##</li>
						</ol>
					</div>
					<div class="orderinfo">
						<strong>주문내역</strong>
						<div class="menulist" id="divorderlist">
							<ul class="">
								<li class="prname">##</li>
								<li class="prcount">##</li>
								<li class="prprice">##</li>
							</ul>
						</div>

						<hr>

						<div class="allprice" id="divorderResult">
							<ul>
								<li class="prname"></li>
								<li class="prcount"></li>
								<li class="prprice"></li>
							</ul>
						</div>

					</div>
				</div>

				<div class="ordererinfo" id="divinfo">
					<p>배달지</p>
					<span>...</span>
					<p>고객 연락처</p>
					<span>...</span>
					<p>주문번호</p>
					<span>...</span>
					<p>주문시간</p>
					<span>...</span>
					<p>가게정보</p>
					<span>...</span>
				</div>

			</div>
		</section>
	</section>

</div>

<!-- modal 영역 -->
<div class="modal fade" id="exampleModalCenter" tabindex="-1"
	role="dialog" aria-labelledby="exampleModalCenterTitle"
	aria-hidden="true">
	<div class="modal-dialog modal-dialog-centered" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="exampleModalCenterTitle">주문 취소</h5>
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">
				<div class="container-fluid">
					<strong>주문 취소 사유를 선택하세요</strong><br> <br>
					<div class="list-group">
						<a href="javascript:void(0);" onclick="cancel(this);"
							class="list-group-item list-group-item-secondary list-group-item-action">고객요청</a>
						<a href="javascript:void(0);" onclick="cancel(this);" return
							false; reason="storecircum"
							class="list-group-item list-group-item-secondary list-group-item-action">가게사정</a>
						<a href="javascript:void(0);" onclick="cancel(this);"
							class="list-group-item list-group-item-secondary list-group-item-action">배달불가</a>
						<a href="javascript:void(0);" onclick="cancel(this);"
							class="list-group-item list-group-item-secondary list-group-item-action">재료소진</a>
					</div>
					<br>
				</div>
			</div>
		</div>
	</div>
</div>




<!-- Additional Scripts -->
<script src="/resources/js/custom.js"></script>
<script src="/resources/js/owl.js"></script>
<script src="/resources/js/slick.js"></script>
<script src="/resources/js/isotope.js"></script>


<!-- 
	/* $('.dropdown-toggle').dropdown(); */

	//내 점포 목록 보기
	/*  $.ajax({
	 type : "post",
	 url : "myStorelist",
	 data : {},
	 dataType : "json",
	 success : function(result) {
	 console.log("myStorelist result ::" + result);
	 },
	 error : function() {
	 alert("연결실패");
	 }
	 }); */ -->


<script type="text/javascript">
	//현재 시간
	//실시간
	var tag = document.getElementById("clock");
	tag.innerHTML = timer();
	setInterval(function() {
		tag.innerHTML = timer();
	}, 1000);

	function timer() {
		//현재 시간 불러옴 and 시간 분 초 로 다 나눠서 변수지정
		var date = new Date();
		var hour = date.getHours();
		var ampm = (hour < 12 || hour == 24) ? " AM" : " PM";
		hour = hour % 12 || 12;
		var minute = date.getMinutes();
		minute = (minute > 9) ? minute : "0" + minute;
		var second = date.getSeconds();
		second = (second > 9) ? second : "0" + second;
		var millisec = date.getMilliseconds();
		millisec = (millisec > 99) ? millisec : (millisec > 9) ? "0" + millisec
				: "00" + millisec;

		var timeString = hour + ":" + minute + ":" + second + ampm;
		var year = date.getFullYear();
		var month = date.getMonth() + 1;
		var day = date.getDate();

		var arrayWeek = [ "(일) ", "(월) ", "(화) ", "(수) ", "(목) ", "(금) ",
				"(토) " ];
		var week = date.getDay();
		week = arrayWeek[week];
		var dateString = year + ". " + month + ". " + day + ". " + week;
		return dateString + timeString;
	}
</script>

<script type="text/javascript">



	//주문목록을 보여줌
	$(document).ready(function() {
		console.log("neworderlist");
		neworderlist();
		afootorderlist();
	});

	//주문목록을 불러옴
	function neworderlist() {
		console.log("neworderlist")

		var stcode = "${sessionScope.stcode}";
		console.log(stcode);

		$.ajax({
			type : "post",
			url : "orderlist",
			data : {
				"stcode" : stcode,
			},
			dataType : "json",
			success : function(result) {
				console.log("orderlist result ::" + result);
				printorderlist(result)
			},
			error : function() {
				alert("orderlist연결실패");
			}
		});

	}

	//주문목록 리스트 출력
	function printorderlist(result) {
		console.log("printorderlist");
		var output = '';

		for ( var i in result) {
			var chcode = result[i].chcode;
			var chcode2 = chcode.substring(10);
			var allprcount = result[i].allprcount;
			var chdate = result[i].chdate;
			var allprprice = result[i].allprprice;

			console.log(chcode + "::" + allprcount + "::" + chdate);

			output += "<label for='orderlist"+chcode2+"'>"
			output += "<li class='neworder' onclick='orderdetail(" + chcode
					+ ")'>";
			output += "<input type='radio' id='orderlist"+chcode2+"' name='orderlisttab'>";
			output += "<p class='newordercode'>" + chdate + "</p>";
			output += "<span class='newordercount'>ㅤㅤㅤㅤ</span>";
			output += "<span class='newordercount'>[메뉴" + allprcount
					+ "개]</span>";
			output += "<span class='newordercount'>" + allprprice + "원</span>";
			output += "</li>";
			output += "</label>"

		}
		$("#printorderlist").html(output);

	};

	function afootorderlist() {
		console.log("afootorderlist")

		var stcode = "${sessionScope.stcode}";
		console.log(stcode);

		$.ajax({
			type : "post",
			url : "afootorderlist",
			data : {
				"stcode" : stcode,
			},
			dataType : "json",
			success : function(result) {
				console.log("orderlist result ::" + result);
				printafootorderlist(result)
			},
			error : function() {
				alert("orderlist연결실패");
			}
		});

	}

	//진행중인 주문목록
	function printafootorderlist(result) {
		console.log("printafootorderlist");
		var output = '';

		if (result == null) {
			$("#afootorder").html("<li>진행중인 주문이 없습니다</li>");
		}

		for ( var i in result) {
			var chcode = result[i].chcode;
			var chcode2 = chcode.substring(10);
			var allprcount = result[i].allprcount;
			var chdate = result[i].chdate;
			var allprprice = result[i].allprprice;

			console.log(chcode + "::" + allprcount + "::" + chdate);

			output += "<label for='orderlist"+chcode2+"'>"
			output += "<li class='neworder' onclick='orderdetail(" + chcode
					+ ")'>";
			output += "<input type='radio' id='orderlist"+chcode2+"' name='orderlisttab'>";
			output += "<p class='newordercode'>" + chdate + "</p>";
			output += "<span class='newordercount'>ㅤㅤㅤㅤ</span>";
			output += "<span class='newordercount'>[메뉴" + allprcount
					+ "개]</span>";
			output += "<span class='newordercount'>" + allprprice + "원</span>";
			output += "</li>";
			output += "</label>"

		}
		$("#afootorder").html(output);

	};

	//리스트는 웹소켓으로 상세보기는 에이젝스로 불러오기..?
	function orderdetail(chcode) {
		console.log(chcode)

		$.ajax({
			type : "post",
			url : "orderdetail",
			data : {
				"chcode" : chcode,
			},
			dataType : "json",
			success : function(orderdetail) {

				console.log("orderdetail result ::" + orderdetail);
				printorderdetail(orderdetail);
			},
			error : function() {
				alert("orderlist연결실패");
			}
		});

		$.ajax({
			type : "post",
			url : "orderdetailList",
			data : {
				"chcode" : chcode,
			},
			dataType : "json",
			success : function(orderdetailList) {

				console.log("orderdetailList result ::" + orderdetailList);
				printorderdetailList(orderdetailList);
			},
			error : function() {
				alert("orderlist연결실패");
			}
		});
	}

	function printorderdetail(orderdetail) {
		console.log("printorderdetail");
		var outputmemo = "";
		var outputinfo = "";
		var outputState = "";
		var outputDivision = "";

		var mid = orderdetail.mid; //주문자 아이디
		var chmemo = orderdetail.chmemo; //배송메모
		var addr = orderdetail.receiveaddr; //배송주소
		var pn = orderdetail.receivepn; //고객번호
		var chcode = orderdetail.chcode; //주문코드
		var chcode2 = chcode.substring(10); //주문코드 간편
		var chdate = orderdetail.chdate; //주문시각
		var stname = orderdetail.stname; //가게이름
		var allprprice = orderdetail.allprprice;//총 가격
		var allprcount = orderdetail.allprcount;//총 가격
		var deliway = orderdetail.deliway; //주문 방식
		var chway = orderdetail.chway; //결제 방식
		var delitime = orderdetail.delitime; //배달 도착 예상시간
		var delistate = orderdetail.delistate; //배달 상태 

		$("#StoreName").html("<span>" + stname + "</span>");

		console.log(mid + "::" + delistate);

		if (chway == "card") {
			chway = "결제완료";
		} else if (chway == "money") {
			chway = "현금결제";
		} else {
		}
		;

		console.log(chmemo, addr, pn, chcode, chdate, stname);

		outputmemo += "<li class='divtable-title'>가게</li>";
		outputmemo += "<li class='divtable-content' id='chmemo'>" + chmemo
				+ "</li>";
		$("#divmemo").html(outputmemo);

		outputinfo += "<p>배달지</p>";
		outputinfo += "<span>" + addr + "</span>";
		outputinfo += "<p>고객 연락처</p>";
		outputinfo += "<span>" + pn + "</span>";
		outputinfo += "<p>주문번호</p>";
		outputinfo += "<span id='chcode'>" + chcode + "</span>";
		outputinfo += "<p>주문시간</p>";
		outputinfo += "<span>" + chdate + "</span>";
		outputinfo += "<p>가게정보</p>";
		outputinfo += "<span id='stname'>" + stname + "</span>";
		$("#divinfo").html(outputinfo);

		outputState += "<p>주문 " + chcode2 + "</p>";
		outputState += "<span>메뉴 " + allprcount + "개</span> <span>총"
				+ allprprice + "원</span> <span>(" + chway + ")</span>"
		$("#divorderState").html(outputState);

		//주문 배달 현장 택하는것
		if(deliway == "deli"){
			$("input:radio[value='배달']").prop('checked', true); 
			$("input:radio[value='포장']").prop('checked', false); 
		}else if (deliway == "packing"){
			$("input:radio[value='배달']").prop('checked', false); 
			$("input:radio[value='포장']").prop('checked', true); 
				};
		
		//<li><input type="radio" name="selectone"><span>포장</span></li>
		//<li><input type="radio" name="selectone"><span>배달</span></li>
		//<li><input type="radio" name="selectone"><span>매장</span></li>
		//$("#divorderDivision").html(outputDivision);

		//총 가격 html
		var outputorderResult = "";

		outputorderResult += "<ul>";
		outputorderResult += "<li class='prname'></li>"
		outputorderResult += "<li class='prcount'>" + allprcount + "</li>"
		outputorderResult += "<li class='prprice'>" + allprprice + "원</li>"
		outputorderResult += "</ul>"

		$("#divorderResult").html(outputorderResult);
		//주문 접수 거절 창

		var outputorderChoice = "";

		if (delistate == "주문접수중") {
			outputorderChoice += " <input type='button' data-toggle='modal' data-target='#exampleModalCenter' value='거부'>"
			outputorderChoice += " <span><a href='javascript:void(0);' onclick='increaseQuantity()'>▲</a> "
			outputorderChoice += " <span id='numberUpDown'>60</span>분"
			outputorderChoice += " <a href='javascript:void(0);' onclick='decreaseQuantity()'>▼</a></span>"
			outputorderChoice += " <input type='button' value='접수' onclick='orderReceipt()'>"
			outputorderChoice += " <input type='hidden' id='replymid' value='"+mid+"'>"

			$("#divorderChoice").html(outputorderChoice);
		} else if (delistate == "배달준비중") {
			outputorderChoice += " <input type='button' data-toggle='modal' data-target='#exampleModalCenter' value='취소'>"
			outputorderChoice += " <input type='button' value='배달 시작' onclick='deliStart()'>"
			outputorderChoice += " <input type='button' value='배달 완료' onclick='deliEnd()'>"
			outputorderChoice += " <input type='hidden' id='replymid' value='"+mid+"'>"

			$("#divorderChoice").html(outputorderChoice);
		} else if (delistate == "배달중") {
			outputorderChoice += " <input type='button' data-toggle='modal' data-target='#exampleModalCenter' value='취소'>"
			outputorderChoice += " <input type='button' value='완료처리하기' onclick='deliEnd()'>"
			outputorderChoice += " <input type='hidden' id='replymid' value='"+mid+"'>"
			$("#divorderChoice").html(outputorderChoice);
		}

	}

	//주문 시간 업 다운
//	$(function() {
		function decreaseQuantity() {
			console.log("down btn click")
			var stat = $('#numberUpDown').text();
			var num = parseInt(stat, 10);
			num = num - 10;
			if (num <= 0) {
				/* alert('더이상 줄일수 없습니다.'); */
				num = 5;
			}
			$('#numberUpDown').text(num);
		};
		function increaseQuantity() {
			console.log("up btn click")
			var stat = $('#numberUpDown').text();
			var num = parseInt(stat, 10);
			num = num + 10;

			if (num > 120) {
				/* alert('더이상 늘릴수 없습니다.'); */
				num = 120;
			}
			$('#numberUpDown').text(num);
		};
	//});

	

	//주문 상세보기 안에서 주문 리스트 보기
	function printorderdetailList(orderdetailList) {
		console.log("printorderdetailList(orderdetailList)")
		var outputorderlist = "";
		for ( var i in orderdetailList) {
			var allprprice = orderdetailList[i].allprprice;
			var prname = orderdetailList[i].prname;
			var prcount = orderdetailList[i].prcount;
			var prprice = orderdetailList[i].prprice;

			//	outputorderlist += "<div class='menulist'>"
			outputorderlist += "<ul class=''>"
			outputorderlist += "<li class='prname'>" + prname + "</li>"
			outputorderlist += "<li class='prcount'>" + prcount + "</li>"
			outputorderlist += "<li class='prprice'>" + prprice + "원</li>"
			outputorderlist += "</ul>"
			//	outputorderlist += "</div>"

		}

		$("#divorderlist").html(outputorderlist);

	}

	//주문 취소
	function cancel(data) {
		console.log("hi");
		//a태그 텍스트 가져오는 법
		var reason = $(data).text();
		console.log(reason);
		var chcode = $("#chcode").text();
		var stname = $("#stname").text();
		console.log(chcode);

		//고객에게 메세지
		var mid = $("#replymid").val();
		var temp = temp;
		console.log(mid);
		console.log("주문취소")
		//주문 취소 // 소켓을 통해 취소 메세지. (cancel(cmd),주문자(고객),가게이름,취소사유,temp, (order(cmd),mid,chcode,prallcount,stcode))

		let socketMsg = "cancel" + "," + mid + "," + stname + "," + reason
				+ "," + temp;
		console.log(socketMsg);
		socket.send(socketMsg);

		//주문 삭제
		$.ajax({
			type : "post",
			url : "orderdelete",
			data : {
				"chcode" : chcode,
			},
			success : function() {
				location.reload();
				alert("주문취소");
			},
			error : function() {
				console.log("주문삭제 실패")
			}
		});
	}

	//주문 접수
	function orderReceipt() {
		//배달남은시간,주문번호,고객아이디
		var delitime = $("#numberUpDown").text();
		var chcode = $("#chcode").text();
		var stname = $("#stname").text();
		console.log(delitime);
		console.log(chcode);

		var mid = $("#replymid").val();
		var temp = temp;
		console.log(mid);
		console.log("orderReceipt112")
		//주문 접수 후 소켓을 통해 주문정보를 전달해준다. (accept(cmd),주문자(고객),배달예상시간,가게이름,temp, (order(cmd),mid,chcode,prallcount,stcode))

		let socketMsg = "accept" + "," + mid + "," + delitime + "," + stname
				+ "," + temp;
		console.log(socketMsg);
		socket.send(socketMsg);

		//주문 접수가 완료되면 신규에서 진행으로 목록 이동 ( 업데이트 주문접수중 -> 배달준비중 )
		//			action_remove()
		$.ajax({
			type : "post",
			url : "newToafoot",
			data : {
				"delitime" : delitime,
				"chcode" : chcode,
			},
			dataType : "json",
			success : function(result) {
				console.log("newToafoot result ::" + result);
				location.reload();
				alert("주문접수");
				sendacceptmessage();
				//orderdetail(chcode);
			},
			error : function() {
				alert("연결실패");
			}
		});



		
	}


	

	//배달 시작
	function deliStart() {
		//주문번호,고객아이디
		var chcode = $("#chcode").text();
		var stname = $("#stname").text();
		console.log(chcode);

		var mid = $("#replymid").val();
		var temp = temp;
		console.log(mid);
		console.log("배달 출발")

		//주문 접수 후 소켓을 통해 주문정보를 전달해준다. (start(cmd),주문자(고객),가게이름,temp,temp, (start(cmd),mid,stname,prallcount,stcode))
		let socketMsg = "start" + "," + mid + "," + stname + "," + temp + ","
				+ temp;
		console.log(socketMsg);
		socket.send(socketMsg);

		// 진행에서 완료로 목록 이동 ( 업데이트 배달준비중 -> 배달중 )
		//			action_remove()
		$.ajax({
			type : "post",
			url : "afootToStart",
			data : {
				"chcode" : chcode,
			},
			dataType : "json",
			success : function(result) {
				console.log("afootToStart result ::" + result);
				location.reload();
				alert("배달출발");
			//	var autoclick = ".neworder" + chcode;
			//	console.log(autoclick);
			//	$(".neworder" + chcode).trigger("click");
			},
			error : function(error) {
				alert("연결실패");
			}
		});
	}
	
	//배달 완료
	function deliEnd() {
		//주문번호,고객아이디
		var chcode = $("#chcode").text();
		var stname = $("#stname").text();

		var mid = $("#replymid").val();
		var temp = temp;

		//배달 완료 후 소켓을 통해 완료메세지를 전달해준다. (deliEnd(cmd),주문자(고객),가게이름,temp,temp, (start(cmd),mid,stname,prallcount,stcode))
		let socketMsg = "deliEnd" + "," + mid + "," + stname + "," + temp + "," + temp;
		console.log(socketMsg);
		socket.send(socketMsg);

		// 진행에서 완료로 목록 이동 ( 업데이트 배달준비중 -> 배달중 )
		//			action_remove()
		$.ajax({
			type : "post",
			url : "deliEnd",
			data : {
				"chcode" : chcode,
			},
			dataType : "json",
			success : function(result) {
				console.log("deliEnd result ::" + result);
				location.reload();
				alert("배달완료");
			
			},
			error : function() {
				alert("연결실패");
			}
		});
	}

//가게 변경
	function changeStore(val){
		console.log(val);
		console.log("가게 변경")
		
		disconnect();
		$.ajax({
			type : "post",
			url : "changeStore",
			data : {
				"stcode" : val,
			},
		//	dataType : "json",
			success : function() {
				console.log("세션변경성공")
				connectWS();
				location.reload();
			
			},
			error : function() {
				connectWS();
				alert("연결실패");
			}
		});

		};

	
</script>



</html>

<%@ include file="../includes/footer.jsp"%>