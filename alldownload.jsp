<%@ page contentType="text/html; charset=euc-kr" 
pageEncoding="euc-kr"%>
<%@ page import="java.net.URLEncoder"%>
<%@ page import="java.io.*" %>
<%
 // Get ��� �Ķ������ ��� ��Ĺ server.xml :
 // URIEncoding="euc-kr" ���� �ʿ�
 OutputStream outStream = null;
 FileInputStream fileStream = null;
 
 try {
  // �ּҿ� �����̸� ��������

  String fileName = request.getParameter("filename");
  //String path = "data";
  //String filePath = getServletContext().getRealPath("/"+path)+"\\";  
	String filePath = "C:/java_bigdata/mywork_jsp/oracleboardUp/WebContent/data/";

	// out.print(filePath) ;
  //���డ���� ���� ���� ������� ������ �ٿ�ε� �ǵ��� �ϱ� ����  
  //���� ����� Content-Type�� �����Ѵ�.

  //response.setContentType("application/x-msdownload");
  //�� �������� �ȵ� ��쿡 ���.
 response.setContentType("application/octet-stream");
 
 String convName1 = URLEncoder.encode(fileName,"utf-8");
 response.setHeader("Content-Disposition", "attachment;filename=" +
	 convName1 + ";");  
 
 // ������ �ִ� ���� �������� ���� �ٸ� ������� ��ȯ
 String convName2 = fileName;
 File file = new File(filePath+convName2);
 
 byte[] byteStream = new byte[(int)file.length()];
 fileStream = new FileInputStream(file);
 
 int i=0,  j=0;
 while( (i=fileStream.read()) != -1){
  byteStream[j] = (byte)i;
  j++;
 }
 out.clear(); //out--> jsp��ü ��ü
 out=pageContext.pushBody(); //out--> jsp��ü ��ü 
 outStream = response.getOutputStream();
 outStream.write(byteStream);

} catch(Exception err) {
 err.printStackTrace();
} finally {
 if(fileStream != null) fileStream.close();
 if(outStream != null) outStream.close();
}
%>
