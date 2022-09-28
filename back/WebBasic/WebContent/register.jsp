<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
	// import 필요 
		List<CodeDto> codeList = (List<CodeDto>) request.getAttribute("codeList");
	%>
	
	
	<%-- codeList 반복문 
	
		for( codeDto : codeList ) {
	--%> 
	<input type="radio" value=<%=codeDto.getCode() %>><%= codeDto.getCodeName() %> 
</body>
</html>