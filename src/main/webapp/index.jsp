<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri ="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<html lang="en">
<head>
  <title>Time to DIVE into IVE</title>
	<script>
		let ans = confirm("아이브의 세계로 입장하시겠습니까?");
		if(ans) {
			location.href="http://192.168.50.64:9090/javaclassJ11/Lobby"; 
			/* location.href="${ctp}/Lobby";  */
		}
		else {
			window.close();
		}	
	</script>
</head>

</html>

