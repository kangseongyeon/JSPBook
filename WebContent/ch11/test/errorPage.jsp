<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html class="no-js" lang="zxx">
<head>
    <meta charset="utf-8" />
    <meta http-equiv="x-ua-compatible" content="ie=edge" />
    <title>쉽게 배우는 JSP 웹 프로그래밍</title>
    <meta name="description" content="" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
	<%@ include file="/pageModule/headPart.jsp" %>
</head>
<body>
	<%@ include file="/pageModule/header.jsp" %>

    <div class="breadcrumbs" style="padding-top:40px;">
        <div class="container">
            <div class="row align-items-center">
                <div class="col-lg-6 col-md-6 col-12">
                    <div class="breadcrumbs-content">
                        <h1 class="page-title">JSP 개요</h1>
                    </div>
                </div>
                <div class="col-lg-6 col-md-6 col-12">
                    <ul class="breadcrumb-nav">
                        <li><a href="/">INDEX</a></li>
                        <li>CH01</li>
                    </ul>
                </div>
            </div>
        </div>
    </div>

    <section class="about-us section">
        <div class="container">
            <div class="row align-items-center justify-content-center">
                <div class="col-lg-12 col-md-12 col-12">
                    <div class="content-left wow fadeInLeft" data-wow-delay=".3s">
                    	<!-- 
                    		시큐리티 인증을 진행 시, 진입하려고 하는 타겟정보에 권한이 맞지 않는 경우 해당 에러 페이지가 활성회된다.
                    		
                    		접근 권한이 맞지 않습니다!
                    		403 FORBIDDEN ERROR!
                    		--------------------------
                    		[게시판 목록으로]
                    		
                    		1. 세션 초기화를 진행해주세요. 
                    		2. 게시판 목록으로 버튼을 클릭 시, 게시판 목록으로 이동해주세요.
                    	 -->
						<h3>접근 권한이 맞지 않습니다!</h3>
		                <h5>
		                    <% 
		                        if (exception == null) {
		                            out.println("403 FORBIDDEN ERROR!");
		                        }
		                    %>
		                </h5>
		                <hr />
		                
		                <% 
		                    session.invalidate(); // 세션 초기화
		                %>
		
		                <button class="btn btn-primary" onclick="location.href='boardList.jsp'">게시판 목록으로</button>
					</div>
                </div>
            </div>
        </div>
    </section>
	<%@ include file="/pageModule/footer.jsp" %>

	<%@ include file="/pageModule/footerPart.jsp" %>
</body>
</html>