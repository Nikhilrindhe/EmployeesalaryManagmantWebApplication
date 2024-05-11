<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="Employee.admin.service.*,java.util.*,Employee.admin.model.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>View Department</title>
<style>
	
	button a
	{
		text-decoration:none;
		color:white;
		padding:20px;
		font-weight: bold;
	}
</style>
</head>
<body>
<%@include file="adminDashbord.jsp" %>
<%!DepartmentService dservice=new DepartmentServiceImpl(); %>
<div class="text-left">
    <button type="button" class="btn btn-primary mt-5 button"><a href='addDepartment.jsp'>Add</a></button>
    
</div>

		
 <div class='container'style="display: flex;
    justify-content: center;
    align-items: center;
    background-color:#808080 ;margin-top:50px;width:70%;">
<table class="table"style="color:white;">
  <thead>
    <tr>
      <th scope="col">Sr.no</th>
      <th scope="col">Department</th>
      <th scope="col">Delete</th>
      <th scope="col">Update</th>
      
    </tr>
  </thead>
  <tbody>
  <%
  	List<DepartmentModel>list=dservice.getallDepartment();
  	int count=0;
  	for(DepartmentModel model:list)
  	{
  	%>
  	<tr>
      <th scope="row"><%=++count%></th>
      <td><%=model.getDept_name()%></td>
      <td><a href="deletedep?dep_id=<%= model.getDept_id()%>"><img src="img/delete.icon.png" alt="delete icon" width="30" height="30" class="rounded-circle bg-denger"></a>
      </td>
      <td><a href="updateDep.jsp?dep_id=<%= model.getDept_id()%>&dep_name=<%= model.getDept_name()%>"><img src="img/update_icon.png" alt="update icon" width="30" height="30" class="round-circle"></a></td>
    </tr>
  	<%	
  	}
  
  	%>

  </tbody>
</table>
</div>

</body>
</html>




