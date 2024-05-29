<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file = "/include/basicInHead.jsp"%> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>홈페이지 관리 전용 페이지</title>
  <style>
  
  	#leftWindow {
			float: left;
			margin-left: 50px;
			width: 14%;
			text-align: center;
			background-color: #dcd;
		}
		
		#rightWindow {
			float: left;
			margin-left: 12px;
			margin-right: 10px;
			width: 79%;
			text-align: center;
			background-color: #efe;
		}
		
		
  </style>
</head>
<body>
<%@ include file = "/include/NavbarAdmin.jsp"%>
<p><br/></p><br/> 
<div id="leftWindow">	
	<br/><br/>	
	<p><a class="btn btn-light" href="JustForAdmin.ad?mSw=1">회원관리</a></p><br/><br/>
	<p><a class="btn btn-light" href="JustForAdmin.ad?mSw=2">출석체크관리</a></p><br/><br/>
	<p><a class="btn btn-light" href="JustForAdmin.ad?mSw=3">게시판관리</a></p><br/><br/>
	<p><a class="btn btn-light" href="JustForAdmin.ad?mSw=4">자료실관리</a></p><br/><br/>
	<p><a class="btn btn-light" href="${ctp}/Lobby">관리종료</a></p><br/><br/>
</div>
<div id="rightWindow">
	<p>
		<c:if test="${mSw == 1}">
		<h3 class="text-center">회원관리</h3>
		<jsp:include page="adminMemberList.jsp" />
		</c:if>
		<c:if test="${mSw == 2}">
		<h3 class="text-center">출석체크관리</h3>
		<jsp:include page="adminVisitCheck.jsp" />
		</c:if>
		<c:if test="${mSw == 3}">
		<h3 class="text-center">게시판관리</h3>
		<jsp:include page="adminBoard.jsp" />
		</c:if>
		<c:if test="${mSw == 4}">
		<h3 class="text-center">자료실관리</h3>
		<jsp:include page="adminPds.jsp" />
		</c:if>
	</p>
</div>
<p><br/></p>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
	<script src="js/scripts.js"></script>
</body>
</html>
