<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="../admin/ad_header.jsp" %>
<form action="hotelUpdateOk.do" method="post" enctype="multipart/form-data">
<table class="table table-borderless">
         <tbody>
         	<tr>
         		<td></td>
         		<td>
         			<input type = "hidden" class = "form-control form-control-sm" 
         					name = "hotelNum" id="hotelNum" readonly value="${hotelDto.hotelNum}"/>
         		</td>
         	</tr>
         	<tr>
               <td>숙소명</td>
               <td><input type="text" class="form-control form-control-sm" name="hotelName"
               		 id="hotelName" value="${hotelDto.hotelName}"/></td>
            </tr>
            <tr>
               <td>가격(1일)2</td>
					<td><input type="text" class="form-control form-control-sm" name="hotelPrice"
							 id="hotelPrice" value="${hotelDto.hotelPrice}"/></td>
            </tr>
            <tr>
               <td>상세정보</td>
					<td><input type="text" class="form-control form-control-sm" name="hotelInfo"
							 id="hotelPrice" value="${hotelDto.hotelInfo}"/></td>
            </tr>
            <tr>
               <td>사진</td>
					<td><input type="text" class="form-control form-control-sm" name="hotelImage"
							 id="hotelImage" value="${hotelDto.hotelImage}"/></td>
            </tr>
            <tr>
               <td>예약현황</td>
					<td>
						<select class="form-select form-select-sm" name="hotelState" id="hotelState">
<%-- 						<c:forEach var="dto" items="${hotelList}"> --%>
<%-- 							<option value="${dto.hotelState}">[${dto.hotelState}]</option> --%>
							<option value="예약불가">[예약불가]</option>
							<option value="예약가능">[예약가능]</option>
<%-- 						</c:forEach> --%>
						</select>
            </tr>       
            <tr>
               <td colspan="2" class="text-center">
                  <input type="submit" class="btn btn-sm btn-primary" value="수정완료"/>   
                  <input type="reset" class="btn btn-sm btn-secondary" value="취소"/>   
               </td>
            </tr>
         </tbody>         
      </table>
</form>
<%@ include file="../admin/ad_footer.jsp" %>