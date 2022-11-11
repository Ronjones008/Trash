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

<form method="get" action="SearchLeave.jsp">
Enter Empno :
<input type="text" name="empno"/><br/><br/>
<input type="submit" value="search"/>


</form>
<c:if test="${param.empno != null}">
	<table border="3" align="center">
		<tr>
			<th>LeaveId</th>
			<th>Empno</th>
			<th>LeaveStartDate</th>
			<th>LeaveEndDate</th>
			<th>NoOfDays</th>
			<th>LeaveReason</th>
			<th>LossOfPay</th>
		</tr>
	<c:forEach var="leave" items="${beanDao.searchLeave(param.empno)}">
	<tr>
	<td><c:out value="${leave.leaveId}"/></td>
	<td><c:out value="${leave.empno}"/></td>
	<td><c:out value="${leave.leaveStartDate}"/></td>
	<td><c:out value="${leave.leaveEndDate}"/></td>
	<td><c:out value="${leave.noOfDays}"/></td>
	<td><c:out value="${leave.leaveReason}"/></td>
	<td><c:out value="${leave.lossOfPay}"/></td>
	
	</tr>
	
	
	</c:forEach>
	
	</table>
	
</c:if>
</body>
</html>