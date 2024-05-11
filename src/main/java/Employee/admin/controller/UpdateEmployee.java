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

@WebServlet("/updemp")
public class UpdateEmployee extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
throws ServletException, IOException {
		response.setContentType("text/html");
		PrintWriter out=response.getWriter();
		
		int eid=Integer.parseInt(request.getParameter("id"));
	      String  name=request.getParameter("name");
	      String surname=request.getParameter("surname");
	      String email=request.getParameter("email");
	      String contact=request.getParameter("contact");
	      String address=request.getParameter("address");
	        
	       int sal=Integer.parseInt(request.getParameter("salary"));
		EmployeeModel emodel=new EmployeeModel();
		emodel.setId(eid);
		emodel.setName(name);
		emodel.setSurname(surname);
		emodel.setEmail(email);
		emodel.setContact(contact);
		emodel.setAddress(address);
		emodel.setSal(sal);
		EmployeeService eservice=new EmployeeServiceImpl();
		boolean b=eservice.isUpdateEmp(emodel);
		if(b) {
			RequestDispatcher rd=request.getRequestDispatcher("viewEmployee.jsp");
			rd.forward(request, response);
		}
		else
		{
			RequestDispatcher rd=request.getRequestDispatcher("viewEmployee.jsp");
			rd.include(request, response);
		}
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
