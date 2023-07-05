<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="../includes/header.jsp"%>

<style>
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


</style>
 <!-- Page Content -->
  <!--  <div class="page-heading contact-heading header-text">
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



<div class="best-features about-features">
	<div class="container" style="width: 1900px; height: 600px; float: left; padding-left: 300px;">
		<div class="row" style="width: 1100px;">
			<div class="col-md-12">
				<div class="section-heading">
					<h2>PRODUCTS</h2>
				</div>
			</div>

		
		<div style="width:1085px; height:50px;">
<select id="selectstore" class="form-control"  onchange="selectStore()" style="width: 150px; float:left; margin-left:14px;">
	 	 <option value="">--가게선택--</option>
	 	 <c:forEach var="storeList" items="${storeList}">
		<option value="${storeList.stcode}">${storeList.stname}</option>
	   </c:forEach> 

		</select>
		<button class="btn btn-outline-secondary btn-sm" type="button"  style="width: 100px; float:right; " onclick="selectalert()">상품 등록</button>
		</div>
	
	

			<div class="col-md-12">
				<div class="left-content">
					<table class="table">
						<thead>
							<tr>
							    <th scope="col">판매가능상품<th> 
								<th scope="col">번호</th>
								<th scope="col">상품명</th>
								<th scope="col">상품이미지</th>
								<th scope="col">가격</th>
								<th scope="col">수량</th>
								<th scope="col">상품설명</th>
								<th scope="col">상품관리</th>
							</tr>
						</thead>
						<tbody id="List">
							
						</tbody>
					</table>
			
					

					<hr>
					<div>
					 <button class="btn btn-outline-secondary btn-sm"onclick="checkboxall()" style='margin-right:5px;'>전체선택</button><button class="btn btn-outline-secondary btn-sm" onclick="checkboxnone()">전체해제</button>
						<ul class="final-payment">
							<li>
								<p class="final-payment-ment">전체상품</p>
								<p class="final-payment-price">
									<span id="productsAllcount"><strong>0</strong></span>개
								</p>
							</li>
							
							<li>
								<p class="final-payment-ment">판매중</p>
								<p class="final-payment-price">
									<span id="productscount">0</span>개
								</p>
							</li>
							
						</ul>
					</div>
						<div class="purchase-btn-area">
						<button type="button" class="btn btn-primary btn-dark btn-lg "
							style="float: right" onclick="operateConditioncancle()" >판매종료</button>
					</div>
					<div class="purchase-btn-area"  >
						<button type="button" class="btn btn-primary btn-dark btn-lg "
							style="float: right; margin-right:10px;" id="startproducts" onclick="operateCondition()">판매시작</button>
					</div>
					




					
				</div>
			</div>
		</div>
	</div>
</div>
<form  id="productjoinModal" method="post" enctype="multipart/form-data">
<div class="modal" tabindex="-1" role="dialog" id="myModal">
  <div class="modal-dialog" role="document"  style="margin:0 auto; margin-top:80px;">
    <div class="modal-content" style="width:700px;">
      <div class="modal-header">
        <h5 class="modal-title">상품등록</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close" onclick="resetProduct()">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      

      <div class="modal-body" style="padding:50px;">


					<input type="hidden" value="${sessionScope.loginId}" name="bid">



					<div style="width: 600px; height: 600px;">

							<div class="input-group mb-3">
									<div class="input-group-prepend">
										<span class="input-group-text" id="basic-addon1">이름</span>
									</div>
									<input type="text" class="form-control" name="prname" id="prname"
										placeholder="상품이름을 입력해주세요" aria-describedby="basic-addon1">
								</div>
								
							
							
						<div style="width: 600px; height: 70px;">
							<div
								style="width: 280px; height: 50px; float: left; margin-right: 40px; ">




								<div class="input-group mb-3">
									<div class="input-group-prepend">
										<span class="input-group-text" id="basic-addon1">수량</span>
									</div>
									<input type="text" class="form-control" name="prstock" id="prstock"
										placeholder="수량을 입력해주세요" aria-describedby="basic-addon1">
								</div>
								
								
							</div>
							<div style="width: 280px; height: 50px; float: left; ">
								<div class="input-group mb-3">
									<div class="input-group-prepend">
										<span class="input-group-text" id="basic-addon1">가격</span>
									</div>
									<input type="text" class="form-control"
										placeholder="가격을 입력해주세요" aria-describedby="basic-addon1" name="prprice" id="prprice">
								</div>
								
								

							</div>
						</div>

						<label>물품소개</label>
						<textarea class="form-control" name="prnote" id="prnote"
							style="height: 400px;"></textarea>
							<input type="hidden" name="stcode" id="setstcode">
                            <input type="hidden" name="prcode" id="prcode"> 
                           <input type="hidden" id="check">
                         


						<div style="float:right; margin-top:10px;">
						 <label class="btn btn-primary btn-file"
                  style="color: #009688; background-color: transparent; border-color: #ccc; height:40px; margin-right:5px;  ">
                      파일 첨부<input type="file"  
                        id="primagename" name="primagename" style=" display:none; " >
                        </label>
                        </div>
						
							


