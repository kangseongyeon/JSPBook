<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<style>
table {
	border-collapse: collapse;
	text-align: center;
}
tb {
	border: 1px;
}
</style>
<script>
	$(document).ready(function() {
		$("select").change(function() {
			var opt = $(this).val();
			
			$("#rowTable, #colTable").hide();
			
			if (opt == "row") {
				$("#rowTable").show();
			} else if (opt == "col") {
				$("#colTable").show();
			}
		});
	});
</script> 

</head>
<body>
	<!-- 
		[문제] 구구단 1-9단까지 출력해주세요.
		[옵션] 
			- 짝수단인 경우에는 빨간색으로 출력해주세요.
			- 출력 기준을 2가지 (가로로 출력, 세로로 출력)를 가진 selectbox를 제공하고 제공된 출력에 따라 결과를 출력해주세요.
				> 스크립트를 활용해주세요.
				> 구구단 알고리즘은 스크립트가 아닌 스크립틀릿에서만 진행해주세요.
				> 가로로출력 / 세로로 출력을 선택할 시, 해당 출력 방식에 따른 출력 결과가 나타날 수 있도록 해주세요.
				
			- 스크립트는 자바스크립트 / 제이쿼리 본인이 편한 방식으로 진행! 
	 -->


	<select>
		<option>-- 출력 선택 --</option>
		<option value="row">가로로 출력</option>
		<option value="col">세로로 출력</option>
	</select>

	<div id="output">
		<div id="rowTable" style="display: none;">
			<table border="1">
				<%
					for (int i = 1; i <= 9; i++) {
						out.println("<tr>");
					for (int j = 1; j <= 9; j++) {
						String color = (i % 2 == 0) ? "color: red;" : "";
						out.println("<td style='" + color + "'>" + i + " * " + j + " = " + (i * j) + "</td>");
					}
					out.println("</tr>");
				}
				%>
			</table>
		</div>

		<div id="colTable" style="display: none;">
			<table border="1">
				<%
					for (int i = 1; i <= 9; i++) {
						out.println("<tr>");
					for (int j = 1; j <= 9; j++) {
						String color = (j % 2 == 0) ? "color: red;" : "";
						out.println("<td style='" + color + "'>" + j + " * " + i + " = " + (i * j) + "</td>");
					}
					out.println("</tr>");
				}
				%>
			</table>
		</div>
	</div>
</body>
</html>