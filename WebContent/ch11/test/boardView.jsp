<%@page import="kr.or.ddit.ch11.vo.BoardVO"%>
<%@page import="kr.or.ddit.ch11.dao.BoardRepository"%>
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
					<!--
						1. 게시글 상세보기를 출력해주세요.
							> JSTL을 활용해주세요. 
						
						게시판 상세보기
						──────────────────────────────────────────────
						제목 : 
						작성자 작성일 조회수
						──────────────────────────────────────────────
						내용
						──────────────────────────────────────────────
						첨부파일
						──────────────────────────────────────────────
						[ 수정  ] [ 삭제  ] [ 목록  ]
						
						2. 수정 버튼 클릭 시, 수정 페이지(boardUpdateForm.jsp)로 이동합니다.
						3. 삭제 버튼 클릭 시, 해당 게시글이 삭제 처리 될 수 있도록 합니다.
							> "정말로 삭제하시겠습니까?" 알림창이 나타나고, [확인]버튼을 클릭 시 삭제가 처리(boardRemove.jsp) 될 수 있도록 해주세요.
							> "정말로 삭제하시겠습니까?" 알림창이 나타나고, [취소]버튼을 클릭 시 알림창이 꺼질 수 있게 해주세요.
						4. 목록 버튼 클릭 시, 목록 페이지(boardList.jsp)로 이동합니다.
					 -->
					 <%
					 	String no = request.getParameter("no");
					 	
					 	BoardRepository dao = BoardRepository.getInstance();
					 	BoardVO board = dao.getBoardById(Integer.parseInt(no));
					 %>
					 <h3>게시판 상세보기</h3>
					 <hr>
					 <table class="table table-bordered">
					 	<tr>
					 		<td width="30%">제목</td>
					 		<td><%=board.getTitle() %></td>
					 	</tr>
					 	<tr>
					 		<td colspan="2">
					 			<%=board.getWriter() %>
					 			<%=board.getRegDate() %>
					 			<%=board.getHit() %>
					 		</td>
					 	</tr>
					 	<tr>
					 		<td colspan="2">
					 		<%=board.getContent() %>
					 		</td>
					 	</tr>
					 	<tr>
					 		<td>첨부파일</td>
					 		<td>
					 		<%
					 		if(board.getFileVO() == null){
					 			out.println("파일이 없습니다");
					 		} else{
					 		%>
					 		<a href="${pageContext.request.contextPath }/resources/assets/images/<%=board.getFileVO().getFileName() %>"
					 			download><%=board.getFileVO().getFileName() %></a>
					 		<%
					 			}
					 		%>
					 		</td>
					 	</tr>
					 	<tr>
					 	<td colspan="2">
					 		<button type="button" class = "btn btn-warning" onclick="updateBoard()">수정</button>
					 		<button type="button" class = "btn btn-danger" onclick="deleteBoard()">삭제</button>
					 		<button type="button" class = "btn btn-primary" onclick="boardList()">목록</button>
					 	</td>
					 	</tr>
					 	
					 </table>
                    </div>
                </div>
            </div>
        </div>
    </section>
	<%@ include file="/pageModule/footer.jsp" %>

	<%@ include file="/pageModule/footerPart.jsp" %>
</body>

<script type="text/javascript">

function updateBoard(){
	location.href = "boardUpdateForm.jsp?no="+<%=board.getNo()%>;
}

function deleteBoard(){
	if(confirm("정말로 삭제하시겠습니까?")){
		location.href = "boardRemove.jsp?no="+<%=board.getNo()%>;
	}
}
function boardList(){
	location.href="boardList.jsp";
}


</script>

</html>