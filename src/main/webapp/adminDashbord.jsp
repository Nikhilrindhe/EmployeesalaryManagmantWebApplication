<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="javax.servlet.http.*"%>
	<%
// Check if the session exists and contains the user attribute
HttpSession existingSession = request.getSession(false);
if(existingSession == null || existingSession.getAttribute("user") == null) {
    // If session or user attribute does not exist, redirect to login page
    response.sendRedirect("adminlogin.jsp");
    return;
}
// If user is logged in, retrieve the username from the session
String username = (String) existingSession.getAttribute("user");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<style>
* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
}

.container-fluid {
	width: 100%; /
	height: 100vh;
	/
}
/* .part1{
    background: linear-gradient(to top,rgb(231, 49, 146),purple);
    
} */
.menu {
	align-items: center;
	color: white;
	min-height: 100vh;
}

.menu h3 {
	margin-top: 20px;
}

.nav {
	align-items: center;
	font-size: 20px;
	margin-top: 10px;
}

.content-area {
	background-image:
		url(https://images.unsplash.com/photo-1501159771943-cc9027db4d8b?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D);
	background-repeat: no-repeat;
	background-position: center;
	overflow-x: hidden;
	min-height: 100vh;
	background-size: cover;
}
</style>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
	crossorigin="anonymous"></script>
<link href="CSS/admindash.css" rel="stylesheet">
</head>
<body>
	<div class="container-fluid">
		<div class="row flex-nowrap">
			<div class="col-auto col-md-5 col-xl-2 px-sm-2 px-0"
				style="background: linear-gradient(to top, rgb(231, 49, 146), black);">

				<div
					class="menu d-flex flex-column  align-items-sm-start px-3 pt-2 ">

					<center>
						<span><h3>Menu</h3></span>
					</center>

					<ul
						class="nav nav-pills flex-column mb-sm-auto mb-0 align-items-sm-start mt-4"
						id="menu">

						<li><a href="#submenu1" data-bs-toggle="collapse"
							class="nav-link px-0 align-middle"> <i class="fs-4 bi-grid"></i>
								<span class="ms-1 d-none d-sm-inline">Department</span>
						</a>
							<ul class="collapse nav flex-column ms-1" id="submenu1"
								data-bs-parent="#menu">
								<li class="w-100"><a href="addDepartment.jsp"
									class="nav-link px-0"> <span
										class="d-none d-sm-inline text-white">Add department</span></a></li>
								<li class="w-100"><a href="viewDepartment.jsp" class="nav-link px-0">
								 <span class="d-none d-sm-inline text-white">View department</span></a></li>

							</ul></li>

						<li><a href="#submenu2" data-bs-toggle="collapse"
							class="nav-link px-0 align-middle"> <i class="fs-4 bi-grid"></i>
								<span class="ms-1 d-none d-sm-inline texr-white">About
									Employee</span>
						</a>
							<ul class="collapse nav flex-column ms-1" id="submenu2"
								data-bs-parent="#menu">
								<li class="w-100"><a href="addEmployee.jsp"
									class="nav-link px-0"> <span
										class="d-none d-sm-inline text-white">Add Employee</span></a></li>
								<li class="w-100"><a href="viewEmployee.jsp"
									class="nav-link px-0"> <span
										class="d-none d-sm-inline text-white">View Employee</span></a></li>
										<li class="w-100"><a href="attendence.jsp"
									class="nav-link px-0"> <span
										class="d-none d-sm-inline text-white">Track Attendence</span></a></li>
										
										<li class="w-100"><a href="Empsalary.jsp"
									class="nav-link px-0"> <span
										class="d-none d-sm-inline text-white">Salary</span></a></li>
										
							</ul></li>
						

						<!--                     <a href="#submenu4" data-bs-toggle="collapse" class="nav-link px-0 align-middle"> -->

						<!--                         <i class="fs-4 bi-grid"></i> <span class="ms-1 d-none d-sm-inline texr-white">Student Information</span> </a> -->
						<!--                         <ul class="collapse nav flex-column ms-1" id="submenu4" data-bs-parent="#menu"> -->
						<!--                         <li class="w-100"> -->
						<!--                             <a href="#" class="nav-link px-0"> <span class="d-none d-sm-inline text-white">Add Student</span></a> -->
						<!--                         </li> -->
						<!--                         <li class="w-100"> -->
						<!--                             <a href="#" class="nav-link px-0"> <span class="d-none d-sm-inline text-white">View Student</span></a> -->
						<!--                         </li> -->
						<!--                         <li class="w-100"> -->
						<!--                             <a href="#" class="nav-link px-0"> <span class="d-none d-sm-inline text-white">Check Status</span></a> -->
						<!--                         </li> -->
						<!--                     </ul> -->
						<!-- </li>
                            <a href="#submenu2" data-bs-toggle="collapse" class="nav-link px-0 align-middle ">
                                <i class="fs-4 bi-bootstrap"></i> <span class="ms-1 d-none d-sm-inline">Bootstrap</span></a>
                            <ul class="collapse nav flex-column ms-1" id="submenu2" data-bs-parent="#menu">
                                <li class="w-100">
                                    <a href="#" class="nav-link px-0"> <span class="d-none d-sm-inline">Item</span> 1</a>
                                </li>
                                <li>
                                    <a href="#" class="nav-link px-0"> <span class="d-none d-sm-inline">Item</span> 2</a>
                                </li>
                            </ul>
                        </li>-->

					</ul>
					<div class="dropdown pb-4">
						<a href="#"
							class="d-flex align-items-center text-white text-decoration-none dropdown-toggle"
							id="dropdownUser1" data-bs-toggle="dropdown"
							aria-expanded="false"> <img src="https://images.unsplash.com/photo-1501159771943-cc9027db4d8b?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"
							alt="hugenerd" width="30" height="30" class="rounded-circle">
					
							<span class="d-none d-sm-inline mx-1"><%=username%></span>
						</a>
						<ul class="dropdown-menu dropdown-menu-dark text-small shadow">
							<!--			<li><a class="dropdown-item" href="#">New project...</a></li> -->
							<!-- 			<li><a class="dropdown-item" href="#">Settings</a></li> -->
							<!-- 			<li><a class="dropdown-item" href="#">Profile</a></li> -->
							<li>
								<hr class="dropdown-divider">
							</li>
							<li><a class="dropdown-item" href="logout.jsp">Sign out</a></li>
						</ul>
					</div>

				</div>
			</div>
			<div class="col py-3 col-sm-10 col-xl-10 content-area">
</body>
</html>