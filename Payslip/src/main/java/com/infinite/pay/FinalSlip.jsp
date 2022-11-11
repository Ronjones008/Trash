<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>PaySlip</title>
</head>
<body>

		<h1>PaySlip</h1>
		<form method="get" action="FinalSlip.jsp">
			Enter Empno :
			<input type="number" name="empno" /><br/><br/>
		    <input type="submit" value="Submit">
		</form>
		
		
		   <table>
		   <tr>
		      <th></th>
		      <th></th>
		   </tr> 
		   <tr>
		   <th><b>Employ No :</b>
		   &nbsp
		   <td></td>
		   <th><b>Employ Name :</b>
		   &nbsp
		   <td></td>
		   </tr>
		   </table>
		   <hr> 
		
		
		

</body>
</html>