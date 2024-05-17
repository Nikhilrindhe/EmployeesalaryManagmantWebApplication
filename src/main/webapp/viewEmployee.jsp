<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page
	import="Employee.admin.service.*,java.util.*,Employee.admin.model.*,java.sql.*,java.io.*,org.apache.poi.xssf.usermodel.*"%>
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
.download a{
text-decoration:none;
font-weight:bold;
 border:2px solid black;
 padding:10px;
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
			<label>Search</label> <input type="search" name="search" class="mt-5"
				id="ser" onkeyup="loadDoc()" placeHolder="Enter name" />
		</div>
	</div>

	<div class='container' id="contain"
		style="display: flex; justify-content: center; align-items: center; margin-top: 10px; background-color: rgba(250,250,250,0.8); width: 80%;margin-bottom:30px;">
		<table class="table border-primary" style="color: black;">
			<thead>
				<tr>
					<th scope="col">Sr.no</th>
					<th scope="col">Name</th>
					<th scope="col">Surname</th>
					<th scope="col">Email</th>
					<th scope="col">Salary</th>
					<th scope="col">Department</th>

					<!-- Button trigger modal -->

					<th scope="col">delete</th>
					<th scope="col">Update</th>

				</tr>
			</thead>
			<tbody>
				<%
				List<Object[]> list = eservice.getAllEmployee();
				System.out.println(list.toString());
				int count = 0;
				for (Object obj[] : list) {
					String modalId = "deleteModal" + count;
				%>

				<tr>
					<th scope="row"><%=++count%></th>
					<td><%=obj[0]%></td>
					<td><%=obj[1]%></td>
					<td><%=obj[2]%></td>
					<td><%=obj[3]%></td>
					<td><%=obj[4]%></td>
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
											<%=obj[0]%>
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
											onclick="location.href='del?empid=<%=obj[5]%>';">Yes</button>
									</div>
								</div>
							</div>
						</div>
					</td>
					<%-- 					<td><a href="del?empid=<%=obj[5]%>"><img src="img/delete.icon.png" alt="delete icon" width="30" height="30" class="rounded-circle"></a></td> --%>
					<td><a
						href='updateEmp.jsp?name=<%=obj[0]%>&surname=<%=obj[1]%>&email=<%=obj[2]%>&contact=<%=obj[6]%>&address=<%=obj[7]%>&sal=<%=(int) obj[3]%>&id=<%=(int) obj[5]%>'><img
							src="img/update_icon.png" alt="hugenerd" width="30" height="30"
							class="rounded-circle"></a></td>

				</tr>
				<!-- Modal -->


				<%
				}
				%>

			</tbody>
		</table>
	</div>
	
<!-- 	========================download all employee details======================================= -->
<%
Connection conn = null;
Statement stmt = null;
ResultSet rs = null;
try {
	// JDBC URL, username, and password for your database
	String jdbcUrl = "jdbc:mysql://localhost:3306/employeeproject";
	 username = "root";
	String password = "root";

	// Load the MySQL JDBC driver
	Class.forName("com.mysql.cj.jdbc.Driver");

	// Connect to the database
	conn = DriverManager.getConnection(jdbcUrl, username, password);

	// Execute a SQL query to fetch data from the database
	stmt = conn.createStatement();
	String sql = "SELECT * FROM employee";
	rs = stmt.executeQuery(sql);

	// Create a new Excel workbook
	XSSFWorkbook workbook = new XSSFWorkbook();
	XSSFSheet sheet = workbook.createSheet("Data");
	// Add column headers
	XSSFRow headerRow = sheet.createRow(0);
	ResultSetMetaData rsmd = rs.getMetaData();
	int numColumns = rsmd.getColumnCount();
	for (int i = 1; i <= numColumns; i++) {
		XSSFCell cell = headerRow.createCell(i - 1);
		cell.setCellValue(rsmd.getColumnName(i));
	}

	// Add data rows
	int rowNum = 1;
	while (rs.next()) {
		XSSFRow row = sheet.createRow(rowNum++);
		for (int i = 1; i <= numColumns; i++) {
	XSSFCell cell = row.createCell(i - 1);
	cell.setCellValue(rs.getString(i));
		}
	}
	
	

	// Write the workbook content to a file
	String filepath = "D:\\Giri tech hub notes\\project\\data.xlsx";
	FileOutputStream fileOut = new FileOutputStream(filepath);
	workbook.write(fileOut);
	fileOut.close();
	workbook.close();
	
	
%>
<%--  <div class="download">
    <a href="<%= filepath %>">Download Excel</a>
</div> --%>
<div class="download">
	<a href="<%=filepath%>"data-download="D:\\Giri tech hub notes\\project\\data.xlsx">Download File</a>
</div>

<%
} catch (Exception e) {
e.printStackTrace();
out.println("An error occurred: " + e.getMessage());


} finally {
// Close the result set, statement, and connection
if (rs != null) {
	try {
		rs.close();
	} catch (SQLException e) {
		/* ignored */ }
}
if (stmt != null) {
	try {
		stmt.close();
	} catch (SQLException e) {
		/* ignored */ }
}
if (conn != null) {
	try {
		conn.close();
	} catch (SQLException e) {
		/* ignored */ }
}
}
%>


</body>
</html>