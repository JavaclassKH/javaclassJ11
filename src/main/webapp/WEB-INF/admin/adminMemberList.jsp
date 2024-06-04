<%@page import="java.sql.Array"%>
<%@page import="admin.AdminMemberList"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ include file = "/include/basicInHead.jsp"%> 
<c:set var="ipLobby" value="http://192.168.50.64:9090/javaclassJ11/Lobby"/>
<!DOCTYPE html>
<html lang="ko">
<head>	
<title>adminMemberList.jsp</title>
	<script>
		'use strict';
		
		// 전체선택 , 전체해제
		function selectChange(x) {
			if(x == 1) {
			  for(let i=0; i<=${fn:length(vos)}; i++) {
			    $("#members"+i).prop("checked",true);
			  }				
			}
			else if(x == 2) {
			  for(let i=0; i<=${fn:length(vos)}; i++) {
			    $("#members"+i).prop("checked",false);
			  }
			}
		}
		
		// 선택회원 등급변경 
    function memLevelChange() {
    	let members = document.querySelectorAll('input[name=members]:checked');
    	let level = $("#levelSelect").val();
    	
    	if(members.length === 0) {
    		alert("등급을 변경할 회원을 1명 이상 선택해주세요");
    		location.reload();
    		return;
    	}
    	
    	let idxArr = "";
    	members.forEach(function(member) {
    		idxArr += member.value+"/";
      });
    	
    	$.ajax({
        url: "AdminMemberLevelChange.ad",
        type: "post",
        data: {
           level: level,
           idxArr : idxArr
        },
        success : function(res) {
          if (res != "0") {
            alert("등급 수정 완료!");
            location.reload(true);
          } 
          else {
            alert("등급 수정 실패");
          }
        },
        error : function() {
          alert("전송오류!");
        }
      });
    	
    }
		
		
		

		// 회원정보 모달로 보기
		function modalOn(name, mid, nickName, contact, email) {
			$("#memberModal #modalName").text(name);
			$("#memberModal #modalMid").text(mid);
			$("#memberModal #modalNickName").text(nickName);
			$("#memberModal #modalContact").text(contact);
			$("#memberModal #modalEmail").text(email);		
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
			width: 77%;
			text-align: center;
			background-color: #efe;
			overflow: scroll;
		}
		
		#btns {
			float: left;
			margin-right: 10px;
			margin-bottom: 7px;
		}	
		
		#levelSelector {
			float: right;
		}
		
		#sels {
			width: 4%;
			vertical-align: middle;
			text-align: center;
		}
		
		#mlcb {
			margin-left: 6px;
		}
		
  </style>
</head>
<body>
<%@ include file = "/include/NavbarAdmin.jsp"%>
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
			<h2><b>회 원 관 리 페 이 지</b></h2><br/>
			<div id="btns">
				<button onclick="selectChange(1)" class="badge bg-primary">전체선택</button>
				<button onclick="selectChange(2)" class="badge bg-warning">전체해제</button>
			</div>
			<div id="levelSelector">
				<select name="levelSelect" id="levelSelect">
		      <option value="1">준회원</option>
		      <option value="2">정회원</option>
			  </select>
			  <input type="button" id="mlcb" value="등급변경" onclick="memLevelChange()" class="btn btn-danger btn-sm" />
			</div>
				<form name="myform">
				<table class="table table-bordered table-hover">
					<tr class="table-info">
						<th class="text-center" id="sels">선택</th>
						<th>아이디</th>
						<th>닉네임</th>
						<th>가입일</th>
						<th>방문횟수</th>
						<th>회원등급</th>
					</tr>
					<c:forEach var="vo" items="${vos}" varStatus="st">
						<c:if test="${vo.memLevel != 0}">
							<tr>
								<td class="text-center" id="sels">
		        			<c:set var="i" value="${st.index}" />
			        		<c:if test="${vo.memLevel != 0}">
			          		<input type="checkbox" name="members" id="members${i}" value="${vo.idx}" />
			        		</c:if>      				
								</td>
								<td>${vo.mid}</td>
								<td>										
									<a href="#" onClick="modalOn('${vo.name}','${vo.mid}','${vo.nickName}','${vo.contact}','${vo.email}')" class="btn btn-light btn-sm" data-bs-toggle="modal" data-bs-target="#memberModal">
									${vo.nickName}
									</a>						
								</td>
								<td>
								${fn:substring(vo.joinDate,0,16)}
								</td>
								<td>${vo.visitCnt}</td>
								<c:if test="${vo.memLevel == 1}">
									<td>준회원</td>
								</c:if>
								<c:if test="${vo.memLevel == 2}">
									<td>정회원</td>
								</c:if>
							</tr>
							<tr><td colspan="5" class="m-0 p-0"></td></tr>
						</c:if>
					</c:forEach>				
				</table>
			</form> 
		</div>
	</div>
<p><br/></p>
	<!-- The Modal -->
	<div class="modal fade" id="memberModal">
		<div class="modal-dialog modal-dialog-centered">
			<div class="modal-content">

				<!-- Modal Header -->
				<div class="modal-header">
					<h4 class="modal-title"><b>선택회원정보</b></h4>
					<button type="button" class="btn-close" data-bs-dismiss="modal"></button>
				</div>

				<!-- Modal body -->
				<div class="modal-body">
						이름 : <span id="modalMid"></span><br/>
						아이디 : <span id="modalName"></span><br/>
						닉네임 : <span id="modalNickName"></span><br/>
						연락처 : <span id="modalContact"></span><br/>
						이메일 : <span id="modalEmail"></span>
				</div>

				<!-- Modal footer -->
				<div class="modal-footer">
					<button type="button" class="btn btn-danger" data-bs-dismiss="modal">Close</button>
				</div>

			</div>
		</div>
	</div>
<p><br/></p>
<p><br/></p>

	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
	<script src="js/scripts.js"></script>
</body>
</html>