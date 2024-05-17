<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--     <%@ page import="Employee.admin.service.*,java.util.*"%> --%>
     <%@page import="Employee.admin.service.*,java.util.*,Employee.admin.model.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
String searchValue=request.getParameter("s");

List<Object[]> list;
%>
<table class="table"style="color:white;">
  <thead>
    <tr>
      <th scope="col">Sr.no</th>
      <th scope="col">Name</th>
      <th scope="col">Surname</th>
      <th scope="col">Email</th>
      <th scope="col">Salary</th>
      <th scope="col">Department</th>
      <th scope="col">Delete</th>
      <th scope="col">Update</th>
      
    </tr>
  </thead>
  <tbody>
  <%
  EmployeeService eservice=new EmployeeServiceImpl();
  list=eservice.getAllSearchEmployee(searchValue);

	int count=0;
	for(Object obj[]:list)
	{
	%>
	<tr>
    <th scope="row"><%=++count%></th>
    <td><%=obj[0] %></td>
    <td><%= obj[1]%></td>
    <td><%= obj[2]%></td>
     <td><%= obj[3]%></td>
     <td><%= obj[4]%></td>
    <td><a href="del?empid=<%=obj[5]%>"><img src="img/delete.icon.png" alt="delete icon" width="30" height="30" class="rounded-circle"></a></td>
	  <td><a href='updateEmp.jsp?name=<%=obj[0]%>&surname=<%=obj[1]%>&email=<%= obj[2]%>&contact=<%=obj[6]%>&address=<%=obj[7]%>&sal=<%=(int)obj[3]%>&id=<%=(int)obj[5]%>'><img src="img/update_icon.png" alt="hugenerd" width="30" height="30" class="rounded-circle"></td>
		      
  </tr>
	<%	
	}

	%>
  
</tbody>
</table>
</body>
</html>