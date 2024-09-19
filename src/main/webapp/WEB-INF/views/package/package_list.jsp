<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<%@ include file="../admin/ad_header.jsp" %>

<div class="container w-75 mt-5 border shadow p-5">
	<h3>Hot Deals 리스트</h3><br>
	<table class="table">
		<thead>
			<tr>
				<th>번호</th>
				<th>이름</th>					
				<th>이미지</th>					
				<th>타입</th>
				<th>가격</th>
				<!-- <th>정보</th> -->
				<th>&nbsp;수정</th>
				<th>삭제</th>
			</tr>
		</thead>
		<tbody>
			<c:if test="${list == null || list.size() == 0 }">
				<tr>
					<td>상품이 존재하지 않습니다.</td>
				</tr>
			</c:if>
			
			<c:if test="${list != null && list.size() != 0 }">
				<c:forEach var="dto" items="${list}">
				<tr>
					<td>${dto.packageNum}</td>
					<td>${dto.packageName}</td>
					<td>
						<%-- <img src="<c:url value="/external/${dto.packageImage}"/>" width="60px"/> --%>
						<%-- <img src="<c:url value='/external/${dto.packageImage}' />" alt="${dto.packageImage}" width="60px"/> --%>
<%-- 						<c:set var="imageList" value="${fn:split(dto.packageImage, ',')}"/>
    					<img src="<c:url value='/external/${imageList[0]}' />" alt="${imageList[0]}" width="60px"/> --%>
    					<c:set var="imageList" value="${fn:split(dto.packageImage, ',')}"/>
						<img src="<c:url value='/external/${imageList[0]}' />" alt="${imageList[0]}" width="60px"/>
    					

					</td>
					<td>${dto.packageType.getValue()}</td>
					<td>${dto.packagePrice}</td>
					<%-- <td>${dto.packageInfo}</td> --%>
					
					<td>
					    <a href="<c:url value='/updatePackage.do?packageNum=${dto.packageNum}'/>" class="btn btn-sm btn-info">수정</a>
					</td>
					<td>
						<a href="javascript:packDel('${dto.packageNum}', '${dto.packageImage}')" class="btn btn-sm btn-danger">삭제</a>
					</td>
				</tr>
				</c:forEach>
			</c:if>
		</tbody>
	</table>
</div>

<script>
	function packDel(packageNum, packageImage){
		let isDel = confirm("삭제하시겠습니까?");  
		// 예,아니오 중에 예를 누르면 True로 리턴됌
		if(isDel) {
			location.href="./deletePackage.do?packageNum=" + packageNum + "&packageImage=" + packageImage;
		}
	}
</script>

<%@ include file="../admin/ad_footer.jsp" %>