<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<jsp:useBean id="beanDao" class="com.infinite.pay.EmployDAO"></jsp:useBean>

<form method="get" action="takeHome.jsp">

enter salary:
<input type="text" name="salary"/><br/>
<input type="submit" value="submit"><br/>
</form>

<c:if test="${param.salary != null}">
<c:set var = "emp" value="${beanDao.takeHome(param.salary)}"></c:set>
<c:out value="${emp}"></c:out>

</c:if>
</body>
</html>