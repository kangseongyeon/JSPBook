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
						<div class="table-responsive">
							<caption>앞(SEM PC 자리)</caption>
							<table class="table table-bordered"
								style="text-align: center; font-size: 24px;">
								<tr height="80px">
									<td width="10%">강성연</td>
									<td width="10%">김필거</td>
									<td width="10%">김수연</td>
									<td width="10%">이영준</td>
									<td width="20%"></td>
									<td width="10%">정현영</td>
									<td width="10%">최동재</td>
									<td width="10%">나성훈</td>
									<td width="10%">황현준</td>
								</tr>
								<tr height="80px">
									<td>이건우</td>
									<td>이은재</td>
									<td>김연희</td>
									<td>김예지</td>
									<td></td>
									<td>김선영</td>
									<td>권기혁</td>
									<td>박범진</td>
									<td>박민수</td>
								</tr>
								<tr height="80px">
									<td>박병준</td>
									<td>이현수</td>
									<td>윤다빈</td>
									<td>김민강</td>
									<td></td>
									<td>이동형</td>
									<td>박현진</td>
									<td>김용주</td>
									<td>문형석</td>
								</tr>
								<tr height="80px">
									<td></td>
									<td>임효정</td>
									<td>정문성</td>
									<td>김은태</td>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
								</tr>
							</table>
						</div>
						<p id="count"></p>
						<h4 id="process"></h4>
						<hr />
						<br />

						<button type="button" class="btn btn-primary" id="clickBtn">출력</button>
						<div id="output"></div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<%@ include file="/pageModule/footer.jsp"%>

	<%@ include file="/pageModule/footerPart.jsp"%>
</body>
<script type="text/javascript">
$(function() {
	var name1 = null;
	var name2 = null;
	
	$("td").on("click", function () {
		var tdt = $(this).text();
		if (tdt == "" || tdt == null) {
			$("#process").html("빈공간을 선택할 수 없습니다.").css("color", "red");
			return;
		}
		
		if (name1==null) {
			name1 = $(this);
			console.log("name1 click >> ", name1.html());
			name1.css('backgroundColor', 'yellow');
			
			$("#process").html(name1.html() + "님과 ");
		} else {
			name2 = $(this);
			console.log("name2 click >> ", name2);
			
			$("#process").html(name1.html()+ "님과 " + name2.html() + "님을 변경합니다.");
			
			var temp = name1.html();
			name1.html(name2.html());
			name2.html(temp);
			name1.css('backgroundColor', 'white');
			name1 = null;
		}
	});
	
	$("#clickBtn").on("click", function() {
	    console.log("clickBtn");
	    
	    $("#output").html('');

	    var html = `<table class="table table-bordered" style="text-align:center; font-size:24px;">`;

	    $("table tr").each(function() {
	        html += '<tr height="80px">';
	        $(this).find('td').each(function(index) {
	            var width = (index % 9 === 4) ? '20%' : '10%';
	            var name = $(this).html().trim();

	            if (name === '강성연') {
	            	
	                html += '<td width="' + width + '"><MARQUEE direction="left"><strong><span style="color: blue;">' + name + '</span></strong></MARQUEE></td>';
	            } else {
	                html += '<td width="' + width + '">' + name + '</td>';
	            }
	        });
	        html += '</tr>';
	    });

	    html += '</table>';
	    $("#output").html(html);
	});
});
</script>
</html>