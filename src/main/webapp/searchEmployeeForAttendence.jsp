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
out.println(searchValue);
List<Object[]> list;
%>
<%!EmployeeService eservice = new EmployeeServiceImpl();%>

<table class="table table-info ">
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
				list = eservice.getAllSearchEmployee(searchValue);
				int count = 0;
				for (Object obj[] : list) {
				%>
				<tr>
					<th scope="row"><%=++count%></th>
					<td><%=obj[5]%></td>
					<td><%=obj[0]%></td>
					<td><%=obj[1]%></td>
					<td><%=LocalDate.now()%></td>
					<td>
					

		<label class="btn btn-primary" for="option1<%=count%>">				
<input type="radio"  name="radioGroup" id="radioOption1<%=count%>" value="option1" name="status"
						for="option1<%=count%>" checked">
		<a href="takeattendence?empid=<%=obj[5]%>&date=<%=LocalDate.now()%>&status=1" style="color: #fff; text-decoration: none;">present</a></label></td>
		
					
					
					<td> 
					<label class="btn btn-danger" for="option1<%=count%>">				
			<input type="radio"  name="radioGroup" id="radioOption1<%=count%>" value="option1" name="status"
						for="option1<%=count%>" checked">
		<a href="takeattendence?empid=<%=obj[5]%>&date=<%=LocalDate.now()%>&status=2" style="color: #fff; text-decoration: none;">Absent</a></label>

						</td>
						
				</tr>
				<%
				}
				%>
			</tbody>
			
		</table>
		
	<span class='marked'>${msg}
		</span>
		
</body>
</html>