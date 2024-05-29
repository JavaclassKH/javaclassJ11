<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file = "/include/basicInHead.jsp"%> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html lang="ko">
<head>	
<title>myPage.jsp</title>
<style>

	th {
		width: 28%;
	}
	
	td {
		width: 72%;		
	}
	
	button {
		margin-right: 4px;
	}

</style>
</head>
<body class="d-flex flex-column h-100">
<%@ include file="/include/Navbar.jsp" %>
<p><br/></p>
<div class="container">
	<h2 class="text-center"><b><font color="gold" size="16em">마 이 페 이 지</font></b></h2>
	<br/><hr/><br/>
	<table class="table table-borderless text-dark">
		<tr>
			<th>아이디</th>
			<td>${vo.mid}</td>
		</tr>
		<tr>
			<th>닉네임</th>
			<td>${vo.nickName}</td>
		</tr>
		<tr>
			<th>회원등급</th>
			<td>${strLevel}</td>
		</tr>
		<tr>
			<th>이메일</th>
			<td>${vo.email}</td>
		</tr>
		<tr>
			<th>방문횟수</th>
			<td>${vo.visitCnt}</td>
		</tr>
		<tr>
			<th>회원가입일</th>
			<td>${fn:substring(vo.joinDate,0,11)}</td>
		</tr>
	</table>
	<br/>
	<div style="text-align: right">
		<button type="button" class="btn btn-primary">메시지 보기 
			<span class="badge bg-secondary"><%-- ${vo.msgCnt} --%>1</span>
		</button>
		<button type="button" class="btn btn-success">미확인 댓글 보기
			<span class="badge bg-secondary"><%-- ${vo.brCnt} --%>2</span>
		</button>
		<input type="button" value="회원정보수정" onclick="MemberInfoupdate('${vo.mid}')" class="btn btn-info" />
	</div>
</div>
<p><br/></p>
<%@ include file="/include/footer.jsp"%>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
	<script src="js/scripts.js"></script>
</body>
</html>