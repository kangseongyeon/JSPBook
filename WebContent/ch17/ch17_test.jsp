<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
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
							문제) 306호 학생들의 각 성씨에 따른 인원수는 각각 몇명인지 작성해주세요.
							
							예) ----------------------------------
							'홍'씨 성을 가진 사람 : 00명
							'유'씨 성을 가진 사람 : 00명
							'정'씨 성을 가진 사람 : 00명
							'이'씨 성을 가진 사람 : 00명
							'박'씨 성을 가진 사람 : 00명
							'조'씨 성을 가진 사람 : 00명
							.....
							
							1. JSTP을 이용하여 작성해주세요.
							2. 학생의 이름을 넣는 건 자유롭게 넣어주세요.
								- 스크립틀릿으로 넣고 JSTL로 옮겨도 되고, JSTL로 직접 넣어도 되고 자유!
						 -->
						 
						 <c:set value="강성연,김필거,김수연,이영준,이건우,이은재,김연희,김예지,박병준,이현수,윤다빈,김민강,임효정,정문성,김은태,정현영,최동재,나성훈,황현준,김선영,권기혁,박범진,박빈수,이동형,박현진,김용주,문형석" var="names"/>
						 <hr/>
						  전체학생 :
						 <c:forEach items="${names }" var="nm">
						 	<c:out value="${nm }"/>
						 </c:forEach>
						 <hr/>
						 
						 <br/>
						 
						 <c:set value="${fn:split(names,',')}" var="name"/>
						 
						 <c:set value="0" var="kangCnt"/>
						 <c:set value="0" var="kwonCnt"/>
						 <c:set value="0" var="kimCnt"/>
						 <c:set value="0" var="naCnt"/>
						 <c:set value="0" var="moonCnt"/>
						 <c:set value="0" var="parkCnt"/>
						 <c:set value="0" var="yoonCnt"/>
						 <c:set value="0" var="leeCnt"/>
						 <c:set value="0" var="limCnt"/>
						 <c:set value="0" var="jungCnt"/>
						 <c:set value="0" var="choiCnt"/>
						 <c:set value="0" var="hangCnt"/>
						 
						<c:forEach items="${name }" var="nm" varStatus="stat">
							<c:choose>
								<c:when test="${fn:substring(name[stat.index], 0, 1) == '강' }">
									<c:set value="${kangCnt+1 }" var="kangCnt"/>
								</c:when>
								<c:when test="${fn:substring(name[stat.index], 0, 1) == '권' }">
									<c:set value="${kwonCnt+1 }" var="kwonCnt"/>
								</c:when>
								<c:when test="${fn:substring(name[stat.index], 0, 1) == '김' }">
									<c:set value="${kimCnt+1 }" var="kimCnt"/>
								</c:when>
								<c:when test="${fn:substring(name[stat.index], 0, 1) == '나' }">
									<c:set value="${naCnt+1 }" var="naCnt"/>
								</c:when>
								<c:when test="${fn:substring(name[stat.index], 0, 1) == '문' }">
									<c:set value="${moonCnt+1 }" var="moonCnt"/>
								</c:when>
								<c:when test="${fn:substring(name[stat.index], 0, 1) == '박' }">
									<c:set value="${parkCnt+1 }" var="parkCnt"/>
								</c:when>
								<c:when test="${fn:substring(name[stat.index], 0, 1) == '윤' }">
									<c:set value="${yoonCnt+1 }" var="yoonCnt"/>
								</c:when>
								<c:when test="${fn:substring(name[stat.index], 0, 1) == '이' }">
									<c:set value="${leeCnt+1 }" var="leeCnt"/>
								</c:when>
								<c:when test="${fn:substring(name[stat.index], 0, 1) == '임' }">
									<c:set value="${limCnt+1 }" var="limCnt"/>
								</c:when>
								<c:when test="${fn:substring(name[stat.index], 0, 1) == '정' }">
									<c:set value="${jungCnt+1 }" var="jungCnt"/>
								</c:when>
								<c:when test="${fn:substring(name[stat.index], 0, 1) == '최' }">
									<c:set value="${choiCnt+1 }" var="choiCnt"/>
								</c:when>
								<c:when test="${fn:substring(name[stat.index], 0, 1) == '황' }">
									<c:set value="${hangCnt+1 }" var="hangCnt"/>
								</c:when>
						 	</c:choose>
						 </c:forEach>
						 
						 <h3>최종 집계 결과!!</h3>
						 <br/>
						 <table class="table table-bordered">
						 	<tr align="center">
						 		<td>강</td>
						 		<td>권</td>
						 		<td>김</td>
						 		<td>나</td>
						 		<td>문</td>
						 		<td>박</td>
						 		<td>윤</td>
						 		<td>이</td>
						 		<td>임</td>
						 		<td>정</td>
						 		<td>최</td>
						 		<td>황</td>
						 	</tr>
						 	<tr align="center">
						 		<td>${kangCnt }</td>
						 		<td>${kwonCnt }</td>
						 		<td>${kimCnt }</td>
						 		<td>${naCnt }</td>
						 		<td>${moonCnt }</td>
						 		<td>${parkCnt }</td>
						 		<td>${yoonCnt }</td>
						 		<td>${leeCnt }</td>
						 		<td>${limCnt }</td>
						 		<td>${jungCnt }</td>
						 		<td>${choiCnt }</td>
						 		<td>${hangCnt }</td>
						 	</tr>
						 </table>
						 <br/><br/>
						 
						 <%
						 	List<String> list = new ArrayList<String>();
						 	String[] names = {"강성연","김필거","김수연","이영준","이건우","이은재","김연희","김예지","박병준","이현수","윤다빈","김민강",
						 						"임효정","정문성","김은태","정현영","최동재","나성훈","황현준","김선영","권기혁","박범진","박빈수","이동형",
						 						 "박현진","김용주","문형석"};
						 	for (int i=0; i<names.length; i++) {
						 		list.add(names[i]);
						 	}
							Map<String, Integer> map = new HashMap<>();
						 %>
						 
						 <hr/>
						 전체학생 :
						 <c:set var="map" value="<%=map %>"/>
						 <c:forEach items="<%=list %>" var="item">
						 	<c:out value="${item }"/>
						 </c:forEach>
						 <hr/>
						 
						 <c:forEach items="<%=list %>" var="item">
						 	<c:choose>
						 		<c:when test="${map.get(fn:substring(item, 0, 1) eq null) }">
						 			<c:set value="${map.put(fn:substring(item,0,1),1) }"/>
						 		</c:when>
						 		<c:otherwise>
						 			<c:out value="${map.put(fn:substring(item,0,1), map.get(fn:substring(item,0,1)) + 1) }"/>
						 		</c:otherwise>
						 	</c:choose>
						 </c:forEach>
						 <br/>
						 <c:forEach items="<%=map.keySet() %>" var="item">
						 	<font color = "red">${item }씨</font> 성을 가진 사람 수 : ${map.get(item) }명<br/>
						 </c:forEach>
                    </div>
                </div>
            </div>
        </div>
    </section>
	<%@ include file="/pageModule/footer.jsp" %>

	<%@ include file="/pageModule/footerPart.jsp" %>
</body>
</html>