<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="board.*, com.jspsmart.upload.*"%>
<% request.setCharacterEncoding("euc-kr"); %>
<jsp:useBean id="smart" class="com.jspsmart.upload.SmartUpload" />
<jsp:useBean id="bb" class="board.BoardBean"/>
<jsp:setProperty property="*" name="boardBean"/>
<jsp:useBean id="bq" class="board.BoardQuery"/>
<title>�Խ��� �۾���</title>
<% 
String filename = "";
int filesize = 0;
smart.initialize(pageContext);
smart.upload();

//File = com.jspsmart.upload.File
File upfile = smart.getFiles().getFile(0);

//���� ���
String path = "C:/java_bigdata/mywork_jsp/oracleboardUp/WebContent/data/";

//������ ���ε� �Ǿ��ٸ�
if(!upfile.isMissing()){
	String filecheck = upfile.getFileName();
	boolean fcount = true;
	int cnt = 1;
	while(fcount){
		java.io.File file = new java.io.File(path+filecheck);
		String fc1 = ""; //���� ���ϸ�
		String fc2 = ""; //Ȯ����
		
		//���� �̸��� ������ �ִٸ� true
		if(file.exists()){
			fc1 = filecheck.substring(0, filecheck.indexOf("."));
			fc2 = filecheck.substring(filecheck.lastIndexOf("."), filecheck.length()); 
			filecheck = fc1+"("+(cnt++)+")"+fc2;
			//out.println(filecheck);
			
			//filecheck���� ù��°(�� ������(�� index���� �ٸ��� ����(cnt)�� ����� �ڿ� ���� �����
			if(filecheck.indexOf("(") != filecheck.lastIndexOf("(")) {
				fc1 = filecheck.substring(0,filecheck.indexOf("("));
				fc2 = filecheck.substring(filecheck.lastIndexOf("("),filecheck.length());
				filecheck = fc1+fc2;
				//out.println(filecheck);
			}
		}else fcount = false;		
	}//while end
	
	//�ֻ������� ���
	String loadfile = path+filecheck;
	
	upfile.saveAs(loadfile);
	filesize = upfile.getSize();
	filename = filecheck;
	
}//if end

//DB �Է�
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
		alert("�ԷµǾ����ϴ�.");
		location.href="list.jsp";
	</script>
<%
}else{
%>
	<script type="text/javascript">
		alert("�Է¿� �����߽��ϴ�.");
		history.back();
	</script>
<%
}
%>