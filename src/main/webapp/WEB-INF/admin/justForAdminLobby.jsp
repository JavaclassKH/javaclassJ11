<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file = "/include/basicInHead.jsp"%> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>justForAdminLobby.jsp</title>
  <style>
  
  	#leftWindow {
			float: left;
			margin-left: 50px;
			width: 15%;
			text-align: center;
			background-color: #dcd;
			display: sticky;
		}
		
		#rightWindow {
			float: left;
			margin-left: 40px;
			margin-right: 16px;
			width: 77%;
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
	<p><a class="btn btn-light" href="JustForAdmin.ad?mSw=0">관리자로비</a></p><br/><br/>
	<p><a class="btn btn-light" href="AdminMemberList.ad">회원관리</a></p><br/><br/>
	<p><a class="btn btn-light" href="AdminVisitCheck.ad">출석체크관리</a></p><br/><br/>
	<p><a class="btn btn-light" href="JustForAdmin.ad?mSw=3">게시판관리</a></p><br/><br/>
	<p><a class="btn btn-light" href="JustForAdmin.ad?mSw=4">자료실관리</a></p><br/><br/>
	<p><a class="btn btn-light" href="${ctp}/Lobby">관리종료</a></p><br/><br/>
</div>
<div id="rightWindow">
<p>
관 리 자 전 용 페 이 지 <br/>
현재 기능: 회원관리, 출석체크관리, 게시판관리, 자료실관리 <br/>
추가예정기능: 아이브소개 편집, 앨범정보 편집
</p> 
	
</div>
<p><br/></p>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
	<script src="js/scripts.js"></script>
</body>
</html>
