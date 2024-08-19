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
			            	타입, 아이디, 비밀번호, 이름 , 핸드폰번호, 성별, 취미, 가입인사 입력 폼양식을 만들고
			            	ch06_test_process.jsp로 결과를 전송해주세요.
			            	
							타입 : 사용자(user) / 관리자(admin)을 선택할 수 있는 입력 양식을 만들어주세요.
							아이디 : 아이디를 입력 받을 수 있는 양식으로 만들어주세요.			            	
							비밀번호 : 비밀번호를 입력 받을 수 있는 양식으로 만들어주세요.			            	
							이름 : 이름을 입력 받을 수 있는 양식으로 만들어주세요.			            	
							핸드폰번호 : 첫번째 자리는 010,011,016,017,019,070을 선택 할 수 있도록 입력 양식을 만들어주세요.
									두번째 자리는 입력 받을 수 있는 양식으로 만들어주세요.	
									세번째 자리는 입력 받을 수 있는 양식으로 만들어주세요.
							성별 : 남자(male), 여자(female)로 선택 할 수 있는 입력 양식을 만들어주세요.
								- value : male / female
							취미 : 개발(development), 독서(book), 영화감상(movie), 음악감상(music), 운동(sports), 기타(etc)
								- 기타 일 때는 직접 입력할 수 있는 입력 양식이 동적으로 생성되어 입력 양식이 나타나게 해주세요.
							가입인사 : 가입인사를 문장으로 입력 할 수 있는 입력 양식으로 만들어주세요. 
						 -->
						 
						<form action = "ch06_test_process.jsp" name = "member" method = "post">
							타입 : <select name = "type">
									<option value = "">타입</option>
									<option value = "사용자">user</option>
									<option value = "관리자">admin</option>
								</select> <br />
							아이디 : <input type = "text" name = "id" id = "id"/><br/>
							비밀번호 : <input type = "text" name = "pw" id = "pw"/><br/>
							이름 : <input type = "text" name = "name" id = "name"/><br/>
							핸드폰번호 : <select name = "phone1">
										<option value = "010">010</option>
										<option value = "011">011</option>
										<option value = "016">016</option>
										<option value = "017">017</option>
										<option value = "019">019</option>
										<option value = "070">070</option>
									</select>-
									<input type = "text" name = "phone2" id = "phone2" maxlength="4" size = "4"/>-
									<input type = "text" name = "phone3" id = "phone3" maxlength="4" size = "4"/><br/>
							성별 : <input type = "radio" name = "gender" value = "M" />남자
									<input type = "radio" name = "gender" value = "G" /> 여자 <br />
							취미 : <input type = "checkbox" name = "hobby" id = "hobby1" value="개발(development)"/> 개발
									<input type = "checkbox" name = "hobby" id = "hobby2" value="독서(book)"/> 독서  
									<input type = "checkbox" name = "hobby" id = "hobby3" value="영화감상(movie)"/> 영화감상
									<input type = "checkbox" name = "hobby" id = "hobby4" value="음악감상(music)"/> 음악감상
									<input type = "checkbox" name = "hobby" id = "hobby5" value="운동(sports)"/> 운동
									<input type = "checkbox" name = "hobby" id = "hobby6" value="기타(etc)"/> 기타 <br/>
									<input type = "text" name = "hobby" id = "etc" value ="" /><br/>
							가입인사 : <textarea rows = "10" cols = "50" name = "comment" 
										placeholder="가입 인사를 입력해주세요." wrap="hard"></textarea>
							<input type = "submit" value = "전송" />
							<input type = "reset" value = "리셋" /><br />	
						</form>
                    </div>
                </div>
            </div>
        </div>
    </section>
	<%@ include file="/pageModule/footer.jsp" %>

	<%@ include file="/pageModule/footerPart.jsp" %>
</body>
<script type = "text/javascript">
$(document).ready(function() {
	$("#etc").hide();
	
	$("#hobby6").on('click', function() {
		$("#etc").show();
	});
});
</script>
</html>