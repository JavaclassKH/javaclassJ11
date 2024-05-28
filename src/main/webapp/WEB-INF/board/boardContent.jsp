<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file = "/include/basicInHead.jsp"%> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
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
	
</script>
<style>
	th {
		font-size: 1.4em;
	}
	.contentBox {
		height: 400px;
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
			<td colspan="3" class="text-left">
				${vo.content} 
			</td>
		</tr>
		<tr>
			<td colspan="3" style="text-align:right">
					<a href="javascript:goodPlus('${vo.idx}')" class="btn btn-light">😄 ${vo.good}</a>
					&nbsp;&nbsp;
					<a href="javascript:badPlus('${vo.idx}')" class="btn btn-light">😣 ${vo.bad}</a>
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<input type="button" value="신고하기" class="btn btn-danger"/>
					<input type="button" value="목록" onclick="location.href='BoardList.bo';" class="btn btn-warning"/>
					<input type="button" value="답글달기" onclick="boardReply('${vo.idx}')" class="btn btn-info"/>
			</td>
		</tr>
	</table>
</div>
<p><br/></p>
<%@ include file="/include/footer.jsp"%>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
	<script src="js/scripts.js"></script>
</body>
</html>