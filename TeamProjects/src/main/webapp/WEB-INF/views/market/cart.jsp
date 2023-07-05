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
</style>

<!-- Banner Starts Here -->
<!-- <div class="banner header-text">
	<div class="owl-banner owl-carousel">
		<div class="banner-item-01">
			<div class="text-content">
				<h4>Best Offer</h4>
				<h2>New Arrivals On Sale</h2>
			</div>
		</div>
		<div class="banner-item-02">
			<div class="text-content">
				<h4>Flash Deals</h4>
				<h2>Get your best products</h2>
			</div>
		</div>
		<div class="banner-item-03">
			<div class="text-content">
				<h4>Last Minute</h4>
				<h2>Grab last minute deals</h2>
			</div>
		</div>
	</div>
</div>
 -->



<div class="best-features about-features">
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<div class="section-heading">
					<h2>Cart / Payment</h2>
				</div>
			</div>


			<div class="col-md-12">
				<div class="left-content">
					<table class="table">
						<thead>
							<tr>
								<th scope="col">번호</th>
								<th scope="col"><input type="checkbox" id="allCheck" name="allCheck"></th>
								<th scope="col"></th>
								<th scope="col">상품명</th>
								<th scope="col">판매가</th>
								<th scope="col">할인율</th>
								<th scope="col">수량</th>
								<th scope="col">구매가</th>
								<th scope="col">주문관리</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="cartView" items="${cartView }">
								<tr>
									<th scope="row">${cartView.canum }</th>
									<td><input type="checkbox" class="cartCheck" name="cartCheck" data-cartcode="${cartView.prcode}"></td>
									<td><img src="/resources/primgfile/${cartView.primage}" style="width:50px;  "></td>
									<td>${cartView.prname }</td>
									<td><fmt:formatNumber pattern="###,###,###"
											value="${cartView.prprice}" />원</td>
									<td>${cartView.prsaleper}%</td>
									<td>${cartView.prcount }</td>
									<td><fmt:formatNumber pattern="###,###,###" 
											value="${cartView.prprice*cartView.prcount }" />원</td>
									<td><button type="button"
											class="btn btn-outline-secondary"
											onclick="location.href='cartdel?mid=${sessionScope.loginId}&prcode=${cartView.prcode}'">삭제하기</button></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
					<!-- delete btn area -->
					<div class="delete-btn-area" style="margin: 10px 0 20px;">
						<button type="button" class="btn btn-outline-secondary btn-sm"
							style="">선택 삭제</button>
						<button type="button" class="btn btn-outline-secondary btn-sm"
							style="">모두 삭제</button>
					</div>
					<div>
						<!-- explain area -->
						<ul>
							<li>"구매 가능 수량이 1개로 제한된 상품은 주문 취소 시, 24시간 내 가상계좌 재주문이 불가합니다."</li>
							<li>"시장가장은 기본적으로 전 상품 무료 배송입니다."</li>
							<li>"해외배송 상품은 배송료가 추가로 발생될 수 있습니다."</li>
						</ul>
					</div>

					<hr>
					<div>
						<ul class="final-payment">
							<li>
								<p class="final-payment-ment">상품 금액</p>
								<p class="final-payment-price">
									<span id="paysum"><strong>${cartallprice}</strong></span>원
								</p>
							</li>
							<i class="btn-plus"></i>
							<li>
								<p class="final-payment-ment">배송비</p>
								<p class="final-payment-price">
									<span id="paydeli">0</span>원
								</p>
							</li>
							<li>
								<p class="final-payment-ti">최종 결제 금액</p>
								<p class="final-payment-price">
									<span id="paysumall"><strong>${cartallprice}</strong></span>원
								</p>
								
							</li>
						</ul>
					</div>
					<div class="purchase-btn-area">
						<button type="button" class="btn btn-primary btn-dark btn-lg "
							style="float: right" >구매하기</button>
					</div>




					<ul class="social-icons">
						<li><a href="#"><i class="fa fa-facebook"></i></a></li>
						<li><a href="#"><i class="fa fa-twitter"></i></a></li>
						<li><a href="#"><i class="fa fa-linkedin"></i></a></li>
						<li><a href="#"><i class="fa fa-behance"></i></a></li>
					</ul>
				</div>
			</div>
		</div>
	</div>
</div>


<script type="text/javascript">

$("#allCheck").click(function(){ //모든 체크박스 체크
	 var chk = $("#allCheck").prop("checked");
	 if(chk) {
	  $(".cartCheck").prop("checked", true);
	 } else {
	  $(".cartCheck").prop("checked", false);
	 }
	});


$(".cartCheck").click(function(){ // 일부상품 체크하면 모든 allcheck 체크취소
	  $("#allCheck").prop("checked", false);
	

		 
	});

	function cartdel() { //상품 삭제

	}

	$(".cartCheck").click(function(){  //체크상품 가격만 종합하도록

		
	
		}); 
	

	
	
</script>



<%@ include file="../includes/footer.jsp"%>
