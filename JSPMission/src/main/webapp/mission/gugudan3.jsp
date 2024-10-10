<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%	
	
	String sval = request.getParameter("val");
	int val = 2 ;
	
	if(sval != null) {
        try {
            val = Integer.parseInt(sval);
            
            // 입력된 값이 2보다 작으면 2로, 9보다 크면 9로 설정
            if (val < 2) {
                val = 2;
            } else if (val > 9) {
                val = 9;
            }
        } catch (NumberFormatException e) {
        	
            out.print("잘못된 숫자 입력입니다.<br/>");
        }
    }
	
	for(int i = 1 ; i<10 ; i++ ){
		out.print(val+" X "+i+" = "+val*i+"<br />");
	}
%>
</body>
</html>