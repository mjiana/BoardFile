<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"  import="board.*, com.jspsmart.upload.*" %>
<% request.setCharacterEncoding("euc-kr");  %>  
<jsp:useBean id="smart" class="com.jspsmart.upload.SmartUpload" />  
<jsp:useBean id="bb" class="board.BoardBean"/>
<jsp:setProperty property="*" name="bb"/>
<jsp:useBean id="bq" class="board.BoardQuery"/>
<title>게시판 글수정</title>
<%
smart.initialize(pageContext);
smart.upload();

int idx = Integer.parseInt(smart.getRequest().getParameter("idx"));
String pwd = smart.getRequest().getParameter("pwd");
bb = bq.boardView(idx);
String oldfname = bb.getFilename();
int oldfsize = bb.getFilesize();

if(bq.passwordCheck(idx, pwd)){
	String filename = "";
	int filesize = 0;
	//File = com.jspsmart.upload.File
	File upfile = smart.getFiles().getFile(0);

	//파일 경로
	String path = "C:/java_bigdata/mywork_jsp/oracleboardUp/WebContent/data/";
	
	
	//새로운 파일이 업로드 되었다면
	if(!upfile.isMissing()){
		//기존 파일 삭제하기
		java.io.File oldfile = new java.io.File(path+oldfname);
		//out.print(oldfile);
		if(oldfile.exists()) oldfile.delete();
		
		//새로운 파일 업로드
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
		
		bb.setFilename(filename);
		bb.setFilesize(filesize);
		
	}else{ //파일이 수정되지 않고 그대로라면 기존 값 그대로 적용
		bb.setFilename(oldfname);
		bb.setFilesize(oldfsize);	
	}//if else end
}//pw end

//DB 입력
bb.setIdx(idx);
bb.setName(smart.getRequest().getParameter("name"));
bb.setEmail(smart.getRequest().getParameter("email"));
bb.setHomepage(smart.getRequest().getParameter("homepage"));
bb.setTitle(smart.getRequest().getParameter("title"));
bb.setContent(smart.getRequest().getParameter("content"));
bb.setPwd(smart.getRequest().getParameter("pwd"));

boolean result = false;
result = bq.boardUpdate(bb);
//out.print(result);
if(result){
%>
	<script type="text/javascript">
		alert('글이 수정되었습니다.');
		location.href='content.jsp?idx='+<%=idx%>;
	</script>
<%
}else{
%>
	<script type="text/javascript">
		alert('암호가 일치하지 않습니다.');
		history.back();
	</script>
<%
}
%>
