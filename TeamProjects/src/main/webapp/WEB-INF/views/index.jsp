<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="includes/header.jsp"%>
<link rel="stylesheet" href="/resources/custom.css">
<link rel="preconnect" href="https://fonts.gstatic.com">
<link
	href="https://fonts.googleapis.com/css2?family=Nanum+Gothic+Coding&family=Noto+Sans+KR&display=swap"
	rel="stylesheet">
<!-- Banner Starts Here -->
<div class="banner header-text">
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

<form id="chatForm">
		<input type="text" id="message"/>
		<button>send</button>
	</form>
	<div id="chat"></div>
	
	<script>
		$(document).ready(function(){
			$("#chatForm").submit(function(event){
				event.preventDefault();
				socket.send($("#message").val());
				$("#message").val('').focus();
			});
		connectWS();
		});
	</script>
	
	




<%@ include file="includes/footer.jsp"%>