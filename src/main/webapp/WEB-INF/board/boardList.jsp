<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file = "/include/basicInHead.jsp"%> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html lang="ko">
<head>	
<title>boardList.jsp</title>
<script>
	'use strict';
	
</script>
<style>
tr {
	vertical-align: middle;
}

#boardCnt {
	text-align: right;
}

b {
	text-align: left;
}
	
</style>
</head>
<body class="d-flex flex-column h-100">
<%@ include file="/include/Navbar.jsp" %>
<p><br/></p>
<div class="container">
	<h2 class="text-center"><strong><font size="16.5em">게&nbsp;&nbsp;&nbsp; 시&nbsp;&nbsp;&nbsp; 판</font></strong></h2>
	<div id="boardCnt">
		<b><font color="navy" size="5em">현재 게시글 수 : </font><font color="red" size="5em">${cnt}개</font></b>
	</div>
	<div>
		<input type="button" value="글쓰기" onclick="location.href='BoardInput.bo';" class="btn btn-success mr-3" />
	</div>
	<br/>
	<table class="table table-hover">
		<tr class="table-secondary text-dark text-center">
			<th>번호</th>
			<th>작성자</th>
			<th>제목</th>
			<th>작성일자</th>
			<th>조회수</th>
		</tr>
		<c:set var="index" value="${fn:length(vos)}"/>
		<c:forEach var="vo" items="${vos}" varStatus="st">
			<tr class="text-center">
				<td>${index}</td>
				<td>${vo.nickName}</td>
				<td class="text-left">
					<a href="BoardContent.bo?idx=${vo.idx}" class="btn btn-light" >${vo.title}</a>
				</td>
				<td>${fn:substring(vo.wDate,0,11)}</td>
				<td>${vo.readNum}</td>
			</tr>
		<c:set var="index" value="${index - 1}"/>	
		</c:forEach>
		<tr><td colspan="6" class="m-0 p-0"></td></tr>
	</table>
</div>
<p><br/></p>
<%@ include file="/include/footer.jsp"%>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
	<script src="js/scripts.js"></script>
</body>
</html>