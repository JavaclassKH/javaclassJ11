<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file = "/include/basicInHead.jsp"%> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html lang="ko">
<head>	
<title>visitCheck.jsp</title>
<script>
	'use strict';
	
	function visitCheck() {
		let nickName = document.getElementById("nickName").value;
		let content = document.getElementById("content").value;
		
		if(content.trim() == "" || content.length >= 20) {
			alert("출석체크&한줄수다를 작성해주세요!(25자 이내)");
			document.getElementById("content").focus();
		}
		else {
			$.ajax({
				url : "MemberVisitCheckOk.mem",
				type : "post",
				data : {
					nickName : nickName,
					content : content 
				},
				success : function(res) {
					if(res != "0") {
						location.reload();
					}
					else {
						alert("출석체크 등록에 실패하였습니다!");
						document.getElementById("content").focus();;
					}
				},
				error : function() {
					alert("출석체크 전송오류..");
				}
			});
		}		
	}
	
	
</script>
</head>
<body class="d-flex flex-column h-100">
<%@ include file="/include/Navbar.jsp" %>
<p><br/></p>
<div class="container">
<h2 class="text-left"><b>출석체크&amp;한줄수다~</b></h2>
<br/>
	<form name="visitCheckForm" method="post">
		<table class="table table-bordered">
			<tr class="table-dark text-dark">
				<td>
					<input type="text" name="nickName" id="nickName" value="${sNickName}" class="form-control" readonly />				
				</td>
				<td>				
					<input type="text" name="content" id="content" placeholder="출석체크&한줄수다~" maxlength="20" class="form-control" autofocus required />
				</td>
				<td>
					<input type="button" value="등록" onclick="visitCheck()" class="btn btn-primary" />
				</td>
			</tr>
		</table>
	</form>
	<table class="table table-hover">
		<tr>
			<th>작성자</th>
			<th>작성일</th>
			<th>출석체크&amp;한줄수다</th>
		</tr>
		<c:forEach var="vo" items="${vos}" varStatus="st">
			<tr>
				<td>${vo.nickName}</td>
				<td>${fn:substring(vo.checkDate,0,11)}</td>
				<td>${vo.content}</td>
			</tr>
		</c:forEach>
		<tr><td colspan="3" class="m-0 p-0"></td></tr>
	</table>
</div>
<p><br/></p>
<%@ include file="/include/footer.jsp"%>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
	<script src="js/scripts.js"></script>
</body>
</html>