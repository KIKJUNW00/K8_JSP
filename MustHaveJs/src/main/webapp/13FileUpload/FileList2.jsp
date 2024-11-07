<%@page import="java.net.URLEncoder"%>
<%@page import="fileupload.MyFileDTO"%>
<%@page import="java.util.List"%>
<%@page import="fileupload.MyFileDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FileUpload</title>
</head>
<body>
	<h2>DB에 등록된 파일 목록 보기</h2>
	<a href="FileUploadMain.jsp">파일등록1</a>
	<a href="MultiFileUploadMain.jsp">파일등록2</a>
	<%
	MyFileDAO dao = new MyFileDAO();
	List<MyFileDTO> fileLists = dao.myFileList();
	dao.close();
	%>
	<table border="1">
	
	<tr>
		<th>NO</th><th>제목</th><th>카테고리</th>
		<th>원본파일명</th><th>저장된 파일명</th><th>작성일</th>
	</tr>
	
	<c:set var="fileLists" value="<%=fileLists %>"></c:set>
	<c:forEach var="file" items="${fileLists}">
		<tr>
			<td>${file.getIdx()}</td>
			<td>${file.getTitle()}</td>
			<td>${file.getCate()}</td>
			<td>${file.getOfile()}</td>
			<td>${file.getSfile()}</td>
			<td>${file.getPostdate()}</td>
			<td>
				<c:url var="downloadUrl" value="Download.jsp">
					<c:param name="oName" value="${file.ofile}" />
					<c:param name="sName" value="${file.sfile}" />
				</c:url>
				<a href="${downloadUrl}">[다운로드]</a>
			</td>
		</tr>
	</c:forEach>
	</table>
</body>
</html>