<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="kr.or.ddit.ch07.MemberDAO"%>
<%@page import="kr.or.ddit.ch07.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html class="no-js" lang="zxx">
<head>
<meta charset="utf-8" />
<meta http-equiv="x-ua-compatible" content="ie=edge" />
<title>쉽게 배우는 JSP 웹 프로그래밍</title>
<meta name="description" content="" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<%@ include file="/pageModule/headPart.jsp"%>
</head>
<body>
	<%@ include file="/pageModule/header.jsp"%>

	<div class="breadcrumbs" style="padding-top: 40px;">
		<div class="container">
			<div class="row align-items-center">
				<div class="col-lg-6 col-md-6 col-12">
					<div class="breadcrumbs-content">
						<h1 class="page-title">파일 업로드</h1>
					</div>
				</div>
				<div class="col-lg-6 col-md-6 col-12">
					<ul class="breadcrumb-nav">
						<li><a href="/">INDEX</a></li>
						<li>CH07</li>
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
                    	1. 회원 목록 페이지를 작성해주세요.
                    	
                    	[ 등록 ]
                    	______________________________
                    	이미지	     회원정보			버튼
                    	______________________________
                    	[ 이	]     아이디 : a001      [상세]
                    	[ 미 ]     이름 : 홍길동
                    	[ 지 ]     
                    	[ 란 ]     
                    	______________________________
                    	[ 이	]     아이디 : a002      [상세]
                    	[ 미 ]     이름 : 홍길순
                    	[ 지 ]     
                    	[ 란 ]     
                    	______________________________
                    	... 
                     -->

						<h3>회원목록</h3>
						<hr>
						<button onclick="memInsert()">회원등록</button>
						<hr>

						<div class="row">
							<%
								String memId = (String) session.getAttribute("mem_id");
	
								MemberDAO dao = MemberDAO.getInstance();
								MemberVO mv = new MemberVO();
								
								List<MemberVO> memList = dao.getMemberList();
	
								for (MemberVO vo : memList) {
							%>
							<div class="col-md-3">
								<div class="card md-4">
									<div class="card-header text-center">
										<%
											if(vo.getMem_id().equals(memId)) { 
										%>
											<p>[본인]<%=vo.getMem_name()%>님의 정보</p>
										<%
											} else {
										%>
										<p><%=vo.getMem_name()%>님의 정보</p>
										<%
											}
										%>
									</div>
									<div class="card-body">
										<img
											src="<%=request.getContextPath()%>/resources/images/<%=vo.getFilename()%>"
											alt="<%=vo.getFilename()%>">
										<div align="center">
											아이디 :<%=vo.getMem_id()%><br />
											이름:<%=vo.getMem_name() %><br/>
										</div>
									</div>
									<%
										if (vo.getMem_id().equals(memId)) {		 
									%>
									<div class = "card-footer text-center">
										<button class = "btn btn-info" onclick = "viewDetail('<%=vo.getMem_id() %>')">상세정보</button>
									</div>
									<%
										}
									%>
								</div>
							</div>
							<%
								}
							%>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<%@ include file="/pageModule/footer.jsp"%>

	<%@ include file="/pageModule/footerPart.jsp"%>
</body>
<script type="text/javascript">
	function memInsert() {
		location.href = "ch07_test_signup.jsp";
	}
	function viewDetail(memId) {
		location.href = "ch07_test_memberDetail.jsp?memId="+memId;
	}
</script>
</html>