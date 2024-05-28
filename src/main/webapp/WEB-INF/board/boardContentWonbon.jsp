<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file = "/include/basicInHead.jsp"%> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html lang="ko">
<head>	
<title>boardContent.jsp</title>
<script>
	'use strict';
	
	function scrap() {
		alert("스크랩 기능 준비중입니다");
	}
	
</script>
<style>
	th {
		font-size: 1.4em;
	}
</style>
</head>
<body class="d-flex flex-column h-100">
<%@ include file="/include/Navbar.jsp" %>
<p><br/></p>
<div class="container">
	<h1 class="text-center"><b>게시글 보기</b></h1>
	<br/><br/>
	<table class="table table-borderless">
		<tr class="text-center">
			<th>
			작성자<br/><br/>
			${vo.nickName}
			</th>
			<th>
			제목<br/><br/>
			${vo.title}
			</th>
			<th>
			작성일자<br/><br/>
			${fn:substring(vo.wDate,0,16)}
			</th>
		</tr>
	</table>
	<br/><br/>
	<div class="text-left">
		${vo.content}
	</div>
	<br/>
	<div class="text-right">
		<input type="button" value="신고하기" class="btn btn-danger"/>
		<input type="button" value="목록" onclick="location.href='BoardList.bo';" class="btn btn-warning"/>
		<input type="button" value="스크랩" onclick="scrap()" class="btn btn-danger"/>
	</div>
</div>
<p><br/></p>
<%@ include file="/include/footer.jsp"%>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
	<script src="js/scripts.js"></script>
</body>
</html>