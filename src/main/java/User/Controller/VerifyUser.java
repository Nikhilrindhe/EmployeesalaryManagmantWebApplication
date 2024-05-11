package User.Controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import User.Service.*;


@WebServlet("/VerifyUser")
public class VerifyUser extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		response.setContentType("text/html");
		PrintWriter out=response.getWriter();
	    String user = request.getParameter("username");
	    String pass = request.getParameter("pass");
	    UserService uservice = new UserServiceImpl();
	    int eid = uservice.isVerifyEmployee(user, pass);
	    out.println("employee id is"+eid);
	    if (eid>0) {
	    	
	        HttpSession session = request.getSession(true);
	        session.setAttribute("eid",eid);
	        
	        HttpSession sessionsignout = request.getSession();
	        sessionsignout.setAttribute("user", user);
	        response.sendRedirect("employeeDashbord.jsp");
	    } else {
	    	out.println("Employee not login");
	        // Set the attribute before forwarding the request
	        request.setAttribute("addMsg", "Enter valid username and password");
	        RequestDispatcher rd = request.getRequestDispatcher("employeelogin.jsp");
	        rd.forward(request, response);
	    }
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		doGet(request, response);
	}

}
