<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file = "/include/basicInHead.jsp"%> 
<!DOCTYPE html>
<html lang="en">
<head>
	<title>Time to DIVE into IVE</title>
	<script>
		'use strict';
		
		/*  정규식 잠시 봉인
			let regMid = /^[a-zA-Z0-9_]{4,20}$/;	  // 아이디는 4~20길이의 영문 대/소문자와 숫자와 밑줄 가능
			let regPwd = "";                        // 비밀번호는 8~14길이의 영문 대/소문자와 숫자와 밑줄과 특수문자 가능
		  let regName = /^[가-힣a-zA-Z]+$/;        // 이름은 최대 8자의 한글/영문 가능
		  let regNickName = /^[가-힣0-9_]+$/;		  	// 닉네임은 8~14길이의 한글, 숫자, 밑줄만 가능
		  let reg
		*/
		
		let idCheckSw = 0;
		let nickNameCheckSw = 0;
		
		
		function memberJoinOkCheck() {  
			let mid = $("#mid").val();
			let pwd = $("#pwd").val();
			let name = $("#name").val();
			let nickName = $("#nickName").val();
			let contact = $("#contact").val();
			let email = $("#email").val();
			
			if(idCheckSw != 1 && nickNameCheckSw != 1) {
				alert("아이디,닉네임 중복체크를 진행해주세요");				
			}
			if(idCheckSw != 1 && nickNameCheckSw == 1){
				alert("아이디중복체크를 진행해주세요");		
			}
			if(idCheckSw == 1 && nickNameCheckSw != 1){
				alert("닉네임 중복체크를 진행해주세요");		
			}
			else {
				myform.submit();
			}
		}
		 
		// 아이디 중복체크
		function idCheck() {
			let mid = $("#mid").val();
			if(mid.trim() == "") {
				alert("아이디를 입력하세요");
				$("#mid").focus();
			}
			else {
				$.ajax({
					url : "",
				});
				
			}
		}
		
		// 닉네임 중복체크
		function nickNameCheck() {
			let nickName = $("#nickName").val();
			if(nickName.trim() == "") {
				alert("닉네임을 입력하세요");
				$("#nickName").focus();
			}
			else {
				
				
			}
		}
		
		
		
	</script>
</head>
<body class="d-flex flex-column h-100">
<%@ include file="/include/Navbar.jsp"%>
	<div class="container">
		<div class="mt-6">
			<table style="height:150px">
				<tr>
					<th><font color="gold" size="8em"><strong>회&nbsp; 원&nbsp; 가&nbsp; 입&nbsp; 화&nbsp; 면&nbsp;</strong></font></th>
				</tr>
			</table>
			<form name="memberJoin" method="post">
			  <b>아이디</b>&nbsp;&nbsp;&nbsp;&nbsp;<input type="button" value="중복확인" onclick="idCheck()" class="btn btn-info btn-sm mb-2" /><br/>
			  <div class="input-group mb-4">
			    <input type="text" name="mid" id="mid" placeholder="아이디 입력" maxlength="20" class="form-control" autofocus required />
			  </div>
		  	<b>비밀번호</b><br/>
			  <div class="input-group mb-4">
			    <input type="password" name="pwd" id="pwd" placeholder="비밀번호 입력" maxlength="14" class="form-control" required />
			  </div>
			 	<b>닉네임</b>&nbsp;&nbsp;&nbsp;&nbsp;<input type="button" value="중복확인" onclick="nickNameCheck()" class="btn btn-info btn-sm mb-2" /><br/>
			  <div class="input-group mb-4">
			    <input type="text" name="nickName" id="nickName" placeholder="닉네임 입력" class="form-control" required />
			  </div>
			 	<b>성명</b><br/>
			  <div class="input-group mb-4">
			    <input type="text" name="name" id="name" placeholder="성명 입력" maxlength="8" class="form-control" required />
			  </div>
			  <b>전화번호</b><br/>
			  <div class="input-group mb-4">
			    <input type="text" name="contact" id="contact" placeholder="전화번호 입력" class="form-control" required />
			  </div>
			  <b>이메일</b><br/>
			  <div class="input-group mb-4">
			    <input type="text" name="email" id="email" placeholder="이메일 입력" class="form-control" required />
			  </div>
				<div class="text-right">
					<input type="reset" value="다시작성" class="btn btn-danger mr-4" />
					<input type="button" value="돌아가기" onclick="location.href='Lobby.mem'" class="btn btn-warning mr-4" />
					<input type="button" value="회원가입" onclick="memberJoinOkCheck()" class="btn btn-success" />
				</div>
			</form>
		</div>
	</div>	
	<%@ include file="/include/footer.jsp"%>
	<!-- Bootstrap core JS-->
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
	<!-- Core theme JS-->
	<script src="js/scripts.js"></script>
</body>
</html>
