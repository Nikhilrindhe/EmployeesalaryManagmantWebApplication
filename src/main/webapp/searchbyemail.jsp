<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="Employee.admin.service.*,java.util.*,Employee.admin.model.*"  %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Salary Slip</title>
<style>
	h4,h6
	{
		text-align:center;
	}
</style>
<script>
function downloadReceipt()
{
	var printContents=document.getElementById("print").innerHTML;
	
	var originalContents=document.body.innerHTML;
	document.body.innerHTML=printContents;
	window.print();
	document.body.innerHTML=originalContents;
}
</script>
</head>
<body>

<%
String searchValue = request.getParameter("s");
String monthValue = request.getParameter("m");
// System.out.println("Search value is: " + searchValue);
// System.out.println("Month is: " + monthValue);

SalaryService sservice=new SalaryServiceImpl();
List<EmployeSalaryModel> list=sservice.empSerchByEmail(searchValue,monthValue);
	%>
	
	<div id="print">

        <h4>MyVentures pvt.ltd</h4>
        <h6>PAY SLIP</h6>
        <form name="pay" id="pay">
            <table>
            <% 
            for(EmployeSalaryModel li:list)
        	{
        		%>
                <tr>
                    <td>Name</td>
                    <td><input type='text' value='<%=li.getName()%>'></td>
                    
                    <td>Employee Code</td>
                    <td><input type='text' value='<%= li.getId()%>'></td>
                </tr>
                 <tr>
                    <td>Basic</td>
                    <td><input type='text'value='<%=li.getBasicSalary() %>'></td>
                    
                    <td>Department</td>
                    <td><input type='text' value='<%= li.getDeptName()%>'></td>
                </tr>
                
                <tr>
                    <td>Dearness Allowance</td>
                    <td><input type='text' value='<%= li.getDa()%>'></td>
                    <td>Provident Fund</td>
                    <td><input type='text' value='<%= li.getPf() %>'></td>
                </tr>
                
                
              
                <tr>
                    <td>House Rent Allowance</td>
                    <td><input type='text' value='<%= li.getHra()%>'></td>
                    <td>Professional Tax</td>
                    <td><input type='text' value='<%= li.getPt()%>'></td>
                </tr>
                <tr>
                    <td>Gross Salary</td>
                    <td><input type='text' value='<%= li.getGs()%>'></td>
                    <td>Aggregate Deduction</td>
                    <td><input type='text' value='<%=li.getAd() %>'></td>
                </tr>
                <tr>
                    <td>Net Salary</td>
                    <td colspan="3"><input type='text' value='<%= li.getNetSalary()%>'></td>
                </tr>
                <tr>
                 <%
				}

			%>	
   
                    <td colspan="4" align="center">
                        <input type="button"  value="Download" onclick="downloadReceipt();" >
                    </td>
                </tr>
               
            </table>
        </form>
  
</div>


</body>
</html>