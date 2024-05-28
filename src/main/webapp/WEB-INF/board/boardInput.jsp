<%@page import="java.rmi.Remote"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file = "/include/basicInHead.jsp"%> 
<!DOCTYPE html>
<html lang="ko">
<head>	
<title>boardInput.jsp</title>
<script>
	'user strict';
	
	function boardInputCheck() {
		let title = document.getElementById("title").value;
		let content = document.getElementById("content").value;
		
		if(title.trim() == "" || content.trim() == "") {
			alert("제목과 내용 모두 입력해주세요");
		}
		
		
		visitCheckForm.submit();
		
	}

</script>
<style>
	input[type="text"] {
		width: 450px;
	}
</style>
</head>
<body class="d-flex flex-column h-100">
<%@ include file="/include/Navbar.jsp" %>
<p><br/></p>
<div class="container">
	<h2 class="text-dark"><b><font size="10em">게시판 글 쓰기</font></b></h2><br/>
		<form name="visitCheckForm" method="post" action="BoardInputOk.bo">
			<table class="table table-bordered">
				<tr class="table-warning text-dark">
					<td> 작성자
						<input type="text" name="nickName" id="nickName" value="${sNickName}" class="form-control" readonly />				
					</td>
					<td> 제목				
						<input type="text" name="title" id="title" placeholder="출석체크&한줄수다~" maxlength="20" class="form-control" autofocus required />
					</td>
				</tr>
				<tr>
					<td colspan="2">
						<textarea rows="12" name="content" id="content" class="form-control" style="resize: none;"></textarea>
					</td>
				</tr>
				<tr class="text-right">
					<td>
						<input type="button" value="등록" onclick="boardInputCheck()" class="btn btn-success" />
						<input type="reset" value="다시작성" class="btn btn-warning" />
						<input type="button" value="목록가기" onclick="location.href='BoardList.bo';" class="btn btn-warning" />
					</td>
				</tr>
			</table>
			<input type="hidden" name="hostIp" value="<%= request.getRemoteAddr() %>"/>
		</form>
</div>
<p><br/></p>
<%@ include file="/include/footer.jsp"%>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
	<script src="js/scripts.js"></script>
</body>
</html>