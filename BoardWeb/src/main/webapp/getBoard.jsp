<%@page import="com.springbook.biz.board.impl.BoardDAO"%>
<%@page import="com.springbook.biz.board.impl.BoardDAOSpring"%>
<%@page import="com.springbook.biz.board.BoardVO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%
/*	//1. �˻��� �Խñ� ��ȣ ����
String seq = request.getParameter("seq");

//2. DB ���� ó��
BoardVO vo = new BoardVO();
vo.setSeq(Integer.parseInt(seq));

BoardDAO boardDAO = new BoardDAO();
BoardVO board = boardDAO.getBoard(vo);*/

//���ǿ� ����� �Խñ� ������ ������.
BoardVO board= (BoardVO)session.getAttribute("board");

//3. ���� ȭ�� ���� 
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>�� ��</title>
</head>
<body>
	<h1>�� ��</h1>
	<a href="logout.do">Log-out</a>
	<hr>
	<form action="updateBoard.do" method="post">
		<table border="1" cellpadding="0" cellspacing="0">
		<input name="seq" type="hidden" value="${board.seq }"/>
			<tr>
				<td bgcolor="orange" width="70">����</td>
				<td align="left"><input name="title" type="text"
					value="${board.title }" /></td>
			</tr>
			<tr>
				<td bgcolor="orange">�ۼ���</td>
				<td align="left">${board.writter }</td>
			</tr>
			<tr>
				<td bgcolor="orange">����</td>
				<td align="left"><textarea rows="10" cols="40" name="content">${board.content }</textarea>
				</td>
			</tr>
			<tr>
				<td bgcolor="orange">�����</td>
				<td align="left">${board.regDate }</td>
			</tr>
			<tr>
				<td bgcolor="orange">��ȸ��</td>
				<td align="left">${board.cnt }</td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<input type="submit" value="�� ����" /> 
				</td>
			</tr>
		</table>
	</form>
	<hr>
	<a href="insertBoard.jsp">�۵��</a>&nbsp;&nbsp;&nbsp;
	<a href="deleteBoard.do?seq=${board.seq }">�ۻ���</a>&nbsp;&nbsp;&nbsp;	
	<a href="getBoardList.do">�۸��</a>&nbsp;&nbsp;&nbsp;
</body>
</html>