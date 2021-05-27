<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="board.*, com.jspsmart.upload.*"%>
<% request.setCharacterEncoding("euc-kr"); %>
<jsp:useBean id="smart" class="com.jspsmart.upload.SmartUpload" />
<jsp:useBean id="bb" class="board.BoardBean"/>
<jsp:setProperty property="*" name="boardBean"/>
<jsp:useBean id="bq" class="board.BoardQuery"/>
<title>게시판 글쓰기</title>
<% 
String filename = "";
int filesize = 0;
smart.initialize(pageContext);
smart.upload();

//File = com.jspsmart.upload.File
File upfile = smart.getFiles().getFile(0);

//파일 경로
String path = "C:/java_bigdata/mywork_jsp/oracleboardUp/WebContent/data/";

//파일이 업로드 되었다면
if(!upfile.isMissing()){
	String filecheck = upfile.getFileName();
	boolean fcount = true;
	int cnt = 1;
	while(fcount){
		java.io.File file = new java.io.File(path+filecheck);
		String fc1 = ""; //순수 파일명
		String fc2 = ""; //확장자
		
		//같은 이름의 파일이 있다면 true
		if(file.exists()){
			fc1 = filecheck.substring(0, filecheck.indexOf("."));
			fc2 = filecheck.substring(filecheck.lastIndexOf("."), filecheck.length()); 
			filecheck = fc1+"("+(cnt++)+")"+fc2;
			//out.println(filecheck);
			
			//filecheck에서 첫번째(와 마지막(의 index값이 다르면 앞의(cnt)을 지우고 뒤에 값만 남기기
			if(filecheck.indexOf("(") != filecheck.lastIndexOf("(")) {
				fc1 = filecheck.substring(0,filecheck.indexOf("("));
				fc2 = filecheck.substring(filecheck.lastIndexOf("("),filecheck.length());
				filecheck = fc1+fc2;
				//out.println(filecheck);
			}
		}else fcount = false;		
	}//while end
	
	//최상위부터 잡기
	String loadfile = path+filecheck;
	
	upfile.saveAs(loadfile);
	filesize = upfile.getSize();
	filename = filecheck;
	
}//if end

//DB 입력
bb.setName(smart.getRequest().getParameter("name"));
bb.setEmail(smart.getRequest().getParameter("email"));
bb.setHomepage(smart.getRequest().getParameter("homepage"));
bb.setTitle(smart.getRequest().getParameter("title"));
bb.setContent(smart.getRequest().getParameter("content"));
bb.setPwd(smart.getRequest().getParameter("pwd"));
bb.setFilename(filename);
bb.setFilesize(filesize);


boolean result = false;
result = bq.boardInsert(bb); 
if(result){
%>
	<script type="text/javascript">
		alert("입력되었습니다.");
		location.href="list.jsp";
	</script>
<%
}else{
%>
	<script type="text/javascript">
		alert("입력에 실패했습니다.");
		history.back();
	</script>
<%
}
%>