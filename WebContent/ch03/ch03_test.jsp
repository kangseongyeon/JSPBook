<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- 
		*** JSTL을 활용하여 아래 문제를 작성해주에쇼.
		1) 306호 반 학생 이름 모두를 Core 태그 set에 저장한 후, 전체를 출력해주세요.
		2) 학생 4명씩 끊어서 출력해주세요.
			이름 이름 이름 이름
			이름 이름 이름 이름
			이름 이름 이름 이름
			이름 이름 이름 이름
			이름 이름 이름 이름
			...
		3) 4명씩 끊어서 출력할 때, 본인의 이름은 '본인'으로 출력해주세요.
			> 이때, 본인 글자를 출력 시 굵은 글씨이면서 녹색으로 출력해주세요.
	 -->

	<%
		String[] names = { 
				"강성연", "김필거", "김수연", "이영준",
				"정현영", "최동재", "나성훈", "황현준", 
				"이건우", "이은재", "김연희", "김예지", 
				"김선영", "권기혁", "박범진", "박민수", 
				"박병준", "이현수", "윤다빈", "김민강", 
				"이동형", "박현진", "김용주", "문형석", 
				"임효정", "정문성", "김은태" 
		};
	int nameSize = names.length;

	List<String> list = new ArrayList<String>();
	for (String name : names) {
		list.add(name);
	}
	%>

	<c:set value="<%=list%>" var="name" />
	<table border="1">
		<tr>
		<c:forEach items="${name }" var="item" varStatus="stat">
		
			<c:if test="${item=='강성연' }">
				<td style="color: green;"><b>본인</b></td>
			</c:if>

			<c:if test="${item != '강성연' }">
				<td>${item }</td>
			</c:if>

			<c:if test="${stat.count % 4 == 0 }">
				</tr>
			</c:if>
		</c:forEach>
	</table>
</body>
</html>