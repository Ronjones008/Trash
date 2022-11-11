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

<jsp:useBean id="beanDao" class="com.infinite.pay.EmployDAO" />

<form method="get" action="payslip.jsp">

 Enter Empno :
 <input type="number" name="empno" /><br/><br/>
 Enter Month ;
 <input type="number" name ="month" /><br/><br/>
 <input type="submit" value="submit" /><br/><br/>

</form>
<c:if test="${param.empno != null && param.month != null}">

<c:set var="id" value="${param.empno}" />
<c:set var="month" value="${param.month}" />
<c:out value="${beanDao.payslip(id,month)}"></c:out>
</c:if>
</body>
</html>