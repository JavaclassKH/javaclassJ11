<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file = "/include/basicInHead.jsp"%> 
<!DOCTYPE html>
<html lang="ko">
<head>	
<title>simplyMakerIntroduce.jsp</title>
<script>
	'use strict';
	
	function whatIsThis() {
		let ans = confirm("이게 뭔지 궁금하신가요?");
		if(!ans) {
			alert("노잼 노감동 이스터에그 였습니다~ \n덕질 더 많이 하세요!");
			window.open("https://cafe.daum.net/IVEstarship", "_blank");
		}
		else {
			alert("노잼 노감동 이스터에그 였습니다~ \n덕질 더 많이 하세요!");
			window.open("https://cafe.daum.net/IVEstarship", "_blank");
		}
	}
	
</script>
<style>
	
	tr {
		margin-bottom: 7px;
	}

	th {
	 width: 25%;
	}
	
	td {
	 width: 75%;
	 text-align: left;
	 margin-left: 10px;
	}
	
</style>
</head>
<body class="d-flex flex-column h-100">
<%@ include file="/include/Navbar.jsp" %>
<p><br/></p>
<div class="container">
	<h1 class="text-center"><strong><font color="gold" size="15em">제 작 자 소 개</font></strong></h1>
	<br/><hr/><br/>	
	<div>
		<table class="table table-borderless">
			<tr>
				<th>제작자 이름</th>
				<td>이 규 혁</td>
			</tr>
			<tr>
				<th>제작자 나이</th>
				<td>만 25세 / 한국 나이 27세</td>
			</tr>
			<tr>
				<th>제작자 학력</th>
				<td>4년제 대학 졸업</td>
			</tr>
			<tr>
				<th>제작자 전공</th>
				<td>중국어</td>
			</tr>
			<tr>
				<th>제작자 MBTI</th>
				<td>INFP</td>
			</tr>
			<tr>
				<th>제작자 취미</th>
				<td>드라마 시청, 산책, 독서, 오락실 게임(펌프)</td>
			</tr>
		</table>
		<div style="text-align: right">
			<input type="button" style="margin-right: 10px;" value="로비" onclick="location.href='${ctp}/Lobby';" class="btn btn-warning btn-lg" />
			<input type="button" value="이게뭘까요" onclick="whatIsThis()" class="btn btn-danger btn-lg" />
		</div>
	</div>
</div>
<p><br/></p>
<%@ include file="/include/footer.jsp"%>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
	<script src="js/scripts.js"></script>
</body>
</html>