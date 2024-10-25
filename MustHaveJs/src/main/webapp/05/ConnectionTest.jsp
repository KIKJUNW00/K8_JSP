<%@page import="common.JDBCconnect"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JDBC</title>
</head>
<body>
	<h2>JDBC 테스트 1</h2>
	<%
	JDBCconnect jdbc1 = new JDBCconnect();
	jdbc1.close();
	%>
	
	<h2>JDBC 테스트 2</h2>
	<%
	String driver = application.getInitParameter("MySQLDriver");
	String url = application.getInitParameter("MySQLURL");
	String id = application.getInitParameter("MySQLId");
	String pwd = application.getInitParameter("MySQLPwd");
	
	JDBCconnect jdbc2 = new JDBCconnect(driver, url, id, pwd);
	jdbc2.close();
	%>
	
	<h2>JDBC 테스트 2</h2>
	<%
	JDBCconnect jdbc3 = new JDBCconnect(application);
	jdbc3.close();
	%>
</body>
</html>