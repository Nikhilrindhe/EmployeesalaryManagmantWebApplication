<%@page import="org.apache.commons.collections4.bag.SynchronizedSortedBag,Employee.admin.service.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.present
{
display:flex;
margin-top:100px;
  
}
 table
 {
 	margin:0 auto;
 	background:rgba(250,250,250,0.8);
 border:2px solid black;
 width:400px;
 height:100px;

justify-content:center;
  align-items:center;
 
 }
 table tr
 {
  border:2px solid black;
  text-align:center;
  align-item:center;
  padding:5px;
 }
</style>

</head>
<body>
<%@
 include file="employeeDashbord.jsp" 
 %>
 <%
 int count;
 int mid=Integer.parseInt(request.getParameter("mid"));
 int eid=Integer.parseInt(request.getParameter("eid"));
 String status=request.getParameter("status");
 if(status.equals("present"))
 {
	 AttendenceService aservice=new AttendenceServiceImpl();
	 count=aservice.getMonthPresentAttendense(eid,mid);
 }
 else
 {
	 AttendenceService aservice=new AttendenceServiceImpl();
	 count=aservice.getMonthAbsentAttendense(eid,mid);
 }
 
 System.out.println("presentcount is"+count);
  %>
<div class="present">

<table>

<tr>
<th>month</th>
<th>count</th>
</tr>
<tr>
<td><%= mid%></td>
<td><%= count %></td>
</tr>
</table>

</div>	
</body>
</html>