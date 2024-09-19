<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ include file="./include/header.jsp" %>
  	<!-- 폰트어썸 -->
  	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.3/css/all.css">
  	<!-- bootstrap -->       
  	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
  	<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.css" rel="stylesheet"/>
  	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
	<!-- css폴더에서 main.css 색상정하기 : css customize를 하려면 가장 밑에 bootstrap 밑에 적기 -->
	<link href="<c:url value="resources/css/main.css"/>" rel="stylesheet"/>

</div>
	<div class="search-box" style="display:flex; justify-content:center; align-items:center; gap:10px">
       <!-- 검색 상자 -->
        <label for="destination">즐길거리 검색: </label>
         <input type="text" id="keyword" name="keyword"
            value="<%= request.getParameter("keyword") != null ? request.getParameter("keyword") : "제주도 맛집" %>">
        
<!--        날짜 선택기
        <label for="start-date">체크인 :</label>
        <input type="date" id="start-date">
        <label for="end-date">체크아웃 :</label>
        <input type="date" id="end-date"> -->
        
       <!-- 검색버튼 -->
        <button type="button" onclick="doSearch()">검색</button>
    </div>
    	
	<div class="container-fluid p-0 visual-area">
		<!-- Carousel -->
		<div id="demo" class="carousel slide" data-bs-ride="carousel">
		
		  <!-- Indicators/dots -->
		  <div class="carousel-indicators">
		    <button type="button" data-bs-target="#demo" data-bs-slide-to="0" class="active"></button>
		    <button type="button" data-bs-target="#demo" data-bs-slide-to="1"></button>
		    <button type="button" data-bs-target="#demo" data-bs-slide-to="2"></button>
		    <button type="button" data-bs-target="#demo" data-bs-slide-to="3"></button>		    
		  </div>
		
		  <!-- The slideshow/carousel -->
		  <div class="carousel-inner">
		    <div class="carousel-item active">
		      <video src="resources/imgs/5.mp4" autoplay muted loop alt="hotDeal1" class="d-block" style="width:100%; height:600%"></video>
		      <!-- <img src="resources/imgs/1.jpg" alt="hotDeal1" class="d-block" style="width:100%; height:100%"> -->
				  <div class="carousel-caption">
				    	<h3>Hot Deal1</h3>
				    	<p>We had such a great time in LA!</p>
				  </div>
		    </div>
		    <div class="carousel-item">
		      <img src="resources/imgs/1.jpg" alt="hotDeal2" class="d-block" style="width:100%; height:100%">
				  <div class="carousel-caption">
				    	<h3>Hot Deal2</h3>
				    	<p>We had such a great time in LA!</p>
				  </div>
		    </div>
		    <div class="carousel-item">
		      <img src="resources/imgs/2.jpg" alt="hotDeal3" class="d-block" style="width:100%; height:100%">
				  <div class="carousel-caption">
				   		<h3>Hot Deal3</h3>
				    	<p>We had such a great time in LA!</p>
				  </div>
		    </div>
		    <div class="carousel-item">
		      <img src="resources/imgs/3.jpg" alt="hotDeal4" class="d-block" style="width:100%; height:100%">
				  <div class="carousel-caption">
				  	 	<h3>Hot Deal4</h3>
				    	<p>We had such a great time in LA!</p>
				  </div>
		    </div>
		  </div>		  
		
		  <!-- Left and right controls/icons -->
		  <button class="carousel-control-prev" type="button" data-bs-target="#demo" data-bs-slide="prev">
		    <span class="carousel-control-prev-icon"></span>
		  </button>
		  <button class="carousel-control-next" type="button" data-bs-target="#demo" data-bs-slide="next">
		    <span class="carousel-control-next-icon"></span>
		  </button>
		</div>
	</div>
		<!-- Carousel End -->
	
	<!-- 내용 삽입 -->	
	<div class="container mt-5 mb-5 p-5">
		<h3>Stays</h3>
      <!-- Card -->
      <c:forEach var="hotelDto" items="${hotelList}">      
            <c:set var="imageList" value="${fn:split(hotelDto.hotelImage, ',')}"/>
            <img class="card-img-top" 
                  src="<c:url value="/external/${imageList[0]}"/>" 
                    style="width:150px">
         </c:forEach>
      <!-- Card End -->
 	
		<br><hr><br>
		
		<h3>Weather</h3>
			<div id="ww_8811bf0cf166f" v='1.3' loc='id' a='{"t":"responsive","lang":"ko","sl_lpl":1,"ids":["wl7410"],"font":"Arial","sl_ics":"one_a","sl_sot":"celsius","cl_bkg":"#FFFFFF","cl_font":"#000000","cl_cloud":"#bcb5b8","cl_persp":"#81D4FA","cl_sun":"#FFC107","cl_moon":"#FFC107","cl_thund":"#FF5722"}'>More forecasts: <a href="https://oneweather.org/seoul/30_days/" id="ww_8811bf0cf166f_u" target="_blank">Seoul 30 day forecast</a></div><script async src="https://app2.weatherwidget.org/js/?id=ww_8811bf0cf166f"></script>
		<br><hr><br>
		
<%-- 		<h3>Package</h3>
		<!-- 유효성검사 : 메인에서 뜨는 상품 카테고리 안에 내용이 없다면, 있다면 -->
			<c:forEach var="key" items="${key}">
				<c:if test="${map[key].size() != 0 }">
					<div class="d-flex">
						<c:set var="cnt" value="0"/>	<!-- 4배수 일 경우 줄내리고 다음포문 새로시작 - 4배수 카운트 -->
						<c:forEach var="pDto" items="${map[key]}">		
							<c:set var="cnt" value="${cnt+1}"/>	<!-- 4배수 일 경우 줄내리고 다음포문 새로시작 - 4배수 카운트 +1 -->
							<!-- Card -->
								<%@include file="./package/package_card.jsp" %>
							<!-- Card End -->
							<c:if test="${cnt%4==0}">
								</div>
								<div class="d-flex mt-3"> <!-- div테그 종료/재시작, 4배수 일 경우 줄내리고 다음포문 새로시작 -->
							</c:if>
						</c:forEach>
					</div>
				</c:if>
				<c:if test="${map[key].size() == 0 }">
					<br>${key} 상품이 없습니다!!<br>
				</c:if>
			</c:forEach>
		<br><hr><br> --%>
		<h3>Notice</h3>
			<div>				
				<%@include file="./board/user_boardList.jsp" %>
			</div>
		<br><br>	
			
	</div>
	
	<script>
	function doSearch() {
	    // 입력된 검색어 가져오기
	   var keyword = document.getElementById("keyword").value;
	   window.location.href = "thingstodoList.do?keyword=" + keyword
	   return;
	
	}
	</script>

		





<%@ include file="./include/footer.jsp" %>
