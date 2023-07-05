
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ include file="../includes/header.jsp"%>
	
<!--검색아이콘 -->
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">

<style>
table {
	width: 100%;
	border-top: 1px solid #444444;
	border-collapse: collapse;
}

th, td {
	border-bottom: 1px solid silver;
	padding: 10px;
	text-align: center;
}

div.gallery {
	margin: 25px;
	border: 1px solid #ccc;
	float: left;
	width: 220px;
}
div.gallery:hover {
	border: 1px solid #777;
}
div.gallery img {
	width: 100%;
	height: auto;
}
div.desc {
	padding: 15px;
	text-align: center;
}
.containers {
     width: 100%;
	padding: 50px 115px 30px 115px; 
	text-align: center; 
	
}
.containerss {
    width: 1500px;
	padding: 40px 0px 0px 20px;
	text-align: center;
}
#search {
	text-align: center;
}

.inContaners {
width: 100%;
}

/* paging */
.tm-paging-link {
    display: flex;
    justify-content: center;
    align-items: center;
    width: 20px;
    height: 20px;
    font-size: 3px;
    color: #999;
    background-color: #EEEEEE;
    margin: 10px;
    border-radius: 5px;
    text-decoration: none;
    transition: all 0.3s ease;
}

.tm-paging-link:hover,
.tm-paging-link.active {
    background-color: #009999;
    color: #fff; 
}

#chageHeight {
	margin-top: 50px;
}

/* search */

#form{
    /*  position: relative;
    top: 50%;
    left: 50%;*/
    transform: translate(-50%,-50%); 
    transition: all 1s;
    width: 50px;
   /*  height: 50px; */
    background: white;
    box-sizing: border-box;
    border-radius: 25px;
    border: 4px solid white;
    padding: 5px;
}

input{
    position: absolute;
    top: 0;
    left: 0;
    width: 100%;;
    height: 42.5px;
    line-height: 30px;
    outline: 0;
    border: 0;
    display: none;
    font-size: 1em;
    border-radius: 20px;
    padding: 0 20px;
}

.fa{
    box-sizing: border-box;
    padding: 10px;
    width: 42.5px;
    height: 42.5px;
    position: absolute;
    top: 0;
    right: 0;
    border-radius: 50%;
    color: #07051a;
    text-align: center;
    font-size: 1.2em;
    transition: all 1s;
}

#form:hover{
    width: 200px;
    cursor: pointer;
}

#form:hover input{
    display: block;
}

#form:hover .fa{
    background: #07051a;
    color: white;
}

/* 사이드바 */
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
	

	<div class="container">
		<div class="col-md-12" style="margin-top: 30px">
			<div class="section-heading" style="text-align: center">
				<h2>검색 게시글 보기 </h2>
			</div>
		</div>




<!-- 게시판List 출력 -->
<div class="containerss" style="float:left; margin-top: 25px;">
	<div class="row" >
		<div class="col-11" >
			<table class="table table-image" style="width: 1100px">
				<thead >
					<tr id="background" style="background-color: black;">
						<th style="color: white;" class="mainFont">글타입</th>
						<th style="color: white;" class="mainFont">글제목</th>
						<th style="color: white;" class="mainFont">작성자</th>
						<th style="color: white;" class="mainFont">작성날짜</th>
						<th style="color: white;" class="mainFont">조회수</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="bList" items="${bList}">
						<tr>
						    <c:if test="${bList.botype == '공지'}"> 
						    <td scope="row" style="color:red; font-weight:bold;">${bList.botype}</td>
						    </c:if>
					        
					        <c:if test="${bList.botype != '공지'}"> 
							<td scope="row" style="font-weight:bold;">${bList.botype}</td>
                            </c:if>
							<td ><span ><a style="font-weight:bold; color: #1a6692;" href="boardView?bonum=${bList.bonum }">${bList.botitle}</a></span></td>
							<td >${bList.bowriter }</td>
						 	<td >${bList.bodate }</td> 
							<td >${bList.bohit }</td>
						</tr>
					</c:forEach>
					
					
				</tbody>
			</table>
		</div>

       <button type="button" onclick="location.href='getWriteInfo?mid=${sessionScope.loginId}'" id="commentsWriterBtn" class="btn btn-default" style="background-color: #D3D3D3; color: #000000; font-weight: bold; margin-left: 980px; margin-top: 10px; float:left; ">글등록</button>

<div style="width: 100%; padding-left: 240px; margin:0px;">
 <form action="boardSearch" id ="boardSearch" method="get" style="margin-bottom:10px; "> 
	  <div class="col-lg-2 col-md-2 col-sm-2" style="float:left; ">
						<label></label> <select name="botype"
							class="form-control" style="margin-top: 5px;">
							<option value="" selected="selected">글타입</option>
							<option value="공지">공지글</option>
							<option value="후기">후기글</option>
							<option value="자유">자유글</option>
						</select>
					</div> 
<div class="col-lg-2 col-md-2 col-sm-2" style="float:left;" >
						<label style="padding: 0px;"></label> <select name="searchtype"
							class="form-control" style="margin-top: 5px;">
							<option value="" selected="selected">검색선택</option>
							<option value="searchbotitle">제목</option>
							<option value="searchbowriter">작성자</option>
							<option value="searchbodate">작성날짜</option>
							<option value="searchmarketname">시장</option>
						</select>
					</div> 


<div id="form" style="float:left; margin-top: 50px; margin-left: 100px;" >
<input type="search"  hidden>
<div class="search" style="float:left; margin-top: 30px; margin-left: 35px;">
     <input type="text" placeholder="검색어 입력" name="keyword">
     <a href="#" onclick="document.getElementById('boardSearch').submit();"><i class="fa fa-search" ></i></a>
      </form> 
</div>
</div>

</div> 


	 </div>
</div> 

