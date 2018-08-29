package Controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Model.User;

/**
 * Servlet implementation class AddAdmin
 */
@WebServlet("/AddAdmin")
public class AddAdmin extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddAdmin() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void processRequest(HttpServletRequest request, HttpServletResponse response)  throws ServletException, IOException, ClassNotFoundException, SQLException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            
            if( request.getSession().getAttribute("uname") == null ){
            
                response.sendRedirect("LoginPage.jsp") ;
            }
            else{
                
                String url="jdbc:mysql://localhost:3306/housebuyandrent";
                String username="root";
                String password="root";

                Class.forName("com.mysql.jdbc.Driver");
                Connection con=DriverManager.getConnection(url, username, password) ;

                Statement stmt=con.createStatement() ;

                String name = request.getParameter("uname");

                String q = "SELECT name  FROM user ;" ;

                ResultSet res= stmt.executeQuery(q) ;

                String curr="" ;

                boolean correct=false ;
                
                while( res.next() ){

                    curr = res.getString("name") ;

                    if( curr.equals(name) ){

                        correct = true ;
                        break ;
                    }
                }

                
                if( correct ){
                    
                   q="UPDATE user SET isadmin='1' WHERE name='"+request.getParameter("uname")+"';";
                   
     	           stmt.executeUpdate(q) ;
                }
                
                
                stmt.close();
                con.close();
                response.sendRedirect("HomePage.jsp") ;
            }
            
        }
	}
	/**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(ChangePassword.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(ChangePassword.class.getName()).log(Level.SEVERE, null, ex);
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
