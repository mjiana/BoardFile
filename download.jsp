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
<b>���� ��ũ : ���� �ҽ� => �ڷ�� ��ġ����, ���� ��ȭ</b> <br>
<%-- URLEncoder.encode("./data/�縷.jpg","utf-8"); --%>
<a href="./data/Desert.jpg">Desert.jpg</a><br> 
<a href="./data/�縷.jpg">�縷.jpg</a><br>
<br> 
<hr>
<b>smartupload �ٿ� ��ũ �����̿� : �ѱ�ó�� ��Ű��</b> <br>
<a href="./download2.jsp?filename=Desert.jpg">Desert.jpg</a><br> 
<a href="./download2.jsp?filename=�縷.jpg">�縷.jpg</a> : ����<br>
<a href="./download2.jsp?filename=<%=java.net.URLEncoder.encode("�縷.jpg","utf-8")%>">���ڵ� �縷.jpg</a> : ����<br>
<br>
<hr>
<b>�ٿ� ��ũ : ������ �ٿ�ε� ��Ű��</b> <br>
<a href="./alldownload.jsp?filename=Desert.jpg">Desert.jpg</a><br> 
<a href="./alldownload.jsp?filename=�縷.jpg">�縷.jpg</a> : ����<br>
<a href="./alldownload.jsp?filename=<%=java.net.URLEncoder.encode("�縷.jpg","utf-8")%>">���ڵ� �縷.jpg</a> : ����<br>
</body>
</html>


