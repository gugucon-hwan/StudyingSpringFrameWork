<%@page import="java.util.List"%>
<%@page import="com.springbook.biz.board.impl.BoardDAO"%>
<%@page import="com.springbook.biz.board.impl.BoardDAOSpring"%>
<%@page import="com.springbook.biz.board.BoardVO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
    <%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>
    <%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
    
    
   <%
   		//1. ����� �Է� ���� ���� (�˻� ����� ���߿� ����)
   		//2. DB���� ó��
   		/*BoardVO vo = new BoardVO();
   		BoardDAO boardDAO = new BoardDAO();
   		List<BoardVO> boardList= boardDAO.getBoardList(vo);*/
   		
   		//���ǿ� ����� �� ����� ������.
   		List<BoardVO> boardList=(List)session.getAttribute("boardList");
   		
   %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>�� ���</title>
</head>
<body>
<center>
<h1><spring:message code="message.board.list.mainTitle" /></h1>
<h3>${userName}<spring:message code="message.board.list.welcomeMsg" />...<a href="logout.do">Log-out</a></h3>
<!-- �˻� ���� -->
<form action="getBoardList.do" method="post">
	<table border="1" cellpadding="0" cellspacing="0" width="700">
			<tr>
				<td align="right">
					<select name="searchCondition">
						<c:forEach items="${conditionMap }" var="option">
								<option value="${option.value }">${option.key }
						</c:forEach>
					</select>					
					<input name="searchKeyword" type="text" />
					<input type="submit" value="<spring:message code="message.board.list.search.condition.btn"/>"/>
				</td>
			</tr>
	</table>
</form>
	<!-- �˻� ���� -->
	<table border="1" cellpadding="0" cellspacing="0" width="700">
		<tr>
			<th bgcolor="orange" width="100">
			<spring:message code="message.board.list.table.head.seq"/></th>
			<th bgcolor="orange" width="200">
			<spring:message code="message.board.list.table.head.title"/></th>
			<th bgcolor="orange" width="150">
			<spring:message code="message.board.list.table.head.writer"/></th>
			<th bgcolor="orange" width="150">
			<spring:message code="message.board.list.table.head.regDate"/></th>
			<th bgcolor="orange" width="100">
			<spring:message code="message.board.list.table.head.cnt"/></th>			
		</tr>
		<c:forEach items="${boardList }" var="board">
			<tr>
				<td>${board.seq }</td>
				<td align="left"><a href="getBoard.do?seq=${board.seq }">${board.title }</a></td>
				<td>${board.writter }</td>
				<td><fmt:formatDate value="${board.regDate }" pattern="yyyy-MM-dd"/></td>
				<td>${board.cnt }</td>
			</tr>
		</c:forEach>
	</table>
	<br>
	<a href="insertBoard.jsp">
	<spring:message code="message.board.list.link.insertBoard"/></a>
</center>
</body>
</html>