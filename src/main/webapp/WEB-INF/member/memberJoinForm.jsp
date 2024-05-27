<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file = "/include/basicInHead.jsp"%> 
<!DOCTYPE html>
<html lang="ko">
<head>
	<title>Time to DIVE into IVE</title>
	<script>
		'use strict';
		
		// 아이디,닉네임 중복확인용 스위치, 분류용 체크
		let whatCheck = '';
		let idCheckSw = 0;
		let nickNameCheckSw = 0;		
		
		/* <<< 정규식 >>> */ 
		// 이름: 한글 2~6자
		const regName= /^[가-힣]{2,6}$/;   
		// 아이디: 영문 대/소문자와 숫자만을 사용한 6~12자
		const regMid= /^[A-Za-z0-9]{6,12}$/;  
		// 비밀번호:  대문자 1개이상, 소문자 1개이상, 숫자 1개이상, 특수문자 1개이상을 포함한 10~16자
		const regPwd = /^(?=.*[a-z])(?=.*[A-Z])(?=.*[!@#$%^&*])[A-Za-z\d!@#$%^&*]{10,16}$/; 
		// 닉네임: 영문/대 소문자, 한글, 숫자만을 사용한 4~12자
		const regNickName = /^[A-Za-z가-힣0-9]{4,12}$/;  
		// 휴대폰번호: 앞번호 3 글자, 중간번호 3또는 4글자, 마지막번호는 4글자. 하이픈 포함 X
		const regContact = /^\d{3}\d{3,4}\d{4}$/;
		// 이메일: 맨 앞은 영문 대/소문자,숫자,밑줄과 하이픈만을 사용한 4~12 글자, 골뱅이 뒤는 영문 대/소문자,숫자,밑줄과 하이픈만을 사용한 4~8 글자
		const regEmail = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i

		// 아이디 중복체크
		function idCheck() {
			let mid = document.getElementById("mid").value;
			if(mid.trim() == "") {
				alert("아이디를 입력하세요");
				$("#mid").focus();
			}
			else {
				$.ajax({
					url : "MemberMidNickNameCheck.mem",
					type: "post",
					data : {
						mid : mid,
						whatCheck : 'midCheck'
					},
					success : function(res) {
						if(res != "0") {
							alert("사용 가능한 아이디입니다");
							idCheckSw = 1;
						}
						else {
							alert("이미 사용중인 아이디입니다");
							$("#mid").focus();
						}
					},
					error : function() {
						alert("아이디,닉네임 전송중 오류가 발생했습니다.");	
					}
				});				
			}
		}
		
		// 닉네임 중복체크
		function nickNameCheck() {
			let nickName = document.getElementById("nickName").value;
			if(nickName.trim() == "") {
				alert("닉네임을 입력하세요");
				$("#nickName").focus();
			}
			else {
				$.ajax({
					url : "MemberMidNickNameCheck.mem",
					type: "post",
					data : {
						nickName : nickName,
						whatCheck : 'nickNameCheck'
						},
					success : function(res) {
						if(res != "0") {
							alert("사용 가능한 닉네임입니다");
							nickNameCheckSw = 1;
						}
						else {
							alert("이미 사용중인 닉네임입니다");
							$("#nickName").focus();
						}
					},
					error : function() {
						alert("아이디,닉네임 전송중 오류가 발생했습니다.");	
					}
				});				
			}
		}
		
		// 회원가입하기
		function memberJoinCheck() {  
			let mid = $("#mid").val();
			let pwd = $("#pwd").val();
			let name = $("#name").val();
			let nickName = $("#nickName").val();
			
			console.log(mid);
			console.log(pwd);
			console.log(name);
			console.log(nickName);
			
			let contact = '';
			let contact1 = $("#contact1").val();
			let contact2 = $("#contact2").val();
			let contact3 = $("#contact3").val();
			contact += contact1 + contact2 + contact3;
			console.log(contact);
			
			let email = '';
			let email1 = $("#email1").val();
			let email2 = $("#email2").val();
			let email3 = $("#email3").val();
			email += email1 + email2 + email3;
			console.log(email);
			
			if(!mid.match(regMid)) {
				alert("아이디 형식에 맞게 작성해주세요!");
				alert("영문 대/소문자와 숫자만을 사용한 6~12자");
				$("#mid").focus();				
			}
			else if(!pwd.match(regPwd)) {
				alert("비밀번호 형식에 맞게 작성해주세요!");
				alert("대문자 1개이상, 소문자 1개이상, 숫자 1개이상, 특수문자 1개이상을 포함한 10~16자");
				$("#pwd").focus();					
			}
			else if(!name.match(regName)) {
				alert("이름 형식에 맞게 작성해주세요!");
				alert("한글 2~6자");
				$("#name").focus();
			}
			else if(!nickName.match(regNickName)) {
				alert("닉네임 형식에 맞게 작성해주세요!");
				alert("영문/대 소문자, 한글, 숫자만을 사용한 4~12자");
				$("#nickName").focus();		
			}
			else if(!contact.match(regContact)) {
				alert("전화번호 형식에 맞게 작성해주세요!");
				alert("앞번호 3자, 중간번호 3~4자, 마지막번호 4자");
				$("#contact").focus();				
			}
 			else if(!email.match(regEmail)) {
				alert("이메일 형식에 맞게 작성해주세요!"); 
				$("#email").focus();					
			} 
			else {
				if(idCheckSw != 1) {
					alert("아이디 중복체크를 진행해주세요");				
				}
				else if(nickNameCheckSw != 1){
					alert("닉네임 중복체크를 진행해주세요");		
				}
				else {
					memberJoinForm.submit();
				}
			}			
		}
		
		// 아이디,비밀번호 찾기 준비중
		function ready(e) {
			if(e == 'm') {
				alert("아이디 찾기 기능을 준비중입니다.");
			}
			else {
				alert("비밀번호 찾기 기능을 준비중입니다.");
			}
		}
		
		
	</script>
	<style>
	
	body {
		margin: 0px;
		padding: 0px;
		background-color: #f4f5f6;
	}
	
	th {
		width: 30%;
		text-align: left;
	}
	
	tr {
		width: 70%;
	}
	
	.join {
		margin-left: 200px; 
		width: 700px;
		float: left;
	}
	
	.joinBtns {
		margin-right: 100px;
		width: 300px;
		display: inline-block;
		float: right;
		position: relative;
		bottom: 350px;
		left: 80px;
	}
	
	input[type="button"] {
		width: 12%;
		margin-right: 30px;
	}
	
	
	
	</style>
</head>
<body class="d-flex flex-column h-100">
<%@ include file="/include/Navbar.jsp" %>
		<br/><br/>
		<h1 class="text-center"><font color="navy" size="10em"><strong>회 원 가 입</strong></font></h1>
		<br/><hr/>
		<div class="container">
		<br/><br/>
		<form name="memberJoinForm" method="post" action="MemberJoinOk.mem"> 
			<table id="LoginFormTable" class="table table-bordered">
				<tr>
					<th>아이디&nbsp;&nbsp;&nbsp;
						<input type="button" style="width:80px" value="중복확인" onclick="idCheck()" class="btn btn-primary btn-sm">
					</th>
					<td>
						<input type="text" name="mid" id="mid" maxlength="12" placeholder="아이디를 입력하세요" class="form-control p-1" autofocus required />
					</td>
				</tr>			
				<tr>
					<th>비밀번호</th>
					<td>
						<input type="password" name="pwd" id="pwd" maxlength="16" placeholder="비밀번호를 입력하세요" class="form-control p-1" required />
					</td>
				</tr>					
				<tr>
					<th>이름</th>
					<td>
						<input type="text" name="name" id="name" maxlength="6" placeholder="이름를 입력하세요" class="form-control p-1" required />
					</td>
				</tr>					
				<tr>
					<th>닉네임&nbsp;&nbsp;&nbsp;
						<input type="button" style="width:80px" value="중복확인" onclick="nickNameCheck()" class="btn btn-primary btn-sm">
					</th>
					<td>
						<input type="text" name="nickName" id="nickName" maxlength="12" placeholder="닉네임을 입력하세요" class="form-control p-1" required />
					</td>
				</tr>					
				<tr>
					<th>
					휴대폰번호<br/>[ ※ 010 번호만 가입이 가능합니다 ]
					</th>
					<td>
						<div class="input-group">
							<input type="text" style="width:20%; text-align: center;" name="contact" id="contact1" value="010" class="form-control p-1" disabled />
							<input type="text" style="width:40%" name="contact" id="contact2" class="form-control p-1" required />
							<input type="text" style="width:40%" name="contact" id="contact3" class="form-control p-1" required />
						</div>
					</td>
				</tr>					
				<tr>
					<th>이메일</th>
					<td>
						<div class="input-group">
							<input type="text" style="width:40%;" name="email" id="email1" class="form-control p-1" required />
							<input type="text" style="width:10%; text-align: center;" value="@" name="email" id="email2" class="form-control p-1" disabled />
							<input type="text" style="width:40%" name="email" id="email3" class="form-control p-1" required />
						</div>
					</td>
				</tr>					
				<tr>
					<td colspan="2">
						<div class="input-group-append text-center">
							<input type="button" value="회원가입" onclick="memberJoinCheck()" class="btn btn-success" />
							<input type="reset" style="width:12%; margin-right:40px;" value="다시작성" class="btn btn-danger" />
							<input type="button" style="width:12%; margin-right:40px;" value="로그인하기" onclick="location.href='MemberLogin.mem';" class="btn btn-warning" />
							<input type="button" value="아이디찾기" onclick="ready('m')" class="btn btn-info" />
							<input type="button" value="비밀번호재설정" onclick="ready('p')" class="btn btn-info" />
						</div>
					</td>
				</tr>
			</table>
		</form>
	</div>	
	<p><br/></p>
	<%@ include file="/include/footer.jsp"%>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
	<script src="js/scripts.js"></script>
</body>
</html>
