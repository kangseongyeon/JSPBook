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
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
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
						1. 게시판 등록 페이지를 작성해주세요.
						
						게시글 등록
						─────────────────────────────
						제목 : 
						내용 :
						─────────────────────────────
						첨부파일 : [파일 선택]
						─────────────────────────────
						[ 등록  ] [ 목록  ]
						
						2. 등록 버튼 클릭 시, 게시글 등록(boardInsert.jsp)을 진행해주세요.
						3. 목록 버튼 클릭 시, 게시판 목록 페이지(boardList.jsp)로 이동해주세요
					 -->
					 
					 <%
					 	String login = request.getParameter("login");
					 
						 if(login != null){
						 	response.sendRedirect("boardList.jsp");
						 }
						 	
						 String error = request.getParameter("error");
						 if(error != null){
						 	out.println("<script>alert('업로드 파일 크기를 초과하였습니다')</script>");
						 }
					 %>
					 
					 <h3>게시글 등록</h3>
					 <hr/>
					 <form action="boardInsert.jsp" enctype="multipart/form-data" method="post">
						<table class="table table-bordered">
						    <tr>
						        <th style="width: 100px;">제목</th>
						        <td><input type="text" class="form-control" name="title"></td>
						    </tr>
						    <tr>
						        <th>내용</th>
						        <td><textarea class="form-control" name="content" rows="10"></textarea></td>
						    </tr>
						    <tr>
						        <th>파일</th>
						        <td><input class="form-control" type="file" id="formFile" name="filename"></td>
						    </tr>
						    <tr>
						        <td colspan="2" class="text-left">
						            <input type="submit" class="btn btn-primary" value="등록">
						            <input type="button" class="btn btn-info" onclick="location.href='boardList.jsp'" value="목록">
						        </td>
						    </tr>
						</table>
					 </form>
                    </div>
                </div>
            </div>
        </div>
    </section>
	<%@ include file="/pageModule/footer.jsp" %>

	<%@ include file="/pageModule/footerPart.jsp" %>
</body>
</html>