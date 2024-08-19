<%@page import="java.io.File"%>
<%@page import="org.apache.commons.fileupload.DiskFileUpload"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="org.apache.commons.fileupload.FileItem"%>
<%@page import="kr.or.ddit.ch11.dao.BoardRepository"%>
<%@page import="kr.or.ddit.ch11.vo.BoardFileVO"%>
<%@page import="kr.or.ddit.ch11.vo.BoardVO"%>
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
						1. 게시글 수정을 처리해주세요.
							> 수정 성공 후, 상세보기 페이지(boardView.jsp)로 이동해주세요.
							> 수정 실패 후, 에러 페이지(exceptionBoard_error.jsp)로 이동해주세요.
							
						2. 게시글 수정 시, 등록과 같은 옵션 정보를 처리해주세요.
							> 등록과  옵션 정보 동일
					 -->
					 <%
						String encType = "utf-8";
						request.setCharacterEncoding(encType);
					
						String realFolder = request.getServletContext().getRealPath("resources/assets/images");
						File file = new File(realFolder);
						if(!file.exists()){
							file.mkdirs();
						}
						
						int maxSize = 2 * 1024 * 1024;
						
						DiskFileUpload upload = new DiskFileUpload();
						upload.setFileSizeMax(10*1024*1024);
						upload.setRepositoryPath(realFolder);
						
						List items = upload.parseRequest(request);
						Iterator params = items.iterator();
					
						String title ="";
						String content = "";
						String writer = request.getRemoteUser();
						String fileName = "";
						long fileSize = 0;
						String contentType = "";
						
						try {
							while(params.hasNext()){
								FileItem item = (FileItem)params.next();
								
								if(item.isFormField()){
									String fieldName = item.getFieldName();
									
									if(fieldName.equals("title")){
										title = item.getString(encType);
									} else if(fieldName.equals("content")){
										content = item.getString(encType);
									}
									
								} else{
									fileName = item.getName();
									File saveFile = new File(realFolder + "/" + fileName);
									if(!fileName.equals("")){
										item.write(saveFile);
										fileSize = item.getSize();
										contentType = fileName.substring(fileName.lastIndexOf('.'), fileName.length());
									}
								}
							}
								
							String no = request.getParameter("no");
							BoardRepository dao = BoardRepository.getInstance();
							
							BoardVO oldBoard = dao.getBoardById(Integer.parseInt(no));
							oldBoard.setContent(content);
							oldBoard.setWriter(writer);
							oldBoard.setTitle(title);
							
							BoardFileVO oldFile = oldBoard.getFileVO();
							oldFile.setContentType(contentType);
							oldFile.setFileName(fileName);
							oldFile.setFileSize(fileSize);
							
							oldBoard.setFileVO(oldFile);
							
							
							String url = "";
							if(fileSize > maxSize){
								url = "boardUpdateForm.jsp?error=true&no="+no;
							} else{
								dao.updateBoard(oldBoard);
								url = "boardView.jsp?no="+no;
							}
							
							response.sendRedirect(url);
						} catch (Exception e) {
                            /* RequestDispatcher dispatcher = request.getRequestDispatcher("exceptionBoard_error.jsp");
                            dispatcher.forward(request, response); */
							request.getRequestDispatcher("exceptionBoard_error.jsp").forward(request, response);
                        }
					%>
                    </div>
                </div>
            </div>
        </div>
    </section>
	<%@ include file="/pageModule/footer.jsp" %>

	<%@ include file="/pageModule/footerPart.jsp" %>
</body>
</html>