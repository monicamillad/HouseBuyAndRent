package Controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class EditAdvertisment
 */
@WebServlet("/EditAdvertisment")
public class EditAdvertisment extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EditAdvertisment() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String title=request.getParameter("title");
		System.out.println("title"+title);
		String size=request.getParameter("size");
		String description=request.getParameter("description");
		String floor=request.getParameter("floor");
		String status=request.getParameter("status");
		String type=request.getParameter("type");
		//String picpath=request.getParameter("size");
		//String uname=request.getParameter("size");//
		String isSell=request.getParameter("radios");
		int sell=0;
		if(isSell.equals("sell"))
		{
			sell=1;
		}
		String location=request.getParameter("latlng");
		int picsnum=0 ;//
		Connection con = null;
        Statement stmt = null;
        String url="jdbc:mysql://localhost:3306/housebuyandrent";
        String username="root";
        String password="root";
		 try {
			   Class.forName("com.mysql.jdbc.Driver");
			   con=DriverManager.getConnection(url, username, password) ;
			   stmt=con.createStatement() ;
			   String q = "UPDATE advertisment SET size='"+size+"', description='"+description+"', floor='"+floor+"', status='"+status+"', type='"+type+"', isSell='"+sell+"', location='"+location+"' WHERE title='"+title+"';";
			   stmt.executeUpdate(q) ;
			   
	           stmt.close();
	           con.close();
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
		 	
            response.sendRedirect("ViewAdvertisment?title="+title);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
