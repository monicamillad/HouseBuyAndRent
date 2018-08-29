package Controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class ViewAdvertisment
 */
@WebServlet("/ViewAdvertisment")
public class ViewAdvertisment extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ViewAdvertisment() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		
		HttpSession session=request.getSession();
		if(session.getAttribute("uname")==null)
		{
			response.sendRedirect("LonginPage.jsp") ;
		}
		else
		{
			String uname=(String) session.getAttribute("uname");
			String title=request.getParameter("title");
			
			Connection con = null;
	        Statement stmt = null;
	        String url="jdbc:mysql://localhost:3306/housebuyandrent";
            String username="root";
            String password="root";
            String isOwner="0";
            int rate=0;
            int urate=0;
			 try {
				   Class.forName("com.mysql.jdbc.Driver");
				   con=DriverManager.getConnection(url, username, password) ;
				   stmt=con.createStatement() ;
				   String q = "SELECT username FROM advertisment where title='"+title+"' ;" ;
				   ResultSet res= stmt.executeQuery(q) ;
				   String advowner="" ;
		            
		            while( res.next() ){

		            	advowner = res.getString("username") ;
		                
		            }
		            System.out.println(advowner+" "+uname);
		           
		            if(uname.equals(advowner))
		            {
		            	isOwner="1";
		            }
		            
		            q = "SELECT sum_rate,n_rate FROM advertisment where title='"+title+"' ;" ;
				    res= stmt.executeQuery(q) ;
				    int sum=0,n=0;
				   
		            while( res.next() ){
		            	sum = res.getInt("sum_rate") ;
		                n = res.getInt("n_rate") ;
		            }
		            if(n>0)
		            	rate=(int) Math.round(sum/(double)n);
		            
		            q = "SELECT rate_value FROM rate where user_title='"+uname+"_"+title+"' ;" ;
				    res= stmt.executeQuery(q) ;
				    while( res.next() ){
		            	urate = res.getInt("rate_value") ;
		            }
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
			 	
	            response.sendRedirect("AdvOwner.jsp?isOwner="+isOwner+"&title="+title+"&rate="+rate+"&urate="+urate);
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
