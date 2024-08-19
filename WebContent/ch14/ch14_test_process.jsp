<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
						<!-- 내용을 입력해주세요 -->
						<!-- 
							# 로그인 페이지를 작성해주세요.
							
							아이디    : _________
							비밀번호 : _________
							[] 아이디 저장
							[로그인]
							
							1. 로그인 페이지를 작성하고, 아이디/비밀번호를 입력후 로그인을 진행해주세요.
								> 로그인은 작성된 아이디, 비밀번호를 임의로 결정한 후 해당 아이디, 비밀번호가 입력되어 넘어올 때
									로그인 처리로 간주하여 진행해주세요. (admin / 1234)
							2. 아이디 저장을 체크하지 않고 로그인 시, 쿠키를 저장하지 않고 로그인 처리를 진행합니다.
								아이디 저장을 체크하고 로그인 시, 쿠키를 저장하고 로그인 처리를 진행합니다. 
							
							***
							[아이디 저장] 체크 후 로그인 처리가 완료된 다음, 해당 로그인 페이지를 다시 요청했을 때
								로그인 당시에 입력했던 아이디가 입력란에 입력되어 있어야 하고, 아이디 저장이 체크되어 있어야 한다.
							[아이디 저장] 체크 해제 후 로그인 진행 후 해당 로그인 페이지를 다시 요청 했을 때
								아이디 입력란이 비어 있고 아이디 저장도 체크 해제가 되어 있어야 한다.
						 -->
						 <%
						    request.setCharacterEncoding("UTF-8");
							String id = request.getParameter("id");
						 	String pw = request.getParameter("pw");
						 	String check = request.getParameter("check");
						 	
						 	if (id.equals("admin") && pw.equals("1234")) {
						 		if (check != null && check.equals("on")) {
						 			Cookie cookie_id = new Cookie("id", id);
						 			Cookie cookie_check = new Cookie("check", check);
						 			
						 			cookie_id.setMaxAge(24 * 60 * 60);
						 			cookie_check.setMaxAge(24 * 60 * 60);
						 			
						 			response.addCookie(cookie_id);
						 			response.addCookie(cookie_check);
						 		} else {
						 			Cookie cookie_id = new Cookie("id", id);
						 			Cookie cookie_check = new Cookie("check", "checked");
						 			
						 			cookie_id.setMaxAge(0);
						 			cookie_check.setMaxAge(0);
						 			
						 			response.addCookie(cookie_id);
						 			response.addCookie(cookie_check);
						 		}
						 		out.println("인증 성공했습니다! <a href='ch14_test.jsp'>로그인 이동</a>");
						 	} else {
						 		out.println("인증 실패했습니다! <a href='ch14_test.jsp'>다시 로그인해주세요.</a>");
						 	}
						 	 
						 %>
                    </div>
                </div>
            </div>
        </div>
    </section>
	<%@ include file="/pageModule/footer.jsp" %>

	<%@ include file="/pageModule/footerPart.jsp" %>
</body>
</html>