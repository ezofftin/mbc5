<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<%@ include file="../include/header.jsp" %>

<link href="<c:url value="resources/css/main.css"/>" rel="stylesheet"/>
	<!-- Slick Slider CSS -->
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css"/>
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick-theme.css"/>
	<!-- jQuery -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<!-- Slick Slider JS -->
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>

<!-- 스타일 -->
<style>
.slider-nav .slick-slide {
	margin: 0 10px; /* 좌우에 각각 10px의 간격 추가 (원하는 값으로 조정 가능) */
}
.slider-nav {
	padding: 0 10px; /* 슬라이더의 양쪽에 추가 공간이 생기지 않도록 슬라이더 자체에 패딩을 추가 */
	margin-top: 20px;
}
	.slider-for img {
	width: auto; /* 부모 요소의 가로 크기에 맞게 이미지 너비 설정 */
	height: auto; /* 가로 세로 비율 유지 */
	max-height: 500px; /* 원하는 최대 높이 설정 */
	object-fit: cover; /* 이미지를 컨테이너에 맞게 자르기 */
	margin : auto;
}
	.slider-nav img {
	width: 100%; /* 부모 요소의 가로 크기에 맞게 이미지 너비 설정 */
	height: auto; /* 가로 세로 비율 유지 */
	max-height: 100px; /* 원하는 최대 높이 설정 */
	object-fit: cover; /* 이미지를 컨테이너에 맞게 자르기 */
}

.slick-prev, .slick-next {
	display: block !important; /* 화살표 강제 표시 */
	background-color: #6291ff; /* 화살표 배경 색상 투명하게*/ 
	color: black; /* 화살표 색상 */
	border-radius: 50%; /* 원형으로 표시 */
	width: auto;
	height: 20px;
	line-height: 40px;
	text-align: center;
	z-index: 1000;
}
/* 화살표 hover 시 하이라이트 효과 */
.slick-prev:hover, .slick-next:hover {
    color: black; /* hover 시 화살표 색상 */
}

</style>

<div class="container w-100 mt-5 border shadow p-5">
	<h4>숙소 이름 : ${hotelDto.hotelName}</h4><br><br>
	<c:set var="imageList" value="${fn:split(hotelDto.hotelImage, ',')}"/>
	<div class="slider-for">
		<c:forEach var="image" items="${imageList}">
			<div>
				<img src="<c:url value='/external/${image}'/>" alt="${image}" />
			</div>
		</c:forEach>
	</div>
	<div class="slider-nav">
		<c:forEach var="image" items="${imageList}">
			<div>
				<img src="<c:url value='/external/${image}'/>" alt="${image}" />
			</div>
		</c:forEach>
	</div><br><br>
	<p>가격 : ${hotelDto.hotelPrice}(1박 기준)</p><br><br>
	<p>상세정보 : ${hotelInfo}</p><br><br>
	<p>예약 현황 : ${hotelDto.hotelState}</p><br><br>
	<c:if test="${hotelDto.hotelState=='예약불가'}">
		<a href="reserveCheck.do?hotelNum=${hotelDto.hotelNum}&memberNum=${sessionScope.loginDTO.memberNum}" 
			class="btn btn-warning me-0 disabled" style="width:200px ; float:right ; background:yellow;">예약불가</a>
	</c:if>
	<c:if test="${hotelDto.hotelState=='예약가능'}">
		<c:if test="${sessionScope.loginDTO.memberId == null}">
		<a href="javascript:alert('로그인이 필요합니다.')" 
			class="btn btn-success me-0" style="width:200px ; float:right">예약하기</a>
		</c:if>	      		
		<c:if test="${sessionScope.loginDTO.memberId != null}"> 
			<a href="reserveCheck.do?hotelNum=${hotelDto.hotelNum}&memberNum=${sessionScope.loginDTO.memberNum}" 
				class="btn btn-success me-0" style="width:200px ; float:right">예약하기</a>
		</c:if>	    		
	</c:if>		    		
</div>
<%@ include file="../include/footer.jsp" %>

<script type="text/javascript">
	$(document).ready(function(){
		$('.slider-for').slick({
			slidesToShow: 1,
			slidesToScroll: 1,
			arrows: true,
			fade: true,
			asNavFor: '.slider-nav',
			adaptiveHeight: false // 슬라이더 높이를 자동으로 맞춤
		});
		$('.slider-nav').slick({
			slidesToShow: 3,
			slidesToScroll: 1,
			asNavFor: '.slider-for',
			dots: false,
			centerMode: true,
			focusOnSelect: true,
			variableWidth: false // 슬라이더의 너비를 자동으로 조정하지 않도록 설정
		});
	});
</script>
				
