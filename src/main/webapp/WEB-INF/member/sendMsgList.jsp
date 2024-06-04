<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file = "/include/basicInHead.jsp"%> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html lang="ko">
<head>	
<title>receiveMsgList.jsp</title>
<style>
	th {
		width: 16%;
	}
	td {
		width: 28%;
	}
	
	#msgRead{
		overflow: scroll;
	}
	
		
	a {
		text-align: right;
		float: right;
	}
	
	.text-right {
		text-align: right;
		width: 10%
	}
	
</style>
<script>
	'use strict';
	
	// 메시지 내용 보는 모달 띄우기
	function msgReadModalOn(message) {
		$("#msgReadModal #msgRead").text(message);
	}
	
	// 메시지 삭제 처리(휴지통)
		function msgErase(idx) {
		let receiveMsgIdx = idx;
		
		$.ajax({
			url : "MsgErase.mem",
			type : "post",
			data : { 
				idx : receiveMsgIdx,
				part : "send"	
			},
			success:function(res) {
				if(res != "0") {
					alert("메시지가 삭제되었습니다");
					location.reload(true);
				}
				else {
					alert("메시지 삭제에 실패했습니다");					
				}
			},
			error : function() {
				alert("메시지 삭제 요청 전송중 문제가 발생했습니다.");
			}
		});
	}

</script>
</head>
<body class="d-flex flex-column h-100">
<%@ include file="/include/Navbar.jsp" %>
<p><br/></p>
<div class="container">
<h2 class="text-center"><b><font color="gold" size="16em">발 신 메 시 지</font></b></h2><br/>
	<table class="table table-border">
		<tr class="table-info">
			<th>수신자</th>
			<td>내용확인</td>
			<td>발신일자</td>
			<td class="text-right">비고</td>
		</tr>
		<c:forEach var="vo" items="${vos}" varStatus="st">
			<tr>
				<th>${vo.receiveMid}</th>
				<td>
					<input type="button" value="읽기" onclick="msgReadModalOn('${vo.message}')" data-bs-toggle="modal" data-bs-target="#msgReadModal" class="btn btn-light" />
				</td>
				<td>${fn:substring(vo.sDate,0,11)}</td>
				<td class="text-right">
					<input type="button" value="삭제" onclick="msgErase('${vo.idx}')" class="btn btn-danger" />
				</td>
			</tr>
		</c:forEach>
		<tr><td colspan="4" class="m-0 p-0"></td></tr>
	</table>
<br/><hr/><br/>
<div>
	<a href="MyPage.mem" class="btn btn-light">마이페이지</a>
</div>
</div>

<!-- 메시지 내용보기 모달 -->
<div class="modal fade" id="msgReadModal">
  <div class="modal-dialog modal-xl">
    <div class="modal-content">

      <!-- Modal Header -->
      <div class="modal-header">
        <h4 class="modal-title"><b>보낸메시지 내용</b></h4>
        <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
      </div>

      <!-- Modal body -->
      <div class="modal-body" style="height: 450px;">
      	<br/>
      	<span id="msgRead"></span>
      </div>

      <!-- Modal footer -->
      <div class="modal-footer">
        <button type="button" class="btn btn-danger" data-bs-dismiss="modal">닫기</button>
      </div>

    </div>
  </div>
</div>

<p><br/></p>
<%@ include file="/include/footer.jsp"%>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
	<script src="js/scripts.js"></script>
</body>
</html>