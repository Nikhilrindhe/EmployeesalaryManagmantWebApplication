<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin login</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet"/>
<link href="css/mainpage.css" rel="stylesheet">
<link href="css/login.css" rel="stylesheet">
<script src='jsFile/loginPageValidation.js'>

</script>
</head>
<body>
<%@include file="nav-bar.jsp" %>
<div class="row">
    <div class="col-md-12 Mainpage">
        <div class='container'>
            <div class='formemp'>
                <strong><h5 id="automatic"></h5></strong>
                <form name='frm' action='verifyadmin' method='POST'>
                    <label for='username'>Username</label>
                    <input type='text' name='username' placeholder='Enter username'>
                    <label for='pass'>Password</label>
                     <span id="pass"></span>
                    <input type='password' name='pass' value=""placeholder='Enter password' onkeyup="passwordValid(this.value)">
                   
                    <input type='submit' name='s' value='Submit'>
                </form>
            </div>
        </div>
    </div>
</div>
<%
String msg = (String)request.getAttribute("addMsg");
%>
<%
if(msg != null) {
%>
<script>
    function hidemessage() {
        var hideElement = document.getElementById("automatic");
        var originalText = hideElement.innerHTML;
        var typemessage = "<%= msg %>";
        hideElement.style.color="red";
        if(typemessage) {
            hideElement.innerHTML = typemessage;
            setTimeout(function() {
                hideElement.innerHTML = originalText;
               
            }, 6000); // Change 5000 to 5000 milliseconds (5 seconds)
        }
    }
    // Call hidemessage function when the DOM content is loaded
    document.addEventListener("DOMContentLoaded", function() {
        hidemessage();
    });
</script>
<%
}
%>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.min.js"></script>
</body>
</html>
