<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<% request.setCharacterEncoding("euc-kr");  %>  
<jsp:useBean id="bb" class="board.BoardBean"/>
<jsp:useBean id="bq" class="board.BoardQuery"/>
<%
int idx = Integer.parseInt(request.getParameter("idx"));
String pwd = request.getParameter("pwd");
bb = bq.boardView(idx);
String oldfname = bb.getFilename();
//���� ���
String path = "C:/java_bigdata/mywork_jsp/oracleboardUp/WebContent/data/";

if(bq.passwordCheck(idx, pwd)){
	//���� ������ �����.
	java.io.File oldfile = new java.io.File(path+oldfname);
	if(oldfile.exists()) oldfile.delete();
}

boolean result = false;
result = bq.boardDelete(idx, pwd);
if(result){
%>
	<script type="text/javascript">
		alert("���� �����Ǿ����ϴ�.");
		location.href="list.jsp";
	</script>
<%
}else{
%>
	<script type="text/javascript">
		alert("��ȣ�� ��ġ���� �ʽ��ϴ�.");
		history.back();
	</script>
<%
}
%>
