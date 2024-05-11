<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="Employee.admin.service.*,java.util.*,Employee.admin.model.*,java.time.LocalDate" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
label {
        font-weight: 600;
        font-size: 18px;
/*         margin-right: 10px; */
    }
input[type='search']
{
width: 200px;
 height: 20px; padding: 25px;
  background: white; 
  border-radius:10px;
  margin-top:50px;
  color:blue;
}
.absent input[type="radio"]
{
background:red;
}
label a{
text-decoration: none;
color:#fff;
font-weight: bold;

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

		xhttp.open('POST', "searchEmployeeForAttendence.jsp?s=" + searchValue, true);
		xhttp.send();
	}
</script>
<body>

<%@include file="adminDashbord.jsp" %>
<%!EmployeeService eservice=new EmployeeServiceImpl(); %>
<div class="text-center">
	<label>Search</label>
	<input type="search" name="search" id="ser" onkeyup="loadDoc()" placeHolder="Enter name"/>
	</div>

 <div class='container'id="contain" style="display: flex;
    justify-content: center;
    align-items: center;margin-top:10px;
    background-color:#808080 ;width:70%;">
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
  	
   List<Object[]>list=eservice.getAllEmployee(); 
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
</div>
</body>
</html>