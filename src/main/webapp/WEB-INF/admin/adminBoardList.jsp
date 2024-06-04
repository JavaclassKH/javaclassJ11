<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ include file = "/include/basicInHead.jsp"%> 
<% request.setAttribute("newLine", "\n"); %>
<c:set var="ipLobby" value="http://192.168.50.64:9090/javaclassJ11/Lobby"/>
<!DOCTYPE html>
<html lang="ko">
<head>	
<title>adminBoard.jsp</title>
<script>
	'use strict';
	
	// 전체선택 , 전체해제
	function selectChange(x) {
		if(x == 1) {
		  for(let i=0; i<=${fn:length(vos)}; i++) {
		    $("#boardContentNo"+i).prop("checked",true);
		  }				
		}
		else if(x == 2) {
		  for(let i=0; i<=${fn:length(vos)}; i++) {
		    $("#boardContentNo"+i).prop("checked",false);
		  }
		}
	}
	
	// 선택글 전부 지우기
	function boardDelete() {
		let idxs = document.querySelectorAll('input[name=boardContentNo]:checked');
		
		if(idxs.length == "" || idxs.length === 0 || idxs == null) {
			alert("삭제할 게시글을 1개 이상 선택해주세요!");
			return;
		}
		
    let idxArr = "";
    idxs.forEach(function(idx) {
    	idxArr += idx.value+"/";
    });
    alert("idxArr : " + idxArr);
    
		$.ajax({
	    url: "AdminBoardListDelete.ad",
	    type: "post",
	    data: {
	      idxArr : idxArr
	    },
	    success : function(res) {
	      if (res != "0") {
	        alert("선택게시글 삭제 완료!");
	        location.reload(true);
	      } 
	      else {
	        alert("선택게시글 삭제 실패!");
	      }
	    },
	    error : function() {
	      alert("선택게시글 삭제 전송 오류!");
	    }
	  });
			
	}
	
	// 글 제목 클릭시 게시자, 게시글 내용 모달로!
	function modalOn(nickName, content) {
		
		$("#boardModal #modalNickName").text(nickName);
		$("#boardModal #modalContent").text(content);
		$("#boardModal #modalNickName").text(${vo.nickName});
		$("#boardModal #modalContent").text(${vo.content});
		
	}
	
</script>
<style>
  	#leftWindow {
			float: left;
			margin-left: 50px;
			width: 15%;
			text-align: center;
			background-color: #dcd;
			display: sticky;
		}
		
		#rightWindow {
			float: left;
			margin-left: 40px;
			margin-right: 16px;
			width: 70%;
			background-color: #efe;
		}

		#allUnSel {
			margin-right: 20px;
		}
		
		#deleteBtn {
			float: right;
			text-align: right;
			margin-bottom: 12px;
		}
		
		


</style>
</head>
<body>
<%@ include file="/include/Navbar.jsp" %>
<p><br/></p><br/>
	<div id="leftWindow">	
		<br/><br/>	
		<p><a class="btn btn-light" href="JustForAdmin.ad">관리자로비</a></p><br/><br/>
		<p><a class="btn btn-light" href="AdminMemberList.ad">회원관리</a></p><br/><br/>
		<p><a class="btn btn-light" href="AdminVisitCheck.ad">출석체크관리</a></p><br/><br/>
		<p><a class="btn btn-light" href="AdminBoardList.ad">게시판관리</a></p><br/><br/>
		<p><a class="btn btn-light" href="${ipLobby}">관리종료</a></p><br/><br/>
	</div>
	<div id="rightWindow">
		<br/>
		<div class="container">
			<h2 class="text-center"><b>게 시 판 관 리 페 이 지</b></h2><br/>
			<div id="btnLeft">
				<button id="allSel" onclick="selectChange(1)" class="badge bg-primary">전체선택</button>
				<button id="allUnSel" onclick="selectChange(2)" class="badge bg-warning">전체해제</button>
				<button id="deleteBtn" onclick="boardDelete()" class="badge bg-danger">삭제</button>
			</div>
				<table class="table table-hover">
					<tr class="table-secondary text-dark text-center">
						<td id="sel1">선택</td>
						<th>번호</th>
						<th>작성자</th>
						<th>제목</th>
						<th>작성일자</th>
						<th>조회수</th>
					</tr>
					<c:set var="index" value="${fn:length(vos)}"/>
					<c:forEach var="vo" items="${vos}" varStatus="st">
					<tr class="text-center">
						<td id="sel2">
							<input type="checkbox" name="boardContentNo" id="boardContentNo${index}" value="${vo.idx}" />
						</td>
						<td>${index}</td>
						<td>${vo.nickName}</td>
						<td>										
							<a href="#" onclick="modalOn('${vo.nickName}','${vo.content}')" class="btn btn-light btn-sm" data-bs-toggle="modal" data-bs-target="#boardModal">
							${vo.title}
							</a>						
						</td>
						<td>${fn:substring(vo.wDate,0,11)}</td>
						<td>${vo.readNum}</td>
					</tr>
				<c:set var="index" value="${index - 1}"/>	
				</c:forEach>
				<tr><td colspan="6" class="m-0 p-0"></td></tr>
			</table>
		</div>
	</div>
<p><br/></p>
<p><br/></p>
	<!-- The Modal -->
	<div class="modal fade" id="boardModal">
		<div class="modal-dialog modal-dialog-centered">
			<div class="modal-content">

				<!-- Modal Header -->
				<div class="modal-header">
					<h4 class="modal-title"><b>선택회원정보</b></h4>
					<button type="button" class="btn-close" data-bs-dismiss="modal"></button>
				</div>

				<!-- Modal body -->
				<div class="modal-body">
						닉네임 : <span id="modalNickName"></span><br/><br/>
						글 내용 : <span id="modalContent"></span>
				</div>

				<!-- Modal footer -->
				<div class="modal-footer">
					<button type="button" class="btn btn-danger" data-bs-dismiss="modal">Close</button>
				</div>

			</div>
		</div>
	</div>
<p><br/></p>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
	<script src="js/scripts.js"></script>
</body>
</html>