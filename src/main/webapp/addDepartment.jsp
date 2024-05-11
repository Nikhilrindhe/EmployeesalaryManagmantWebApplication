<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/addEmployee.css">
</head>
<body>
<%@include file="adminDashbord.jsp" %>

  <div class='container'>
        <div class='formemp'>
            <form name='frm' action='addDepartmentController' method='POST'>
            <div class='form-group'>
                <label for='name'>Name</label>
                <input type='text' name='name' placeholder='Enter department name'required>
                 </div>
                
                <input type='submit' name='s' value='submit'>
            </form>
        </div>
    </div>
    
<!--   ---------------------------------------------- -->
   </div>
  </div>  
    </div>       
</body>
</html>