<div class="container mt-5 mb-5 p-5">
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

    <div>				
        <c:if test="${not empty noticeList}">
            <table class="table">
                <thead>
                    <tr>
                        <th>번호</th>
                        <th>제목</th>
                        <th>글쓴이</th>
                        <th>등록일</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="notice" items="${noticeList}">
                
                        <tr>
                            <td>${notice.bid}</td>
                            <td><a href="viewBoard.do?bid=${notice.bid}">${notice.subject}</a></td>
                            <td>${notice.writer}</td>
                            <td>${notice.reg_date}</td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </c:if>
        <c:if test="${empty noticeList}">
            <p>공지사항이 없습니다.</p>
        </c:if>
    </div>
    <br><br>	
</div>
