<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="ad_header.jsp" %>
숙소 등록페이지
<form action="hotelRegister.do" method="post" enctype="multipart/form-data">
	<table class="table table-border">
		<tbody>
			<tr>
				<td></td>
				<td>
					<input type = "hidden" class = "form-control form-control-sm" 
							name = "hotelNum" id="hotelNum" readonly/>
				</td>
			</tr>
				<td>숙소명</td>
				<td><input type="text" class="form-control form-control-sm" name="hotelName" id="hotelName"/></td>
			</tr>
			<tr>
				<td>가격(1일)</td>
				<td><input type="text" class="form-control form-control-sm" name="hotelPrice" id="hotelPrice"/></td>
			</tr>
			<tr>
				<td>상세정보</td>
				<td><input type="text" class="form-control form-control-sm" name="hotelInfo" id="hotelPrice"/></td>
			</tr>
			<tr>
				<td>사진</td>
				<td>
					<div id="imageContainer">
						<div>
							<input type="file" class="form-control form-control-sm" name="hotelImages" id="hotelImages"/>
				</td>
				<button type="button" class="btn btn-sm" onclick="removeImage(this)">삭제</button>
				<button type="button" class="btn btn-sm btn-secondary" onclick="addMoreImage()">사진추가</button>
			</tr>
			<tr>
				<td>예약현황</td>
				<td>
					<select class="form-select form-select-sm" name="hotelState" id="hotelState">
						<option value="예약가능">[예약가능]</option>
						<option value="예약불가">[예약불가]</option>
					</select>
				</td>
			</tr>
			<tr>
				<td>소유주 등록번호</td>
				<td><input type="text" class="form-control form-control-sm" name="hostNum" id="hostNum"/></td>
			</tr>
			<tr>
				<td colspan="2" class="text-center">
					<input type="submit" class="btn btn-sm btn-primary" value="등록"/>   
					<input type="reset" class="btn btn-sm btn-secondary" value="취소"/>   
				</td>
			</tr>
		</tbody>         
	</table>
</form>

<%@ include file="ad_footer.jsp" %>

<script>
function addMoreImage() {
	var newInputGroup = document.createElement('div');
	newInputGroup.className = 'input-group mb-2';
	
	var newFileInput = document.createElement('input');
	newFileInput.type= 'file';
	newFileInput.className='form-control form-control-sm';
	newFileInput.name='hotelImages';
	
	var deleteButton = document.createElement('button');
	deleteButton.type='button';
	deleteButton.className='btn btn-sm btn-danger';
	deleteButton.textContent = '삭제';
	deleteButton.onclick = function() {
		removeImage(this);
	};
	
	newInputGroup.appendChild(newFileInput);
	newInputGroup.appendChild(deleteButton);
	
	var container = document.getElementById('imageContainer');
	container.appendChild(newInputGroup);
}

function removeImage(button) {
	var inputGroup = button.parentElement;
	inputGroup.remove();
}
</script>