<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file = "/include/basicInHead.jsp"%> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
	
	#modalBtn {
		text-align: right;
	}

</style>
<script>
	'use strict';
	
	// 메세지 보내기 모달창
	function sendModalOn(nickName, mid) {
		$("#sendModal #sendNickName").text(nickName);
		$("#sendModal #sendMid").text(mid);
	}
	
	// 메세지 보내기 전 회원(수신자)존재여부 체크
	function receiverCheck() {
		let receiverMid = modalSend.receiver.value;
		if(receiverMid == "") {
			alert("수신자의 아이디를 입력하세요");
			$("#receiver").focus();
			return;
		}
		 $.ajax({
			 url : "MsgSendMidCheck.mem",
			 type : "post",
			 data : { receiverMid : receiverMid },
			 success : function(res) {
				 if(res != "0") {
					 alert("해당 회원은 존재하지 않는 회원입니다");
					 $("#receiver").focus();
					 $("input[name='receiver']").val("");
				 }
				 else {
					 alert("해당 회원에게 메세지를 보냅니다");			
					 $("#receiver").text(receiverMid);
					 $("input[name='receiver']").attr("readonly",true);
					 $("input[name='rCheck']").hide();
					 $("input[name='rChange']").show();
					 $("textarea[name='message']").focus();
				 }
			 },
			 error : function() {
				 alert("메시지 전송 중 오류가 발생했습니다");				
			}
		 });		
	}
	
	// 메시지 수신자 변경하기
	function receiverChange() {
		alert("수신자를 다시 지정해주세요");
		$("input[name='receiver']").attr("readonly",false);
		$("input[name='receiver']").val("");
		$("textarea[name='message']").val("");
		$("input[name='rCheck']").show();
		$("input[name='rChange']").hide();
		$("#receiver").focus();
	}
	
	// 메시지 전송하기! 
	function msgSend(mid) {
		let receiveMid = modalSend.receiver.value;
		let message = modalSend.message.value;
				
		$.ajax({
			url : "MessageSend.mem",
			type : "post",
			data : {
				sendMid : mid,
				receiveMid : receiveMid,
				message : message
			},
			success : function(res) {
				if(res != "0"){
					alert("메시지 전송에 성공했습니다");		
				}			
				else {
					alert("메시지 전송에 실패했습니다");										
				}
			},
			error : function() {
				alert("메시지 전송 오류");
			}
		});
	}
	
	

</script>
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
		<button type="button" onclick="sendModalOn('${vo.nickName}','${vo.mid}')" data-bs-toggle="modal" data-bs-target="#sendModal" class="btn btn-info">
			메시지 보내기
		</button>
		<button type="button" onclick="location.href='GoToSendMsgList.mem?mid=${vo.mid}';" class="btn btn-success">
			보낸 메시지	
		</button>
		<button type="button" onclick="location.href='GoToReceiveMsgList.mem?mid=${vo.mid}';" class="btn btn-primary">
			받은 메시지	<span class="badge bg-secondary" id="receiveMsgCnt">${hereCnt}</span>
		</button>
		<input type="button" value="회원정보수정" onclick="MemberInfoupdate('${vo.mid}')" class="btn btn-danger" />
	</div>
</div>
<p><br/></p>

<!-- 메시지 보내기 모달 -->
<div class="modal fade" id="sendModal">
  <div class="modal-dialog modal-xl">
    <div class="modal-content">

      <!-- Modal Header -->
      <div class="modal-header">
        <h4 class="modal-title"><b>메시지 보내기</b></h4>
        <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
      </div>

      <!-- Modal body -->
      <div class="modal-body" style="height: 450px;">
      	<form name="modalSend">
	      	발신자 &nbsp;&nbsp;&nbsp;<span id="sendNickName"></span>(<span id="sendMid"></span>)<br/><br/>
		      수신자
		      <div class="input-group append">
			      <input type="text" name="receiver" id="receiver" class="form-control" />
			      <input type="button" name="rCheck" value="수신자확인" style="border-radius: 5px;" onclick="receiverCheck()" class="btn btn-info" />
			      <input type="button" name="rChange" value="수신자변경" style="display: none;" onclick="receiverChange()" class="btn btn-info" />
		      </div><br/>
	      	메세지 내용 <br/>
	      	<textarea rows="8" name="message" id="message" class="form-control" style="resize: none;"></textarea><br/>   
	      	<div id="modalBtn">
	      		<input type="button" value="보내기" onclick="msgSend('${vo.mid}')" class="btn btn-success" />
	      		&nbsp;&nbsp;
	      		<input type="reset" value="다시쓰기" class="btn btn-danger" />
	      		<br/>
	      	</div>
      	</form>
      </div>

      <!-- Modal footer -->
      <div class="modal-footer">
        <button type="button" class="btn btn-danger" data-bs-dismiss="modal">닫기</button>
      </div>

    </div>
  </div>
</div>

<%@ include file="/include/footer.jsp"%>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
	<script src="js/scripts.js"></script>
</body>
</html>