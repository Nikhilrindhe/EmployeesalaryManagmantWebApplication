package Employee.admin.controller;

import java.io.*;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Employee.admin.model.DepartmentModel;
import Employee.admin.service.*;

@WebServlet("/updatedep")
public class UpdateDepartment extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int id=Integer.parseInt(request.getParameter("id"));
		String name=request.getParameter("name");
		DepartmentModel dmodel=new DepartmentModel();
		dmodel.setDept_id(id);
		dmodel.setDept_name(name);
		DepartmentService dservice=new DepartmentServiceImpl();
		boolean b=dservice.isUpdateDepartment(dmodel);
		if(b)
		{
			RequestDispatcher rd=request.getRequestDispatcher("viewDepartment.jsp");
			rd.forward(request, response);
		}
		else {
			RequestDispatcher rd=request.getRequestDispatcher("viewDepartment.jsp");
			rd.forward(request, response);
		}
		
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		
		doGet(request, response);
	}

}
