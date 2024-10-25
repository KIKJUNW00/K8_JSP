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
	<h2>회원 목록 조회 테스트 (ExeQuery() 사용)</h2>
	<table border="1">
		<%
		//DB에 연결
		JDBCconnect jdbc = new JDBCconnect();

		//쿼리문 생성
		String sql = "SELECT id, pass, name, regidate FROM member";
		Statement stmt = jdbc.con.createStatement();

		//쿼리 수행
		ResultSet rs = stmt.executeQuery(sql);
		%>
		<tr>
			<th scope="col">ID</th>
			<th scope="col">PW</th>
			<th scope="col">NAME</th>
			<th scope="col">DATE</th>
		</tr>


		<%
		while (rs.next()) {
		%>
		<tr>
			<td><%=rs.getString("id")%></td>
			<td><%=rs.getString("pass")%></td>
			<td><%=rs.getString("name")%></td>
			<td><%=rs.getDate("regidate")%></td>
		</tr>
		<%
		}
		%>
		<%
		//연결닫기
		rs.close();
		stmt.close();
		jdbc.close();
		%>
	</table>
</body>
</html>