<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="../include/header.jsp" %>
<h3> 예약 목록</h3>
<!-- 검색창 : 날짜 입력? -->

<!-- 리스트 창(hotelListCard를 한 블럭에 지정, foreach 이용) -->

<div class="container border">
	<table class="table">
		<thead>
			<tr>
				<th>예약번호</th>               
				<th>예약자</th>
				<th>호텔</th>
				<th>체크인</th>
				<th>체크아웃</th>
				<th>인원</th>
            
				<th>수정/삭제</th>
				<th>결재상태</th>
			</tr>
		</thead>
		<tbody>
			<div class="reservelist d-flex-inline">
				<c:forEach var="dto" items="${myReserveList}">
					<tr>
						<td>${dto.reserveNum}</td>
						<td>${memberDto.memberName}</td>
						<td>${dto.hotelNum}</td>
						<td>${dto.checkin}</td>
						<td>${dto.checkout}</td>
						<td>${dto.people}</td>
	               
						<td>
							<a href="reserveInfo.do?reserveNum=${dto.reserveNum}&hotelNum=${dto.hotelNum}&memberNum=${dto.memberNum}" class="btn btn-sm btn-info">정보</a>
							<a href="reserveDelete.do?reserveNum=${dto.reserveNum}" class="btn btn-sm btn-danger">삭제</a>
						</td>
						<td>
							[${dto.state}]
							<c:if test="${dto.state=='결재 필요'}">
								<a href="payment.do?reserveNum=${dto.reserveNum}&hotelNum=${dto.hotelNum}&memberNum=${dto.memberNum}" class="btn btn-sm">결재</a>
							</c:if>
						</td>
					</tr>
				</c:forEach>
			</div>
		</tbody>
	</table>
</div>
<%@ include file="../include/footer.jsp" %>