</div>


					</div>
					<div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary" onclick="productjoinModal()">등록하기</button>
      </div>
    </div>
  </div>
</div>
</div>
</form>                       



<script type="text/javascript">



function checkboxall(){//체크박스 전체 선택
     $('input:checkbox[type=checkbox]').prop("checked", true);
}
function checkboxnone(){//체크박스 전체 해제
	$('input:checkbox[type=checkbox]').prop("checked", false);
}

function operateCondition(){    //판매 시작
	var stcode=$("#selectstore").val();  //선택한 옵션의 값 
	var checklength=$('input:checkbox[type=checkbox]:checked').length;
	
	 $.ajax({
			type:"post",
			url:"stoperatecheck",
			data :{
	             
	              "stcode":stcode
				},
			dataType:"text",
			async:false,
			success :function(result){
				 
				  if(result=="OPEN"){
                         alert("판매 종료를 눌러주세요");
					  }else{
						  if(checklength>0){
						  alert("판매가 시작되었습니다.");
						  prcheckbox();
						  $('input:checkbox[type=checkbox]').prop("checked", false);
						  productCount();//판매중상품갯수 출력 
						  }
						  else{
                           alert("물품을 1개 이상 선택해 주세요");
							  }
						  }
				  
				},
				error:function(){
	                  alert("연결실패");
					}
				

			}); 
	
}

