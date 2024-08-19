<%@page import="java.util.Enumeration"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
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
			            	넘겨받은 데이터를 활용해 아래의 문제를 해결해주세요.
			            	
			            	----------------------------------------------------------
			            	1. 출력 결과 상단의 type에 따라 아래와 같이 출력해주세요.
			            	
			            	# 사용자인 경우,
			            	[사용자 '홍길동'님, 환영합니다!]
			            	
			            	# 관리자인 경우,
			            	[관리자 '홍길동'님, 환영합니다!]
			            	
			            	----------------------------------------------------------
			            	2. 나머지 항목의 데이터를 출력해주세요.
			            	
			            	# 출력 결과
			            	아이디		:	a001
			            	비밀번호		:	1234
			            	이름			:	홍길동
			            	핸드폰번호		:	010-1234-1234
			            	성별			:	남자
			            	취미			:	운동, 영화, 독서, 클라이밍
			            	가입인사		:	대덕인재개발원 306호 홍길동입니다!
			            					잘부탁드립니다! 열심히 해볼게요!
			            					아자아자아자아자아자아자아자!!!
			            	
			            	----------------------------------------------------------
			            	3. 출력의 형태를 selectbox를 통해 각 선택에 따른 출력으로 만들어주세요.
			            	
			            	# 출력 결과
			            	[	--출력 형태 선택--	]
			            	[	스크립틀릿으로 출력 	]
			            	[		JSTL로 출력 	] 
			            	
			            	각 선택에 따른 출력 형태로 1,2번 문제에 나오는 출력 결과를 출력해주세요! 
			             -->

			            <%
			            	request.setCharacterEncoding("UTF-8");
			            	
			            	String type = request.getParameter("type");
			            	String id = request.getParameter("id");
			            	String pw = request.getParameter("pw");
			            	String name = request.getParameter("name");
			            	String phone1 = request.getParameter("phone1");
			            	String phone2 = request.getParameter("phone2");
			            	String phone3 = request.getParameter("phone3");
			            	String gender = request.getParameter("gender");
			            	String[] hobby = request.getParameterValues("hobby");
			            	String comment = request.getParameter("comment");
			            %>
			            
			            
						<h3>[<%=type %>] '<%=name %>'님, 환영합니다!]</h3> <br/>
						
						<select class = "select">
							<option value = "">[	--출력 형태 선택--	]</option>
							<option value = "1">[	스크립틀릿으로 출력 	]</option>
							<option value = "2">[		JSTL로 출력 	]</option>
						</select>
						
						<div id = "scriptlet">
							<br/><h4>스크립틀릿으로 출력</h4><br />
				            <p>아이디 : <%=id %></p>
				            <p>비밀번호 : <%=pw %></p>
				            <p>이름 : <%=name %></p>
				            <p>핸드폰번호 : <%=phone1 %> - <%=phone2 %> - <%=phone3 %></p>
				            <p>성별 : <%="M".equals(gender) ? "남자" : "여자" %></p>
				            <p>취미 : <%
				            	if (hobby!=null) {
				            		for (int i=0; i<hobby.length; i++) {
				            			out.print(" " + hobby[i]);
				            		}
				            	}
				            
				            %></p>
				           <p style = "white-space: pre-wrap;">가입인사 : <c:out value = "<%=comment %>"/></p>
			           </div>
			           
			           <div id = "jstl">
				           <br/><h4>JSTL로 출력</h4><br />
				           <c:set value = "<%=id %>" var="id" />
				           	아이디 : <c:out value = "${id }"/><br/>
				           	
				           <c:set value = "<%=pw %>" var="pw" />
				           	비밀번호 : <c:out value = "${pw }"/><br/>
				           	
				           <c:set value = "<%=name %>" var="name" />
				           	이름 : <c:out value = "${name }"/><br/>
				           	
				           <c:set value = "<%=phone1 %>" var="phone1" />
				           <c:set value = "<%=phone2 %>" var="phone2" />
				           <c:set value = "<%=phone3 %>" var="phone3" />
				           	핸드폰번호 : <c:out value = "${phone1 } - ${phone2 } - ${phone3 }"/><br/>
				           	
				           <c:set value = "<%=gender %>" var="gender" />
				           	성별 : <c:choose>
								 	<c:when test="${gender == 'M' }">남자</c:when>
									<c:otherwise>여자</c:otherwise>	
							 </c:choose> <br>
				           	
				           <c:set value = "<%=hobby %>" var="hobby" />
				         	취미 	: <c:forEach items="${hobby}" var="hobby">
							 			<c:out value="${hobby }" /> 
							 	  </c:forEach><br/>
				           	
				           <c:set value = "<%=comment %>" var="comment" />
				           	가입인사  : <c:out value = "${comment }"/><br/>
			           	</div>
                    </div>
                </div>
            </div>
        </div>
    </section>
	<%@ include file="/pageModule/footer.jsp" %>

	<%@ include file="/pageModule/footerPart.jsp" %>
</body>
<script type = "text/javascript">
$(function() {
	var opt = $("select");
	
	$("#scriptlet").hide();
	$("#jstl").hide();
	
	opt.on("change", function () {
		var value = $(this).val();
		
		if (value == "1") {
			$("#scriptlet").show();
			$("#jstl").hide();
		} else {
			$("#jstl").show();
			$("#scriptlet").hide();
		}
	});
});
</script>
</html>