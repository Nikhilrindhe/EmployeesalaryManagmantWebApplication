<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="User.Service.*,Employee.admin.model.*" %>
    <%@ page session="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@
 include file="employeeDashbord.jsp" 
 %>
 <div class='container' id="contain"
		style="display: flex; justify-content: center; align-items: center; margin-top: 70px; background-color: #808080; width: 80%;">
		<table class="table" style="color: white;">
			<thead>
				<tr>
					<th scope="col">Sr.no</th>
					<th scope="col">Name</th>
					<th scope="col">Surname</th>
					<th scope="col">Email</th>
					<th scope="col">Contact</th>
					<th scope="col">JoinDate</th>
					<th scope="col">Salary</th>
					<th scope="col">Address</th>
					<th scope="col">Update</th>

				</tr>
			</thead>
			<tbody>
				<%
				int eid=Integer.parseInt(session.getAttribute("eid").toString());
				UserService uservice=new UserServiceImpl();
				EmployeeModel em = uservice.viewProfile(eid);
				int count=0;
				if(em!=null)
				{
					%>
					<tr>
					<th scope="row"><%=++count%></th>
					<td><%=em.getName()%></td>
					<td><%=em.getSurname()%></td>
					<td><%=em.getEmail()%></td>
					<td><%=em.getContact()%></td>
					<td><%=em.getDate()%></td>
					<td><%= em.getSal()%></td>
					<td><%= em.getAddress()%>
					
					<td><ahref='updateEmp.jsp?name=<%=em.getName()%>></a><img
						src="img/update_icon.png" alt="hugenerd" width="30" height="30"
						class="rounded-circle"></td>
					
				</tr>
				
				<% 
				}
				%>

				
				

			</tbody>
		</table>
	</div>

</body>
</html>