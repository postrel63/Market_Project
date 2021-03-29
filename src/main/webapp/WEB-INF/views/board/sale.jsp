<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ include file="../includes/header.jsp"%>

	
    <link rel="stylesheet" href="/resources/templatemo_556/css/bootstrap.min.css">
    <link rel="stylesheet" href="/resources/templatemo_556/fontawesome/css/all.min.css">
    <link rel="stylesheet" href="/resources/templatemo_556/css/templatemo-style.css">

    <!-- Page Loader -->
    <div id="loader-wrapper">
        <div id="loader"></div>

        <div class="loader-section section-left"></div>
        <div class="loader-section section-right"></div>

    </div>
    
    <div style="padding: 150px; class="container-fluid tm-container-content tm-mt-60">
        <div class="row mb-4">
            <h2 class="col-6 tm-text-primary">
               <button>마감세일</button>
               <button>오늘의 특가</button>
            </h2>
        </div>
        <hr>
        
        <h3>마감세일</h3>
         <div class="row tm-mb-90 tm-gallery">
        	<div class="col-xl-3 col-lg-4 col-md-6 col-sm-6 col-12 mb-5">
                <figure class="effect-ming tm-video-item">
                    <img src="/resources/11.png" alt="Image" class="img-fluid">
                    <figcaption class="d-flex align-items-center justify-content-center">
                        <h2>피카츄</h2>
                        <a href="/resources/templatemo_556/photo-detail.html">View more</a>
                    </figcaption>                    
                </figure>
                <div class="d-flex justify-content-between tm-text-gray">
                    <span class="tm-text-gray-light"></span>
                    <span></span>
                </div>
            </div>
            </div>
            <hr>
            
             <h3>오늘의 특가</h3>
             <div class="row tm-mb-90 tm-gallery">
        	<div class="col-xl-3 col-lg-4 col-md-6 col-sm-6 col-12 mb-5">
                <figure class="effect-ming tm-video-item">
                    <img src="/resources/11.png" alt="Image" class="img-fluid">
                    <figcaption class="d-flex align-items-center justify-content-center">
                        <h2>피카츄</h2>
                        <a href="/resources/templatemo_556/photo-detail.html">View more</a>
                    </figcaption>                    
                </figure>
                <div class="d-flex justify-content-between tm-text-gray">
                    <span class="tm-text-gray-light"></span>
                    <span></span>
                </div>
            </div>
            </div>
         
            
    
    <script src="js/plugins.js"></script>
    <script>
        $(window).on("load", function() {
            $('body').addClass('loaded');
        });
    </script>
</body>
</html>