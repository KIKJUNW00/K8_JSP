<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Mission - gugudan2</title>
</head>
<body>
	<table align="center" border="1">
		<tr>
			<%
				for(int i = 1 ; i < 10 ; i++){
			%>
			<td><%= i %>단</td>
			<%
				}
			%>
		</tr>
			<%
			   for (int j = 2; j <= 9; j++) {
			%>
		<tr>
			<%
				for (int i = 1; i <= 9; i++) {
		    %>
			<td><%=i%> X <%=j %> = <%=j * i %></td>
			<%
				}
					%>

			<%
				}
		    %>
		</tr>

	</table>
</body>
</html>