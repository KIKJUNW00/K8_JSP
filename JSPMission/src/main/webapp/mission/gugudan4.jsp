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
	 int val = 3; // 기본값

    // 쿠키에서 val 값 읽기
    Cookie[] cookies = request.getCookies();
    if (cookies != null) {
        for (Cookie c : cookies) {
            if (c.getName().equals("val")) {
                try {
                    val = Integer.parseInt(c.getValue());
                } catch (NumberFormatException e) {}
            }
        }
    }

    // 질의 문자열에서 val 값 읽기
    String sval = request.getParameter("val");
    if (sval != null && !sval.isEmpty()) {
        try {
            val = Integer.parseInt(sval);
        } catch (NumberFormatException e) {
            // 숫자로 변환 실패 시 기존 val 사용
        }
    }

    // val 값을 쿠키에 저장
    Cookie valCookie = new Cookie("val", String.valueOf(val));
    valCookie.setMaxAge(60 * 60 * 24); // 1일 동안 유효
    response.addCookie(valCookie);

	
	for (int j = 2; j < 10; j += val) {
		for (int k = j; k < j + val && k <= 9; k++) {
	        out.print(k + "단&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"); // 각 단 제목 출력
	    }
	    out.print("<br/>");

		
	    // 각 단의 첫 번째 줄부터 아홉 번째 줄까지 출력
	    for (int i = 1; i <= 9; i++) {
	        for (int k = j; k < j + val && k <= 9; k++) {
	            out.print(k + "x" + i + "=" + (k * i) + "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;");
	        }
	        out.print("<br/>");
	    }
	    out.print("<br/>"); // 각 그룹 사이에 줄 바꿈
	}
	
	%>
</body>
</html>