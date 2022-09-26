<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"  %>
<%@ page import="java.util.List, com.ssafy.test.dto.Note " %>
<!DOCTYPE html>
<html>
<head>
	<%@ include file="/include/head.jsp" %>
</head>
<body>
	<%@ include file="/include/nav.jsp" %>
	
<%
	List<Note> noteList  = (List<Note>)request.getAttribute("noteList");
%>
	<%-- 페이지만의 내용 --%>
	<div class="container p-4">
	  <h2>노트북 목록</h2>
	  <table class="table table-hover">
	    <thead>
	      <tr>
	        <th>고유번호</th>
	        <th>모델명</th>
	        <th>가격</th>
	        <th>제조사</th>
	      </tr>
	    </thead>
	    <tbody>
			<%-- 노트북 정보 개수만큼 반복 출력 --%>
			
			<%
			
			for(Note note : noteList){
				%>
				
				<tr >
				<td><%= note.getNoteCode() %></td>
				<td><a href="./detailNote.jsp"><%=  note.getNoteCode() %></a></td>
				<td><%=  note.getPrice() %></td>
				<td><%= note.getCompany() %></td>
			</tr>
				
				<% 
			}
			
			%>
		
	    </tbody>
	  </table>

	</div>

<%@ include file="/include/footer.jsp" %>