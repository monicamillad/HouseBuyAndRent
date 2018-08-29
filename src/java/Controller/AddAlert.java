/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import Model.Alert;
import Model.Notification;
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

/**
 *
 * @author User
 */
@WebServlet(name = "AddAlert", urlPatterns = {"/AddAlert"})
public class AddAlert extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, ClassNotFoundException, SQLException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            
            if( request.getSession().getAttribute("uname") == null ){
            
                response.sendRedirect("LoginPage.jsp") ;
            }
            else{
                
                Alert alert = new Alert() ;
                
                alert.username = request.getSession().getAttribute("uname").toString() ;
                alert.size = request.getParameter("size") ;
                alert.status = request.getParameter("status") ;
                alert.type = request.getParameter("type") ;
                alert.title = request.getParameter("title") ;
                        
                alert.AddToDatabase() ; 
                
                String url="jdbc:mysql://localhost:3306/housebuyandrent";
                String username="root";
                String password="root";

                Class.forName("com.mysql.jdbc.Driver");
                Connection con=DriverManager.getConnection(url, username, password) ;

                Statement stmt=con.createStatement() ;

                String q = "SELECT * FROM advertisment ;" ;

                ResultSet res= stmt.executeQuery(q) ;
                
                while( res.next() ){
                    
                    String size= res.getString("size") ;
                    String type= res.getString("type") ;
                    String status= res.getString("status") ;
                    
                    if( alert.size.equals(size) && alert.status.equals(status) && alert.type.equals(type) && !alert.username.equals(res.getString("username")) && res.getInt("isSuspend")==0 ){
                        
                        Notification not = new Notification() ;
                        
                        not.username = alert.username ;
                        not.isAlert = 1 ;
                        not.link = res.getString("title") ;
                        not.description = "There is an Advertisement that match your " + alert.title + "Alert !" ;
                        
                        not.AddToDatabase() ;
                    }
                    
                }
                
                response.sendRedirect("HomePage.jsp") ;
            }
            
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
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
            Logger.getLogger(AddAlert.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(AddAlert.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(AddAlert.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(AddAlert.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
