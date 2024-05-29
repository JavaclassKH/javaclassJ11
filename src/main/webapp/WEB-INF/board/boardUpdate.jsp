<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file = "/include/basicInHead.jsp"%> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<% pageContext.setAttribute("et", "\n"); %>
<!DOCTYPE html>
<html lang="ko">
<head>	
<title>boardUpdate.jsp</title>
<script>
	'use strict';
	
	function boardUpdateCheck() {
		let title = document.getElementById("title").value;
		let content = document.getElementById("content").value;
		
		if(title.trim() == "" || content.trim() == "") {
			alert("제목과 내용 모두 입력해주세요");
		}
			
		boardUpdateForm.submit(); 
	}
	
</script>
</head>
<body class="d-flex flex-column h-100">
<%@ include file="/include/Navbar.jsp" %>
<p><br/></p>
<div class="container">
	<h1 class="ml-6"><strong>글 수 정 하 기</strong></h1>
	<br/>
	<form name="boardUpdateForm" method="post" action="BoardUpdateOk.bo">
			<table class="table table-bordered">
				<tr class="table-warning text-dark">
					<td> 작성자
						<input type="text" name="nickName" id="nickName" value="${sNickName}" class="form-control" readonly />				
					</td>
					<td> 제목				
						<input type="text" name="title" id="title" placeholder="${vo.title}" maxlength="20" class="form-control" autofocus required />
					</td>
				</tr>
				<tr>
					<td colspan="2">
						<textarea rows="12" name="content" id="content" class="form-control" style="resize: none; text-align: left;">
							${fn:replace(vo.content,et,"<br/>")}
						</textarea>
					</td>
				</tr>
				<tr class="text-right">
					<td>
						<input type="button" value="수정" onclick="boardUpdateCheck()" class="btn btn-success" />
						<input type="reset" value="다시작성" class="btn btn-warning" />
						<input type="button" value="돌아가기" onclick="location.href='BoardContent.bo?idx=${vo.idx}';" class="btn btn-warning" />
					</td>
				</tr>
			</table>
			<input type="hidden" name="hostIp" value="<%= request.getRemoteAddr() %>"/>
			<input type="hidden" name="idx" value="${vo.idx}"/>
		</form>
</div>
<p><br/></p>
<%@ include file="/include/footer.jsp"%>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
	<script src="js/scripts.js"></script>
</body>
</html>