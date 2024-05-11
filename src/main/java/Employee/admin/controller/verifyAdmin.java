package Employee.admin.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Employee.admin.service.*;

@WebServlet("/verifyadmin")
public class verifyAdmin extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) 
	        throws ServletException, IOException {
	    response.setContentType("text/html");
	    String user = request.getParameter("username");
	    String pass = request.getParameter("pass");
	    AdminService aservice = new AdminServiceImpl();
	    boolean b = aservice.isVarifyAdmin(user, pass);
	    if (b) {
	        HttpSession session = request.getSession();
	        session.setAttribute("user", user);
	        response.sendRedirect("adminDashbord.jsp");
	    } else {
	        // Set the attribute before forwarding the request
	        request.setAttribute("addMsg", "Enter valid username and password");
	        RequestDispatcher rd = request.getRequestDispatcher("adminlogin.jsp");
	        rd.forward(request, response);
	    }
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
