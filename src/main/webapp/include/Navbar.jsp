<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<c:set var="ipLobby" value="http://192.168.50.64:9090/javaclassJ11/Lobby"/>
  <!-- 최상단 네이게이션 바 -->
<style>
	@import url('https://fonts.googleapis.com/css2?family=Jua&display=swap');
	#Navbar {
		background-color: #9aa3e1;
	}
	
	* {
		font-family: 'Jua';
	}
</style>  
            <nav class="navbar navbar-expand-lg" id="Navbar">
                <div class="container px-5">
                    <a class="navbar-brand" id="Top">
                    비공식 아이브 팬사이트 - Second DIVE
                    </a>
                    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
                    <div class="collapse navbar-collapse" id="navbarSupportedContent">
                        <ul class="navbar-nav ms-auto mb-2 mb-lg-0">
                            <li class="nav-item"><a class="nav-link" href="${ipLobby}">로비</a></li>
                            <li class="nav-item"><a class="nav-link" href="MemberVisitCheck.mem">출석체크</a></li>
                            <li class="nav-item"><a class="nav-link" href="IntroduceIVE.inf">아이브소개</a></li>
                            <c:if test="${empty sMid}">
	                            <li class="nav-item"><a class="nav-link" href="MemberLogin.mem">로그인</a></li>
	                            <li class="nav-item"><a class="nav-link" href="MemberJoin.mem">회원가입</a></li>
                            </c:if>
                            <c:if test="${!empty sMid}">
	                            <li class="nav-item"><a class="nav-link" href="BoardList.bo">게시판</a></li>
	                            <li class="nav-item"><a class="nav-link" href="MyPage.mem">마이페이지</a></li>
	                            <li class="nav-item"><a class="nav-link" href="MemberLogout.mem">로그아웃</a></li>
                            </c:if>
                            <c:if test="${memLevel == 0}">
                            	<li class="nav-item"><a class="nav-link" href="JustForAdmin.ad">관리자전용</a></li>
                            </c:if>
                            <li class="nav-item dropdown ml-3">
                                <a class="nav-link dropdown-toggle ml-5" id="navbarDropdownBlog" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">사이트맵</a>
                                <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdownBlog">
                                    <li><a class="dropdown-item" href="https://cafe.daum.net/IVEstarship" target="_blank">공식 팬카페</a></li>
                                    <li><a class="dropdown-item" href="https://www.youtube.com/@IVEstarship" target="_blank">공식 유튜브</a></li>
                                    <li><a class="dropdown-item" href="https://www.instagram.com/IVEstarship/" target="_blank">공식 인스타그램</a></li>
                                    <li><a class="dropdown-item" href="https://www.facebook.com/IVEstarship" target="_blank">공식 페이스북</a></li>
                                    <li><a class="dropdown-item" href="https://twitter.com/IVEstarship" target="_blank">공식 트위터</a></li>
                                    <li><a class="dropdown-item" href="https://www.tiktok.com/@ive.official" target="_blank">공식 틱톡</a></li>
                                    <li><a class="dropdown-item" href="https://weibo.com/ivestarship" target="_blank">공식 웨이보</a></li>
                                </ul>
                            </li>
                        </ul>
                    </div>
                </div>
            </nav>