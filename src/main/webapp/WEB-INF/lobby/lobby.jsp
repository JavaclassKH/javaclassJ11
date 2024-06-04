<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file = "/include/basicInHead.jsp"%> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<% int ir = (int)request.getAttribute("ir"); %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<c:set var="i" value="<%=ir%>" />
<!DOCTYPE html>
<html lang="en">
    <head>
       <title>Time to DIVE into IVE</title>
       <script>
       	'use strict';
       	
       	// 건의사항 제출
       	function suggestionsInput() {
					let suggestions = document.getElementById("suggestions").value;
					if(suggestions.trim() = "") alert("건의사항을 작성해주세요");
					else {
						$.ajax({
							url : "suggestionsInput.ad",
							type : "post",
							data : {suggestions : suggestions},
							success : function(res) {
								if(res != "0") {
									alert("건의사항 전송이 완료되었습니다.\n건의해주셔서 정말 감사합니다.");
									location.reload();
								}
								else {
									alert("건의사항 전송에 실패했습니다. 다시 시도해주세요");
								}
							},
							error : function() {
								alert("건의사항 전송 중 오류가 발생했습니다");
							}
						});						
					}
				}
       	 
       	 
       	 
       </script>
       <style>
       	
       	body {
       		cursor : url('${ctp}/images/c${i}.gif') 12 11, auto;
       	}
       	
       	header {
       		background-image: linear-gradient(to bottom, purple, black);
       	}
       	
       	.forVid {
       		border-radius: 10px;
       		width: 620px;
       		height: 290px;
       	}
       	
       	video {
       		width: 100%;
       		height: 100%;
       	}
       	
       </style>
    </head>
    <body class="d-flex flex-column h-100">
        <main class="flex-shrink-0">
            <!-- Header-->
            <%@ include file = "/include/Navbar.jsp"%> 
            <header class="py-5">
                <div class="container px-5">
                    <div class="row gx-5 align-items-center justify-content-center">
                        <div class="col-lg-8 col-xl-7 col-xxl-6 mr-6">
                            <div class="my-5 text-xl-start">
                                <h1 class="display-5 fw-bolder text-white text-center  mb-2">비공식 아이브 팬사이트에 오신 여러분 환영합니다!</h1>
                                <p class="lead fw-normal text-white-50 text-center mb-4">아이브에 입덕할 준비가 되셨나요? 이 곳에서 여러분이 아이브<br/>입덕계기를 꼭 찾으시길 바라겠습니다~~~♥♥♥♥</p>
                                <div class="text-center">
                                  <a class="btn btn-info btn-lg px-4 me-3" href="https://www.melon.com/artist/song.htm?artistId=3055146" target="_blank"><font color="mediumpurple"><b>아이브 노래 듣기</b></font></a>
                                  <a class="btn btn-info btn-lg px-4 me-3" href="http://www.starship-ent.com/bbs/board.php?bo_table=ivesch" target="_blank"><font color="mediumpurple"><b>아이브 스케줄 보기</b></font></a>
                                </div>
                            </div>
                        </div>
                        <div class="forVid col-xl-5 col-xxl-6 d-none d-xl-block text-center">
                        <c:set var="i" value="${random}" />
                      	  <c:if test="${i != 1 && i != 2 && i != 3}">
          									<video src="${ctp}/images/3.mp4" autoplay muted loop controls></video>
                        	</c:if>
                      	  <c:if test="${i == 1 || i == 2 || i == 3}">
          									<video src="${ctp}/images/${i}.mp4" autoplay muted loop controls></video>
                        	</c:if>
                        </div>
                    </div>
                </div>
            </header>
            <!-- Blog preview section-->
            <section class="py-5">
                <div class="container px-5 my-5">
                    <div class="row gx-5 justify-content-center">
                        <div class="col-lg-8 col-xl-6">
                            <div class="text-center">
                                <h2 class="fw-bolder"><b>Second DIVE를 소개합니다!</b></h2>
                                <p class="lead fw-normal text-muted mb-6">
                                	아이브를 사랑하는 팬들이 모여 함께 팬 활동을 이어갈 수 있고,<br/>
                                	아이브를 모르는 분들이 다이브로 변하도록 만들 수 있으며, <br/>
                                	전 세계에 아이브가 알려지도록 만들고 싶은<br/>
                                	<b>이곳은 Second DIVE 입니다~</b>
                                </p>
                            </div>
                        </div>
                    </div>
                    <div class="row gx-5">
                        <div class="col-lg-4 mb-5">
                            <div class="card h-100 shadow border-0">
                                <img class="card-img-top" src="${ctp}/images/IVEfun.jpg" style="width:375px; height: 220px;" alt="..." />
                                <div class="card-body p-4">
	                                    <div class="badge bg-primary bg-gradient rounded-pill mb-2">humor</div>                                  
                                    <p class="card-text mb-0">
                                    	노래도 완벽! 춤도 완벽! <br/>
                                    	무엇 하나도 빠지지 않는데...<br/>
                                    	거기다 예능감까지 <br/>
                                    	완벽히 갖춘 우리의 짱이브!!! <br/>
                                    	짱이브에게 푹 빠지면... <br/>
                                    	절대 헤어나올 수 없어요~~~
                                    </p>
                                </div>
                                <div class="card-footer p-4 pt-0 bg-transparent border-top-0">
                                    <div class="d-flex align-items-end justify-content-between">
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-4 mb-5">
                            <div class="card h-100 shadow border-0">
                                <img class="card-img-top" src="https://dummyimage.com/600x350/adb5bd/495057" alt="..." />
                                <div class="card-body p-4">
                                    <div class="badge bg-primary bg-gradient rounded-pill mb-2">sing</div>
                                    <p class="card-text mb-0">This text is a bit longer to illustrate the adaptive height of each card. Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                                </div>
                                <div class="card-footer p-4 pt-0 bg-transparent border-top-0">
                                    <div class="d-flex align-items-end justify-content-between">
                                        <div class="d-flex align-items-center">
                                            <img class="rounded-circle me-3" src="https://dummyimage.com/40x40/ced4da/6c757d" alt="..." />
                                            <div class="small">
                                                <div class="fw-bold">Josiah Barclay</div>
                                                <div class="text-muted">March 23, 2023 &middot; 4 min read</div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-4 mb-5">
                            <div class="card h-100 shadow border-0">
                                <img class="card-img-top" src="https://dummyimage.com/600x350/6c757d/343a40" alt="..." />
                                <div class="card-body p-4">
                                    <div class="badge bg-primary bg-gradient rounded-pill mb-2">News</div>
                                    <p class="card-text mb-0">Some more quick example text to build on the card title and make up the bulk of the card's content.</p>
                                </div>
                                <div class="card-footer p-4 pt-0 bg-transparent border-top-0">
                                    <div class="d-flex align-items-end justify-content-between">
                                        <div class="d-flex align-items-center">
                                            <img class="rounded-circle me-3" src="https://dummyimage.com/40x40/ced4da/6c757d" alt="..." />
                                            <div class="small">
                                                <div class="fw-bold">Evelyn Martinez</div>
                                                <div class="text-muted">April 2, 2023 &middot; 10 min read</div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- Call to action-->
                    <aside class="bg-primary bg-gradient rounded-3 p-4 p-sm-5 mt-5">
                        <div class="d-flex align-items-center justify-content-between flex-column flex-xl-row text-center text-xl-start">
                            <div class="mb-4 mb-xl-0">
                                <div class="fs-3 fw-bold text-white">
                                <font size="6em">
                                	처음 만들어 본 웹 페이지이기에<br/>
                                	부족한 점이 많습니다.
                                </font>
                                </div>
                                <div class="text-white-50">우측 폼에 건의사항을 남겨주세요</div>
                            </div>
                            <div class="ms-xl-4">
                                <div class="input-group mb-2">
                               	 <form name="sgForm">
                                    <textarea rows="3" style="width:550px; height: 300px; resize: none;" class="form-control"></textarea>
                                    <button class="btn btn-outline-light form-control mt-3" id="suggestions" onclick="suggestionsInput()" type="button" >제출하기</button>
                                	</form>
                                </div>
                                <div class="small text-white-50">여러분의 건의사항을 통해 더욱 발전하겠습니다!!</div>
                            </div>
                        </div>
                    </aside>
                </div>
            </section>
        </main>
        <%@ include file = "/include/footer.jsp"%>         
        <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Core theme JS-->
        <script src="js/scripts.js"></script>
    </body>
</html>
