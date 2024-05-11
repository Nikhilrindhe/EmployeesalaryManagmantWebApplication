<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="Employee.admin.service.*,java.util.*,Employee.admin.model.*,java.time.LocalDate" %>
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
      <th scope="col">E.ID</th>
      <th scope="col">Name</th>
      <th scope="col">Surname</th>
      <th scope="col">Date</th>
      <th scope="col">Present</th>
      <th scope="col">Absent</th>
      
    </tr>
  </thead>
  <tbody>
 <%
  EmployeeService eservice=new EmployeeServiceImpl();
  list=eservice.getAllSearchEmployee(searchValue);
//   if(list!=null){
// 	  System.out.println("Data is present");
//   }
//   else{
// 	  System.out.println("Data is not present");
//   }
	int count=0;
	for(Object obj[]:list)
	{
	%>

<tr>
      <th scope="row"><%=++count%></th>
      <td><%=obj[5]%></td>
      <td><%=obj[0] %></td>
      <td><%= obj[1]%></td>
       <td> <%=LocalDate.now()%></td>  


		<td><input type="radio" class="btn-check" name="status" id="option1" autocomplete="off" checked>
		
		<label class="btn btn-primary" for="option1"><a href="takeattendence?empid=<%= obj[5]%>&date=<%= LocalDate.now()%>&status=<%= 1%>">Present</a></label></td>
		<td>
		
		<input type="radio" class="btn-check" name="status" id="option2" autocomplete="off" checked>
		<label class="btn btn-danger" for="option1"><a href="takeattendence?empid=<%= obj[5]%>&date=<%= LocalDate.now()%>&status=<%= 2%>">Absent</a></label></td>
    </tr>
    
  	<%	
   	}
  
   	%> 
    
  </tbody>
</table>
</body>
</html>