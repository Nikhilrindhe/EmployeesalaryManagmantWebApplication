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
<%
int dep_id=Integer.parseInt(request.getParameter("dep_id"));
String dep_name=request.getParameter("dep_name");
%>
<%@include file="adminDashbord.jsp" %>

  <div class='container'>
        <div class='formemp'>
            <form name='frm' action='updatedep' method='POST'>
            <input type="hidden" name="id" value="<%= dep_id%>" />
            <div class='form-group'>
                <label for='name'>Name</label>
                <input type='text' name='name' value="<%=dep_name%>">
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