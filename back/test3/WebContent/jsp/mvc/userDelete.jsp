<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.List, dto.UserDto"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<%
		UserDto userDto = (UserDto) request.getAttribute("userDto");
	%>
	<h4>사용자 삭제 결과</h4>
	<h4><%=userDto.getUserName()%> 
		삭제를 성공했습니다.
	</h4>
</body>
</html>