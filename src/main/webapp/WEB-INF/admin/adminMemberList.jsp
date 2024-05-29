<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file = "/include/basicInHead.jsp"%> 
<!DOCTYPE html>
<html lang="ko">
<head>	
<title>adminMemberList.jsp</title>
</head>
<body class="d-flex flex-column h-100">
<p><br/></p>
<div class="container">
	<div>
		<table class="table table-bordered table-hover">
			<tr>
				<th>아이디</th>
				<th>닉네임</th>
				<th>가입일</th>
				<th>방문횟수</th>
				<th>회원등급</th>
			</tr>
			<c:forEach var="vo" items="${vos}" varStatus="st">
				<tr>
					<td>${vo.mid}</td>
					<td>${vo.nickName}</td>
					<td>${vo.joinDate}</td>
					<td>${vo.visitCnt}</td>
					<c:if test="${vo.memLevel == 1}">
						<td>준회원</td>
					</c:if>
					<c:if test="${vo.memLevel == 2}">
						<td>정회원</td>
					</c:if>
				</tr>
			</c:forEach>
		</table>
	</div>
</div>
<p><br/></p>
<%@ include file="/include/adminFooter.jsp"%>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
	<script src="js/scripts.js"></script>
</body>
</html>