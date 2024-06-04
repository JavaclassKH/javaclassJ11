<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file = "/include/basicInHead.jsp"%> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<c:set var="ipLobby" value="http://192.168.50.64:9090/javaclassJ11/Lobby"/>
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
		
		#rightWindow table {
			width: 80%;
			margin: auto;
		}
		
  </style>
</head>
<body>
<%@ include file = "/include/NavbarAdmin.jsp"%>
<p><br/></p><br/> 
<div id="leftWindow">	
	<br/><br/>	
	<p><a class="btn btn-light" href="JustForAdmin.ad">관리자로비</a></p><br/><br/>
	<p><a class="btn btn-light" href="AdminMemberList.ad">회원관리</a></p><br/><br/>
	<p><a class="btn btn-light" href="AdminVisitCheck.ad">출석체크관리</a></p><br/><br/>
	<p><a class="btn btn-light" href="AdminBoardList.ad">게시판관리</a></p><br/><br/>
	<p><a class="btn btn-light" href="${ipLobby}">관리종료</a></p><br/><br/>
</div>
<div id="rightWindow">
<p><br/></p>
<h2 class="text-center"><b>관&nbsp; 리&nbsp; 자&nbsp; 현&nbsp; 황&nbsp;</b></h2>
<p><br/></p>
<table class="table table-hover table-bordered text-center">
	<tr class="table-info">
		<td>아이디</td>
		<td>닉네임</td>
		<td>권한</td>
	</tr>
	<c:forEach var="vo" items="${vos}" varStatus="st">
	<c:set var="check" value="${fn:substring(vo.nickName,1,3)}" />
		<tr>
			<td>${vo.mid}</td>
			<td>${vo.nickName}</td>
			<td>
				<c:if test="${check == 'AD'}">
					관리자
				</c:if>
				<c:if test="${check == 'GM'}">
					운영자
				</c:if>
			</td>
		</tr>
	</c:forEach>
	<tr><td colspan="3" class="m-0 p-0"></td></tr>
</table>	
<p><br/></p>
</div>
<p><br/></p>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
	<script src="js/scripts.js"></script>
</body>
</html>
