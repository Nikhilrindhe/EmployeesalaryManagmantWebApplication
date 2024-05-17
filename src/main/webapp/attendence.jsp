<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<%@page
	import="Employee.admin.service.*,java.util.*,Employee.admin.model.*,java.time.LocalDate"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
input.disabled {
	background-color: #f0f0f0; /* Change to your desired disabled style */
	color: #999; /* Change to your desired disabled style */
	cursor: not-allowed; /* Change to your desired disabled style */
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
	margin-top: 50px;
	color: blue;
}

.absent input[type="radio"] {
	background: red;
}

label a {
	text-decoration: none;
	color: #fff;
	font-weight: bold;
}
.marked{
color:blue;
font-weight: bold;
    font-style: italic;
}
</style>
<script type="text/javascript">
function hideMessage() {
    var messageElement = document.getElementById("message");

    if (messageElement) {
        setTimeout(function() {
            messageElement.style.display = "none";
            // Enable radio buttons
            enableRadioButtons();
        }, 1000); // 6000 milliseconds = 6 seconds
    }
}

window.onload = function() {
    hideMessage();
};

	function loadDoc() {
		var searchValue = document.getElementById("ser").value;
		var xhttp = new XMLHttpRequest();
		xhttp.onreadystatechange = function() {
			if (this.readyState == 4 && this.status == 200) {
				document.getElementById("contain").innerHTML = this.responseText;
			} else if (this.readyState == 4 && this.status == 404) {
				document.getElementById("contain").innerHTML = "File Not Found";
			}
		}
		xhttp.open('POST', "searchEmployeeForAttendance.jsp?s=" + searchValue,
				true);
		xhttp.send();
	}
</script>


<body>

	<%@include file="adminDashbord.jsp"%>
	<%!EmployeeService eservice = new EmployeeServiceImpl();%>
	<div class="text-center">
		<p id="message">${message}</p>

		<label>Search</label> <input type="search" name="search" id="ser"
			onkeyup="loadDoc()" placeHolder="Enter name" />
	</div>

	<div class='container' id="contain"
		style="display: flex; justify-content: center; align-items: center; margin-top: 10px;width: 80%;">
		<table class="table table-info">
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
				List<Object[]> list = eservice.getAllEmployee();
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
					
<%-- 						<a href="takeattendence?empid=<%=obj[5]%>&date=<%=LocalDate.now()%>&status=1" style="color: #fff; text-decoration: none;">
					<input type="radio" name="radioGroup" --%>
<%-- 						id="radioOption1<%=count%>" value="option1" name="status" --%>
<%-- 						for="option1<%=count%>"> Present</a> --%>
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
		
	</div>
	
	<script>
		window.onload = function() {
			// Add click event listener to each radio button
			var radioButtons = document.querySelectorAll('input[type="radio"]');
			radioButtons.forEach(function(radioButton) {
				radioButton.addEventListener('click', function() {
					var row = this.closest('tr'); // Get the closest row
					var radioButtonsInRow = row
							.querySelectorAll('input[type="radio"]'); // Get radio buttons in the row
					radioButtonsInRow.forEach(function(rb) {
						rb.disabled = true; // Disable all radio buttons in the row
					});
					this.disabled = false; // Enable the clicked radio button
					this.parentNode.classList.add('disabled-label'); // Add a class to style the disabled label (optional)

					// Disable radio buttons again after 24 hours
					setTimeout(function() {
						radioButtonsInRow.forEach(function(rb) {
							rb.disabled = false; // Enable all radio buttons in the row
						});
					}, 24 * 60 * 60 * 1000); // 24 hours in milliseconds
				});
			});
		};
	</script>

	
</body>
</html>