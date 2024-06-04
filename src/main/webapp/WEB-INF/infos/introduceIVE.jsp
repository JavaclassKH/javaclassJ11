<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file = "/include/basicInHead.jsp"%> 
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html lang="ko">
<head>	
<title>introduceIVE.jsp</title>
<style>
 .card-img-top {
 	height: 305px;
 }
 
 img {
 	border-radius: 15px;
 	width: 400px;
 }
 
 src {
 	width: 400px; 
 }
	
</style>
</head>
<body class="d-flex flex-column h-100">
<%@ include file="/include/Navbar.jsp" %>
<p><br/></p>
<div class="container">
<h2 class="text-center"><strong><font size="16em">아이브 소개</font></strong></h2>
  <br/>
  <div class="row">
	  <div class="card" style="width:400px">
	    <img class="card-img-top" src="${ctp}/images/Gaeul1.gif" alt="Card image" style="width:100%">
	    <div class="card-body">
	      <h4 class="card-title">가을</h4>
	      <p class="card-text">
	      	이름: 김가을 &nbsp;&nbsp; 생년월일: 2002-09-24<br/>
	      	포지션: 래퍼 &nbsp;&nbsp; MBTI: ISTJ &nbsp;&nbsp;<br/>
	      	MINIVE: 달이<br/>
	      	대표 별명: 가을 선배, 가을양<br/>
	      	<br/><br/>
	      	<b>- 소개 -</b><br/>
	      	매력 만점 아이브의 맏언니 가을!<br/>
	      	<a href="https://namu.wiki/w/%EA%B0%80%EC%9D%84(IVE)" target="_blank" class="btn btn-primary mt-2">상세소개(나무위키)</a>
	      </p>
	    </div>
	  </div>
	  <div class="card" style="width:400px; margin-left:60px;">
	    <img class="card-img-top" src="${ctp}/images/Yujin1.gif" alt="Card image" style="width:100%">
	    <div class="card-body">
	      <h4 class="card-title">안유진</h4>
	      <p class="card-text">
	      	이름: 안유진 &nbsp;&nbsp; 생년월일: 2003-09-01<br/>
	      	포지션: <b>리더</b>, 보컬 &nbsp;&nbsp; MBTI: ESTP, ISTP &nbsp;&nbsp;<br/>
	      	MINIVE: 강안지<br/>
	      	대표 별명: 안댕댕, 맑은 눈의 광인<br/><br/><br/>
	      	<b>- 소개 -</b><br/>
	      	아이브의 카리스마 리더 안유진!<br/>
	      	<a href="https://namu.wiki/w/%EC%95%88%EC%9C%A0%EC%A7%84" target="_blank" class="btn btn-primary mt-2">상세소개(나무위키)</a>
	      </p>
	    </div>
	  </div>
	  <div class="card" style="width:400px; margin-left:60px;">
	    <img class="card-img-top" src="${ctp}/images/Ray1.gif" alt="Card image" style="width:100%">
	    <div class="card-body">
	      <h4 class="card-title">레이</h4>
	      <p class="card-text">
	      	이름: 나오이 레이 &nbsp;&nbsp; 생년월일: 2004-02-03<br/>
	      	포지션: 보컬, 래퍼 &nbsp;&nbsp; MBTI: INFJ &nbsp;&nbsp;<br/>
	      	MINIVE: 나오리<br/>
	      	대표 별명: 김레이, 콩순이<br/><br/><br/>
	      	<b>- 소개 -</b><br/>
	      	아이브의 귀요미 레이!<br/>
	      	<a href="https://namu.wiki/w/%EB%A0%88%EC%9D%B4(IVE)" target="_blank" class="btn btn-primary mt-2">상세소개(나무위키)</a>
	      </p>
	    </div>
	  </div>
	  <p><br/></p>
	  <p><br/></p>
	  <div class="card" style="width:400px">
	    <img class="card-img-top" src="${ctp}/images/Wonyoung1.gif" alt="Card image" style="width:100%">
	    <div class="card-body">
	      <h4 class="card-title">장원영</h4>
	      <p class="card-text">
	      	이름: 장원영 &nbsp;&nbsp; 생년월일: 2004-08-31<br/>
	      	포지션: 보컬 &nbsp;&nbsp; MBTI: ESTJ? &nbsp;&nbsp;<br/>
	      	MINIVE: 체리<br/>
	      	대표 별명: 워뇨, 워녕, 갓기<br/>
	      	<br/><br/>
	      	<b>- 소개 -</b><br/>
	      	미모 포텐 폭발하는 아이브의 센터 장원영!<br/>
	      	<a href="https://namu.wiki/w/%EC%9E%A5%EC%9B%90%EC%98%81" target="_blank" class="btn btn-primary mt-2">상세소개(나무위키)</a>
	      </p>
	    </div>
	  </div>
	  <div class="card" style="width:400px; margin-left:60px;">
	    <img class="card-img-top" src="${ctp}/images/Liz1.gif" alt="Card image" style="width:100%">
	    <div class="card-body">
	      <h4 class="card-title">리즈</h4>
	      <p class="card-text">
	      	이름: 김지원 &nbsp;&nbsp; 생년월일: 2004-11-21<br/>
	      	포지션: 메인보컬 &nbsp;&nbsp; MBTI: INFP &nbsp;&nbsp;<br/>
	      	MINIVE: 치즈<br/>
	      	대표 별명: 치즈냥이, 깜냥이, 포도냥이<br/><br/><br/>
	      	<b>- 소개 -</b><br/>
	      	아이브의 노래 잘하는 냥이 리즈!<br/>
	      	<a href="https://namu.wiki/w/%EB%A6%AC%EC%A6%88(IVE)" target="_blank" class="btn btn-primary mt-2">상세소개(나무위키)</a>
	      </p>
	    </div>
	  </div>
	  <div class="card" style="width:400px; margin-left:60px;">
	    <img class="card-img-top" src="${ctp}/images/Yiseo1.gif" alt="Card image" style="width:100%">
	    <div class="card-body">
	      <h4 class="card-title">이서</h4>
	      <p class="card-text">
	      	이름: 이현서 &nbsp;&nbsp; 생년월일: 2007-02-21<br/>
	      	포지션: 보컬 &nbsp;&nbsp; MBTI: ENFP &nbsp;&nbsp;<br/>
	      	MINIVE: 이랑이<br/>
	      	대표 별명: 아기호랑이, 막냉이<br/><br/><br/>
	      	<b>- 소개 -</b><br/>
	      	아이브의 활력소 비타민 막내 이서!<br/>
	      	<a href="https://namu.wiki/w/%EC%9D%B4%EC%84%9C" target="_blank" class="btn btn-primary mt-2">상세소개(나무위키)</a>
	      </p>
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