package Employee.admin.controller;

import java.io.*;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Employee.admin.service.*;

@WebServlet("/addDepartmentController")
public class addDepartmentController extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		response.setContentType("text/html");
		PrintWriter out=response.getWriter();
		String name=request.getParameter("name");
	DepartmentService dservice=new DepartmentServiceImpl();
	boolean b=dservice.isAddDepartment(name);
		if(b)
		{
		RequestDispatcher rd=request.getRequestDispatcher("viewDepartment.jsp");
		rd.forward(request, response);
		}
		else {
			out.println("Department not added !!");
			RequestDispatcher rd=request.getRequestDispatcher("viewDepartment.jsp");
			rd.forward(request, response);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		doGet(request, response);
	}

}
