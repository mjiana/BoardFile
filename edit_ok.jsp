<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"  import="board.*, com.jspsmart.upload.*" %>
<% request.setCharacterEncoding("euc-kr");  %>  
<jsp:useBean id="smart" class="com.jspsmart.upload.SmartUpload" />  
<jsp:useBean id="bb" class="board.BoardBean"/>
<jsp:setProperty property="*" name="bb"/>
<jsp:useBean id="bq" class="board.BoardQuery"/>
<title>�Խ��� �ۼ���</title>
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

	//���� ���
	String path = "C:/java_bigdata/mywork_jsp/oracleboardUp/WebContent/data/";
	
	
	//���ο� ������ ���ε� �Ǿ��ٸ�
	if(!upfile.isMissing()){
		//���� ���� �����ϱ�
		java.io.File oldfile = new java.io.File(path+oldfname);
		//out.print(oldfile);
		if(oldfile.exists()) oldfile.delete();
		
		//���ο� ���� ���ε�
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
		
		bb.setFilename(filename);
		bb.setFilesize(filesize);
		
	}else{ //������ �������� �ʰ� �״�ζ�� ���� �� �״�� ����
		bb.setFilename(oldfname);
		bb.setFilesize(oldfsize);	
	}//if else end
}//pw end

//DB �Է�
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
		alert('���� �����Ǿ����ϴ�.');
		location.href='content.jsp?idx='+<%=idx%>;
	</script>
<%
}else{
%>
	<script type="text/javascript">
		alert('��ȣ�� ��ġ���� �ʽ��ϴ�.');
		history.back();
	</script>
<%
}
%>
