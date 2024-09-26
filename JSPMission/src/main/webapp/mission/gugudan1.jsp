<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Mission - gugudan1</title>
</head>
<body>
	<%
		for(int i = 2 ; i<=3 ; i++){
			for(int j = 1 ; j<=9 ; j++ ){
				out.print(i+" X "+j+" = "+i*j+"<br />");
			}
		}
	%>
</body>
</html>