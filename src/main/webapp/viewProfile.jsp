<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="User.Service.*,Employee.admin.model.*" %>
    <%@ page session="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>

.main-div
{
display: flex;
  justify-content: center;  
/*  align-items: center; */
margin-top: 40px;
}
        @media only screen and (max-width: 600px) {
            .container {
                width: 100%;
            }
        }

        /* Rest of your existing CSS */
        /* Style the dropdown button */
        .dropdow {
           position: relative;
    display: inline-block;
    margin-left: 70px;

        }

        /* Style the dropdown content (hidden by default) */
        .dropdown-content {
            display: none;
            position: absolute;
            background-color: #f9f9f9;
            min-width: 100px;
            z-index: 1;
            max-height:100px;
            overflow-x: hidden; /* Hide horizontal scrollbar */
  overflow-y: scroll; /* Add vertical scrollbar */
        }

        /* Style the dropdown links */
        .dropdown-content a {
            color: black;
            padding: 4px 0px;
            text-decoration: none;
            display: block;
            text-align: center;
            
            
        }

        /* Change color of dropdown links on hover */
        .dropdown-content a:hover {
            background-color: #f1f1f1;
        }

        /* Show the dropdown menu on hover */
        .dropdow:hover .dropdown-content {
            display: block;
        }

        /* Set the dropdown content width to fit its content */
        .dropdown-content {
            width: fit-content;
        }

        .title {
            display: flex;
            justify-content: center;
            align-items: center;
            
        }
    </style>

</head>
<body>
<%@
 include file="employeeDashbord.jsp" 
 
 %>
 <div class="main-div">
 
 
 <div class="personal-detail">
 <div class="title">
 <h3>Personal Details</h3>
</div>
 <div class='container'
		style="display: flex; justify-content: center; align-items: center;background-color: rgba(250,250,250,0.8); width: 100%; border-radius:20px; padding:10px;">
		
		<table class="table border-primary" style="color: black;">
		
			<tbody>
				<%
				int eid=Integer.parseInt(session.getAttribute("eid").toString());
				UserService uservice=new UserServiceImpl();
				EmployeeModel em = uservice.viewProfile(eid);
			
				if(em!=null)
				{
					%>
					<tr>
					<th scope="col">Name :</th>
					<td><%=em.getName()%></td>
					</tr>
					
					<tr>
					<th scope="col">Surname :</th>
					<td><%=em.getSurname()%></td>
					</tr>
					
					<tr>
					<th scope="col">Email :</th>
					<td><%=em.getEmail()%></td>
					</tr>
					
					<tr>
					<th scope="col">Contact :</th>
					<td><%=em.getContact()%></td>
					</tr>
					
					<tr>
					<th scope="col">JoinDate :</th>
					<td><%=em.getDate()%></td>
					</tr>
					
					<tr>
						<th scope="col">Salary :</th>
					<td><%= em.getSal()%></td>
					</tr>
					
					<tr>
					<th scope="col">Address :</th>
					<td><%= em.getAddress()%></td>		
				</tr>
				
				<% 
				}
				%>
			</tbody>
		</table>
	</div>
	</div>
<!-- 	============================================================================================================ -->
<div class="dropdow">
	<p style="color:white;background:black;">Select Month for see presenty</p>
    <button class="dropbtn" style="padding:10px;">Select Month</button>
    <div class="dropdown-content">
        <a href="viewAttendence.jsp?mid=<%=1%>&eid=<%=eid%>&status=<%= "status"%>">January</a>
        
        <a href="viewAttendence.jsp?mid=<%=2%>&eid=<%=eid%>&status=<%= "present"%>">February</a>
        <a href="viewAttendence.jsp?mid=<%=3%>&eid=<%=eid%>&status=<%= "present"%>">March</a>
        <a href="viewAttendence.jsp?mid=<%=4%>&eid=<%=eid%>&status=<%= "present"%>">April</a>
        <a href="viewAttendence.jsp?mid=<%=5%>&eid=<%=eid%>&status=<%= "present"%>">May</a>
        <a href="viewAttendence.jsp?mid=<%=6%>&eid=<%=eid%>&status=<%= "present"%>">June</a>
        <a href="viewAttendence.jsp?mid=<%=7%>&eid=<%=eid%>&status=<%= "present"%>">July</a>
        <a href="viewAttendence.jsp?mid=<%=8%>&eid=<%=eid%>&status=<%= "present"%>">August</a>
        <a href="viewAttendence.jsp?mid=<%=9%>&eid=<%=eid%>&status=<%= "present"%>">September</a>
        <a href="viewAttendence.jsp?mid=<%=10%>&eid=<%=eid%>&status=<%= "present"%>">October</a>
        <a href="viewAttendence.jsp?mid=<%=11%>&eid=<%=eid%>&status=<%= "present"%>">November</a>
        <a href="viewAttendence.jsp?mid=<%=12%>&eid=<%=eid%>&status=<%= "present"%>">December</a>
    </div>
</div>

<!-- =========================================================================================== -->
<div class="dropdow">
	<p style="color:white;background:black;">Select Month for see Absenty</p>
    <button class="dropbtn" style="padding:10px;">Select Month</button>
    <div class="dropdown-content">
        <a href="viewAttendence.jsp?mid=<%=1%>&eid=<%=eid%>&status=<%= "absent"%>">January</a>
        
        <a href="viewAttendence.jsp?mid=<%=2%>&eid=<%=eid%>&status=<%= "absent"%>">February</a>
        <a href="viewAttendence.jsp?mid=<%=3%>&eid=<%=eid%>&status=<%= "absent"%>">March</a>
        <a href="viewAttendence.jsp?mid=<%=4%>&eid=<%=eid%>&status=<%= "absent"%>">April</a>
        <a href="viewAttendence.jsp?mid=<%=5%>&eid=<%=eid%>&status=<%= "absent"%>">May</a>
        <a href="viewAttendence.jsp?mid=<%=6%>&eid=<%=eid%>&status=<%= "absent"%>">June</a>
        <a href="viewAttendence.jsp?mid=<%=7%>&eid=<%=eid%>&status=<%= "absent"%>">July</a>
        <a href="viewAttendence.jsp?mid=<%=8%>&eid=<%=eid%>&status=<%= "absent"%>">August</a>
        <a href="viewAttendence.jsp?mid=<%=9%>&eid=<%=eid%>&status=<%= "absent"%>">September</a>
        <a href="viewAttendence.jsp?mid=<%=10%>&eid=<%=eid%>&status=<%= "absent"%>">October</a>
        <a href="viewAttendence.jsp?mid=<%=11%>&eid=<%=eid%>&status=<%= "absent"%>">November</a>
        <a href="viewAttendence.jsp?mid=<%=12%>&eid=<%=eid%>&status=<%= "absent"%>">December</a>
    </div>
</div>
	</div>
</body>
</html>