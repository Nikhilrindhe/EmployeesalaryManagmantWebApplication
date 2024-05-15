<%@page import="Employee.admin.service.*,Employee.admin.model.*,java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Employee Form</title>
<link href="css/addEmployee.css" rel="stylesheet"/>

<script type="text/javascript" src="jsFile/loginPageValidation.js"></script>
</head>

<body>
<%@include file="adminDashbord.jsp" %>
<%  DepartmentService dservice=new DepartmentServiceImpl();
%>
<div class='container'>
    <div class='formemp'>
        <form name='frm' action='addemployee' method='POST'>
            <div class='form-group'>
                <label for='name'>Name</label>
                <input type='text' name='name' placeholder='Enter name' required onkeyup="nameValid(this.value)">
                <span id="name"></span>
            </div>
            <div class='form-group'>
                <label for='surname'>Surname</label>
                <input type='text' name='surname' placeholder='Enter Surname' required onkeyup="surnameValid(this.value)">
                <span id="surname"></span>
            </div>
            <div class='form-group'>
            
                <label for='email'>Email</label>
                
                <input type='email' name='email' placeholder='Enter email' required onkeyup="emailValid(this.value)">
                 <span id="email"></span>
            </div>
            <div class='form-group'>
                <label for='contact'>Contact</label>
                <input type='number' name='contact' placeholder='Enter contact' required onkeyup="contactValid(this.value)">
                <span id="contact"></span>
            </div>
            <div class='form-group'>
                <label for='join_date'>Join Date</label>
                <input type='date' name='join_date' required>
            </div>
             <div class='form-group'>
                <label for='name'>Address</label>
                <input type='text' name='address' placeholder='Enter address' required>
            </div>
            <div class='form-group'>
                <label for='salary'>Salary</label>
                <input type='number' name='salary' placeholder='Enter employee salary' required onkeyup="salaryValid(this.value)">
                <span id="sal"></span>
            </div>
            <h5>Select Department</h5>
            <div class='form-group'>

			
            <%
            List<DepartmentModel>list=dservice.getallDepartment();
                	for(DepartmentModel model:list)
                	{
                		%>
              
                 <input type="radio" name="dept" value="<%=model.getDept_name() %>" required>
                <label for='dept'><%=model.getDept_name() %></label>
              
                  <%
                	}
            %>
            </div>
            <input type='submit' name='s' value='Submit'>
        </form>
    </div>
</div>

</body>
</html>
