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
//파일 경로
String path = "C:/java_bigdata/mywork_jsp/oracleboardUp/WebContent/data/";

if(bq.passwordCheck(idx, pwd)){
	//기존 파일을 지운다.
	java.io.File oldfile = new java.io.File(path+oldfname);
	if(oldfile.exists()) oldfile.delete();
}

boolean result = false;
result = bq.boardDelete(idx, pwd);
if(result){
%>
	<script type="text/javascript">
		alert("글이 삭제되었습니다.");
		location.href="list.jsp";
	</script>
<%
}else{
%>
	<script type="text/javascript">
		alert("암호가 일치하지 않습니다.");
		history.back();
	</script>
<%
}
%>
