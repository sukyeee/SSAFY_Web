<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List,dto.FoodDto" %>
<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

</head>
<body>

<%
	FoodDto FoodDto = (FoodDto)request.getAttribute("FoodDto");
	String foodprice = request.getParameter("foodprice"); 
	String[] spicy = request.getParameterValues("spicy");
	StringBuilder sb = new StringBuilder();
	for (String str : spicy) {
		System.out.println(str);
		sb.append( str );
	}

	
	
%>
    <h4>음식 등록 결과</h4>
  	<h4> <%= FoodDto.getFoodName() %> 등록을 성공했습니다.</h4>
  		가격: <%= foodprice %> 원
  		맵기: <%= sb %> 
  		

</body>
</html>