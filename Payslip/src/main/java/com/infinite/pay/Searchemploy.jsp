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

<jsp:useBean id="beanDao" class="com.infinite.pay.EmployDAO"/>

<form method="get" action="Searchemploy.jsp">
  Enter Empno :
  <input type="number" name="empno" /><br/><br/>
  <input type="submit" value="Search"/>
</form>
<c:if test="${param.empno != null}">
	<table border="3" align="center">
		<tr>
			<th>Empno</th>
			<th>Ename</th>
			<th>Gender</th>
			<th>Salary</th>
			<th>Hra</th>
			<th>Da</th>
			<th>Ta</th>
			<th>Tax</th>
			<th>pf</th>
			<th>Gross</th>
			<th>NetPay</th>
			<th>LeaveAvailable</th>
		</tr>
		
		<c:forEach var="employ" items="${beanDao.searchEmploy(param.empno)}">
		
			<tr>
			<td><c:out value="${employ.empno}" /></td>
			<td><c:out value="${employ.ename}" /></td>
			<td><c:out value="${employ.gender}" /></td>
			<td><c:out value="${employ.salary}" /></td>
			<td><c:out value="${employ.hra}" /></td>
			<td><c:out value="${employ.da}" /></td>
			<td><c:out value="${employ.ta}" /></td>
			<td><c:out value="${employ.tax}" /></td>
			<td><c:out value="${employ.pf}" /></td>
			<td><c:out value="${employ.gross}" /></td>
			<td><c:out value="${employ.netPay}" /></td>
			<td><c:out value="${employ.leaveAvailable}" /></td>
		
		</tr>
		
		
		</c:forEach>
	
	
	
	</table>
</c:if>
</body>
</html>