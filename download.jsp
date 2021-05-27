<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<hr>
<b>직접 링크 : 현재 소스 => 자료실 위치노출, 보안 약화</b> <br>
<%-- URLEncoder.encode("./data/사막.jpg","utf-8"); --%>
<a href="./data/Desert.jpg">Desert.jpg</a><br> 
<a href="./data/사막.jpg">사막.jpg</a><br>
<br> 
<hr>
<b>smartupload 다운 링크 파일이용 : 한글처리 시키기</b> <br>
<a href="./download2.jsp?filename=Desert.jpg">Desert.jpg</a><br> 
<a href="./download2.jsp?filename=사막.jpg">사막.jpg</a> : 오류<br>
<a href="./download2.jsp?filename=<%=java.net.URLEncoder.encode("사막.jpg","utf-8")%>">인코딩 사막.jpg</a> : 성공<br>
<br>
<hr>
<b>다운 링크 : 무조건 다운로드 시키기</b> <br>
<a href="./alldownload.jsp?filename=Desert.jpg">Desert.jpg</a><br> 
<a href="./alldownload.jsp?filename=사막.jpg">사막.jpg</a> : 오류<br>
<a href="./alldownload.jsp?filename=<%=java.net.URLEncoder.encode("사막.jpg","utf-8")%>">인코딩 사막.jpg</a> : 성공<br>
</body>
</html>


