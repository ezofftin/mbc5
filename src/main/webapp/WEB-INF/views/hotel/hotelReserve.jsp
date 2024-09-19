<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="../include/header.jsp" %>
<!-- 예약하기 form action = '결재'
1. 예약자 이름, 연락처 : loginDTO
2. 숙소명 : hotelDTO
3. 입실날짜, 퇴실날짜
4. 인원 _명 
5. 옵션 : hotelDTO
6. 예약하기 버튼 -> 결재.do
7. 취소하기 버튼-> hotelInfo.do
 -->
<form action="#" method="post" enctype="multipart/form-data">
	<tr>
		<td>예약자명</td>
		<td><input type="text" class="form-control form-control-sm" name="memberName" id="memberName"/></td>
	</tr>
	<tr>
		<td>숙소명</td>
		<td><input type="text" class="form-control form-control-sm" name="hotelName" id="hotelName"/></td>
	</tr>
	<tr>
		<td>입실날짜</td>
		<td><input type="text" class="form-control form-control-sm" name="checkin" id="checkin"/></td>
	</tr>
	<tr>
		<td>퇴실날짜</td>
		<td><input type="text" class="form-control form-control-sm" name="checkout" id="checkout"/></td>
	</tr>
	<tr>
		<td>인원</td>
		<td><input type="text" class="form-control form-control-sm" name="people" id="people"/></td>
	</tr>
	<tr>
		<td>
			숙소정보</br>
			${hotelDto.hotelInfo}
		</td>
	</tr>
	
	<a href="#" class="btn btn-success me-0" style="width:150px ; float:right">결재하기</a>
	<a href="hotelList.do" class="btn btn-success me-0" style="width:150px ; float:right">목록으로</a>
</form>
<%@ include file="../include/footer.jsp" %>