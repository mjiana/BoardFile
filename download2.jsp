<%@ page language="java" import="com.jspsmart.upload.*"%>
<jsp:useBean id="mySmartUpload" scope="page" 
class="com.jspsmart.upload.SmartUpload" />

<%

	// Initialization
	mySmartUpload.initialize(pageContext);
	
    out.clearBuffer() ;
	
    //Download file, ���� �̸��� �ѱ��� �����ִ� ���
	String filename = 
		java.net.URLDecoder.decode(request.getParameter("filename"),"EUC-KR") ;
	
	//�Ʒ�ó�� ����ϸ� �ܺο� �ڷ�� ��ΰ� ������� �ʴ´�. ������ ��ο� �°� ����
	String path ="C:\\java_bigdata\\mywork_jsp\\oracleboardUp\\WebContent\\data\\" ;
	//C:\java_bigdata\mywork_jsp\oracleboardUp\WebContent\data\
	
	mySmartUpload.downloadFile(path+filename);
	
	
	// With a physical path
	// mySmartUpload.downloadFile
	// ("D:\\���������\\upload\\sample.zip");
	
	// With options
	// mySmartUpload.downloadFile
	// ("/upload/sample.zip","application/x-zip-compressed","downloaded.zip")

%>