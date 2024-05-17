package Employee.admin.controller;

import java.io.*;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Employee.admin.service.*;

@WebServlet("/takeattendence")
public class TakeAttendence extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		response.setContentType("text/html");
		PrintWriter out=response.getWriter();
		int eid=Integer.parseInt(request.getParameter("empid"));
		String date=request.getParameter("date");
		int status=Integer.parseInt(request.getParameter("status"));
		System.out.println(eid+"\t"+date+"\t"+status);		
		AttendenceService eservice=new AttendenceServiceImpl();
		int res=eservice.isTakeAttendence(eid, date, status);
		if(res==1)
		{
		request.setAttribute("msg","Mark Successfully");
		RequestDispatcher r=request.getRequestDispatcher("attendence.jsp");
		r.include(request, response);
			
		}
		else if(res==-1)
		{
			request.setAttribute("msg","Allready Marked");
			RequestDispatcher r=request.getRequestDispatcher("attendence.jsp");
			r.include(request, response);
		}
		else {
			out.println("some problem is there");
		}
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		
		
		doGet(request, response);
	}

}
