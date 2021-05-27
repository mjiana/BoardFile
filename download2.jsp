<%@ page language="java" import="com.jspsmart.upload.*"%>
<jsp:useBean id="mySmartUpload" scope="page" 
class="com.jspsmart.upload.SmartUpload" />

<%

	// Initialization
	mySmartUpload.initialize(pageContext);
	
    out.clearBuffer() ;
	
    //Download file, 파일 이름에 한글이 섞여있는 경우
	String filename = 
		java.net.URLDecoder.decode(request.getParameter("filename"),"EUC-KR") ;
	
	//아래처럼 사용하면 외부에 자료실 경로가 노출되지 않는다. 본인의 경로에 맞게 변경
	String path ="C:\\java_bigdata\\mywork_jsp\\oracleboardUp\\WebContent\\data\\" ;
	//C:\java_bigdata\mywork_jsp\oracleboardUp\WebContent\data\
	
	mySmartUpload.downloadFile(path+filename);
	
	
	// With a physical path
	// mySmartUpload.downloadFile
	// ("D:\\물리적경로\\upload\\sample.zip");
	
	// With options
	// mySmartUpload.downloadFile
	// ("/upload/sample.zip","application/x-zip-compressed","downloaded.zip")

%>