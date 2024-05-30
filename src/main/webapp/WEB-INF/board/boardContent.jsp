<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file = "/include/basicInHead.jsp"%> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<% pageContext.setAttribute("et", "\n"); %>
<!DOCTYPE html>
<html lang="ko">
<head>	
<title>boardContent.jsp</title>
<script>
	'use strict';
	let cnt = 0;
	
	function scrap(content) {
		window.clipboardData.setData('Text', content);
	}
	
	function goodPlus(idx) {
		$.ajax({
			url : "BoardGoodBad.bo",
			type : "post",
			data : { 
				idx : ${vo.idx},
				cnt : +1
			},
			success : function(res) {
				if(res != "0") location.reload();
			},
			error : function() {
				alert("");
			}
		});
	}
	
	function badPlus(idx) {
		$.ajax({
			url : "BoardGoodBad.bo",
			type : "post",
			data : { 
				idx : ${vo.idx},
				cnt : -1
			},
			success : function(res) {
				if(res != "0") location.reload();
			},
			error : function() {
				alert("");
			}
		});
	}
	
	function boardReply(idx) {
		let content = boardReplyForm.content.value;
		
		$.ajax({
			url : "BoardReplyInputOk.bo",
			type : "post",
			data : {
				idx : idx,
				content : content
			},
			success : function(res) {
				if(res != "0") location.reload();
				else alert("댓글 등록에 오류가 발생했습니다");
			}
		});
	}
	
	
</script>
<style>
	th {
		font-size: 1.4em;
	}
	
	.textBox {
		height: 300px;
		overflow: scroll;
	}
	
	.contentShow {
		margin-left: 10px;
	}
	
	.btn {
		margin-right: 15px;
	}
	
	.text-left {
		height: 350px;
	}
	
	#thl {
		width: 26%;
		text-align: left;
		padding-left: 25px;
	}
	
	#tdl {
		width: 74%;
		text-align: left;
	}
	
</style>
</head>
<body class="d-flex flex-column h-100">
<%@ include file="/include/Navbar.jsp" %>
<p><br/></p>
<div class="container">
	<h1 class="text-center"><b>게시글 보기</b></h1>
	<br/>
	<table class="table table-bordered table-hover">
		<tr class="text-center">
			<th>
				<font color="navy">작성자</font> <br/><br/>
				<font color="gold">${vo.nickName}</font>
			</th>
			<th>
				<font color="navy">제목</font> <br/><br/>
				<font color="gold">${vo.title}</font>
			</th>
			<th>
				<font color="navy">작성일자</font> <br/><br/>
				<font color="gold">${fn:substring(vo.wDate,0,16)}</font>
			</th>
		</tr>
		<tr>
			<td colspan="3" class="textBox">
				${fn:replace(vo.content,et,"<br/>")} 
			</td>
		</tr>
		<tr>
			<td colspan="3" style="text-align:right">
			<c:if test="${vo.mid == sMid}">
				<input type="button" value="수정하기" onclick="location.href='BoardUpdate.bo?idx=${vo.idx}';" class="btn btn-warning"/>
			</c:if>
			<c:if test="${vo.mid == sMid || memLevel == 0}">
				<input type="button" value="삭제하기" onclick="location.href='BoardContentDelete.bo?idx=${vo.idx}';" class="btn btn-warning"/>
			</c:if>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<a href="javascript:goodPlus('${vo.idx}')" class="btn btn-light">😄 ${vo.good}</a>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<a href="javascript:badPlus('${vo.idx}')" class="btn btn-light">😣 ${vo.bad}</a>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<input type="button" value="신고하기" class="btn btn-danger"/>
				<input type="button" value="목록" onclick="location.href='BoardList.bo';" class="btn btn-warning"/>
			</td>
		</tr>
	</table><br/>
		<form name="boardReplyForm">
		<table class="table table-borderless">
			<tr>
				<td>
					<c:set var="ph" value="※ 불쾌감과 혐오감을 조성하는 댓글 작성은 자제해주세요.&#13;&#10;※ 상대방에 대한 매너는 꼭 지켜주세요. 욕설과 비방을 지양해주세요.&#13;&#10;※ 아름다운 댓글 문화가 더욱 행복한 팬 활동을 할 수 있도록 이끌어갑니다.	" />
					<textarea rows="4" name="content" class="form-control" placeholder="${ph}" style="resize: none;"></textarea>
					<br/>
				</td>
			</tr>
			<tr style="text-align: right">
				<td>
					<input type="button" value="답글달기" onclick="boardReply('${vo.idx}')" class="btn btn-info"/>
				</td>
			</tr>
		</table>
	</form>
	<br/>
	<table class="table table-primary text-center">
		<c:forEach var="vo" items="${vos}" varStatus="st">
			<tr>
				<th id="thl">
					🆔 ${vo.nickName}
				</th>
				<td>${vo.content}</td>
			</tr>
		</c:forEach>
	</table>
</div>
<p><br/></p>
<%@ include file="/include/footer.jsp"%>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
	<script src="js/scripts.js"></script>
</body>
</html>