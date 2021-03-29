<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../includes/header.jsp"%>

<!-- 게시판 css -->
<link rel="stylesheet" href="/resources/css/boardWrite.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

  <div class="page-heading contact-heading header-text">
      <div class="container">
         <div class="row">
            <div class="col-md-12">
               <div class="text-content">
                  <h4>join us</h4>
                  <h2>환영합니다!</h2>
               </div>
            </div>
         </div>
      </div>
   </div>

 <div class="products">
	<div class="sidecontainer2"
		style="float: left; width: 300px; height: 700px; margin-top: 110px">
		<ul class="accordion">
			<li><a class="active">시장별</a>
				<div class="content" style="display: none;">
					<a href="memberView?loginId?=${sessionScope.loginId}">내정보</a>
				</div></li>
			<li><a class="active">시장별</a>
				<div class="content" style="display: none;">
					<a href="storeJoin?loginId?=${sessionScope.loginId}">사업자 등록</a>
				</div></li>
			<li><a class="active">시장별</a>
				<div class="content" style="display: none;">
					<p>xx별
					<p>
				</div></li>
			<li><a class="active">시장별</a>
				<div class="content" style="display: none;">
					<p>xx별
					<p>
				</div></li>
		</ul>
	</div>
</div>


<div class="maincontainer2" style="padding-left: 300px;">
	<div class="col-md-12">
		<div class="section-heading">
			<h2>이벤트쓰기</h2>
		</div>
	</div>
	<form action="eventInsert" method="post" enctype="multipart/form-data" style="padding-left: 150px;">
		<div class="contact-form">
			<div class="row">
					<div class="row" >
					<div class="col-lg-3 col-md-3 col-sm-3" style="padding-left: 150px;" hidden> 
							<label hidden>아이디</label> <input type="text" class="form-control" name="bowriter"
							     value="${sessionScope.loginId}" readonly="readonly" style="text-align:center;" hidden>
						</div> 
					
					<div class="col-lg-7 col-md-7 col-sm-7" style="padding-left: 150px;" >
						<label >제목</label> <input type="text"
							class="form-control" name="etitle" placeholder="이벤트제목" placeholder="제목입력" required >
					</div>

					<div class="col-lg-7 col-md-7 col-sm-7" style="padding-left: 150px;">
						<label style="margin-top: 15px;">내용</label> <input style="padding: 0px;" type="text"
							class="form-control" name="econtent" placeholder="내용입력" required>
					</div>
					
					<div class="col-lg-7 col-md-7 col-sm-7" style="padding-left: 150px;">
						<label style="margin-top: 15px;">이벤트시작기간</label> <input style="padding: 0px;" type="date"
							class="form-control" name="estartdate" placeholder="이벤트 시작기간" required>
					</div>
					
					<div class="col-lg-7 col-md-7 col-sm-7" style="padding-left: 150px;">
						<label style="margin-top: 15px;">이벤트종료기간</label> <input style="padding: 0px;" type="date"
							class="form-control" name="eenddate" placeholder="이벤트 종료기간" required>
					</div>
					
					</div>
					
					<div class="col-lg-5 col-md-5 col-sm-5" style="padding-left: 150px;">
						<label>파일선택</label> <input type="file"
							class="form-control" name="efile" id="sample6_address"
							 placeholder="파일첨부" style="width:250px;">
				     </div>
					
					</div>
					
				<div class="col-lg-7 col-md-7 col-sm-7" style="padding: 25px 0px 0px 130px; width: 775px;" >
				<input type="submit" class="filled-button" value="입력완료">
			</div>
			</div>

		
	</form>
</div>
</div>
</div>
  </div>

<!-- Additional Scripts -->
   <script src="/resources/js/custom.js"></script>
   <script src="/resources/js/owl.js"></script>
   <script src="/resources/js/slick.js"></script>
   <script src="/resources/js/isotope.js"></script>


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
</html>

