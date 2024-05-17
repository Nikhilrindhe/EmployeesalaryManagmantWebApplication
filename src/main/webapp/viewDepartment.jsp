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
    background-color: rgba(250,250,250,0.8); margin-top:50px;width:70%;">
<table class="table border-primary"style="color;">
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
  		String modalId = "deleteModal" + count;
  	%>
  	<tr>
      <th scope="row"><%=++count%></th>
      <td><%=model.getDept_name()%></td>
     <td>
						<button type="button" class="btn btn-primary"
							data-bs-toggle="modal" data-bs-target="#<%=modalId%>">
							Delete</button>
						<div class="modal fade" id="<%=modalId%>"
							data-bs-backdrop="static" data-bs-keyboard="false"
							aria-labelledby="staticBackdropLabel" aria-hidden="true">
							<div class="modal-dialog">
								<div class="modal-content">
									<div class="modal-header">
										<h5 class="modal-title" id="staticBackdropLabel"
											style="color: #000;">
											Do you want to delete
											<%=model.getDept_name()%>
										</h5>
										<button type="button" class="btn-close"
											data-bs-dismiss="modal" aria-label="Close"></button>
									</div>
									<div class="modal-body" style="color: #000;">Confirm
										Deletion</div>
									<div class="modal-footer">
										<button type="button" class="btn btn-secondary"
											data-bs-dismiss="modal">No</button>
										<button type="button" class="btn btn-primary"
											onclick="location.href='deletedep?dep_id=<%= model.getDept_id()%>';">Yes</button>
									</div>
								</div>
							</div>
						</div>
					</td>
      
<%--       <td><a href="deletedep?dep_id=<%= model.getDept_id()%>"><img src="img/delete.icon.png" alt="delete icon" width="30" height="30" class="rounded-circle bg-denger"></a> --%>
<!--       </td> -->
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




