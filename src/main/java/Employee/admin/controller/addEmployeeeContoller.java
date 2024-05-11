package Employee.admin.controller;

import java.io.*;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Employee.admin.model.EmployeeModel;
import Employee.admin.service.EmployeeService;
import Employee.admin.service.EmployeeServiceImpl;


@WebServlet("/addemployee")
public class addEmployeeeContoller extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		PrintWriter out=response.getWriter();
	String name=request.getParameter("name");
	String surname=request.getParameter("surname");
	String email=request.getParameter("email");
	String contact=request.getParameter("contact");
	String date=request.getParameter("join_date");
	String address=request.getParameter("address");
	int sal=Integer.parseInt(request.getParameter("salary"));
	//int dep_id=Integer.parseInt(request.getParameter("dept"));
	
	String depName=request.getParameter("dept");
//	out.println(name+"\t"+surname+"\t"+email+"\t"+contact+"\t"+date+"\t"+sal);
	EmployeeModel emodel=new EmployeeModel(name,surname,email,contact,date,address,sal);
	EmployeeService eservice=new EmployeeServiceImpl();
	int val=eservice.isAddEmployee(emodel, depName);
	if(val==1)
	{
		response.sendRedirect("viewEmployee.jsp");
		
	}
	else if(val==-1){
		
		out.println("Employee alredy present");
		response.sendRedirect("viewEmployee.jsp");
	}
	else {
		out.println("some prolem is there");
	}
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
