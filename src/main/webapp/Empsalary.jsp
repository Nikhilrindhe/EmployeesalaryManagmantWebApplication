<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@page import="Employee.admin.service.*,java.util.*,Employee.admin.model.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	h4,h6
	{
		text-align:center;
	}
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f2f2f2;
        }

        #container {
            max-width: 600px;
            margin: 20px auto;
            padding: 10px;
            background-color: #fff;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        h1 {
            text-align: center;
            margin-bottom: 20px;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 20px;
        }

        table, th, td {
            border: 1px solid #ddd;
        }

        th, td {
            padding: 10px;
            text-align: left;
        }

        input[type="text"], select, input[type="button"] {
            width: 100%;
            padding: 8px;
            margin-top: 5px;
/*             margin-bottom: 10px; */
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box;
        }

        input[type="button"] {
            background-color: #4CAF50;
            color: white;
            border: none;
            cursor: pointer;
        }

        input[type="button"]:hover {
            background-color: #45a049;
        }
        
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

input[type='search'],[type='month'],[type='number']{
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
.operator .serch {
	flex: 1;
}

</style>
<script type="text/javascript">
    function loadDoc() {
        var searchValue = document.getElementById("ser").value;
        var monthValue = document.getElementById("month").value;

        console.log("Search Value: " + searchValue);
        console.log("Month Value: " + monthValue);

        var xhttp = new XMLHttpRequest();
        xhttp.onreadystatechange = function() {
            if (this.readyState == 4 && this.status == 200) {
                document.getElementById("contain").innerHTML = this.responseText;
            } else if (this.readyState == 4 && this.status == 404) {
                document.getElementById("contain").innerHTML = "File Not Found";
            }
        }

        var params = 's=' + encodeURIComponent(searchValue) + '&m=' + encodeURIComponent(monthValue);

        xhttp.open('GET', "searchbyemail.jsp?" + params, true);
        xhttp.send();
    }
</script>
</head>
<body>
<%@include file="adminDashbord.jsp"%>
	<%!EmployeeService eservice = new EmployeeServiceImpl();%>

	<div class="operator">
		<div class="text-center serch">
			<label>month</label> 
			<input type="month" name="month" class="mt-2"
				id="month"/>
		</div>
		
		<div class="text-center serch">
			<label>Search</label> 
			<input type="search" name="search" class="mt-2"
				id="ser" onkeyup="loadDoc()" placeHolder="Enter Email" />
		</div>
	</div>

	<div id="container">
	<div id="contain">       
	<h4>MyVentures pvt.ltd</h4>
        <h6>PAY SLIP</h6>
        <form name="pay" id="pay">
            <table>
                 <tr>
                    <td>Name</td>
                    <td><input type='text'></td>
                    
                    <td>Employee Code</td>
                   <td><input type='text'></td>
                </tr>
                 <tr>
                    <td>Basic</td>
                    <td><input type='text'></td>
                    
                    <td>Department</td>
                  <td><input type='text'></td>
                </tr>
                <tr>
                    <td>Dearness Allowance</td>
                    <td><input type="text" id="empDA" disabled/></td>
                    <td>Provident Fund</td>
                    <td><input type="text" id="empPF" disabled/></td>
                </tr>
                <tr>
                    <td>House Rent Allowance</td>
                    <td><input type="text" id="empHRA" disabled/></td>
                    <td>Professional Tax</td>
                    <td><input type="text" id="empPT" disabled/></td>
                </tr>
                <tr>
                    <td>Gross Salary</td>
                    <td><input type="text" id="empGS" disabled/></td>
                    <td>Aggregate Deduction</td>
                    <td><input type="text" id="empAD" disabled/></td>
                </tr>
                <tr>
                    <td>Net Salary</td>
                    <td colspan="3"><input type="text" id="empNS" disabled/></td>
                </tr>
                <tr>
                    <td colspan="4" align="center">
                        <input type="button" id="empCompute" value="Compute Pay" onclick="calcPay();" >
                    </td>
                </tr>
            </table>
        </form>
        </div>
        
    </div>
</body>
</html>