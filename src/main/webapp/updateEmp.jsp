<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="css/addEmployee.css" rel="stylesheet"/>
</head>
<body>
<%
int eid,sal;
String name,surname,email,contact,address;

%>

<div class='container'>
    <div class='formemp'>
        <form name='frm' action='updemp' method='POST'>
        <%
        eid=Integer.parseInt(request.getParameter("id"));
        name=request.getParameter("name");
        surname=request.getParameter("surname");
        email=request.getParameter("email");
        contact=request.getParameter("contact");
        address=request.getParameter("address");
        sal=Integer.parseInt(request.getParameter("sal"));
        %>
         <div class='form-group'>
                <input type='hidden' name='id' value="<%=(int)eid%>">
            </div>
            <div class='form-group'>
                <label for='name'>Name</label>
                <input type='text' name='name' value="<%=name%>">
            </div>
            <div class='form-group'>
                <label for='surname'>Surname</label>
                <input type='text' name='surname' value="<%=surname%>">
            </div>
            <div class='form-group'>
                <label for='email'>Email</label>
                <input type='email' name='email' value="<%=email%>">
            </div>
            <div class='form-group'>
                <label for='contact'>Contact</label>
                <input type='number' name='contact' value="<%=contact%>">
            </div>
             <div class='form-group'>
                <label for='name'>Address</label>
                <input type='text' name='address' value="<%=address%>">
            </div>
            <div class='form-group'>
                <label for='salary'>Salary</label>
                <input type='number' name='salary' value="<%=sal%>">
            </div>           
            <input type='submit' name='s' value='Update'>
        </form>
    </div>
</div>

</body>
</html>