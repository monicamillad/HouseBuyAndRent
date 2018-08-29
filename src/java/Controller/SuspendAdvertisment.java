package Controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Model.Rate;

/**
 * Servlet implementation class SuspendAdvertisment
 */
@WebServlet("/SuspendAdvertisment")
public class SuspendAdvertisment extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SuspendAdvertisment() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try (PrintWriter out = response.getWriter()) {
		
		String title=request.getParameter("title");
		Connection con = null;
        Statement stmt = null;
        String url="jdbc:mysql://localhost:3306/housebuyandrent";
        String username="root";
        String password="root";
		 try {
			   Class.forName("com.mysql.jdbc.Driver");
			   con=DriverManager.getConnection(url, username, password) ;
			   stmt=con.createStatement() ;
			   String q="UPDATE advertisment SET isSuspend='1' WHERE title='"+title+"';";
	           stmt.executeUpdate(q) ;
                   
                   q="DELETE FROM notification WHERE adv='"+title+"';" ;
                   
                   stmt.executeUpdate(q) ;
			   
	        } catch(SQLException se) {
	           se.printStackTrace();
	        } catch(Exception e) {
	           e.printStackTrace();
	        } finally {
	           try {
	              if(stmt!=null)
	                 stmt.close();
	           } catch(SQLException se2) {
	           } 
	           try {
	              if(con!=null)
	              con.close();
	           } catch(SQLException se) {
	              se.printStackTrace();
	           } 
	        } 
		 out.print("");
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
