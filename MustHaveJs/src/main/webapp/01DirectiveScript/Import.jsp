<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>page 지시어 = import 속성</title>
</head>
<body>
	<%
		//외부클래스 생성
		Date today = new Date();
/* 		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd"); */
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy");
		
		String todayStr = dateFormat.format(today);
		
		//오늘 날짜를 웹 브라우저에 입력
		out.println("<h1> 오늘날짜 : " + todayStr +"</h2>");
	%>
</body>
</html>