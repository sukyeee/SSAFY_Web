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
	/* String foodprice = request.getParameter("deletefoodname"); */ 

	
	
%>
    <h4>음식 삭제 결과</h4>
  	<h4> "<%= FoodDto.getFoodName() %>" 메뉴가 삭제되었습니다! </h4>
  		
  		

</body>
</html>