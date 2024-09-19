<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 

<c:choose>
	<c:when test="${sessionScope.mode == 'user'}">
		<%@ include file="../include/header.jsp" %>
   </c:when>
	<c:when test="${sessionScope.mode == 'admin'}">
		<%@ include file="../admin/ad_header.jsp" %>
	</c:when>
</c:choose>


<!-- 달력 -->
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.3/css/all.css">
<link rel="stylesheet" href="//code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" />
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<script src="//code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
<!-- ------------ -->
<form action="reserveUpdate.do" method="post" enctype="multipart/form-data">
	<div class="container">
		<table class="table table-border" >
			<tbody>
				<tr>
					<td>예약자 번호</td>
					<td>
						<input type="nember" class="form-control form-control-sm" name="memberNum" id="memberNum" 
								value="${reserveDto.memberNum}" readonly/>
					</td>
				</tr>
				<tr>
					<td>호텔번호</td>
					<td>
						<input type="number" class="form-control form-control-sm" name="hotelNum" id="hotelNum"
								value="${reserveDto.hotelNum}" readonly/>
					</td>
				</tr>
				<tr>
					<td>예약자명</td>
					<td>
						<input type="text" class="form-control form-control" id="memberName" name="memberName" 
								value="${memberDto.memberName}" readonly/>
					</td>
				</tr>
				<tr>
					<td>호텔명</td>
					<td>
					<input type="text" class="form-control" id="hotelName" name="hotelName" value="${hotelDto.hotelName }" readonly/>
					</td> 
				</tr>
				<tr>
					<td>예약일자</td>
					<td>
						<div class="date-picker ms-0">
							<label for="start-date">체크인 :</label>
							<input type="date" id="checkin" name="checkin" value="${reserveDto.checkin}">
							<label for="end-date">체크아웃 :</label>
							<input type="date" id="checkout" name="checkout" value="${reserveDto.checkout}">
						</div>
					</td>
				</tr>
				<tr>
					<td>예약인원</td>
					<td><input type="text" class="form-control form-control" name="people" id="people" 
							value="${reserveDto.people}"/>명</td>
				</tr>
				<tr>
					<td>상세정보</td>
					<td>
						<input type="text" class="form-control form-control" name="hotelInfo" 
								value="${hotelDto.hotelInfo}" readonly/>
					</td>
				</tr>
				<tr>
					<td>1일 숙박가</td>
					<td>
						<input type="text" class="form-control form-control" id="hotelPrice" name="hotelPrice" 
								value="${hotelDto.hotelPrice}" readonly/>원
					</td>
				</tr>
				<tr>
					<td>총액</td>
					<td>
						<input name="totalPrice" id="totalPrice" readonly value="${reserveDto.totalPrice}"> 원</p>
						<input type="button" value="계산하기" onclick="totPay()">
					</td>
				</tr>
				
				<a href="myReserveList.do" 
					class="btn btn-success me-0" style="width:200px ; float:right" type="submit">목록으로</a>
			</tbody>	
		</table>
	</div>
</form>

<c:choose>
	<c:when test="${sessionScope.mode == 'user'}">
		<%@ include file="../include/footer.jsp" %>
   </c:when>
	<c:when test="${sessionScope.mode == 'admin'}">
		<%@ include file="../admin/ad_footer.jsp" %>
	</c:when>
</c:choose>

<script>
function totPay() {
	// 입력된 날짜 가져오기
	var date1 = new Date(document.getElementById('checkin').value);
	var date2 = new Date(document.getElementById('checkout').value);

	// 날짜가 유효한지 확인 (체크인과 체크아웃이 선택되지 않으면 계산하지 않음)
	if (!date1 || !date2 || date1 >= date2) {
	    document.getElementById("totalPrice").innerHTML = "날짜를 올바르게 선택해주세요.";
	    return;
	}
	
	// 기간 계산하기
	var period = (date2-date1) / (1000* 3600 * 24);
	
	// 총액 계산하기
	var price = parseInt(document.getElementById('hotelPrice').value, 10);
	var totalPrice = (period+1) * price;
	
	document.getElementById("totalPrice").value = totalPrice;
}
</script>
