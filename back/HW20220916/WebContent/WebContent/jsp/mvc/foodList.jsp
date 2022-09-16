<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List,dto.FoodDto" %>
<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
table {
    border-collapse: collapse;
    width: 100%;
}

th, td {
    border: 1px solid black;
}

th:nth-child(1) {
    width: 100px;
}
</style>
</head>
<body>

<%
	List<?> list = (List<?>) request.getAttribute("list");
%>
    <h4>음식 목록</h4>
    <table>
        <tbody>
<%
	if( list != null ){
        for( Object dto : list ){
%>
            <tr>
                <td><%=((FoodDto) dto).getFoodSeq()%></td>
                <td><%=((FoodDto) dto).getFoodName()%></td>
                <td><%=((FoodDto) dto).getFoodPrice()%></td>
            </tr>
<%
        }
    }
%>

        </tbody>
    </table>
</body>
</html>