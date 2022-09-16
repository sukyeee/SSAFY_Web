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
	
%>
    <h4>메뉴 상세보기</h4>
  	<h4> <%= FoodDto.getFoodName() %> 메뉴입니다.</h4>
  		가격: <%= FoodDto.getFoodPrice() %> 원 <br>
  		메뉴 등록 번호: <%= FoodDto.getFoodSeq() %>

</body>
</html>