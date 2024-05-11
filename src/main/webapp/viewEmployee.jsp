<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page
	import="Employee.admin.service.*,java.util.*,Employee.admin.model.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>View Employee</title>
<style>
button a {
	text-decoration: none;
	color: white;
	padding: 20px;
	font-weight: bold;
}

label {
	font-weight: 600;
	font-size: 18px;
	/*         margin-right: 10px; */
}

input[type='search'] {
	width: 200px;
	height: 20px;
	padding: 25px;
	background: white;
	border-radius: 10px;
	color: blue;
}

.operator {
	display: flex;
	flex-direction: row;
}

.operator .but {
	
}

.operator .serch {
	flex: 1;
}
</style>
<script type="text/javascript">
	function loadDoc() {
		var searchValue = document.getElementById("ser").value;
		console.log(searchValue);
		var xhttp = new XMLHttpRequest();
		xhttp.onreadystatechange = function() {
			if (this.readyState == 4 && this.status == 200) {
				document.getElementById("contain").innerHTML = this.responseText;
			} else if (this.readyState == 4 && this.status == 404) {
				document.getElementById("contain").innerHTML = "File Not Found";
			}
		}

		xhttp.open('POST', "searchEmployee.jsp?s=" + searchValue, true);
		xhttp.send();
	}
</script>
</head>
<body>
	<%@include file="adminDashbord.jsp"%>
	<%!EmployeeService eservice = new EmployeeServiceImpl();%>

	<div class="operator">
		<div class="text-left but">
			<button type="button" class="btn btn-primary mt-5 button">
				<a href='addEmployee.jsp'>Add</a>
			</button>
		</div>
		<div class="text-center serch">
			<label>Search</label> 
			<input type="search" name="search" class="mt-5"
				id="ser" onkeyup="loadDoc()" placeHolder="Enter name" />
		</div>
	</div>

	<div class='container' id="contain"
		style="display: flex; justify-content: center; align-items: center; margin-top: 10px; background-color: #808080; width: 80%;">
		<table class="table" style="color: white;">
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
				List<Object[]> list = eservice.getAllEmployee();
				System.out.println(list.toString());
				int count = 0;
				for (Object obj[] : list) {
				%>

				<tr>
					<th scope="row"><%=++count%></th>
					<td><%=obj[0]%></td>
					<td><%=obj[1]%></td>
					<td><%=obj[2]%></td>
					<td><%=obj[3]%></td>
					<td><%=obj[4]%></td>
					<td><a href="del?empid=<%=obj[5]%>"><img src="img/delete.icon.png" alt="delete icon" width="30" height="30" class="rounded-circle"></a></td>
					<td><a href='updateEmp.jsp?name=<%=obj[0]%>&surname=<%=obj[1]%>&email=<%=obj[2]%>&contact=<%=obj[6]%>&address=<%=obj[7]%>&sal=<%=(int) obj[3]%>&id=<%=(int) obj[5]%>'><img
						src="img/update_icon.png" alt="hugenerd" width="30" height="30" class="rounded-circle"></a></td>

				</tr>
				
				<%
				}
				%>

			</tbody>
		</table>
	</div>
</body>
</html>