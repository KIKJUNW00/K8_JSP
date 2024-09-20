<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    trimDirectiveWhitespaces="true"
    %>
    
    <%!
    public int age(int today, int pastYear){
    	return today - pastYear	+ 1;
    }
    
    public String ddical(int year){
    	String[] ddiList = {"원숭이", "닭", "개", "돼지", "쥐", "소", "호랑이", "토끼", "용", "뱀", "말", "양"};
        // year에서 4를 뺀 후 12로 나눈 나머지를 이용하여 띠를 계산
        int str = year % 12;
    	
    	return ddiList[str];
    }
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
try{
		int year = Integer.parseInt(request.getParameter("year"));
		

		//외부클래스 생성
		Date today = new Date();
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy");
		
		String todayStr = dateFormat.format(today);

		//문자열 년도를 int형으로 전환
		int currentYear = Integer.parseInt(todayStr);
		
		//나이계산
		int result = age(currentYear, year);
		
		//띠 계산
		String ddi = ddical(year);
		
		
		out.println("<h1>"+ year + "년에 태어난 당신은</h1>");//실행되지않음
		//오늘 날짜를 웹 브라우저에 입력
		out.println("<h1>" +todayStr +"년 올해 한국 나이로"+ result +"살이고</h1>");
		out.println(ddi+"띠 입니다.");		
}
catch(Exception e){
	out.println("예외발생: 매개변수 year가 null입니다.");
}
	%>
</body>
</html>