<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
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

<form method="get" action="ApplyLeave.jsp">
	<center>
	
	 Enter Empno :
	 <input type="number" name="empno"><br/><br/>
	 Enter LeaveStartDate :
	 <input type="date" name="leaveStartDate"><br/><br/>
	 Enter LeaveEndDate :
	 <input type="date" name="leaveEndDate"><br/><br/>
	 Enter Leave Reason :
	 <input type="text" name="leaveReason"><br/><br/>
	 
	 <input type="submit" value="Apply"><br/><br/>
	</center>
</form>

<c:if test="${param.leaveReason != null}">

<c:if test="${param.leaveReason != null}">
	<jsp:useBean id="leaveTable" class="com.infinite.pay.LeaveTable" />
	<jsp:setProperty property="empno" name="leaveTable"/>
	
	
	<fmt:parseDate value="${param.leaveStartDate}" pattern="yyyy-MM-dd" var="cdate1"/>
		<c:set var="sqlDate1" value="${beanDao.convertDate(cdate1)}"/>
		
		<fmt:parseDate value="${param.leaveEndDate}" pattern="yyyy-MM-dd" var="cdate2"/>
		<c:set var="sqlDate2" value="${beanDao.convertDate(cdate2)}"/>
		
	<jsp:setProperty property="leaveStartDate" name="leaveTable" value="${sqlDate1}"/>	
	<jsp:setProperty property="leaveEndDate" name="leaveTable" value="${sqlDate2}"/>	
		
		<jsp:setProperty property="leaveReason" name="leaveTable"/>
	
	<c:out value="${beanDao.applyLeave(leaveTable)}"></c:out>
	</c:if>
</c:if>
</body>
</html>