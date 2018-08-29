/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import Model.User;
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
@WebServlet(name = "ChangePassword", urlPatterns = {"/ChangePassword"})
public class ChangePassword extends HttpServlet {

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
                
                String url="jdbc:mysql://localhost:3306/housebuyandrent";
                String username="root";
                String password="root";

                Class.forName("com.mysql.jdbc.Driver");
                Connection con=DriverManager.getConnection(url, username, password) ;

                Statement stmt=con.createStatement() ;

                String name = request.getSession().getAttribute("uname").toString() ;

                String q = "SELECT name , password FROM user ;" ;

                ResultSet res= stmt.executeQuery(q) ;

                String curr="" ;

                boolean correct=false ;
                
                while( res.next() ){

                    curr = res.getString("name") ;

                    if( curr.equals(name) ){

                        if( res.getString("password").equals(request.getParameter("password")) ){

                            correct = true ;
                        }

                        break ;
                    }
                }

                stmt.close();
                con.close();
                
                if( correct ){
                    
                    User user = new User() ;
                
                    user.name = request.getSession().getAttribute("uname").toString() ;

                    user.password = request.getParameter("conf") ;

                    user.ChangePassword() ; 

                    response.sendRedirect("EditProfilePage.jsp") ;
                }
                else{
                    
                    String s="Wrong Password !" ;
                    
                    response.sendRedirect("EditProfilePage.jsp?error="+s) ;
                }
                
                
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
            Logger.getLogger(ChangePassword.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(ChangePassword.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(ChangePassword.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(ChangePassword.class.getName()).log(Level.SEVERE, null, ex);
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
