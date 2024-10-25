<%@page import="java.util.Scanner"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
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
	<h2>Board 목록 조회</h2>
	<table border="1">
	<%
	try{
	//DB연결
	JDBCconnect Jboard = new JDBCconnect();
	
	//파라미터 값입력
	String id = "musthave";
    String sid = request.getParameter("id");
    if (sid != null && !sid.isEmpty()) {
            id = sid;   
    }
	
	//쿼리문 생성
	String sql = ("select num, title, name, postdate, visitcount"
				+" from board, member"
				+" where board.id = member.id and member.id = '"+id+"'; ");
	Statement stmt = Jboard.con.createStatement();
	
	//쿼리 수행
	ResultSet rs = stmt.executeQuery(sql);		
	
	%>
	<tr>
		<th scope="row">NUM</th>
		<th scope="row">TITLE</th>
		<th scope="row">NAME</th>
		<th scope="row">POSTDATE</th>
		<th scope="row">VISIT</th>		
	</tr>
	<%
	while(rs.next()){
	%>
	<tr>
		<td><%=rs.getString("num") %></td>
		<td><%=rs.getString("title") %></td>
		<td><%=rs.getString("name") %></td>
		<td><%=rs.getDate("postdate")%></td>
		<td><%=rs.getString("visitcount") %></td>
	</tr>
	<%
	}
	%>
	<%
		//연결닫기
		rs.close();
		stmt.close();
		Jboard.close();
	%>
	</table>
	<%
	}catch(Exception e){
		e.printStackTrace();
	}
	
	%>
</body>
</html>