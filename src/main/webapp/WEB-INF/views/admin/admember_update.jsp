<%@page import="com.mbc.jeju.domain.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ include file="../admin/ad_header.jsp" %>


<div class="container w-50 mt-5 border shadow p-5">
   <form action="adminMemberUpdateOk.do" method="post" name="joinForm" onsubmit="return inputChk();"> 
      <h3 class="text-center">멤버정보 수정</h3>      
          <input type='hidden' name='no' value='${dto.getMemberNum()}'> 
              <div class="mt-3 mb-2 text-end">                                        
               <b>${dto.getMemberName()} 님의 멤버정보</b>                                                        
         	  </div>
	      <div class="mt-2 mb-2">
	         <label for="no">번호 <b>(수정불가)</b></label>
	         <input type="text" class="form-control" id="no" name="memberNum" value="${dto.memberNum}" readonly/>
	      </div> 
	      <div class="mb-2">
	         <label for="id">아이디 <b>(수정불가)</b></label>
	         <input type="text" class="form-control" id="id" name="memberId" value="${dto.memberId}" readonly/>
	      </div>
	      <div class="mb-2">
	         <label for="pw">비밀번호</label>
	         <input type="password" class="form-control" id="pw" name="memberPw" value="${dto.memberPw}"/>
	      </div>
	      <div class="mb-2">
	         <label for="pwConfirm">비밀번호 확인</label>
	         <input type="password" class="form-control" id="pwConfirm" name="pwConfirm" value="${dto.memberPw}"/>
	      </div>
	      <div class="mb-2">
	         <label for="name">이름</label>
	         <input type="text" class="form-control" id="name" name="memberName" value="${dto.memberName}"/>
	      </div>
	      <div class="mb-2">
	         <label for="tel">전화번호</label>
	         <input type="text" class="form-control" id="tel" name="memberTel" value="${dto.memberTel}"/>
	      </div>
	      <div class="mb-2">
	         <label for="email">이메일</label>
	         <input type="text" class="form-control" id="email" name="memberEmail" value="${dto.memberEmail}"/>
	      </div>
	      <div class="mb-2">
	         <label for="type">멤버타입</label>
	         <input type="text" class="form-control" id="type" name="memberType" value="${dto.memberType}"/>
	      </div>
         
<%--          <!----------------------------------- 주소 ----------------------------------->
            <div class="row mb-2">
               <lable for="addr">주소</lable><br>
             <div class="col-md-6">
                <input class="form-control mb-1" type="text" id="sample6_postcode" name="zipcode" value="${dto.zipcode}" readonly/>
             </div>
             <div class="col-md-6">
               <input class="btn btn-secondary mb-1" type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기">
            </div>
         </div>
               <input class="form-control mb-2" type="text" id="sample6_address" name="road_addr" value="${dto.road_addr}" readonly/>
               <input class="form-control mb-2" type="text" id="sample6_detailAddress" name="detail_addr" value="${dto.detail_addr}"/>
               <input class="form-control mb-2" type="text" id="sample6_extraAddress" name="plus_addr" value="${dto.plus_addr}" readonly/>
         
                           <!-- 위에는 뷰 // 아래는 로직 -->
            
          <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
         <script>
             function sample6_execDaumPostcode() {
                 new daum.Postcode({
                     oncomplete: function(data) {
                         // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
         
                         // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                         // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                         var addr = ''; // 주소 변수
                         var extraAddr = ''; // 참고항목 변수
         
                         //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                         if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                             addr = data.roadAddress;
                         } else { // 사용자가 지번 주소를 선택했을 경우(J)
                             addr = data.jibunAddress;
                         }
         
                         // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                         if(data.userSelectedType === 'R'){
                             // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                             // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                             if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                                 extraAddr += data.bname;
                             }
                             // 건물명이 있고, 공동주택일 경우 추가한다.
                             if(data.buildingName !== '' && data.apartment === 'Y'){
                                 extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                             }
                             // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                             if(extraAddr !== ''){
                                 extraAddr = ' (' + extraAddr + ')';
                             }
                             // 조합된 참고항목을 해당 필드에 넣는다.  -->> 참고항목을 안넣으면 주석처리
                             document.getElementById("sample6_extraAddress").value = extraAddr;
                         
                         } else {
                            // -->> 참고항목을 안넣으면 주석처리
                             document.getElementById("sample6_extraAddress").value = '';
                         }
         
                         // 우편번호와 주소 정보를 해당 필드에 넣는다.
                         document.getElementById('sample6_postcode').value = data.zonecode;
                         document.getElementById("sample6_address").value = addr;
                         // 커서를 상세주소 필드로 이동한다.
                         document.getElementById("sample6_detailAddress").focus();
                     }
             }
         </script>
         <!-----------------------------------------------------------------------------------------------> --%>
         
          <div class="text-center mt-3"><br>
            <input type="submit" class="btn btn-sm btn-primary" value="수정"/>
            <input type="reset" class="btn btn-sm btn-warning" value="취소"/>
            <a href="adminMemberList.do" class="btn btn-sm btn-info">회원 리스트</a>
            &nbsp;&nbsp;<a href="adminMemberDelete.do?no=${dto.memberNum}" class="btn btn-sm btn-danger">회원 탈퇴</a>
          </div>
   </form>
</div> 
  
  <!-- ?v=${now.time}: 캐시 때문에 js 적용 안 될 때 사용 -->
  <%-- <script type="text/javascript" src="resources/js/valid.js?v=${now.time}" charset="utf-8"></script> --%>
  <script type="text/javascript" src="resources/js/valid.js" charset="utf-8"></script>
  
   
<%@ include file="../admin/ad_footer.jsp" %>





















