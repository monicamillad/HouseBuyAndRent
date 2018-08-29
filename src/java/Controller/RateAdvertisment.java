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
import javax.servlet.http.HttpSession;

import Model.Rate;

/**
 * Servlet implementation class RateAdvertisment
 */
@WebServlet("/RateAdvertisment")
public class RateAdvertisment extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RateAdvertisment() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
			HttpSession session=request.getSession();
			if(session.getAttribute("uname")==null)
			{
				response.sendRedirect("LonginPage.jsp") ;
			}
			else
			{
				String uname=(String) session.getAttribute("uname");
				String title=request.getParameter("title");
				int rate=Integer.parseInt(request.getParameter("rate"));
				Connection con = null;
		        Statement stmt = null;
		        String url="jdbc:mysql://localhost:3306/housebuyandrent";
	            String username="root";
	            String password="root";
	            String isOwner="0";
				 try {
					   Class.forName("com.mysql.jdbc.Driver");
					   con=DriverManager.getConnection(url, username, password) ;
					   stmt=con.createStatement() ;
					   String q = "SELECT COUNT(*) FROM rate where user_title='"+uname+"_"+title+"' ;" ;
					   ResultSet res= stmt.executeQuery(q) ;
					   int old_rate=0,n_rate=0;
					   int c=0;
					   while( res.next() ){
						   c=res.getInt(1);
					   }
					   if(c==0)
					   {
						   //new rate
						   Rate r=new Rate();
						   r.user_title=uname+"_"+title;
						   r.user=uname;
						   r.title=title;
						   r.rate_value=rate;
						   r.AddToDatabase();
						   n_rate++;
					   }
					   else
					   {
						   //chane rate
						   q = "SELECT rate_value FROM rate where user_title='"+uname+"_"+title+"' ;" ;
						   res= stmt.executeQuery(q) ;
						   while( res.next() ){
							   old_rate=res.getInt("rate_value") ;
						   }
						   
						   q="UPDATE rate SET rate_value='"+rate+"' WHERE user_title='"+uname+"_"+title+"';";
						   stmt.executeUpdate(q) ;
					   }
					   
					   q = "SELECT sum_rate,n_rate FROM advertisment where title='"+title+"' ;" ;
					   res= stmt.executeQuery(q) ;
					   int sum=0,n=0;
			            while( res.next() ){
			            	sum = res.getInt("sum_rate") ;
			                n = res.getInt("n_rate") ;
			            }
			           
			            sum+=rate;
			            sum-=old_rate;
			            n+=n_rate;
			            
			            q="UPDATE advertisment SET sum_rate='"+sum+"', n_rate='"+n+"' WHERE title='"+title+"';";
			            stmt.executeUpdate(q) ;
			            int x=(int) Math.round(sum/(double)n);
			            out.print(Integer.toString(x));
			            
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
				 	
		         //   response.sendRedirect("AdvOwner.jsp?isOwner="+isOwner+"&title="+title);
			}
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