function operateConditioncancle(){    //판매 종료 
	var stcode=$("#selectstore").val();  //선택한 옵션의 값 
	
	 $.ajax({
			type:"post",
			url:"stoperatecheck",
			data :{
	             
	              "stcode":stcode
				},
			dataType:"text",
			async:false,
			success :function(result){
				  
				  if(result=="OPEN"){
                         alert("판매가 종료되었습니다.");
                         prcheckcancle();
                         productCount();//판매중상품갯수 출력
          
	} else {

					alert("판매를 시작해주세요.");

				}

			},
			error : function() {
				alert("연결실패");
			}

		});

	}

	function prcheckcancle() { //판매종료시 전체 false
		var stcode = $("#selectstore").val(); //선택한 옵션의 값 
		var operate = "CLOSE";
		$.ajax({
			type : "post", //가게 open close 확인
			url : "stcheck",
			data : {
				"operate" : operate,
				"stcode" : stcode
			},
			dataType : "text",
			async : false,
			success : function(result) {
				console.log("성공성공@operate");
			},
			error : function() {
				alert("연결실패");
			}

		});

		$('input:checkbox[type=checkbox]').each(function() { //모든 체크박스의값을 false로 만든다.
			var test = $(this).val();
			var prcheck = "FALSE";
			console.log(test);
			$.ajax({
				type : "post",
				url : "prcheckbox",
				data : {
					"prcode" : test,
					"prcheck" : prcheck
				},
				dataType : "text",
				async : false,
				success : function(result) {
					console.log("성공성공@");
				},
				error : function() {
					alert("연결실패");
				}

			});

		});
	}

	function prcheckbox() { //판매시작시 check된 항목의 값들을 DB로 넘겨줌
		var stcode = $("#selectstore").val(); //선택한 옵션의 값 
		var operate = "OPEN";
		$.ajax({
			type : "post",
			url : "stcheck",
			data : {
				"operate" : operate,
				"stcode" : stcode
			},
			dataType : "text",
			async : false,
			success : function(result) {
				console.log("성공성공@operate");
			},
			error : function() {
				alert("연결실패");
			}

		});

		$('input:checkbox[type=checkbox]:checked').each(function() {
			var test = $(this).val();
			var prcheck = "TRUE";
			console.log(test);
			$.ajax({
				type : "post",
				url : "prcheckbox",
				data : {
					"prcode" : test,
					"prcheck" : prcheck
				},
				dataType : "text",
				async : false,
				success : function(result) {
					console.log("성공성공@");
				},
				error : function() {
					alert("연결실패");
				}

			});

		});

	}

	function deleteProduct(prcode) {
		console.log("딜리트" + prcode);
		var stcode = $("#selectstore").val();
		$.ajax({
			type : "post",
			url : "deleteProduct",
			data : {
				"prcode" : prcode,
				"stcode" : stcode
			},
			dataType : "json",
			success : function(result) {

				productList(result);
				alert("물품이 삭제 되었습니다.");

			},
			error : function() {
				alert("실패");
			}

		});

	}



	function selectalert() { //가게선택 경고창
		var stcode = $("#selectstore").val();
		if (stcode == '') {
			alert("가게를 선택해주세요"); //가게를 선택하지 않았을경우 경고창을 띄움
		} else {
			resetProduct();//가게 초기화
			$('#myModal').modal(); // 가게를 선택했을경우 모달을 띄워준다.
		}
	}

	function productjoinModal() { //파일 등록
		var form = $("#productjoinModal")[0];
		var formData = new FormData(form); //formdata 가져오기
		var check = $("#check").val();
		console.log("!!!" + check);
		console.log(form);

		if (check == '') {
			$.ajax({
				type : "post",
				url : "productjoinModal",
				processData : false,
				contentType : false,
				data : formData,
				async : false,
				dataType : "json",
				success : function(result) {
					console.log(result);
					$('#myModal').modal('hide');
					productList(result);
					alert("물품이 등록되었습니다.");
				},
				error : function(e) {
					console.log(e);
				}
			});
		} else if (check == 'Modify') {
			console.log("Modify폼" + check);
			$.ajax({
				type : "post",
				url : "productModifyModal",
				processData : false,
				contentType : false,
				data : formData,
				async : false,
				dataType : "json",
				success : function(result) {
					console.log(result);
					$('#myModal').modal('hide');
					productList(result);
					alert("물품이 수정되었습니다.");
				},
				error : function(e) {
					console.log(e);
				}
			});

		}

	}

   function productCount(){        //판매중인상품 체크
		var stcode = $("#selectstore").val(); //선택한 옵션의 값 
		$.ajax({
			type : "post",
			url : "productCount",
			data : {
				"stcode" : stcode
			},
			dataType : "text",
			success : function(result) {
                      console.log(result);
				$("#productscount").text(result);

			},
			error : function() {
				alert("실패");
			}

		});
	   }

	
	function selectStore() {
		var stcode = $("#selectstore").val(); //선택한 옵션의 값 
		$("#setstcode").val(stcode); //모달에 가게코드 form안에 넣어주기
		console.log(stcode);

		$.ajax({
			type : "post",
			url : "storeProductsView",
			data : {
				"stcode" : stcode
			},
			dataType : "json",
			success : function(result) {

				productList(result);

			},
			error : function() {
				alert("실패");
			}

		});
	}

	function productList(result) { // 상품 리스트들을 띄워줌
		console.log("productsList");
		var output = '';
		var number = 0;
		
		for ( var i in result) {
			number = (number + 1);
			var prname = result[i]["prname"];
			var prprice = result[i]["prprice"];
			var prcode = result[i]["prcode"];
			var primage = result[i]["primage"];
			var prprice = result[i]["prprice"];
			var prstock = result[i]["prstock"];
			var prnote = result[i]["prnote"];
			console.log(prname);
			console.log(prcode);
			console.log("prstock" + prstock);

			output += "<input type='hidden' value="+prcode+"  id="+i+" >"

			output += "<tr><td scope='row'><input type='checkbox' value="+prcode+" id="+i+"number"+"  name='checkbox'></td>";
			output += "<td></td>";
			output += "<th scope='row' >" + number + "</th>";
			output += "<td >" + prname + "</td>";
			output += "<td><img src='/resources/primgfile/"+primage+"' style='width:100px; height:70px;'></td>";
			//이미지 코드 수정요망 데이터 삽입시
			output += "<td>" + prprice + "</td>"
			output += "<td>" + prstock + "</td>"
			output += "<td>" + prnote + "</td>"
			output += "<td><button class='btn btn-outline-secondary btn-sm' type='button' onclick='prModify("+ i+ ")' data-toggle='modal' data-target='#myModal'style='margin-right:5px;'>수정</button><button type='button' class='btn btn-outline-secondary btn-sm' onclick='deleteProduct(\""+ prcode + "\")'>삭제</button> </td>"
			output += "</tr>";

		}
		$("#List").html(output);
		productCount();//판매중상품갯수 출력
		
		$("#productsAllcount").text(result.length); //상품의 전체 개수
	};

	function prModify(num) { //   prcode를 받아 수정할 데이터 출력
		console.log("@" + num);
		var prcode = $("#" + num).val();

		$.ajax({
			type : "post",
			url : "productModifyinfo",
			data : {
				"prcode" : prcode
			},
			dataType : "json",
			success : function(result) {
				productModifyinfo(result);
			},
			error : function() {
				alert("연결실패");
			}

		});

	}

	function productModifyinfo(result) { //수정을 누르면 폼에 해당값을 넣어준다(수정창)
		$("#prcode").val(result.prcode);
		$("#prname").val(result.prname);
		$("#prstock").val(result.prstock);
		$("#prprice").val(result.prprice);
		$("#prnote").val(result.prnote);
		$("#check").val("Modify");
	}

	function resetProduct() { //등록될 값을 초기화 시켜줌(등록창)
		$("#prcode").val("");
		$("#prname").val("");
		$("#prstock").val("");
		$("#prprice").val("");
		$("#prnote").val("");
		$("#check").val("");

	}
</script>



<%@ include file="../includes/footer.jsp"%>
