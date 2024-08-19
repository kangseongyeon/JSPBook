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
						<div class="table-responsive">
							<caption>앞(SEM PC 자리)</caption>
							   <table class="table table-bordered" style="text-align:center; font-size:24px;">
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

							<hr/>
							<div class="progress" style="height: 40px;">
								<div class="progress-bar progress-bar-striped" id="myBar" role="progressbar" aria-valuenow="60" aria-valuemin="0"
									aria-valuemax="100" style="width: 1px; height: 40px;">
									<span class="sr-only">60% Complete</span>
								</div>
							</div>
							<br/>
							<h4 id="txt"></h4>
							<button type="button" id="button" style="padding:12px;border:none;cursor:pointer;">출력</button>
						</div>
                    </div>
                </div>
            </div>
        </div>
    </section>
	<%@ include file="/pageModule/footer.jsp" %>

	<%@ include file="/pageModule/footerPart.jsp" %>
</body>
<!-- 
	프로그레스바 % 증가 이벤트 
	스타일 요소의 width를 증가시켜주면 됨.
	.css("width", "100");
	.style.width = 100;
-->
<script type="text/javascript">
$(document).ready(function() {
	function name() {
		return $(this).text().trim() != "";
	}
	
	var cell = $("td").filter(name);
	console.log(cell);
	
	var cellLength = cell.length;
	console.log(cellLength);
	
	var update;
	var progress = 0;
	
	function updateBar() {
		var ran = Math.floor(Math.random() * cellLength);
		console.log(ran);
		backgroundColor();
		
		if (progress >= 100) {
        	clearInterval(update);
		} else {
			progress +=1;
			$("#myBar").css("width", progress + "%");
			$(".sr-only").text(progress + "%");
		}
	} 

	function backgroundColor() {
		var ranColor = Math.floor(Math.random() * cellLength);
		console.log(ranColor);
        cell.css('background', 'none');
        cell.eq(ranColor).css('background', 'yellow');
	}
	
	$("#button").on("click", function () {
		updateBar();
		console.log("button click");
		
		$("#myBar").css("width", "0");
		$(".sr-only").text("0%");
		
		update = setInterval(updateBar, 20);
	})
})
</script>
</html>








