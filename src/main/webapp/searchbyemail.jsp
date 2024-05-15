<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="Employee.admin.service.*,java.util.*,Employee.admin.model.*"  %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
String searchValue = request.getParameter("s");
String monthValue = request.getParameter("m");
System.out.println("Search value is: " + searchValue);
System.out.println("Month is: " + monthValue);
List<Object[]> list;

SalaryService sservice=new SalaryServiceImpl();
list=sservice.empSerchByEmail(searchValue,monthValue);
	%>
	
	

        <h1>Payslip</h1>
        <form name="pay" id="pay">
            <table>
            <% 
            for(Object obj[]:list)
        	{
        		%>
                <tr>
                    <td>Name</td>
                    <td><%=obj[0] %></td>
                    
                    <td>Employee Code</td>
                    <td><%= obj[5]%></td>
                </tr>
                 <tr>
                    <td>Basic</td>
                    <td><%=obj[3] %></td>
                    
                    <td>Department</td>
                    <td><%= obj[4]%></td>
                </tr>
                  		
   <%
				}

			%>	
                
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
                    <td colspan="3"><input type="text" id="empGS" disabled/></td>
                </tr>
                <tr>
                    <td>Aggregate Deduction</td>
                    <td colspan="3"><input type="text" id="empAD" disabled/></td>
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
  

<!--     <script> 
//         function calcPay()
//         {
//             var Basic = parseInt(document.getElementById('empBasic').value);
//             var DA = Basic * .1;
//             var HRA = Basic * .05;
//             var PF = Basic * .12;
//             var PT;
//             if (Basic >= 20000)
//             {
//                 PT = 1800;
//             }
//             else
//             {
//                 PT = 1200;
//             }
//             var GS = Basic + DA + HRA;
//             var AD = PF + PT;
//             document.getElementById('empDA').value = DA;
//             document.getElementById('empHRA').value = HRA;
//             document.getElementById('empPF').value = PF;
//             document.getElementById('empPT').value = PT;
//             document.getElementById('empGS').value = GS; 
//             document.getElementById('empAD').value = AD;
//             document.getElementById('empNS').value = GS - AD;   
//         }
    </script> -->

</body>
</html>