<%@ page contentType="text/html; charset=euc-kr" 
pageEncoding="euc-kr"%>
<%@ page import="java.net.URLEncoder"%>
<%@ page import="java.io.*" %>
<%
 // Get 방식 파라미터일 경우 톰캣 server.xml :
 // URIEncoding="euc-kr" 설정 필요
 OutputStream outStream = null;
 FileInputStream fileStream = null;
 
 try {
  // 주소와 파일이름 가져오기

  String fileName = request.getParameter("filename");
  //String path = "data";
  //String filePath = getServletContext().getRealPath("/"+path)+"\\";  
	String filePath = "C:/java_bigdata/mywork_jsp/oracleboardUp/WebContent/data/";

	// out.print(filePath) ;
  //실행가능한 파일 여부 상관없이 무조건 다운로드 되도록 하기 위해  
  //응답 헤더의 Content-Type을 세팅한다.

  //response.setContentType("application/x-msdownload");
  //위 세팅으로 안될 경우에 사용.
 response.setContentType("application/octet-stream");
 
 String convName1 = URLEncoder.encode(fileName,"utf-8");
 response.setHeader("Content-Disposition", "attachment;filename=" +
	 convName1 + ";");  
 
 // 폴더에 있는 파일 가져오기 위해 다른 방법으로 변환
 String convName2 = fileName;
 File file = new File(filePath+convName2);
 
 byte[] byteStream = new byte[(int)file.length()];
 fileStream = new FileInputStream(file);
 
 int i=0,  j=0;
 while( (i=fileStream.read()) != -1){
  byteStream[j] = (byte)i;
  j++;
 }
 out.clear(); //out--> jsp자체 객체
 out=pageContext.pushBody(); //out--> jsp자체 객체 
 outStream = response.getOutputStream();
 outStream.write(byteStream);

} catch(Exception err) {
 err.printStackTrace();
} finally {
 if(fileStream != null) fileStream.close();
 if(outStream != null) outStream.close();
}
%>
